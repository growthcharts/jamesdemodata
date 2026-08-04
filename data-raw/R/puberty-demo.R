# export pubertal (Tanner stage) demo data as BDS v3.1 sideload JSON
#
# The `pub` source has no dnr counterpart in `donorloader` and its variables
# (gen/phb/tv/bre/phg/men) fall outside the bdsNumber 600:1500 range that
# `bdsreader::export_as_bds()` pivots on. Instead this writes Format 3.1 JSON
# directly, using the varName sideload path documented in
# bdsreader's test-tanner_bds.R.

fn <- path.expand(
  "~/Project/groeistat/diversen/puberty diagram/R/Stadia plot/pubertal demo data.txt"
)
pub <- read.table(fn, header = TRUE, sep = "\t")

# id 8 is absent from the source; sex is 6 female / 3 male
names <- c(
  "1" = "Anne P",
  "2" = "Iris P",
  "3" = "Sharon P",
  "4" = "Esmee P",
  "5" = "Chantal P",
  "6" = "Nienke P",
  "7" = "Kevin P",
  "9" = "Daan P",
  "10" = "Ruben P"
)

dob <- as.Date("2000-01-01")

export_puberty_demo <- function(pub, names, dob, path, indent = NULL) {
  ids <- names(names)
  varnames <- c("gen", "phb", "tv", "bre", "phg", "men")

  if (!dir.exists(path)) dir.create(path, recursive = TRUE)

  for (id in ids) {
    child <- pub[pub$id == as.integer(id), ]
    sex_code <- ifelse(child$sex[1] == "M", "1", "2")

    client_details <- list(
      list(bdsNumber = 19, value = sex_code),
      list(bdsNumber = 20, value = format(dob, "%Y%m%d"))
    )

    measurements <- list()
    for (vn in varnames) {
      long <- child[!is.na(child[[vn]]) & child[[vn]] != "", c("age", vn)]
      if (!nrow(long)) next
      dates <- format(dob + round(long$age * 365.25), "%Y%m%d")
      values <- as.character(long[[vn]])
      measurements[[length(measurements) + 1]] <- list(
        varName = vn,
        values = mapply(function(d, v) list(date = d, value = v),
                        dates, values, SIMPLIFY = FALSE, USE.NAMES = FALSE)
      )
    }

    bds <- list(
      Format = "3.1",
      clientDetails = client_details,
      clientMeasurements = measurements
    )
    js <- jsonlite::toJSON(bds, auto_unbox = TRUE)

    if (!jsonvalidate::json_validate(
      js,
      system.file("schemas", "bds_v3.1.json", package = "bdsreader"),
      verbose = TRUE
    )) {
      stop("Invalid JSON for id ", id)
    }

    # round-trip check against the varName sideload path
    tgt <- bdsreader::read_bds(js, format = "3.1")
    stopifnot(all(tgt$xyz$yname %in% varnames))

    if (!is.null(indent)) js <- jsonlite::prettify(js, indent = indent)
    fn_out <- file.path(path, paste0(gsub(" ", "_", names[[id]]), ".json"))
    writeLines(js, fn_out)
  }
}

export_puberty_demo(
  pub = pub,
  names = names,
  dob = dob,
  path = file.path("inst", "extdata", "bds_v3.1", "puberty"),
  indent = 2
)

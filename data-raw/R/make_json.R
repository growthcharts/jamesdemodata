# export demo children from donorloader in specified format

# outcomments to evade dependency on donorloader
# library(donorloader) # >= 0.36.0

export_demodata <- function(path, schema, indent = NULL) {
  # write and validate according to bds_schema.json
  donorloader::export_as_bds_from_donorloader(
    dnr = "smocc",
    ids = as.integer(c(34071, 34072, 34073, 34075, 34076, 34077, 34078, 34079, 34080, 34081)),
    names = c("Laura S", "Thomas S", "Anne S", "Jeroen S", "Mark S", "Kevin S",
              "Linda S", "Iris S", "Tim S", "Rick S"),
    path = file.path(path, "smocc"),
    schema = schema,
    indent = indent)

  donorloader::export_as_bds_from_donorloader(
    dnr = "lollypop",
    ids = as.integer(c(53696, 53675, 53676, 53684, 53519, 53520, 53531, 53582, 53583, 53584)),
    names = c("Jurre P", "Sanne P",  "Milan P", "Roos P",  "Bram P",
              "Freek P", "Anouk P",  "Sharon P", "Nick P", "Simon P"),
    path = file.path(path, "lollypop"),
    schema = schema,
    indent = indent)

  donorloader::export_as_bds_from_donorloader(
    dnr = "pops",
    ids = as.integer(c(1, 4, 176, 234, 235, 290, 291, 548, 549, 625)),
    names = c("Angela", "Boris", "Chantalle", "Bonny", "Clyde",
              "Agnetha", "Anni-Frid", "Stan", "Laurel", "Randy"),
    path = file.path(path, "pops"),
    schema = schema,
    indent = indent)

  donorloader::export_as_bds_from_donorloader(
    dnr = "terneuzen",
    ids = as.integer(c(163, 1017, 1413, 2035, 2602, 3254, 4207, 5002, 5270, 6021)),
    names = c("T 163", "T 1017",  "T 1413", "T 2035",  "T 2602",
              "T 3254", "T 4207",  "T 5002", "T 5270", "T 6021"),
    path = file.path(path, "terneuzen"),
    schema = schema,
    indent = indent)

  donorloader::export_as_bds_from_donorloader(
    dnr = "graham",
    ids = as.integer(1:9),
    names = c("Lotte G", "Tim G", "Hasna G", "Naomi G", "Sven G",
              "Nikki G", "Nienke G", "Femke G", "Bas G"),
    path = file.path(path, "graham"),
    schema = schema,
    indent = indent)
}

# outcommented to evade circular dependency with bdsreader package

# schemas <- c("schemas/bds_v1.0.json", "schemas/bds_v1.1.json", "schemas/bds_v2.0.json", "schemas/bds_v3.0.json")
# schemas <- system.file(schemas, package = "bdsreader")
# paths <-  file.path("inst/extdata", c("bds_v1.0", "bds_v1.1", "bds_v2.0", "bds_v3.0"))
#
# for (i in 1:length(schemas)) {
#   export_demodata(path = paths[i], schema = schemas[i], indent = 2)
# }

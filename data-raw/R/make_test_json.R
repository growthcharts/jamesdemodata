library(bdsreader)

jtf <- system.file("extdata", "bds_v1.0", "test", paste0("test", 1:25, ".json"), package = "jamesdemodata")
path <- file.path("inst", "extdata", "bds", "test")

idx <- c(1:7, 9:13, 15:25)
for (i in idx) {
  cat("<-- READ\n")
  tgt <- read_bds(jtf[i], schema = "bds_schema_v1.0.json", append_ddi = TRUE, verbose = TRUE)
  cat("--> WRITE\n")
  js <- write_bds(tgt, file = file.path(path, paste0("test", i, ".json")), schema = "bds_schema.json", indent = 2)
  cat("--- NEXT\n")
  rm(tgt)
}

fns <- system.file("extdata", "bds_v1.0", "test", c("http400.json", "not_a_vector.json"), package = "jamesdemodata")

tgt <- read_bds(fns[1], schema = "bds_schema_v1.0.json", append_ddi = TRUE, verbose = TRUE)
js <- write_bds(tgt, file = file.path(path, "http400.json"), schema = "bds_schema.json", indent = 2)

tgt <- read_bds(fns[2], schema = "bds_schema_v1.0.json", append_ddi = TRUE, verbose = TRUE)
js <- write_bds(tgt, file = file.path(path, "not_a_vector.json"), schema = "bds_schema.json", indent = 2)

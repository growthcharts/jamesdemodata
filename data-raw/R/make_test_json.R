# outcommented to evade circular dependency on bdsreader

library(bdsreader)

jtf <- system.file("extdata", "bds_v1.0", "test",
                   paste0("test", 1:25, ".json"),
                   package = "jamesdemodata")

path <- file.path("inst", "extdata", "bds_v1.1", "test")
path <- file.path("inst", "extdata", "bds_v2.0", "test")
path <- file.path("inst", "extdata", "bds_v3.0", "test")

outformat <- "1.1"
outformat <- "2.0"
outformat <- "3.0"

idx <- c(1:7, 9:13, 15:25)
for (i in idx) {
  cat("<-- READ\n")
  tgt <- read_bds(jtf[i], format = "1.0", append_ddi = TRUE, verbose = TRUE)
  cat("--> WRITE\n")
  js <- write_bds(tgt, file = file.path(path, paste0("test", i, ".json")),
                  format = outformat, indent = 2)
  cat("--- NEXT\n")
  rm(tgt)
}

# fns <- system.file("extdata", "bds_v1.0", "test", c("http400.json",
#                                                     "not_a_vector.json"),
#                    package = "jamesdemodata")
#
# tgt <- read_bds(fns[1], format = "1.0", append_ddi = TRUE, verbose = TRUE)
# js <- write_bds(tgt, file = file.path(path, "http400.json"),
#                 format = outformat, indent = 2)
#
# tgt <- read_bds(fns[2], format = "1.0", append_ddi = TRUE, verbose = TRUE)
# js <- write_bds(tgt, file = file.path(path, "not_a_vector.json"),
#                 format = outformat, indent = 2)

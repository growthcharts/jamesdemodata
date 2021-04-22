library(donorloader) # >= 0.25.0

# write and validate according to bds_schema.json
export_as_bds(dnr = "smocc",
              ids = as.integer(c(34071, 34072, 34073, 34075, 34076, 34077, 34078, 34079, 34080, 34081)),
              names = c("Laura S", "Thomas S", "Anne S", "Jeroen S", "Mark S", "Kevin S",
                        "Linda S", "Iris S", "Tim S", "Rick S"),
              path = "inst/extdata/bds/smocc",
              schema = "bds_schema.json")

export_as_bds(dnr = "lollypop",
              ids = as.integer(c(53696, 53675, 53676, 53684, 53519, 53520, 53531, 53582, 53583, 53584)),
              names = c("Jurre P", "Sanne P",  "Milan P", "Roos P",  "Bram P",
                        "Freek P", "Anouk P",  "Sharon P", "Nick P", "Simon P"),
              path = "inst/extdata/bds/lollypop",
              schema = "bds_schema.json")

export_as_bds(dnr = "pops",
              ids = as.integer(c(1, 4, 176, 234, 235, 290, 291, 548, 549, 625)),
              names = c("Angela", "Boris", "Chantalle", "Bonny", "Clyde",
                        "Agnetha", "Anni-Frid", "Stan", "Laurel", "Randy"),
              path = "inst/extdata/bds/pops",
              schema = "bds_schema.json")

export_as_bds(dnr = "terneuzen",
              ids = as.integer(c(163, 1017, 1413, 2035, 2602, 3254, 4207, 5002, 5270, 6021)),
              names = c("T 163", "T 1017",  "T 1413", "T 2035",  "T 2602",
                        "T 3254", "T 4207",  "T 5002", "T 5270", "T 6021"),
              path = "inst/extdata/bds/terneuzen",
              schema = "bds_schema.json")

export_as_bds(dnr = "graham",
              ids = as.integer(1:9),
              names = c("Lotte G", "Tim G", "Hasna G", "Naomi G", "Sven G",
                         "Nikki G", "Nienke G", "Femke G", "Bas G"),
              path = "inst/extdata/bds/graham",
              schema = "bds_schema.json")


# write and validate according to bds_schema.json
export_as_bds(dnr = "smocc",
              ids = as.integer(c(34071, 34072, 34073, 34075, 34076, 34077, 34078, 34079, 34080, 34081)),
              names = c("Laura S", "Thomas S", "Anne S", "Jeroen S", "Mark S", "Kevin S",
                        "Linda S", "Iris S", "Tim S", "Rick S"),
              path = "inst/extdata/bds_str/smocc",
              schema = "bds_schema_str.json")

export_as_bds(dnr = "lollypop",
              ids = as.integer(c(53696, 53675, 53676, 53684, 53519, 53520, 53531, 53582, 53583, 53584)),
              names = c("Jurre P", "Sanne P",  "Milan P", "Roos P",  "Bram P",
                        "Freek P", "Anouk P",  "Sharon P", "Nick P", "Simon P"),
              path = "inst/extdata/bds_str/lollypop",
              schema = "bds_schema_str.json")

export_as_bds(dnr = "pops",
              ids = as.integer(c(1, 4, 176, 234, 235, 290, 291, 548, 549, 625)),
              names = c("Angela", "Boris", "Chantalle", "Bonny", "Clyde",
                        "Agnetha", "Anni-Frid", "Stan", "Laurel", "Randy"),
              path = "inst/extdata/bds_str/pops",
              schema = "bds_schema_str.json")

export_as_bds(dnr = "terneuzen",
              ids = as.integer(c(163, 1017, 1413, 2035, 2602, 3254, 4207, 5002, 5270, 6021)),
              names = c("T 163", "T 1017",  "T 1413", "T 2035",  "T 2602",
                        "T 3254", "T 4207",  "T 5002", "T 5270", "T 6021"),
              path = "inst/extdata/bds_str/terneuzen",
              schema = "bds_schema_str.json")

export_as_bds(dnr = "graham",
              ids = as.integer(1:9),
              names = c("Lotte G", "Tim G", "Hasna G", "Naomi G", "Sven G",
                        "Nikki G", "Nienke G", "Femke G", "Bas G"),
              path = "inst/extdata/bds_str/graham",
              schema = "bds_schema_str.json")

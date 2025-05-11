# jamesdemodata 0.12.0

- Transfers `bdsreader/inst/examples` to `jamesdemodata/json/examples` to bundle all 
  example files in one package
- Updates the README with examples and documentation

# jamesdemodata 0.11.0

- Rewrites the JSON schema V3.0 demo and test files according to 
`bdsreader 0.23.5`. This removes superfluous JSON array definitions.

# jamesdemodata 0.10.1

- Adds missing `test8.json` and `test14.json` files for testing

# jamesdemodata 0.10.0

- Regenerates example and test files from `bdsreader` and `donorloader`
- Corrects problem with gestational ages in lollypop data

# jamesdemodata 0.9.0

- Manually: Make fields "organisationCode" and "Reference" conform to the V3.0 schema
- TODO: This needs to be addressed in example creation

# jamesdemodata 0.8.0

## Major update

- Adds JSON example files coded according to BDS JSON schema V3.0 as
defined in the [bdsreader](https://growthcharts.org/bdsreader/) package.

# jamesdemodata 0.7.1

- Changes `test4.json` JSON test files

# jamesdemodata 0.7.0

* Adds `Format` field to data in `bds_v1.0`, `bds_v1.1` and `bds_v2.0`

# jamesdemodata 0.6.0

* Adds child data for three bds schema
* Renames `bds_schema_str` --> `bds_v1.0`
* Renames `bds_schema` --> `bds_v1.1`
* Renames `bds_schema_V2` --> `bds_v2.0`

# jamesdemodata 0.5.0

* Adds GHA `R-CMD-check` for Ubuntu 20.4 devel
* Rename remotes to `growthcharts`
* Repairs errors in `DESCRIPTION`

# jamesdemodata 0.4.0

* Adds GitHub action `R-CMD-CHECK`

# jamesdemodata 0.3.0

* Removes superfluous package structure
* Removes superfluous dependencies

# jamesdemodata 0.2.0

* Adds files to `inst/extdata/bds/test`
* Adds conversion script `data-raw/R/make_test_json.R`

# jamesdemodata 0.1.0

* Rename to `jamesdemodata`
* Adds a `NEWS.md` file to track changes to the package
* Split code off from the `jamestest` package
* Removes dependencies on `minihealth`

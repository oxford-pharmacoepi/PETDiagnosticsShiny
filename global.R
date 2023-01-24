#### PACKAGES -----
library(shiny)
library(bslib)
library(here)
library(readr)
library(dplyr)
library(stringr)
library(checkmate)
library(DT)
library(shinycssloaders)
library(shinyWidgets)
library(glue)
source("tableFilterPanel.R")

# input directory
DATA_DIRECTORY <- "C:/Users/tburkard/OneDrive - Nexus365/Documents/PETDiagnosticsShiny/exampleData"
#DATA_DIRECTORY <- "exampleData" # to run the app with the mock data or any data that is stored in the data folder
#Please make sure that the results are stored in a separate folder per database

if (!dir.exists(DATA_DIRECTORY)) {
  stop(glue("Please make sure the '{DATA_DIRECTORY}' directory exists."))
}

subDirs <- list.dirs(DATA_DIRECTORY, full.names = TRUE, recursive = FALSE)
if (identical(subDirs, character(0))) {
  stop(glue("No subdirectories found in '{DATA_DIRECTORY}'. Please make sure to
            store the results per database in a separate folder."))
}

# load data from directory, merge csv's for multiple databases
mergeFiles <- function(files) {
  dplyr::bind_rows(lapply(files,
                          FUN = function(filename) {
                            if (file.exists(filename)) {
                              read.csv(filename)
                            }
                          }))
}


PETOverviewMother <- mergeFiles(file.path(subDirs, "PETOverviewMother.csv"))
AnnualPETOverviewMother <- mergeFiles(file.path(subDirs, "AnnualPETOverviewMother.csv"))
missingSummaryMother <- mergeFiles(file.path(subDirs, "missingSummaryMother.csv"))
unknownSummaryMother <- mergeFiles(file.path(subDirs, "unknownSummaryMother.csv"))
gestationalAgeMatch <- mergeFiles(file.path(subDirs, "gestationalAgeMatch.csv"))
valueDatesAgeDist <- mergeFiles(file.path(subDirs, "valueDatesAgeDist.csv"))
outcomeModeMatch <- mergeFiles(file.path(subDirs, "outcomeModeMatch.csv"))
fetusesLivebornNumber <- mergeFiles(file.path(subDirs, "fetusesLivebornNumber.csv"))

PETOverviewBaby <- mergeFiles(file.path(subDirs, "PETOverviewBaby.csv"))
missingSummaryBaby <- mergeFiles(file.path(subDirs, "missingSummaryBaby.csv"))
fetusIdMatch <- mergeFiles(file.path(subDirs, "fetusIdMatch.csv"))
valueWeightDist <- mergeFiles(file.path(subDirs, "valueWeightDist.csv"))

bitSetOverviewAll <- mergeFiles(file.path(subDirs, "bitSetOverviewAll.csv"))
bitSetOverviewMother <- mergeFiles(file.path(subDirs, "bitSetOverviewMother.csv"))
bitSetOverviewBaby <- mergeFiles(file.path(subDirs, "bitSetOverviewBaby.csv"))



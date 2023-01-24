#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- # User interface definition
  fluidPage(theme = bs_theme(version = "5", bootswatch = "spacelab"),

    # Application title
    titlePanel(title = h2("Pregnancy Extension Table Diagnostics Dashboard", align = "center"),
               windowTitle = "Pregnancy Extension Table Diagnostics Dashboard"),

        navlistPanel(
          tableFilterPanelViewer("PETOverviewMother", "Overview Pregnancies"),
          tableFilterPanelViewer("AnnualPETOverviewMother", "Overview Pregnancies [year]"),
          tableFilterPanelViewer("missingSummaryMother", "Missing values"),
          tableFilterPanelViewer("unknownSummaryMother", "Unknown values"),
          tableFilterPanelViewer("gestationalAgeMatch", "Dates and Gestational Age"),
          tableFilterPanelViewer("valueDatesAgeDist", "Values of Dates and GestAge"),
          tableFilterPanelViewer("outcomeModeMatch", "Outcome and Mode of Delivery"),
          tableFilterPanelViewer("fetusesLivebornNumber", "Fetuses vs Liveborns & Single Preg"),
          tableFilterPanelViewer("PETOverviewBaby", "Overview Fetuses"),
          tableFilterPanelViewer("missingSummaryBaby", "Missing values"),
          tableFilterPanelViewer("fetusIdMatch", "FetusIds vs Fetuses & Single Preg"),
          tableFilterPanelViewer("valueWeightDist", "Value of Birth weight"),
          tableFilterPanelViewer("bitSetOverviewAll", "Missing/Unknown Data Pattern"),
          tableFilterPanelViewer("bitSetOverviewMother", "Missing/ Unknown Data Pattern Pregnancies"),
          tableFilterPanelViewer("bitSetOverviewBaby", "Missing Data Pattern Fetuses"),
            widths = c(2, 10))
    )

# Define server logic
server <- function(input, output, session) {
  tableFilterPanelServer(id = "PETOverviewMother",
                         data = PETOverviewMother,
                         downloadFilename = "PETOverviewMother.csv")
  tableFilterPanelServer(id = "AnnualPETOverviewMother",
                         data = AnnualPETOverviewMother,
                         downloadFilename = "AnnualPETOverviewMother.csv")
  tableFilterPanelServer(id = "missingSummaryMother",
                         data = missingSummaryMother,
                         downloadFilename = "missingSummaryMother.csv")
  tableFilterPanelServer(id = "unknownSummaryMother",
                         data = unknownSummaryMother,
                         downloadFilename = "unknownSummaryMother.csv")
  tableFilterPanelServer(id = "gestationalAgeMatch",
                         data = gestationalAgeMatch,
                         downloadFilename = "gestationalAgeMatch.csv")
  tableFilterPanelServer(id = "valueDatesAgeDist",
                         data = valueDatesAgeDist,
                         downloadFilename = "valueDatesAgeDist.csv")
  tableFilterPanelServer(id = "outcomeModeMatch",
                         data = outcomeModeMatch,
                         downloadFilename = "outcomeModeMatch.csv")
  tableFilterPanelServer(id = "fetusesLivebornNumber",
                         data = fetusesLivebornNumber,
                         downloadFilename = "fetusesLivebornNumber.csv")
  tableFilterPanelServer(id = "PETOverviewBaby",
                         data = PETOverviewBaby,
                         downloadFilename = "PETOverviewBaby.csv")
  tableFilterPanelServer(id = "missingSummaryBaby",
                         data = missingSummaryBaby,
                         downloadFilename = "missingSummaryBaby.csv")
  tableFilterPanelServer(id = "fetusIdMatch",
                         data = fetusIdMatch,
                         downloadFilename = "fetusIdMatch.csv")
  tableFilterPanelServer(id = "valueWeightDist",
                         data = valueWeightDist,
                         downloadFilename = "valueWeightDist.csv")
  tableFilterPanelServer(id = "bitSetOverviewAll",
                         data = bitSetOverviewAll,
                         downloadFilename = "bitSetOverviewAll.csv")
  tableFilterPanelServer(id = "bitSetOverviewMother",
                         data = bitSetOverviewMother,
                         downloadFilename = "bitSetOverviewMother.csv")
  tableFilterPanelServer(id = "bitSetOverviewBaby",
                         data = bitSetOverviewBaby,
                         downloadFilename = "bitSetOverviewBaby.csv")

}


# Run the application
shinyApp(ui = ui, server = server)

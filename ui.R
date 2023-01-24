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

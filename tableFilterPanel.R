# Module to display and filter data

# @file tableFilterPanel
# Copyright 2022 DARWIN EU®
#
# This file is part of IncidencePrevalence
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


#' The module viewer for rendering the results
#'
#' @param id the unique reference id for the module
#' @param title panel title
#'
#' @return
#' The user interface to the results
#'
#' @export
tableFilterPanelViewer <- function(id, title) {
  ns <- shiny::NS(id)

  filterRow <- fluidRow(column(width = 4, uiOutput(ns("dbPickerUI"))))

  tabPanel(title,
           filterRow,
           tags$hr(),
           withSpinner(DT::dataTableOutput(ns('mainTable'))),
           tags$hr(),
           downloadBttn(ns("downloadButton"),
                        size="xs",
                        label = "Download"))
}

#' The module server for rendering the results
#'
#' @param id the unique reference id for the module
#' @param data the data
#' @param downloadFilename filename of the table data that can be downloaded
#'
#' @return the results table server
#'
#' @export
tableFilterPanelServer <- function(id, data, downloadFilename) {
  ns <- shiny::NS(id)

  shiny::moduleServer(id,
                      function(input, output, session) {

                        databases <- unique(data$databaseId)

                        getData <- reactive({
                          result <- NULL
                          databases <- input$dbPicker
                          if (!is.null(databases)) {
                            result <- data
                            result <- result %>% filter(databaseId %in% databases)
                          }
                          result
                        })

                        output$dbPickerUI <- renderUI({
                          pickerInput(inputId = ns('dbPicker'),
                                      label = 'Databases',
                                      choices = databases,
                                      options = list(`actions-box` = TRUE),
                                      multiple = T,
                                      selected = databases)
                        })

                        output$mainTable <- DT::renderDataTable({
                          validate(need(ncol(getData()) > 1, "No input data"))

                          DT::datatable(getData(), rownames = FALSE)
                        } )

                        output$downloadButton <- downloadHandler(
                          filename = function() {
                            downloadFilename
                          },
                          content = function(file) {
                            write.csv(getData(), file, row.names =FALSE)
                          }
                        )
                      }
  )
}

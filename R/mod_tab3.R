#' tab3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tab3_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::fluidRow(
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("plot_1"))
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("plot_2"))
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("plot_3"))
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("plot_4"))
      )
    )

  )
}

#' tab3 Server Functions
#'
#' @noRd
mod_tab3_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$plot_1 <- shiny::renderPlot({
      shinipsum::random_ggplot()
    })
    output$plot_2 <- shiny::renderPlot({
      shinipsum::random_ggplot()
    })
    output$plot_3 <- shiny::renderPlot({
      shinipsum::random_ggplot()
    })
    output$plot_4 <- shiny::renderPlot({
      shinipsum::random_ggplot()
    })
  })
}

## To be copied in the UI
# mod_tab3_ui("tab3_ui_1")

## To be copied in the server
# mod_tab3_server("tab3_ui_1")

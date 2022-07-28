#' tab1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab1_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::fluidRow(
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        DT::DTOutput(ns("data_table_1"))
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        DT::DTOutput(ns("data_table_2"))
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        DT::DTOutput(ns("data_table_3"))
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        DT::DTOutput(ns("data_table_4"))
      )
    )
  )
}
    
#' tab1 Server Functions
#'
#' @noRd 
mod_tab1_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$data_table_1 <- DT::renderDT({
      shinipsum::random_DT(10, 5)
    })
    output$data_table_2 <- DT::renderDT({
      shinipsum::random_DT(10, 5)
    })
    output$data_table_3 <- DT::renderDT({
      shinipsum::random_DT(10, 5)
    })
    output$data_table_4 <- DT::renderDT({
      shinipsum::random_DT(10, 5)
    })
  })
}
    
## To be copied in the UI
# mod_tab1_ui("tab1_ui_1")
    
## To be copied in the server
# mod_tab1_server("tab1_ui_1")

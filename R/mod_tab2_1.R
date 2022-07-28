#' tab2_1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab2_1_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::fluidRow(
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("image_1"), height = "300px")
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("image_2"), height = "300px")
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("image_3"), height = "300px")
      ),
      bs4Dash::box(
        width = 6,
        title = "Something goes here",
        shiny::plotOutput(ns("image_4"), height = "300px")
      )
    )
  )
}
    
#' tab2_1 Server Functions
#'
#' @noRd 
mod_tab2_1_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$image_1 <- shiny::renderImage({
      shinipsum::random_image()
    })
    output$image_2 <- shiny::renderImage({
      shinipsum::random_image()
    })
    output$image_3 <- shiny::renderImage({
      shinipsum::random_image()
    })
    output$image_4 <- shiny::renderImage({
      shinipsum::random_image()
    })
 
  })
}
    
## To be copied in the UI
# mod_tab2_1_ui("tab2_1_ui_1")
    
## To be copied in the server
# mod_tab2_1_server("tab2_1_ui_1")

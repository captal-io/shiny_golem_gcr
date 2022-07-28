#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic
  mod_tab1_server("tab1_ui_1")
  mod_tab2_1_server("tab2_1_ui_1")
  mod_tab2_2_server("tab2_2_ui_1")
  mod_tab3_server("tab3_ui_1")
  mod_tab4_server("tab4_ui_1")
  
}

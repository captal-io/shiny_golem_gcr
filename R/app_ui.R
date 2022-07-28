#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bs4Dash::bs4DashPage(
      dark = NULL,
      bs4Dash::dashboardHeader(),
      bs4Dash::bs4DashSidebar(
        collapsed = TRUE,
        bs4Dash::sidebarMenu(
          id = "sidebar",

          bs4Dash::menuItem(
            "tab1",
            tabName = "tab1",
            icon = shiny::icon("globe-americas"),
            selected = TRUE
          ),

          bs4Dash::menuItem(
            "tab2",
            selected = FALSE,
            icon = shiny::icon("barcode"),
            bs4Dash::menuSubItem(
              text = "tab2-1",
              tabName = "tab2_1",
              selected = FALSE
            ),
            bs4Dash::menuSubItem(
              text = "tab2-2",
              tabName = "tab2_2",
              selected = FALSE
            )
          ),

          bs4Dash::sidebarHeader("IMPORTANT"),

          bs4Dash::menuItem(
            "tab3",
            tabName = "tab3",
            icon = shiny::icon("spider"),
            selected = FALSE
          ),
          bs4Dash::menuItem(
            "tab4",
            tabName = "tab4",
            icon = shiny::icon("file-invoice-dollar"),
            selected = FALSE
          )
        )
      ),
      bs4Dash::bs4DashBody(
        bs4Dash::tabItems(
          bs4Dash::tabItem(
            tabName = "tab1",
            mod_tab1_ui("tab1_ui_1")
          ),
          bs4Dash::tabItem(
            tabName = "tab2_1",
            mod_tab2_1_ui("tab2_1_ui_1")
          ),
          bs4Dash::tabItem(
            tabName = "tab2_2",
            mod_tab2_2_ui("tab2_2_ui_1")
          ),
          bs4Dash::tabItem(
            tabName = "tab3",
            mod_tab3_ui("tab3_ui_1")
          ),

          bs4Dash::tabItem(
            tabName = "tab4",
            mod_tab4_ui("tab4_ui_1")
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "shinyTest"
    )
  )
}
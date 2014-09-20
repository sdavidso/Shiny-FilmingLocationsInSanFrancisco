shinyUI(pageWithSidebar(
    headerPanel("Filming locations in San Francisco"),
    sidebarPanel(
        numericInput('year', 'Enter a year (1915-2015) to find scenes in films that were shot in San Francisco.',
                     value = 2015, min = 1915, max = 2015, step = 1)

    ),
    mainPanel(
        plotOutput('plot'),
        h3(textOutput('text')),
        dataTableOutput('table'),
        a("Source", href="https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am")
    )
))

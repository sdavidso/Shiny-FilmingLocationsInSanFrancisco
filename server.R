data <- read.csv("Film_Locations_in_San_Francisco.csv")

data <- data[,1:3]

datamovie <- data[,-3]
datamovie <- datamovie[!duplicated(datamovie[,1]),]

plot(table(datamovie$Release.Year))

shinyServer(
    function(input, output) {
        output$plot <- renderPlot({
             year <- input$year
             plot(table(datamovie$Release.Year), 
                  col=ifelse(names(table(datamovie$Release.Year))==year,"red","black"),
                  ylab="Number of Released Movies", xlab = "Year",
                  main="Movie releases per year with a scene in San Francisco")
            
            })
        
        output$text <- renderText({
            year <- input$year
            numm <- nrow(datamovie[datamovie==year,])
            out <- paste("Inputted year",year,"has",numm,
                         ifelse(numm==1,"movie.","movies."))
            
        })
        
        output$table <- renderDataTable({
            year <- input$year
            data[data$Release.Year==year,-2]
            })

        
    }
)
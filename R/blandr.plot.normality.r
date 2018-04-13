#' @title Bland-Altman histogram and density plot
#'
#' @description Generates  a combined histogram and density curve for Bland-Altman differences
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @param statistics.results A list of statistics generated by the blandr.statistics function: see the function's return list to see what variables are passed to this function
#'
#' @include blandr.statistics.r
#'
#' @export

blandr.plot.normality <- function( statistics.results ) {

    # We could do a histogram and density plot by the following
    # hist( statistics.results$differences )
    # plot( density( statistics.results$differences ) )
    # qqnorm( results$differences )
    # qqline( results$differences, col = 2 )
    # However ggplot2 is so much more customisable

    # ggplot can't use lists, so need to convert the results to a dataframe
    results <- data.frame( statistics.results$differences )
    # and rename
    names(results)[1] <- "differences"

    # Create the histogram
    normality.plot <- ggplot( results , aes( x=differences ) ) +
      geom_histogram( aes(y=..density..) , colour="black", fill="white" ) +
      geom_density( colour="red" ) +
      ylab( "Density" ) +
      xlab( "Differences") +
      ggtitle("Histogram and density plot of differences")

    return(normality.plot)

    # END OF FUNCTION
}
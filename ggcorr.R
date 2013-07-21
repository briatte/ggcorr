#' ggcorr - Plot a correlation matrix with ggplot2
#'
#' Function for making a correlation plot starting from a data matrix, using ggplot2. The function is directly inspired by Tian Zheng and Yu-Sung Su's arm::corrplot function. Please visit \link{http://github.com/briatte/ggcorr} for the latest development and descriptions about ggcorr.
#'
#' @export
#' @param data a data matrix. Should contain numerical (continuous) data.
#' @param method a character string giving a method for computing covariances in the presence of missing values. This must be (an abbreviation of) one of the strings \code{"everything"}, \code{"all.obs"}, \code{"complete.obs"}, \code{"na.or.complete"}, or \code{"pairwise.complete.obs"}. Defaults to \code{"pairwise"}.
#' @param palette a ColorBrewer palette to be used for correlation coefficients. Defaults to \code{"RdYlGn"}.
#' @param name a character string for the legend that shows quintiles of correlation coefficients.
#' @param geom the geom object to use. Accepts either \code{tile} (the default) or \code{circle}, to plot scale-sized circles.
#' @param min_size the minimum size for circles. Defaults to \code{5}.
#' @param ... other arguments supplied to geom_text for the diagonal labels.  Arguments pertaining to the title or other items can be achieved through ggplot2 methods.
#' @seealso \code{\link{cor}} and \code{\link[arm]{corrplot}}
#' @author Francois Briatte \email{f.briatte@@ed.ac.uk}
#' @examples
#' # Basketball statistics provided by Nathan Yau at Flowing Data.
#' nba <- read.csv("http://datasets.flowingdata.com/ppg2008.csv")
#' ggcorr(nba[-1])
#' ggcorr(
#'   nba[-1],
#'   size = 3,
#'   hjust = 0.75,
#'   angle = -45,
#'   palette = "PuOr" # colorblind safe, photocopy-able
#' ) + labs(title = "Points Per Game")
ggcorr <- function(data, method = "pairwise", palette = "RdYlGn", name = "Correlation\ncoefficient", geom = "tile", min_size = 5, ...) {

  M <- cor(data[1:ncol(data)], use = method)
  M <- M * lower.tri(M)
  M <- as.data.frame(M)
  M <- data.frame(row = names(data), M)
  M <- melt(M, id.vars = "row")
  M$value[M$value == 0] <- NA
  s <- seq(-1, 1, by = .25)
  M$value <- cut(M$value, breaks = s, include.lowest = TRUE,
                 label = cut(s, breaks = s)[-1])
  M$row <- factor(M$row, levels = (unique(as.character(M$variable))))
  diag <- subset(M, row == variable)

  po.nopanel <- list(theme(
    panel.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.text.x = element_text(angle = -90))
  )

  p = ggplot(M, aes(row, variable))
  
  if(geom == "circle") {
    q_values = levels(M$value)
    q_length = length(q_values)
    q_factor = RColorBrewer::brewer.pal(q_length, palette)
    p = p +
      scale_colour_manual(name, values = q_factor, labels = q_values) +
      scale_size_manual(name, values = min_size:(min_size + q_length), 
                        labels = q_values) +
      geom_point(aes(size = value, colour = value))
  }
  else {
    p = p +
      scale_fill_brewer(name, palette = palette) +
      geom_tile(aes(fill = value), colour = "white")
  }
  
  p = p  +
    geom_text(data = diag, aes(label = variable), ...) +
    scale_x_discrete(breaks = NULL) +
    scale_y_discrete(breaks = NULL) +
    labs(x = "", y = "") +
    po.nopanel
  
  return(p)
}

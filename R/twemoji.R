#' Twitter Emoji (twemoji)
#'
#' Use the Twitter Emoji open-sourced
#' \href{https://github.com/twitter/twemoji}{twemoji} emoji library
#' easily in the R console, RStudio Viewer, or \code{rmarkdown}.
#' 
#' @param svg \code{logical} to use \code{SVG} instead of \code{PNG}
#'
#' @import htmlwidgets
#'
#' @export
twemoji <- function(svg = FALSE) {

  # forward options using x
  x = list(options = NULL)
  
  if(svg){
    x$options$folder = "svg"
    x$options$ext = ".svg"
  }

  # create widget
  htmlwidgets::createWidget(
    name = 'twemoji',
    x,
    width = 0,
    height = 0,
    package = 'remoji'
  )
}

twemoji_html <- function(id, style, class, ...){
  htmltools::tags$div(
    id = id,
    style = style,
    style = "display:none;",
    class = class
  )
}

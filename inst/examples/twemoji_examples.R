#devtools::install_github("timelyportfolio/remoji@twemoji")

library(htmltools)
library(stringi)
library(remoji)

browsable(
  tagList(
    twemoji(),
    tags$p(HTML("I &#x1F497; emoji!")),
    tags$h2(style="display:block;","hearts"),
    lapply(
      find_emoji("heart"),
      function(heart){
        tags$div(
          style="float:left;",
          HTML(stri_trans_general(emoji(heart),"any-hex/xml"))
        )
      }
    ),
    tags$hr(style="clear:both;"),
    tags$h2("sun"),
    lapply(
      find_emoji("sun"),
      function(sun){
        tags$div(
          style="float:left;",
          HTML(stri_trans_general(emoji(sun),"any-hex/xml"))
        )
      }
    ),
    tags$hr(style="clear:both;"),
    tags$h2("hi"),
    lapply(
      find_emoji("hi"),
      function(hi){
        tags$div(
          style="float:left;",
          HTML(stri_trans_general(emoji(hi),"any-hex/xml"))
        )
      }
    )      
  )
)

# use SVG instead of PNG
browsable(
  tagList(
    twemoji(svg=TRUE),
    lapply(
      find_emoji("moon"),
      function(emoj){
        tags$div(
          style="float:left;height:6em;width:6em;",
          HTML(stri_trans_general(emoji(emoj),"any-hex/xml"))
        )
      }
    )
  )
)


# try to use twemoji with use element in SVG
browsable(HTML('
<svg viewBox="0 0 100 100">
  <use xlink:href="http://twemoji.maxcdn.com/svg/1f31d.svg#g10"></use>
</svg>
'))


library(networkD3)
data(MisLinks)
data(MisNodes)
# Create graph with legend and varying node radius
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Nodesize = "size",
             radiusCalculation = "30",
             Group = "group", opacity = 0.4, legend = TRUE)
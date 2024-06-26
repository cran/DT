% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shiny.R
\name{dataTableAjax}
\alias{dataTableAjax}
\title{Register a data object in a shiny session for DataTables}
\usage{
dataTableAjax(
  session,
  data,
  rownames,
  filter = dataTablesFilter,
  outputId,
  future = FALSE
)
}
\arguments{
\item{session}{the \code{session} object in the shiny server function
(\code{function(input, output, session)})}

\item{data}{a data object (will be coerced to a data frame internally)}

\item{rownames}{see \code{\link{datatable}()}; it must be consistent with
what you use in \code{datatable()}, e.g. if the widget is generated by
\code{datatable(rownames = FALSE)}, you must also use
\code{dataTableAjax(rownames = FALSE)} here}

\item{filter}{(for expert use only) a function with two arguments \code{data}
and \code{params} (Ajax parameters, a list of the form \code{list(search =
list(value = 'FOO', regex = 'false'), length = 10, ...)}) that return the
filtered table result according to the DataTables Ajax request}

\item{outputId}{the output ID of the table (the same ID passed to
\code{dataTableOutput()}; if missing, an attempt to infer it from
\code{session} is made. If it can't be inferred, a random id is
generated.)}

\item{future}{whether the server-side filter function should be executed as a
future or as a standard synchronous function. If true, the future will be
evaluated according to the session's \link[future]{plan}.}
}
\value{
A character string (an Ajax URL that can be queried by DataTables).
}
\description{
This function stores a data object in a shiny session and returns a URL that
returns JSON data based on DataTables Ajax requests. The URL can be used as
the \code{url} option inside the \code{ajax} option of the table. It is
basically an implementation of server-side processing of DataTables in R.
Filtering, sorting, and pagination are processed through R instead of
JavaScript (client-side processing).
}
\details{
Normally you should not need to call this function directly. It is called
internally when a table widget is rendered in a Shiny app to configure the
table option \code{ajax} automatically. If you are familiar with
\pkg{DataTables}' server-side processing, and want to use a custom filter
function, you may call this function to get an Ajax URL.
}
\examples{
DTApp = function(data, ..., options = list()) {
  library(shiny)
  library(DT)
  shinyApp(
    ui = fluidPage(
      title = 'Server-side processing of DataTables',
      fluidRow(
        DT::dataTableOutput('tbl')
      )
    ),
    server = function(input, output, session) {
      options$serverSide = TRUE
      options$ajax = list(url = dataTableAjax(session, data, outputId = 'tbl'))
      # create a widget using an Ajax URL created above
      widget = datatable(data, ..., options = options)
      output$tbl = DT::renderDataTable(widget)
    }
  )
}

if (interactive()) DTApp(iris)
if (interactive()) DTApp(iris, filter = 'top')
}
\references{
\url{https://rstudio.github.io/DT/server.html}
}

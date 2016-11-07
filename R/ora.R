# code shamefully stolen from the arnis's ora-package
# reason: using ora::function name breaks earlier established mar-connections
# here the damage is outcommented
# And function name is more verb-like

#' ora_sql
#'
#' @param query xxx
#' @param tolower xxx
#' @param dots xxx
#' @param encoding xxx
#' @param useBytes xxx
#' @param stringsAsFactors xxx
#' @param warn xxx
#' @param debug xxx
#' @param ... xxx


ora_sql <-
  function (query, tolower = TRUE, dots = TRUE, encoding = "unknown",
            useBytes = TRUE, stringsAsFactors = FALSE, warn = -1, debug = FALSE,
            ...)  {
    # EINAR outcommented: on.exit(suppressWarnings(DBI::dbUnloadDriver(DBI::dbDriver("Oracle"))))
    osaf <- options(stringsAsFactors = stringsAsFactors)
    on.exit(options(osaf), add = TRUE)
    owarn <- options(warn = warn)
    on.exit(options(owarn), add = TRUE)
    if (file.exists(query))
      query <- paste(readLines(query, encoding = encoding),
                     collapse = " ")
    query <- gsub("[ \f\n\r\t\v\xa0]+", " ", query, useBytes = useBytes)
    query <- gsub(";", "", query, useBytes = useBytes)
    if (debug)
      return(query)
    output <- ROracle::dbGetQuery(DBI::dbConnect(DBI::dbDriver("Oracle"), ...),
                                  query)
    if (class(output) != "data.frame")
      return(output)
    attr(output, "row.names") <- seq_len(nrow(output))
    if (tolower)
      names(output) <- tolower(names(output))
    if (dots)
      names(output) <- chartr("_", ".", names(output))
    return(output)
  }


#' oracle_tables
#'
#' @param owner xxx
#' @param table xxx
#' @param space xxx
#' @param tolower xxx
#' @param ... xxx
#' 
#' @export

oracle_tables <- function (owner = "%", table = "%", space = "%", tolower = TRUE,
                        ...) {
  select.from <- "SELECT owner,table_name,tablespace_name,num_rows,last_analyzed FROM all_tables"
  where <- paste("WHERE owner LIKE '", toupper(owner), "' ESCAPE '\\' ",
                 "AND table_name LIKE '", toupper(table), "' ESCAPE '\\' ",
                 "AND tablespace_name LIKE '", toupper(space), "' ESCAPE '\\'",
                 sep = "")
  query <- paste(select.from, where)
  output <- ora_sql(query, ...)
  names(output) <- c("owner", "table", "space", "rows", "analyzed")
  if (tolower)
    output[1:3] <- sapply(output[1:3], tolower)
  cat("\n")
  print(output, right = FALSE)
  cat("\n")
  invisible(output)
}

#' oracle_variables
#'
#' @param table xxx
#' @param tolower xxx
#' @param dots xxx
#' @param ... xxx
#' 
#' @export

oracle_variables <- function (table, tolower = TRUE, dots = FALSE, ...) {
  #  EINAR outcommented: on.exit(suppressWarnings(DBI::dbUnloadDriver(DBI::dbDriver("Oracle"))))
  query <- paste("SELECT * FROM", table)
  output <- DBI::dbColumnInfo(DBI::dbSendQuery(DBI::dbConnect(DBI::dbDriver("Oracle"),
                                               ...), query))
  attr(output, "row.names") <- seq_len(nrow(output))
  if (tolower) {
    output$name <- tolower(output$name)
    output$type <- tolower(output$type)
  }
  if (dots)
    output$name <- chartr("_", ".", output$name)
  splitname <- toupper(unlist(strsplit(table, "\\.")))
  select.from <- "SELECT num_rows,last_analyzed FROM all_tables"
  if (length(splitname) == 1)
    where <- paste("WHERE table_name='", splitname, "'",
                   sep = "")
  else where <- paste("WHERE owner='", splitname[1], "' AND table_name='",
                      splitname[2], "'", sep = "")
  query <- paste(select.from, where)
  rows.date <- ROracle::dbGetQuery(DBI::dbConnect(DBI::dbDriver("Oracle"), ...),
                          query)
  attr(output, "rows") <- if (nrow(rows.date) == 1)
    rows.date$NUM_ROWS
  else as.numeric(NA)
  attr(output, "analyzed") <- if (nrow(rows.date) == 1)
    rows.date$LAST_ANALYZED
  else as.character(NA)
  cat("\n")
  print(output, right = FALSE)
  cat("\n")
  if (nrow(rows.date) > 0) {
    indent <- rep(" ", nchar(nrow(output)) + 1)
    cat(indent, attr(output, "rows"), " rows on ", as.character(attr(output,
                                                                     "analyzed")), "\n\n", sep = "")
  }
  invisible(output)
}

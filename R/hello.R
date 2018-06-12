#' MS SQL Connection
#' @param host the host
#' @param user user
#' @param pass password
#' @export
#'
mssql_con <- function(host, user, pass) {
  require(RJDBC)
  drv_path <- system.file("driver", package = "mssqlr")
  drv_path <- file.path(drv_path, "mssql-jdbc-6.4.0.jre9.jar")
  drv <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver", drv_path)
  conn <- dbConnect(
    drv,
    sprintf("jdbc:sqlserver://%s", host),
    user, pass
  )
  conn
}

#' MS SQL Connection
#' @param host the host
#' @param user user
#' @param pass password
#' @export
#'
mssql_con <- function(host, user, pass, java_version = c("9", "8", "7")) {
  require(RJDBC)
  if (length(java_version) > 1) java_version <- java_version[1]
  drv_path <- system.file("driver", package = "mssqlr")
  drv_path <- file.path(
    drv_path,
    sprintf("mssql-jdbc-6.4.0.jre%s.jar", java_version)
  )
  drv <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver", drv_path)
  conn <- dbConnect(
    drv,
    sprintf("jdbc:sqlserver://%s", host),
    user, pass
  )
  conn
}

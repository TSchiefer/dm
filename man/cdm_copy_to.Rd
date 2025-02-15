% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/db-interface.R
\name{cdm_copy_to}
\alias{cdm_copy_to}
\title{Copy a 'dm'-object to a 'src'/'con'}
\usage{
cdm_copy_to(dest, dm, ..., set_key_constraints = TRUE,
  unique_table_names = FALSE, temporary = TRUE)
}
\arguments{
\item{dest}{A \code{src} or \code{con} object like e.g. a database.}

\item{dm}{A \code{dm} object.}

\item{...}{Possible further arguments passed to \code{\link[dplyr:copy_to]{dplyr::copy_to()}} (which is used on each table)}

\item{set_key_constraints}{Boolean variable, if \code{TRUE} will mirror \code{dm} key constraints on a database.}

\item{unique_table_names}{Boolean, if \code{FALSE} (default), original table names will be used, if \code{TRUE},
unique table names will be created based on the original table names.}

\item{temporary}{Boolean variable, if \code{TRUE} will only create temporary tables, which will vanish when connection is interrupted.}
}
\description{
\code{cdm_copy_to()} takes a \code{src}- or \code{con}-object as a first argument,
and a \code{\link{dm}} object as a second. The latter is copied to the former. By default
the key constraints will be set (for now only on MSSQL- and Postgres-DBs).
By default temporary tables will be created.
}
\examples{
src_sqlite <- dplyr::src_sqlite(":memory:", create = TRUE)
iris_dm <- cdm_copy_to(
  src_sqlite,
  as_dm(list(iris = iris)),
  set_key_constraints = FALSE
)
}
\seealso{
Other DB interaction functions: \code{\link{cdm_learn_from_db}},
  \code{\link{cdm_set_key_constraints}}
}
\concept{DB interaction functions}

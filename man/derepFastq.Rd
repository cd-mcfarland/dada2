% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/sequenceIO.R
\name{derepFastq}
\alias{derepFastq}
\title{Read and Dereplicate a Fastq file.}
\usage{
derepFastq(fl, n = 1e+06, verbose = FALSE)
}
\arguments{
\item{fl}{(Required). \code{character(1)}.
 The file path to the fastq or fastq.gz file.
 Actually, any file format supported by \code{\link[ShortRead]{FastqStreamer}}.}

\item{n}{(Optional). \code{numeric(1)}.
 the maximum number of records (reads) to parse and dereplicate
 at any one time. This controls the peak memory requirement
 so that large fastq files are supported.
 Defaults is \code{1e6}, one-million reads.
 See \code{\link[ShortRead]{FastqStreamer}} for details on this parameter,
 which is passed on.}

\item{verbose}{(Optional). \code{logical(1)}.
 Whether or not to throw standard R \code{\link{message}}s
 on the intermittent and final status of the dereplication.
 Default is \code{FALSE}, no messages.}
}
\value{
A \code{\link{derep-class}} object.
}
\description{
This is a custom interface to \code{\link[ShortRead]{FastqStreamer}}
for dereplicating amplicon sequences from a fastq or compressed fastq file,
while also controlling peak memory requirement to support large files.
}
\examples{
# Test that chunk-size, `n`, does not affect the result.
testFastq = system.file("extdata", "sam1F.fastq.gz", package="dada2")
derep1 = derepFastq(testFastq, verbose = TRUE)
derep1.35 = derepFastq(testFastq, 35, TRUE)
all.equal(getUniques(derep1), getUniques(derep1.35)[names(getUniques(derep1))])
}


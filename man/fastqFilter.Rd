% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/filter.R
\name{fastqFilter}
\alias{fastqFilter}
\title{fastqFilter filters and trims fastq files.}
\usage{
fastqFilter(fn, fout, truncQ = 2, truncLen = 0, trimLeft = 0, maxN = 0,
  minQ = 0, maxEE = Inf, n = 1e+06, compress = TRUE, verbose = FALSE)
}
\arguments{
\item{fn}{(Required). A character string naming the path to the fastq file, or an R connection.}

\item{fout}{(Required). A character string naming the path to the output file, or an R connection.}

\item{truncQ}{(Optional). Truncate reads at the first instance of a quality score less than
   or equal to truncQ. Default is 2, a special quality score indicating the end of good quality
   sequence in Illumina 1.8+. Can provide truncQ as an integer or appropriate ascii encoding.}

\item{truncLen}{(Optional). A \code{numeric(1)} Truncate after truncLen bases, reads shorter than
   this are discarded.}

\item{trimLeft}{(Optional). Remove trimLeft nucleotides from the start of each read. If both
   truncLen and trimLeft are used, all filtered reads will have length truncLen-trimLeft.}

\item{maxN}{(Optional). After truncation, sequences with more than maxN Ns will be discarded.
   Default is 0. Currently dada() does not allow Ns.}

\item{minQ}{(Optional). After truncation, reads contain a quality score below minQ will be discarded.}

\item{maxEE}{(Optional). After truncation, reads with higher than maxEE "expected errors" will be discarded.
 Expected errors are calculated from the nominal definition of the quality score: EE = sum(10^(-Q/10))}

\item{n}{(Optional). The number of records (reads) to read in and filter at any one time.
 This controls the peak memory requirement so that very large fastq files are supported.
 Default is \code{1e6}, one-million reads. See \code{\link{FastqStreamer}} for details.}

\item{compress}{(Optional). A \code{logical(1)} indicating whether the output should be gz compressed.}

\item{verbose}{(Optional). A \code{logical(1)}. If TRUE, some status messages are displayed.}
}
\description{
fastqFilter takes an input fastq file (can be compressed), filters it based on several
user-definable criteria, and outputs those reads which pass the filter and their associated
qualities to a new fastq file (also can be compressed). Several functions in the ShortRead
package are leveraged to do this filtering.
}
\details{
fastqFilter replicates most of the functionality of the fastq_filter command in usearch
(http://www.drive5.com/usearch/manual/cmd_fastq_filter.html).
}
\examples{
testFastq = system.file("extdata", "sam1F.fastq.gz", package="dada2")
filtFastq <- tempfile(fileext=".fastq.gz")
fastqFilter(testFastq, filtFastq, maxN=0, maxEE=2)
fastqFilter(testFastq, filtFastq, trimLeft=10, truncLen=200, maxEE=2, verbose=TRUE)
}
\seealso{
\code{\link{fastqPairedFilter}}

 \code{\link[ShortRead]{FastqStreamer}}

 \code{\link[ShortRead]{srFilter}}

 \code{\link[ShortRead]{trimTails}}
}


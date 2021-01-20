\name{MISS}
\alias{MISS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Creating Missing Values at Random in Multivariate Datasets

}
\description{
This function randomly creates missing values in a multivariate dataset. The resultant missing data mechanism is missing at random (MAR). The percentage of missingness has to be specified. This percentage is computed as a proportion of the sample size. In addition, the function allows for more than one missing value in any given case. It is set such that in a p-variate dataset, for any i^th case, the maximum allowable number of missing values is p-1. This helps avoid a situation where a case has no observed value.
}
\usage{
MISS (TT, Percent)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{TT}{n×p complete dataset.}
  \item{Percent}{the proportion of missing values, which must be specified.}
  }

\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# 3-dimensional multivariate t distribution
n <- 10
p=3
df=3
mu=c(1:3)
A <- matrix(rt(p^2,df), p, p)
A <- tcrossprod(A,A) #A %*% t(A)

Y7 <-mvtnorm::rmvt(n, delta=mu, sigma=A, df=df)
Y7
TT=Y7 #Complete Dataset

#Introduce MAR Data
Y8= MISS(TT,20) #The newly created incomplete dataset.

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

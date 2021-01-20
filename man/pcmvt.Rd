\name{pcmvt}
\alias{pcmvt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Conditional Multivariate t Distribution
%%  ~~function to do ... ~~
}
\description{Computes the distribution function of the conditional multivariate t, [Y given X], where Z = (X,Y) is the fully-joint multivariate t distribution with mean equal to location vector, df equal to degrees of freedom and scatter matrix sigma.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pcmvt(lower = -Inf, upper = Inf, mean, sigma, df, dependent.ind, given.ind, X.given, check.sigma = TRUE, algorithm = GenzBretz(), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lower}{
the vector of lower limits of length n.
}
  \item{upper}{
the vector of upper limits of length n.
}
  \item{mean}{
the mean vector of length n.
}
  \item{sigma}{
a symmetric, positive-definte matrix, of dimension n x n, which must be specified.
}
  \item{df}{
degrees of freedom, which must be specified.
}
  \item{dependent.ind}{
a vector of integers denoting the indices of the dependent variable Y.
}
  \item{given.ind}{
a vector of integers denoting the indices of the conditioning variable X.

}
  \item{X.given}{
a vector of reals denoting the conditioning value of X. When both given.ind and X.given are missing, the distribution of Y becomes Z[dependent.ind]
}
  \item{check.sigma}{
logical; if TRUE, the variance-covariance matrix is checked for appropriateness (symmetry, positive-definiteness). This could be set to FALSE if the user knows it is appropriate.
}
  \item{algorithm}{
an object of class GenzBretz, Miwa or TVPACK specifying both the algorithm to be used as well as the associated hyper parameters.
}
  \item{\dots}{
additional parameters (currently given to GenzBretz for backward compatibility issues).
}
}
\details{
This program involves the computation of multivariate t probabilities with arbitrary correlation matrices.
}
\value{
The evaluated distribution function is returned with attributes

%%  If it is a LIST, use
 \item{error}{estimated absolute error and}
  \item{msg }{Normal Completion}
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

 \seealso{\code{\link{dcmvt}()},\code{\link{rcmvt}()},\code{\link{pmvt}()}}

\examples{
n <- 10
df=3
A <- matrix(rt(n^2,df), n, n)
A <- tcrossprod(A,A) #A %*% t(A)

pcmvt(lower=-Inf, upper=1, mean=rep(1,n), sigma=A, df=df,	dependent.ind=3, given.ind=c(1,4,7,9,10),
      X.given=c(1,1,0,0,-1))


pcmvt(lower=-Inf, upper=c(1,2), mean=rep(1,n),
      sigma=A,df=df, dep=c(2,5), given=c(1,4,7,9,10),
      X=c(1,1,0,0,-1))

pcmvt(lower=-Inf, upper=c(1,2), mean=rep(1,n), sigma=A,df=df,
      dep=c(2,5))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

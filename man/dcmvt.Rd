\name{dcmvt}
\title{Conditional Multivariate t Density and Random Deviates
}
\description{These functions provide the density function and a random number generator for the conditional multivariate t distribution, [Y given X], where Z = (X,Y) is the fully-joint multivariate t distribution with location vector (or mode) equal to mean and covariance matrix sigma.}
\usage{
dcmvt(x, mean, sigma,df, dependent.ind, given.ind, X.given, check.sigma=TRUE, log = FALSE)

rcmvt=function (n, mean, sigma, df,dependent.ind, given.ind, X.given,
                check.sigma = TRUE,type = c("shifted", "Kshirsagar"),
                method = c("eigen", "svd", "chol"))
}
\arguments{
  \item{x}{vector or matrix of quantiles of Y. If x is a matrix, each row is taken to be a quantile.}
  \item{n}{number of random deviates.}
  \item{mean}{location vector, which must be specified.}
  \item{sigma}{a symmetric, positive-definte matrix of dimension n x n, which must be specified.}
  \item{df}{degrees of freedom, which must be specified.}
  \item{dependent.ind}{a vector of integers denoting the indices of dependent variable Y.}
  \item{given.ind}{a vector of integers denoting the indices of conditoning variable X.}
 \item{X.given}{a vector of reals denoting the conditioning value of X. When both given.ind and X.given are missing, the distribution of Y becomes Z[dependent.ind]}
 \item{check.sigma}{logical; if TRUE, the scatter matrix is checked for appropriateness (symmetry, positive-definiteness). This could be set to FALSE if the user knows it is appropriate.}
 \item{log}{logical; if TRUE, densities d are given as log(d).}
 \item{type}{type of the noncentral multivariate tt distribution. type = "Kshirsagar" corresponds to formula (1.4) in Genz and Bretz (2009) (see also Chapter 5.1 in Kotz and Nadarajah (2004)).
  This is the noncentral t-distribution needed for calculating the power of multiple contrast tests under a normality assumption. type = "shifted" corresponds to the formula right before
  formula (1.4) in Genz and Bretz (2009) (see also formula (1.1) in Kotz and Nadarajah (2004)). It is a location shifted version of the central t-distribution. This noncentral 
   multivariate t-distribution appears for example as the Bayesian posterior distribution for the regression coefficients in a linear regression. In the central case both types coincide.} 
  \item{method}{
string specifying the matrix decomposition used to determine the matrix root of sigma. Possible methods are eigenvalue decomposition ("eigen", default), singular value decomposition ("svd"), and Cholesky decomposition ("chol"). The Cholesky is typically fastest, not by much though.}

}

\examples{
# 10-dimensional multivariate t distribution
n <- 10
df=3
A <- matrix(rt(n^2,df), n, n)
A <- tcrossprod(A,A) #A %*% t(A)

# density of Z[c(2,5)] given Z[c(1,4,7,9)]=c(1,1,0,-1)
dcmvt(x=c(1.2,-1), mean=rep(1,n), sigma=A,dependent.ind=c(2,5),df=df, given.ind=c(1,4,7,9),
X.given=c(1,1,0,-1))

dcmvt(x=-1, mean=rep(1,n), sigma=A,df=df, dep=3, given=c(1,4,7,9,10), X=c(1,1,0,0,-1))
dcmvt(x=c(1.2,-1), mean=rep(1,n), sigma=A,df=df, dep=c(2,5))

# gives an error since `x' and `dep' are incompatibe
#dcmvt(x=-1, mean=rep(1,n), sigma=A,df=df, dep=c(2,3),
#      given=c(1,4,7,9,10), X=c(1,1,0,0,-1))

rcmvt(n=10, mean=rep(1,n), sigma=A,df=df, dep=c(2,5),
         given=c(1,4,7,9,10), X=c(1,1,0,0,-1),
         method="eigen")

rcmvt(n=10, mean=rep(1,n), sigma=A,df=df,dep=3,
         given=c(1,4,7,9,10), X=c(1,1,0,0,-1),
         method="chol")
}


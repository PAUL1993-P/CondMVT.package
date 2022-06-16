\name{SMCEM_Umsteps}
\alias{SMCEM_Umsteps}
\title{Data Imputation Using SEM and MCEM (Multiple Iterations; Degrees of Freedom Unknown)

}
\description{
This sub-package provides subroutines for implementation of SEM and MCEM techniques in imputing missing values as well as estimating multivariate t parameters when the degrees of freedom are unknown.The functions SMCEM_msteps constitute the SEM and MCEM algorithms for multiple-iterative data imputation and parameter estimation for multivariate t data with unknown degrees of freedom. The functions represent SEM when the number of draws in the E-step (denoted by nob) is 1 and MCEM when we have more than one draw in the E-step.More details on the implementation of SEM and MCEM techniques can be found in Kinyanjui et al. (2020).
}
\usage{SMCEM_Umsteps(Y,mu,Sigma,df,nob,K,e)
}
\arguments{
  \item{Y}{the multivariate t dataset}
  \item{mu}{	the location vector, which must be specified. In cases where it is unknown, starting values are provided.}
  \item{Sigma}{scatter matrix, which must be specified. In cases where it is unknown, starting values are provided.}
  \item{df}{degrees of freedom, which must be specified.}
  \item{nob}{number of draws in the E-step}
  \item{K}{the number of iterations, which must be specified.}
  \item{e}{tolerance level for convergence of the bisection method for estimation of df. }
}
\references{
Kinyanjui, P. K., Tamba, C. L., Orawo, L. A. O., & Okenye, J. O. (2020). Missing data imputation in multivariate t distribution with unknown degrees of freedom using expectation maximization algorithm and its stochastic variants. Model Assisted Statistics and Applications, 15(3), 263-272.
}
\examples{
# 3-dimensional multivariate t distribution
n <- 25
p=3
df=3
mu=c(10,20,30)
A=matrix(c(14,10,12,10,13,9,12,9,18), 3,3)
Y7 <-mvtnorm::rmvt(n, delta=mu, sigma=A, df=df)
Y7
TT=Y7 #Complete Dataset

#Introduce MAR Data
Y8= MISS(TT,20) #The newly created incomplete dataset.
#Initializing Values
mu_stat=c(0.5,1,2)
Sigma_stat=matrix(c(0.33,0.31,0.3,0.31,0.335,0.295,0.3,0.295,0.32),3,3)
df_stat=6

#Imputing Missing Values and Updating Parameter Estimates

#Single Iteration (SEM)
SEMU1=SMCEM_Uonestep(Y=Y8,mu=mu,Sigma=Sigma_stat,df= df_stat,nob=1,e=0.00001)

#Single Iteration (MCEM)
MCEMU1=SMCEM_Uonestep(Y=Y8,mu=mu,Sigma=Sigma_stat,df= df_stat,nob=1000,e=0.00001)

#Multiple Iterations (SEM)
SEMU=SMCEM_Umsteps(Y=Y8,mu=mu_stat,Sigma=Sigma_stat,df=df_stat,nob=1,K=1000,e=0.00001)

#Results for Newly Completed Dataset (Burning in first 100 iterations in SEM)
T_mu=rep(0,3)
T_Sigma=matrix(rep(0,3*3),nrow=3)
T_Data=matrix(rep(0,3*25), nrow =25)
T_df=rep()
for (l in 101:1000){
  T_mu = T_mu + SEMU$muchain[l,]
  T_Sigma = T_Sigma + SEMU$SigmaChain[,,l]
  T_Data= T_Data+ SEMU$YChain[,,l]
}
#updated location vector
round((T_mu/900),4) 
#updated scatter matrix 
round((T_Sigma/900),4)
#updated degrees of freedom 
udfs=mean(SEMU$dfchain[101:1000])
#complete dataset as an average of (K-100) complete datasets for the various iterations.
T_Data1=  T_Data/900	

#Multiple Iterations (MCEM)
MCEMU=SMCEM_Umsteps(Y=Y8,mu=mu_stat,Sigma=Sigma_stat,df=df_stat,nob=1000,K=1000,e=0.00001)

#Results for Newly Completed Dataset (Burning in first 100 iterations in MCEM)
T_mu=rep(0,3)
T_Sigma=matrix(rep(0,3*3),nrow=3)
T_Data=matrix(rep(0,3*25), nrow =25)
T_df=rep()
for (l in 101:1000){
  T_mu = T_mu + MCEMU$muchain[l,]
  T_Sigma = T_Sigma + MCEMU$SigmaChain[,,l]
  T_Data= T_Data+ MCEMU$YChain[,,l]
}
#updated location vector
round((T_mu/900),4)
#updated scatter matrix 
round((T_Sigma/900),4)
#updated degrees of freedom  
udf=mean(MCEMU$dfchain[101:1000])	
#complete dataset as an average of (K-100) complete datasets for the various iterations.  
T_Data1=  T_Data/900

}

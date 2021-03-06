% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GppDxy.R
\name{GppDxy}
\alias{GppDxy}
\title{GppDxy: function to simulate posterior predictive simulated distributions of dxy under the neutral coalescent model for two species}
\usage{
GppDxy(posterior.samples, loci.per.step, sample.vec.0, sample.vec.1,
  sequence.length.vec)
}
\arguments{
\item{posterior.samples}{List of posterior samples with columns for single column for each parameter and a row for each step of the MCMC chain [see read.posterior]}

\item{loci.per.step}{Number of genealogies to simulate for each joint parameter combination of the posterior MCMC chain}

\item{sample.vec.0}{List of number of sampled individuals for population 0 for each locus in the empirical distribution}

\item{sample.vec.1}{List of number of sampled individuals for population 1 for each locus in the empirical distribution}

\item{sequence.length.vec}{List of the locus length for each locus in the empirical dataset; can be set to c(190,190) to simulate all loci with length of 190 nucleotides}
}
\description{
This function returns a vector of dxy values simulated from a posterior distribution
}
\examples{
\dontrun{
library(GppFst)
library(Geneland)
library(phybase)

experimental_params <- read.table(file = '~/Desktop/GppFST_Tutorial/ExperimentalParameters.txt', header = T) # Read tab-delimited file with experimental parameters
pop0.samples <- experimental_params$pop0.samples # Extract pop0 samples per empirical locus
pop1.samples <- experimental_params$pop1.samples # Extract pop1 samples per empirical locus
locus.lengths <- experimental_params$locus.length # Extract locus lengths per empirical locus

MCMC.samples <- read.posterior(posterior.file = '~/Desktop/GppFST_Tutorial/atrox_snap_gamma2.log', format = "tab", burnin = .95)

Gppdxy.results <- GppDxy(posterior.samples = MCMC.samples, loci.per.step = 10, sample.vec.0 = pop0.samples, sample.vec.1 = pop1.samples, sequence.length.vec = locus.lengths)
mean(as.numeric(Gppdxy.results) # get mean
hist(as.numeric(Gppdxy.results) # plot distribution
}
}
\keyword{Bayesian,}
\keyword{Posterior}
\keyword{Predictive}
\keyword{Simulation}
\keyword{dxy,}
\keyword{genetics,}
\keyword{population}


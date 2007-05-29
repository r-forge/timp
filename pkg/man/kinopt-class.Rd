\name{kinopt-class}
\docType{class}
\alias{kinopt-class}
\alias{kinopt} 
\title{Class "kinopt" stores options for fitting and plotting kinetic models}
\description{Class "kinopt" stores options for fitting and plotting kinetic
models in particular; this is a subclass of class \code{opt} that contains 
options applicable to all model types }
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("kinopt", ...)} or
\code{kinopt(...)}
}
\section{Slots}{
	 \describe{
    \item{\code{notraces}:}{Object of class \code{"logical"} that defaults
    to \code{FALSE}; if \code{TRUE}, do not plot traces}
    \item{\code{selectedtraces}:}{Object of class \code{"vector"} containing
     \code{x} indices for which plots of 
     traces are desired under a kinetic model }
     \item{\code{breakdown}:}{Object of class \code{"list"} with the 
following elements: 
  \itemize{ 
  \item{plot}{vector of \code{x2} values to plot the breakdown for.  
  These values be specified in 
  a fuzzy way:  an \code{x2} value within \code{abs(x2[1] - x2[2])/100} 
  a value given in \code{plot} means that a plot for that \code{x2} value 
  will be generated, where
  the reference \code{x2[1]} and \code{x2[2]} are from the first dataset
  modelled. 
    }
   \item{tol}{numeric giving a tolerance by which 
   the values in \code{plot} are compared to \code{x2} values
   for near-equality. The default is defined as  
   \code{abs(x2[1] - x2[2])/100}. }
      \item{superimpose}{vector of dataset indices for which results should
    be superimposed if the dataset has an \code{x2} value at a value in 
    \code{plot}.}
    }
    }
    \item{FLIM:}{Object of class \code{"logical"} that defaults to 
    \code{FALSE}; if \code{TRUE}, the data represent a FLIM experiment and 
    special plots are generated. }
     \item{kinspecest}{Object of class \code{"logical"} that defaults to 
    \code{FALSE}; if \code{TRUE}, make a plot of the spectra associated with
    the kinetic components as well as the lifetime estimates. }
 \item{kinspecerr}{Object of class \code{"logical"} that defaults to 
    \code{FALSE}; if \code{TRUE}, add standard error estimates to the spectra
    a plot generated with \code{kinspecest=TRUE}.  This option can only be 
    used if the estimates were generated during fitting via the option 
    \code{stderrclp=TRUE}}
 \item{specinterpol}{Object of class \code{"logical"} that defaults to 
    \code{FALSE}; if \code{TRUE}, use spline instead of lines between 
    the points representing estimated spectra}
   \item{specinterpolpoints}{Object of class \code{"logical"} that defaults to 
    \code{TRUE}; if \code{TRUE}, add points representing the actual estimates
    for spectra to plots of the curves respresenting smoothed spectra}
\item{specinterpolseg}{Object of class \code{"numeric"} that defaults to 
    \code{50}; represents the number of segments used in a spline-based
    representation of spectra}  
 \item{specinterpolbspline}{Object of class \code{"logical"} that defaults
to \code{FALSE}; determines whether a B-spline based representation of
spectra is used (when \code{specinterpol=TRUE}) or a piecewise polynomial 
	representation} 
 \item{normspec}{Object of class \code{"logical"} that determines whether
spectra are normalized in plots}

 \item{writespecinterpol}{Object of class \code{"logical"} that defaults to 
    \code{FALSE}; if \code{TRUE}, a spline-based representation of spectra
    is written to ASCII files}
 \item{writeplaincon}{Object of class \code{"list"}; if length is greater
than 0, then the concentration model will be evaluated at the vector of 
\code{x} values supplied as the element \code{"x"} of \code{writeplaincon} 
and the result will be written to file for each dataset.   
}
 \item{writerawcon}{Object of class \code{"logical"} 
 that defaults to \code{FALSE}; if \code{TRUE}, then the representation of 
the concentration profiles before the application of constraints (to 
account for the equality of spectra, etc.) is written to file for each 
dataset.
  }
 \item{plotcohcolspec}{Object of class \code{"logical"} 
that defaults to \code{TRUE}; if \code{FALSE} then the spectra associated
with the coherent artifact (pulse-follower) are not included in the summary
plots
  }
 \item{ylimspecplus}{Object of class \code{"vector"} that defaults to 
\code{vector()}; if changed, the first value should specify a vector to
add to the y-limits of the plot of spectra}
\item{samespecline}{Object of class \code{"logical"} that defaults to 
\code{FALSE}; if \code{TRUE}, then the line-type for spectra is the same 
for all datasets
}
 \item{xlimspec}{Object of class \code{"vector"} that defaults to 
\code{vector()}; if changed, it should specify the desired x-limits of 
the plot of spectra}
 \item{ylimspec}{Object of class \code{"vector"} that defaults to 
\code{vector()}; if changed, it should specify the desired y-limits of 
the plot of spectra}
}}
\details{See \code{\link{opt-class}} and  \link{specopt-class} for 
the specification of fitting/plotting options that are not specific to the 
class type and for the \code{kin} class type, respectively. }
\author{Katharine M. Mullen, Ivo H. M. van Stokkum}
\seealso{
\code{\link{examineFit}}, \code{\link{fitModel}}, \code{\link{opt-class}}, \code{\link{specopt-class}}
}
\keyword{classes}
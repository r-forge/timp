"simndecay_gen" <-
function (kinpar, tmax, deltat, specpar, lmin, lmax, deltal, 
    sigma, irf = FALSE, irfpar = vector(), seqmod = FALSE, dispmu = FALSE, 
    disptau = FALSE, parmu = vector(), partau = vector(), lambdac = 0, 
    fullk = FALSE, kmat = matrix(), jvec = vector(), specfun = "gaus", 
    nupow = 1) 
{
    x <- seq(0, tmax, deltat)
    nt <- length(x)
    ncomp <- length(kinpar)
    x2 <- seq(lmin, lmax, deltal)
    nl <- length(x2)
    if (specfun == "gaus") 
        E2 <- calcEhiergaus(specpar, x2, nupow)
    if (!(dispmu || disptau)) {
        C2 <- compModel(k = kinpar, x = x, irfpar = irfpar, irf = irf, 
            seqmod = seqmod, fullk = fullk, kmat = kmat, jvec = jvec)
        psisim <- C2 %*% t(E2)
    }
    else {
        psisim <- matrix(nrow = nt, ncol = nl)
        for (i in 1:nl) {
            irfvec <- irfparF(irfpar, lambdac, x2[i], i, dispmu, 
                parmu, disptau, partau, "", "", "gaus")
        
            C2 <- compModel(k = kinpar, x = x, irfpar = irfpar, 
                irf = irf, seqmod = seqmod, fullk = fullk, kmat = kmat, 
                jvec = jvec)
            psisim[, i] <- C2 %*% cbind(E2[i, ])
        }
    }
    dim(psisim) <- c(nt * nl, 1)
    psi.df <- psisim + sigma * rnorm(nt * nl)
    dim(psi.df) <- c(nt, nl)
    
    kin(psi.df = psi.df, x = x, nt = nt, x2 = x2, nl = nl, C2 = C2, 
        E2 = E2, kinpar = kinpar, specpar = specpar, 
        seqmod = seqmod, irf = irf, irfpar = irfpar, 
        dispmu = dispmu, disptau = disptau, parmu = parmu, partau = partau, 
        lambdac = lambdac, simdata = TRUE, fullk = fullk, kmat = kmat, 
        jvec = jvec)
}

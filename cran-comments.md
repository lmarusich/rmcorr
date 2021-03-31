We received a message about problems with Version 0.4.2 - we have
rewritten the vignette so that it no longer installs packages or 
writes files to the user's working directory

## Test environments
* local Windows install, R 4.0.4
* ubuntu 16.04.6 (on travis-ci), R 4.0.2
* win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs. 

## Downstream dependencies
I have also run R CMD check on downstream dependencies of rmcorr - all packages passed

#https://covr.r-lib.org/
install.packages("covr")
require(covr)

install.packages("vdiffr")
require(vdiffr)

# install.packages('diffviewer')
# require(diffviewer)

#Dev tools test
devtools::test()

#Run code coverage 
report()


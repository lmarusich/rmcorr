install.packages("covr")
require(covr)

install.packages("vdiffr")
require(vdiffr)

#Dev tools test
devtools::test()

#Run code coverage 
report()


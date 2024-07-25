# rmcorr 0.7.0
* Added geom for simplified graphing with ggplot2: geom_rmc 
* Added vignette for overfitting/pseudoreplication
* Updated roxygen to 7.3.2 and now using _PACKAGE

# rmcorr 0.6.0

* Added HCAHPS2022 dataset and description  
* Added vignette showing diagnostic plots 
* Added vignette for synthetic dataset w/NaN estimates (thanks to Shreya Ghosh) and a possible solution
* Added references in vignettes using bibtex
* Split references in documentation into functions and datasets

# rmcorr 0.5.4.2 (dev release only, not on CRAN)

* Documentation update: Remove TravisCI, add U.S. gov disclaimer, fix typos and formatting 

# rmcorr 0.5.4.1 (dev release only, not on CRAN)

* Added reproducible example of bootstrapping
* Specify article order for web docs

# rmcorr 0.5.4

* Corrected df for confidence intervals. We thank Benjamin Zobel for finding this mistake

# rmcorr 0.5.3 (dev release only, not on CRAN)

* Added more unit tests 
* Use covr to evaluate code coverage
* Documentation updates 

# rmcorr 0.5.2

* R 4.1.0 is now required

# rmcorr 0.5.1 (dev release only, not on CRAN)

* Documentation update: Table describing twedt_dist_measures is now a markdown chunk. This renders correctly with pkgdown

# rmcorr 0.5.0

* Beta: Added rmcorr_mat() to calculate an rmcorr correlation matrix 
* To demonstrate rmcorr_mat(), added a new dataset and description: twedt_dist_measures 
* Rewrote how variable names are saved in rmcorr()
* Updated description: Minimum version of R is >3.5.0 because of serialized objects

# rmcorr 0.4.7 (dev release only, not on CRAN)

* Fixed typo in bland1995 example and data: PacO2 is now PaCO2 (partial pressure of CO2)
* Add marusich2016 data and description 
* Documentation: Add details to bland1995 data and add DOIs to all data references 

# rmcorr 0.4.6

* use packages in 'suggests' conditionally

# rmcorr 0.4.5

* Fix issue in column names
* Add testing

# rmcorr 0.4.4

* Just changing maintainer email address

# rmcorr 0.4.3

* Updated vignette

# rmcorr 0.4.2

* Fixed another error in bootstrapped confidence intervals
* Updated vignette

# rmcorr 0.4.1

* Fixed error in last update for bootstrapped confidence intervals

# rmcorr 0.4.0

* Added argument for confidence level
* Reset contrast option after running rmcorr
* Added parent.frame access

# rmcorr 0.3.0

* column names can be entered as strings and dynamically
* dataset parameter is no longer required in the plot.rmc function
* Added a `NEWS.md` file to track changes to the package.
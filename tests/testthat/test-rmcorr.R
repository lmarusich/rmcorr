test_that("symbol column names work", {
  expect_warning(rmcorr(Subject, PaCO2, pH, bland1995), "coerced into a factor")
})

test_that("string column names work", {
    expect_warning(rmcorr("Subject", "PaCO2", "pH", bland1995), "coerced into a factor")
})

test_that("dynamic column names work", {
    col_names <- c("Subject", "PaCO2", "pH")
    expect_warning(rmc.out <- rmcorr(col_names[1], col_names[2], col_names[3], bland1995), "coerced into a factor")
    expect_equal(rmc.out$r, -0.507, tolerance = 0.001)
})

test_that("different classes of sub_ids work", {
    bland1995mod <- bland1995
    #change the subject column from integers to characters
    bland1995mod$Subject[1:4]  <- "a"
    
    expect_warning(rmc.out <- rmcorr(Subject, PaCO2, pH, bland1995mod), "coerced into a factor")
    expect_equal(rmc.out$CI[1], -0.711, tolerance = 0.001)
    
    #change to factor, shouldn't get warning
    expect_silent(rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995mod))
})

test_that("non-numeric data columns throw error", {
    bland1995mod <- bland1995
    bland1995mod$pH <- as.character(bland1995mod$pH)
    expect_warning(expect_error(rmcorr(Subject, as.character(PaCO2), pH, bland1995),"must be numeric"), "coerced")
})

test_that("changing CI level works", {
    #use default 95% CIs
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010))
    expect_equal(rmc.out$CI[1], -0.661, tolerance = 0.001)
    
    set.seed(1753)
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010, CIs = "bootstrap"))
    expect_equal(rmc.out$CI[[1]], -0.604, tolerance = 0.001)
    
    #use 99% CIs
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010, CI.level = 0.99))
    expect_equal(rmc.out$CI[1], -0.721, tolerance = 0.001)
    
    set.seed(1212)
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010, CIs = "bootstrap", CI.level = 0.99))
    expect_equal(rmc.out$CI[[1]], -0.610, tolerance = 0.001)
})

test_that("test rmcorr_mat", {
    #Full 5 by 5 matrix  
    dist_rmc_mat <- rmcorr_mat(participant = Subject, 
                               variables = c("Blindwalk Away",
                                             "Blindwalk Toward",
                                             "Triangulated BW",
                                             "Verbal",
                                             "Visual matching"),
                               dataset = twedt_dist_measures)
    
    #Check dimensions
    identical(dim(dist_rmc_mat$matrix), c(5,5))
    
    #Check transpose of output rmcorr matrix too
    identical(dist_rmc_mat$matrix, 
              t(dist_rmc_mat$matrix))
    
   #Expected output for correlation matrix to reasonable number of decimal places
    expected <- c(1.00000000, 0.8065821, 0.2382857, 0.7355813, 0.7758245,
                  0.8065821,  1.0000000, 0.2254866, 0.7160551, 0.7575109,
                  0.2382857,  0.2254866, 1.0000000, 0.1835838, 0.2537431,
                  0.7355813,  0.7160551, 0.1835838, 1.0000000, 0.7341831,
                  0.7758245,  0.7575109, 0.2537431, 0.7341831, 1.0000000) 
    
    expected.matrix <- matrix(expected,    
                              byrow = FALSE,
                              nrow = 5, ncol = 5)
    
    expected.mat.row.col.names <- c("Blindwalk Away",
                                    "Blindwalk Toward",
                                    "Triangulated BW",
                                    "Verbal",
                                    "Visual matching")
    rownames(expected.matrix) <- expected.mat.row.col.names
    colnames(expected.matrix) <- expected.mat.row.col.names
    
    expect_equal(dist_rmc_mat$matrix, expected.matrix, tolerance = 0.00001)
    

    

    
    #Models
    #Expected output for rmcorr_mat model and single rmcorr model, run separately
    expect_warning(bwa.tribw.rmc <- rmcorr(Subject, 
                                           "Blindwalk Away", 
                                           "Triangulated BW", 
                                            twedt_dist_measures), 
                                                        "coerced into a factor")
    
    identical(bwa.tribw.rmc$r,  dist_rmc_mat$models[[2]]$r)
    identical(bwa.tribw.rmc$df, dist_rmc_mat$models[[2]]$df)
    identical(bwa.tribw.rmc$p,  dist_rmc_mat$models[[2]]$p)
    identical(bwa.tribw.rmc$CI, dist_rmc_mat$models[[2]]$CI)
    
    #dist_rmc_mat uses "Participant" regardless of the input variable 
    identical(bwa.tribw.rmc$vars[2:3], dist_rmc_mat$models[[2]]$vars[2:3])
    
    identical(dist_rmc_mat$models[[2]]$vars[1], "Participant")
    
    #Summary
    #Expected output for rmcorr_mat summary and single rmcorr model, run separately
    expect_warning(bwt.vis.rmc <- rmcorr(Subject, 
                                         "Blindwalk Toward", 
                                         "Visual matching", 
                                         twedt_dist_measures), 
                   "coerced into a factor")
    
    identical(dist_rmc_mat$summary[7,]$rmcorr.r, bwt.vis.rmc$r)
    identical(dist_rmc_mat$summary[7,]$df, bwt.vis.rmc$df)
    identical(dist_rmc_mat$summary[7,]$p.vals, bwt.vis.rmc$p)
    
    #2 by 2 matrix  
    dist_rmc_mat_2by2 <- rmcorr_mat(participant = Subject, 
                               variables = c("Blindwalk Away",
                                             "Blindwalk Toward"),
                               dataset = twedt_dist_measures)
    
    #Dimensions
    identical(dim(dist_rmc_mat_2by2$matrix), c(2,2))
    
    #Transpose
    identical(dist_rmc_mat_2by2$matrix, 
              t(dist_rmc_mat_2by2$matrix))
    
})

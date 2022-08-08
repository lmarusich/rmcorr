test_that("2x2 correlation matrix generated correctly", {

#2 by 2 matrix  
dist_rmc_mat_2by2 <- rmcorr_mat(participant = Subject, 
                                variables = c("Blindwalk Away",
                                              "Blindwalk Toward"),
                                dataset = twedt_dist_measures)

#Dimensions
expect_identical(dim(dist_rmc_mat_2by2$matrix), c(2L,2L))

#Transpose
expect_identical(dist_rmc_mat_2by2$matrix, 
                 t(dist_rmc_mat_2by2$matrix))

})


test_that("5x5 correlation matrix generated correctly", {
    
    dist_rmc_mat <- rmcorr_mat(participant = Subject, 
                               variables = c("Blindwalk Away",
                                             "Blindwalk Toward",
                                             "Triangulated BW",
                                             "Verbal",
                                             "Visual matching"),
                               dataset = twedt_dist_measures)
    #check class
    expect_s3_class(dist_rmc_mat, 'rmcmat')
    
    #Check dimensions
    identical(dim(dist_rmc_mat$matrix), c(5L,5L))
    
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
})

test_that('rmcorr_mat model matches single rmcorr model', {
    
    #rmcorr_mat
    dist_rmc_mat <- rmcorr_mat(participant = Subject, 
                               variables = c("Blindwalk Away",
                                             "Blindwalk Toward",
                                             "Triangulated BW",
                                             "Verbal",
                                             "Visual matching"),
                               dataset = twedt_dist_measures)
    
    
    #single rmcorr model
    expect_warning(bwa.tribw.rmc <- rmcorr(Subject, 
                                           "Blindwalk Away", 
                                           "Triangulated BW", 
                                           twedt_dist_measures), 
                   regexp = "coerced into a factor")
    
    #Expected output for rmcorr_mat model and single rmcorr model, run separately
    expect_identical(bwa.tribw.rmc$r,  dist_rmc_mat$models[[2]]$r)
    expect_identical(bwa.tribw.rmc$df, dist_rmc_mat$models[[2]]$df)
    expect_identical(bwa.tribw.rmc$p,  dist_rmc_mat$models[[2]]$p)
    expect_identical(bwa.tribw.rmc$CI, dist_rmc_mat$models[[2]]$CI)
    
    #check that variable names are the same
    expect_identical(bwa.tribw.rmc$vars[2:3], dist_rmc_mat$models[[2]]$vars[2:3])
    
    #dist_rmc_mat uses "Participant" regardless of the input variable 
    expect_identical(dist_rmc_mat$models[[2]]$vars[1], "Participant")
})

test_that('rmcorr_mat summary matches single rmcorr model', {
    
    #rmcorr_mat
    dist_rmc_mat <- rmcorr_mat(participant = Subject, 
                               variables = c("Blindwalk Away",
                                             "Blindwalk Toward",
                                             "Triangulated BW",
                                             "Verbal",
                                             "Visual matching"),
                               dataset = twedt_dist_measures)
    
    #single rmcorr model
    expect_warning(bwt.vis.rmc <- rmcorr(Subject, 
                                         "Blindwalk Toward", 
                                         "Visual matching", 
                                         twedt_dist_measures), 
                   "coerced into a factor")
    

    #Expected output for rmcorr_mat summary and single rmcorr model, run separately
    expect_identical(dist_rmc_mat$summary[7,]$rmcorr.r, bwt.vis.rmc$r)
    expect_identical(dist_rmc_mat$summary[7,]$df, bwt.vis.rmc$df)
    expect_identical(dist_rmc_mat$summary[7,]$p.vals, bwt.vis.rmc$p)
    
})




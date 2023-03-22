########################################################
### Example for adding and imputation missing values ### 
########################################################
#
# Example using Cheetah with 10% missing values in the landmarks
#
# load cheetah dataset from "Raw Dataset" and cheetah missing pattern from "Missing Patterns"
cheetah <-  read.csv(file = "Cheetah.csv", dec =",", sep =",", header = T, fill = TRUE)[,-c(1,2,3)]
cheetah_missing_pattern <- read.csv2(file = "Missing_Patterns_Cheetah.csv")
# load MCAR function with source() function 
# add MCAR 
cheetah_NA_010_seed1234 <- add_MCAR(seed = 1234,p = 0.10, data_raw = cheetah, data_mp = cheetah_missing_pattern, nlandmarks = 25, nderived = 15)
# To be noted: There are more than 10% missing values in this dataset because the derived variables are included and NOT the landmarks. 
# load packages for imputation 
library("missMethods")
library("missForest")
library("mice")
library("missRanger")
# deletion of all observation with at least one missing value 
cheetah_NA_010_seed1234_narm <- na.omit(cheetah_NA_010_seed1234)
# mean imputation 
cheetah_NA_010_seed1234_mean <- impute_mean(cheetah_NA_010_seed1234, type = "columnwise")
# missForest imputation 
cheetah_NA_010_seed1234_missForest <- missForest(cheetah_NA_010_seed1234)
# mice pmm imputation
cheetah_NA_010_seed1234_micePMM <- mice(cheetah_NA_010_seed1234, method = "pmm", m = 3, seed = 1234, remove_collinear = FALSE)
# mice rf imputation
cheetah_NA_010_seed1234_micerf <- mice(cheetah_NA_010_seed1234, method = "rf", m = 3, seed = 1234, remove_collinear = FALSE)
# missRanger imputation
cheetah_NA_010_seed1234_missRanger <- missRanger(cheetah_NA_010_seed1234, seed = 1234, pmm.k = 5)


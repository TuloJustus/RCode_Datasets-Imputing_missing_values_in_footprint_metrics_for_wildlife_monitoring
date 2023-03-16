# general script for artifically adding MCAR (Missing Completly Ar Random) in animal data with landmarks and derived vawriables

# 1. step: data preparation
# In this step we prepare the datasets for the following steps. These include reading in the data with the missing patterns (data_mp)
# and the raw datasets with the calculated variables (data_raw). Both as as.data.frame(). data_mp coded in {0,1} for all entries. 
# The column names of both datasets have to be identical for the calculated variables. But in general the column names
# differ in that the data_mp includes the names of the derived variables (that means additional columns before the calculated variables).

# 2. main function: adding MCAR values
# loading packages
# install.packages("missForest")
library("missForest") # includes prodNA() 

add_MCAR <- function(seed,p, data_raw,data_mp, nlandmarks, nderived){
  # seed = seed value for possibility of replication
  # p = percentage (in [0,1]) of missing values in landmarks
  # data_raw = name of original dataset with variables values (structure described above)
  # data_name = desired output name for the output data (in strings)
  # data_mp = dataset of missing pattern structure (structure described above)
  # nlandmarks = number of landmarks points
  # nderived = number of derived variables
  
  ### STEP 1: Random drawing of landmark points
  set.seed(seed)
  n <- nrow(data_raw)
  # auxiliary matrix because the raw datasets do not contain the landmark points 
  help_mp <- matrix(0,ncol = nlandmarks, nrow = n)
  # Random drawing of missing values
  NA_mp <- prodNA(help_mp, p)
  
  # STEP 2: Derivation of the NA values for the variables that depend on the landmark points
  # auxiliary matrix for the derived variables 
  dp_help <- matrix(0, ncol = nderived, nrow = n)
 # load missing pattern dataset and recoding
  mp_mpdp <- data_mp[c(1:nlandmarks),c(1:nderived)]
  mp_mpdp[mp_mpdp == 1] <- NA  
  
  # intern function for calculating the resultiing missing values in the derived variables from  the missing values in the landmarks:
    k <- n
    p <- nlandmarks
    for(i in 1:k){
      for(j in 1:p){
        if(is.na(NA_mp[i,j])){
          dp_help[i,] <- as.numeric(mp_mpdp[j,]) * dp_help[i,]
        }
      }
    }
    NA_mp_dp <- cbind(NA_mp,dp_help)
  # NA_mp_dp contain all NA values of the derived variables which result of the random drawing of the landmark points in step 1 
  
  # STEP 3: Transfer of the NA values to the real data set
  # recoding 
  data_mp[data_mp == 1] <- NA
  data_mp[data_mp == 0] <- 1
  final_NA <- data_raw
  
  p <- nlandmarks + nderived
  
  for(i in 1:n){
    for(j in 1:p){
      if(is.na(NA_mp_dp[i,j])){ 
        final_NA[i,] <- data_mp[j,-c(1:nderived)] * final_NA[i,]
      }
    }
  }
  # NA_mp_dp contain the real data values and all the NA values  
 return(final_NA)
}

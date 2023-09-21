# RCode_Datasets-Imputing_missing_values_in_footprint_metrics_for_wildlife_monitoring

This repository belongs to the paper "Imputing missing values in footprint metrics for wildlife monitoring".  The aim of the project is the imputation of missing so-called landmark points in images of animal footprints. The imputation of missing points is necessary for the classification and identification of the footprints by calculating distances, angles and areas of the landmark points. In total, the footprints of five different species originating from more than 100 individuals were examined. In each case, artificially missing values are generated in the present datasets and then imputed. All used datasets and R codes with self-written functions and examples are deposited in this respository.

## Folder structure 
### Datasets
#### Raw Datasets
This folder contains all the original datasets used. All calculated variables are shown, which indicate in the name from which variables they are calculated.



#### Missing Patterns 
This folder contains the Missing Patterns of the respective animals. The missing patterns indicate which variables depend on which landmark points. The correlation is binary coded; 1 corresponds to a correlation and 0 does not. Therefore, a missing value in one landmark point results in missing values in all dependent variables. 

### R Codes for missing value imputation
This folder contains the self-written function for applying a Missing Completly at Random (MCAR) algorithm for calculating missing values. The *Adding_MCAR* function randomly generates a certain proportion of missing values in the respective landmark points and then calculates all the residual missing values in the variables. In the project, different proportions of missing values in the landmark points were examined. For more details, please refer to the corresponding paper. 
In addition to this function, an example of the application of adding and imputing missing values also provided. As an example mean, missForst, mice pmm, mice rf and missRanger are applied to the Cheetah dataset with 10% missing landmarks. For all scenarios described in the paper, an analogous approach was taken. 

#### Installation 
To introduce missing values and apply the imputation methods, the packages *missMethods*, *missForest*, *mice* and *missRanger* must be loaded. 


## Application 
1. Download the datasets from the **Datasets** folder. 
2. Start RStudio and install the R packages described in **Installation**. 
3. Download the datasets from the **R Codes** folder *Adding_MCAR*. Apply the function as described in the comments in the R code. Select the appropriate parameters.
4. Impute the missing values in the same way as in the R code *Example_Imputation*.   


## Note 
The further procedure, i.e. in particular the application of the FIT model, was carried out in JMP. Frederick Kistner is available to answer any questions and provide further details. The final results can be found in the Final Results folder in a csv file. The results described in the paper are based on these values.

## JMP JSL code for Footprint Identification Technology

## Add RCV to datasets

## Run Pairwise Comparison model
https://www.jove.com/de/v/54034/spotting-cheetahs-identifying-individuals-by-their-footprints
4.40 -6.57 Running of Pairwise Comparison Model


## Model Parameters per species
| Species (latin name) | No. of variables | Counter probability | Wards cut-off distance |
|-----------------------|------------------|--------------------|-----------------------|
| Amur Tiger (*Panthera tigris altaica*) | 18 | 0.50 | 1.95 |
| Cheetah (*Acinonyx jubatus*) | 18 | 0.50 | 1.90 |
| Giant Panda (*Ailuropoda melanoleuca*) | 12 | 0.50 | 1.50 |
| Mountain Lion (*Puma concolor*) | 18 | 0.50 | 1.90 |
| White Rhino (*Ceratotherium simum*) | 12 | 0.50 | 1.95 |
| Cheetah (experiment 2) | 18 | 0.50 | 1.90 |


## Extract target metrics and populate raw Results table


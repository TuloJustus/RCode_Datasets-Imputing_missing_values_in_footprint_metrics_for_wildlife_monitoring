## Project Overview

This repository is associated with the research manuskript titled **"Keeping Track!: Monitoring Endangered Species with Footprint Identification Technology Enhanced by Missing Value Imputation."** The primary objective of this project is to assess the feasibility of incorporating Missing Value Imputation as a valuable data preprocessing step in the context of the established Footprint Identification Technology developed by Wildtrack ([Wildtrack Website](https://www.wildtrack.org/)). By introducing artificial missing values into five different datasets, we aimed to explore the potential of this approach and validate our findings on a new dataset containing real missing values.

### The Significance of Missing Value Imputation

The imputation of missing landmark points is a crucial step in the classification and identification of animal footprints, as it enables the calculation of distances, angles, and areas of these points. In this study, we examined the footprints of five different species, comprising data from over 100 individual animals. For each species, we intentionally introduced artificial missing values into the existing datasets and subsequently applied imputation techniques to recover these missing data points.

### Repository Contents

Within this repository, you will find all the datasets used in our research, along with the R code containing self-written functions and illustrative examples. These resources are made available to facilitate further exploration and experimentation in the field of wildlife monitoring through footprint analysis.

### FIT Pairwise Model Snippets

To aid in the practical application of the FIT (Footprint Identification Technology) Pairwise model, essential code snippets are provided via Dropbox. Additionally, a comprehensive manual on how to utilize FIT is included, offering step-by-step guidance for those interested in implementing this technology.

### Datasets

#### Raw Datasets

This folder contains all the original datasets used. All datasets but the data set "RealCheetah" have been previously published in scientific journals. Details on the used Morphometric Landmarks and the calculation of the derived measurements can be found in the literature below:

- S. Alibhai, Z. Jewell, J. Evans, The challenge of monitoring elusive large carnivores: An accurate and cost-effective tool to identify and sex pumas (puma concolor) from footprints, PloS one 12 (3) (2017) e0172065.

- S. K. Alibhai, Z. C. Jewell, P. R. Law, A footprint technique to identify white rhino Ceratotherium simum at individual and species levels, Endangered Species Research 4 (1-2) (2008) 205–218.

- B. V. Li, S. Alibhai, Z. Jewell, D. Li, H. Zhang, Using footprints to identify and sex giant pandas, Biological Conservation 218 (2018) 83–90.

- J. Gu, S. K. Alibhai, Z. C. Jewell, G. Jiang, J. Ma, Sex determination of amur tigers (Panthera tigris altaica) from footprints in snow, Wildlife Society Bulletin 38 (3) (2014) 495–502.

- S. K. Alibhai, J. Gu, Z. C. Jewell, J. Morgan, D. Liu, G. Jiang, ‘i know the tiger by his paw’: A non-invasive footprint identification technique for monitoring individual amur tigers (panthera tigris altaica) in snow, Ecological Informatics (2022) 101947.

- Z. C. Jewell, S. K. Alibhai, F. Weise, S. Munro, M. Van Vuuren, R. Van Vuuren, Spotting cheetahs: identifying individuals by their footprints, JoVE (Journal of Visualized Experiments) (111) (2016).

#### Missing Patterns in R

This folder contains the Missing Patterns of the respective animals. The missing patterns indicate which variables depend on which landmark points. The correlation is binary coded; 1 corresponds to a correlation and 0 does not. Therefore, a missing value in one landmark point results in missing values in all dependent variables.

### R Codes for Missing Value Imputation

This folder contains the self-written function for applying a Missing Completely at Random (MCAR) algorithm for calculating missing values. The *Adding_MCAR* function randomly generates a certain proportion of missing values in the respective landmark points and then calculates all the residual missing values in the variables. In the project, different proportions of missing values in the landmark points were examined. For more details, please refer to the corresponding paper. In addition to this function, an example of the application of adding and imputing missing values is also provided. As an example mean, missForst, mice pmm, mice rf, and missRanger are applied to the Cheetah dataset with 10% missing landmarks. For all scenarios described in the paper, an analogous approach was taken.

#### Installation

To introduce missing values and apply the imputation methods, the packages *missMethods*, *missForest*, *mice*, and *missRanger* must be loaded.

## JMP JSL Code for Footprint Identification Technology

### Usage Instructions

1. Download the datasets from the **Datasets** folder.

2. Start RStudio and install the R packages described in **Installation**.

3. Download the datasets from the **R Codes** folder *Adding_MCAR*. Apply the function as described in the comments in the R code. Select the appropriate parameters.

4. Impute the missing values in the same way as in the R code *Example_Imputation*.

5. Start JMP Pro 16.2.

6. Duplicate the Raw Dataset of a species, change the name of each individual animal and each trail to "RCV," and save it under a new table name.

7. Stack the two tables with matching column names.

8. Execute the Cheetah JMautoscript.jsl script and adjust the parameters (No. Variables, Counter Probability, and Wards Cutoff) to match the species of interest.

9. Populate the results table with the prediction of the confusion matrix of the pairwise comparison model and calculate the target metrics as described in the paper.

### Additional Resources

- Download FIT application files [here](https://1drv.ms/f/s!AqGN38c8mh7Wi6gn9AGHwaNUL5yGAQ?e=ioAqpe).

- Detailed instructions on running and interpreting FIT can be found in this [video](https://www.jove.com/de/v/54034/spotting-cheetahs-identifying-individuals-by-their-footprints) (Time: 4:40 - 6:57).

### Model Parameters per Species

The script mentioned above uses default parameters for a Cheetah pairwise analysis model. You can manually adjust parameters for other species within the user interface or the script. Species-specific parameters used in this study are provided in the table below:

| Species (Latin Name)              | No. of Variables | Counter Probability | Wards Cutoff Distance |
|-----------------------------------|------------------|--------------------|-----------------------|
| Amur Tiger (*Panthera tigris altaica*)    | 18           | 0.50               | 1.95                  |
| Cheetah (*Acinonyx jubatus*)             | 18           | 0.50               | 1.90                  |
| Giant Panda (*Ailuropoda melanoleuca*)    | 12           | 0.50               | 1.50                  |
| Mountain Lion (*Puma concolor*)           | 18           | 0.50               | 1.90                  |
| White Rhino (*Ceratotherium simum*)       | 12           | 0.50               | 1.95                  |
| Cheetah (Experiment 2)                   | 18           | 0.50               | 1.90                  |

### Data Processing Note

Due to issues in an automation attempt, all FIT model runs have been conducted separately and manually. The raw metrics from the pairwise comparison model and the predicted number of animals were manually added to the results table. Target metrics were calculated as described in the manuskript.

## EDS214 Data Exploration and Reproducibility

### **1) Purpose**

This project is intended to serve as practice for reproducing analysis and figures produced by scientific research that is published to GitHub. The data and analysis in this repository is an attempt at reproducing Schaefer et. al's research about nutrient levels in lakes and streams after hurricane Hugo in Puerto Rico in 1989. More specifically, this repo is purposed to reproduce Fig. 2 of Schaefer et. al.'s paper, pictured below.

![](fig3_example.png){width="300"}

### **2) Contents**

This repo contains scripts which house code that seeks to recreate the analysis performed to create the figure picture above. In addition to scripts, this repo contains all of the raw and cleaned data that was utilized in Schaefer et. al.'s research, and obtained from the Environmental Data Initiatives website at (<https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-luq.20.4923064>).

##### **data**
Contains the raw data from Schaeffer et. al. 2000 for ion (constituent) levels in four watersheds in Puerto Rico

##### **1_environment_init**
Contains all necessary packages and functions for analysis.

##### **2_data_cleaning**
Contains the scripts that import the necessary data, and the script that cleans the data before analysis.

##### **3_analysis**
Contains the primary analysis of the cleaned data. The script in this folder applies the roll_mean function for each constituent value, and susequently cleans/transforms the data into a final data frame called data_comb_avgs.

##### **4_processed_data**
Contains an export of the data frame used to plot Figure 3, saved as data_comb_avgs.csv

##### **5_plot**
Contains the script that produces Figure 3

##### **docs**

Contains the quarto document that can be rendered to view the steps taken to produce Figure 3

#### 

### **3) Flowchart**

The flowchart below provides a visual for the workflow of this project

![](Flowchart.png){width="500"}

### **4) Analysis**

This analysis can be broke up into 5 parts, listed below:

#### **1 - Environment Initialization**

This step installs the following packages and functions necessary to run the analysis:

-   (tidyverse) - tools for data manipulation, visualization, and analysis

-   (here) - simplifies file referencing

-   (janitor) - provides functions for data cleaning

-   (lubridate) - provides functions for parsing, extracting, and manipulating date-time data

-   roll_avg - Function; calculates the rolling average of concentration values within a specified time window (in weeks) centered around a given focal date. It identifies dates within the window, extracts the corresponding concentration values, and returns their mean, ignoring any missing (NA) values.

#### **2 - Data Import**

#### **3 - Data Cleaning**

#### **4 - Analysis**

#### **5 - Plot Generation**

##### 

### **4) Data Access**

Schaefer et. al's raw data is made publicly available by the Environmental Data Initiative organisation, and can be downloaded at the link provided in the contents section. A citation for the data source is also located below in the references for this repository.

### **5) Author**

Henry Oliver, the author of this repository is currently a student in the Masters of Environmental Data Science program at the University of California, Santa Barbara.

### **6) References**

Schaefer, D. A., McDowell, W. H., Scatena, F. N., & Asbury, C. E. (2000). *Effects of hurricane disturbance on stream water concentrations and fluxes in eight tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico*. **Journal of Tropical Ecology, 16**, 189–207. <https://doi.org/10.1017/S0266467400001358>

McDowell, W. and International Institute of Tropical Forestry(IITF), USDA Forest Service.. 2024. Chemistry of stream water from the Luquillo Mountains ver 4923064. Environmental Data Initiative. <https://doi.org/10.6073/pasta/f31349bebdc304f758718f4798d25458> (Accessed 2025-08-26).

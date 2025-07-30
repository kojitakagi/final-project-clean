# Diabetes Prediction API

This is a simple REST API built with the `plumber` package in R.  
It predicts the probability of diabetes based on selected health indicators from the BRFSS 2015 dataset.

---

## Author

**Koji Takagi**  
**GitHub Pages (Model Summary):**  
https://kojitakagi.github.io/final-project/

---

## How to Launch the API Locally

1. Open **R** or **RStudio**.
2. Set your working directory to the root of this project.
3. Run the following code:

```r
library(plumber)
api <- pr("plumber.R")
api$run(port = 8000)
```
Then go to: http://127.0.0.1:8000/__docs__/ in your browser to access Swagger UI.

API Endpoints
1. GET /predict
Predicts the probability of having diabetes based on the following predictors:

high_bp: 0 or 1 (default = 1)

bmi: numeric (default = 28.5)

high_chol: 0 or 1 (default = 1)

chol_check: 0 or 1 (default = 1)

Example Calls:

http://127.0.0.1:8000/predict?high_bp=1&bmi=28.5&high_chol=1&chol_check=1

http://127.0.0.1:8000/predict?high_bp=0&bmi=35&high_chol=1&chol_check=1

http://127.0.0.1:8000/predict?high_bp=1&bmi=22&high_chol=0&chol_check=0

2. GET /info
Returns basic information about the API author and GitHub Pages site.
Example Call:
http://127.0.0.1:8000/info

Requirements
Make sure the following R packages are installed:

plumber

tidyverse

caret

janitor

You can install them via:
```r
install.packages(c("plumber", "tidyverse", "caret", "janitor"))
```
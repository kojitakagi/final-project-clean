# plumber.R
#* @apiTitle Diabetes Prediction API
# Load necessary libraries
library(plumber)
library(readr)
library(dplyr)
library(ggplot2)
library(caret)
library(janitor)

# Load and prepare data
df <- read_csv("diabetes_binary_health_indicators_BRFSS2015.csv") %>%
  clean_names() %>%
  mutate(
    diabetes_binary = factor(diabetes_binary, labels = c("No", "Yes")),
    high_bp = factor(high_bp),
    high_chol = factor(high_chol),
    chol_check = factor(chol_check),
    bmi = as.numeric(bmi)
  )

# Train-test split (only training needed here)
set.seed(2025)
train_idx <- createDataPartition(df$diabetes_binary, p = 0.7, list = FALSE)
train_data <- df[train_idx, ]

# Fit the best model (logistic regression)
ctrl <- trainControl(method = "cv", number = 5, classProbs = TRUE, summaryFunction = mnLogLoss)
final_model <- train(
  diabetes_binary ~ high_bp + bmi + high_chol + chol_check,
  data = train_data,
  method = "glm",
  family = "binomial",
  trControl = ctrl,
  metric = "logLoss"
)

#* Predict diabetes probability
#* @param high_bp 0 or 1 (default = 1)
#* @param bmi numeric (default = 28.5)
#* @param high_chol 0 or 1 (default = 1)
#* @param chol_check 0 or 1 (default = 1)
#* @get /predict
function(high_bp = 1, bmi = 28.5, high_chol = 1, chol_check = 1) {
  new_data <- data.frame(
    high_bp = factor(as.numeric(high_bp), levels = c(0, 1)),
    bmi = as.numeric(bmi),
    high_chol = factor(as.numeric(high_chol), levels = c(0, 1)),
    chol_check = factor(as.numeric(chol_check), levels = c(0, 1))
  )
  probs <- predict(final_model, newdata = new_data, type = "prob")
  return(list(probability_yes = probs$Yes))
}

#* Info endpoint
#* @get /info
function() {
  list(
    name = "Koji Takagi",
    github_pages_url = "https://kojitakagi.github.io/final-project/"
  )
}

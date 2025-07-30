FROM rstudio/plumber

RUN apt-get update -qq && apt-get install -y \
    libssl-dev \
    libcurl4-gnutls-dev \
    libpng-dev \
    pandoc

RUN R -e "install.packages(c('plumber', 'readr', 'dplyr', 'ggplot2', 'caret', 'janitor'), repos='https://cloud.r-project.org/')"

COPY plumber.R /app/plumber.R
COPY diabetes_binary_health_indicators_BRFSS2015.csv /app/diabetes_binary_health_indicators_BRFSS2015.csv

WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('plumber.R'); pr$run(host='0.0.0.0', port=8000)"]


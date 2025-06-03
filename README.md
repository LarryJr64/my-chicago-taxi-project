# Chicago Taxi Trip Analysis: Weather and Trip Duration

## Introduction

This project analyzes Chicago taxi trip data from BigQuery to explore the relationship between weather conditions and trip duration. The goal is to build a Looker Studio dashboard that visualizes this relationship, based on the hypothesis that weather affects trip duration. This project uses dbt for data transformation and Terraform for infrastructure provisioning on Google Cloud.

## Deliverables

*   GitHub repository containing code (Terraform, dbt, and potentially scripts for data ingestion).
*   Looker Studio dashboard visualizing the relationship between weather and taxi trip duration.

## Project Structure
. ├── README.md # This file ├── credentials/ # Credentials (git ignored) │ └── dbt-service-account.json ├── dashboard/ # Looker Studio dashboard (placeholder) │ └── .gitkeep ├── dbt/ # dbt project │ ├── dbt_project.yml # dbt project configuration │ ├── profiles.yml # dbt profiles configuration │ ├── models/ # dbt models │ │ ├── filtered_trips.sql # SQL model to filter trips │ │ └── join_model.sql # SQL model to join trips and weather data │ └── logs/ # dbt logs (git ignored) ├── logs/ # General logs (git ignored) ├── scripts/ # Scripts (placeholder) │ └── .gitkeep ├── terraform/ # Terraform configuration │ ├── main.tf # Main Terraform file │ ├── variables.tf # Terraform variables │ ├── terraform.tfvars # Terraform variables (git ignored) │ └── credentials/ # Credentials for Terraform (git ignored) └── .gitignore # Git ignore file


## dbt Configuration

*   [`dbt_project.yml`](dbt/dbt_project.yml): Defines the dbt project, including the profile, model paths, and target path.
*   [`profiles.yml`](dbt/profiles.yml): Configures the connection to BigQuery using the `assignment_profile` profile.
*   [`models/filtered_trips.sql`](dbt/models/filtered_trips.sql): Filters taxi trip data based on the `trip_start_timestamp`.
*   [`models/join_model.sql`](dbt/models/join_model.sql): Joins the filtered taxi trip data with weather data.

## Terraform Configuration

*   [`terraform/main.tf`](terraform/main.tf): Defines the Google Cloud resources.
*   [`terraform/variables.tf`](terraform/variables.tf): Declares the variables used in the Terraform configuration, such as `project_id` and `region`.
*   [`terraform/terraform.tfvars`](terraform/terraform.tfvars): Assigns values to the variables declared in `variables.tf`. This file is git ignored for security reasons.

## Credentials

*   [`credentials/dbt-service-account.json`](credentials/dbt-service-account.json): Service account key for dbt to access BigQuery.  **Note:** This file should be kept secure and is git ignored.

## Getting Started

1.  **Set up Google Cloud project:**
    *   Create a new Google Cloud project.
    *   Enable the BigQuery API.
2.  **Configure Terraform:**
    *   Install the Terraform CLI.
    *   Authenticate Terraform with Google Cloud.
    *   Update the `terraform/terraform.tfvars` file with your project ID and region.
3.  **Deploy Infrastructure:**
    ```bash
    cd terraform
    terraform init
    terraform plan
    terraform apply
    ```
4.  **Configure dbt:**
    *   Install dbt.
    *   Update the `dbt/profiles.yml` file with the correct credentials and project details.
5.  **Run dbt Models:**
    ```bash
    cd dbt
    dbt run
    ```
6.  **Create Looker Studio Dashboard:**
    *   Connect Looker Studio to the BigQuery datasets created by dbt.
    *   Create visualizations to analyze the relationship between weather conditions and trip duration.

## Important

By selecting only six months of data, your queries will not cost anything and will enter the free-tier offered by Google Cloud on any new projects.

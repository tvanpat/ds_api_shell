# ds_api_shell
A simple shell script to create a folder structure to build a model and deploy it through FastAPI.

Upon execution the script will build the structure below.

```
project
└───data
└───notebooks
│   │   01_eda.ipynb
│   │   02_data_imputation_model_build.ipynb
│   │   03_data_preprocessing_final.ipynb
│   │   04_model_training.ipynb
│   │   workbench.ipynb
└───references
└───src
│   └───app
│   |   └───assets
|   |   |   └───models
|   |   |   |   └───current_models
|   |   |   |   └───data_preprocessing_models
|   |   |   |   └───deprecated_models
|   |   |   |   └───test_models
│   |   └───modules
|   |   |   __init__.py
|   |   |   data_pre.py
|   |   |   models.py
│   |   |   .env
│   |   |   main.py
│   │   Dockerfile
│   │   fastapi-docker-compose.yml
│   │   requirements.txt
│   │   setup.py
|   .gitignore
|   Dockerfile
|   notebook-docker-compose.yml
|   README.md
|   requirements.txt
```
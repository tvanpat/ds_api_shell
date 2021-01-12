mkdir data
#Create Notebook folder and developement notebooks
mkdir notebooks
touch notebooks/01_eda.ipynb
touch notebooks/02_data_imputation_model_build.ipynb
touch notebooks/03_data_preprocessing_final.ipynb
touch notebooks/04_model_training.ipynb
touch notebooks/workbench.ipynb
mkdir references
#setup src directory
mkdir src
mkdir src/app
# Create the FastApi Dockerfile
touch src/Dockerfile
cat << 'EOF' >> Dockerfile
FROM tiangolo/uvicorn-gunicorn-fastapi:latest-2020-06-06
COPY requirements.txt .
RUN pip --no-cache-dir install -r requirements.txt
COPY ./app /app
EOF
# Create Docker Compose file
cat << 'EOF' >> src/fastapi-docker-compose.yml
version: '3.7'
services:
  web:
    build: .
    command: uvicorn main:app --reload --workers 1 --host 0.0.0.0 --port 80
    volumes:
      - ./app:/app
    ports:
      - 8002:80
    environment:
      - ENVIRONMENT=dev
      - TESTING=0
EOF
touch src/requirements.txt
touch src/setup.py
#Create app folder
mkdir src/app/assets
#Create modules/models folder
mkdir src/app/modules
touch src/app/modules/__init__.py
touch src/app/modules/data_pre.py
touch src/app/modules/models.py
mkdir src/app/assets/models
mkdir src/app/assets/models/current_models
mkdir src/app/assets/models/data_preprocessing_models
mkdir src/app/assets/models/deprecated_models
mkdir src/app/assets/models/test_models
touch src/app/.env
touch src/app/main.py
#setup gitignore
touch .gitignore
echo ".ipynb_checkpoints" >> .gitignore
echo ".env" >> .gitignore
#create dockerfile for the notebooks
touch Dockerfile
cat << 'EOF' >> notebook-docker-compose.yml
version: "3"
services:
  ds-notebook:
    image: jupyter/scipy-notebook
    environment:
        - JUPYTER_ENABLE_LAB=yes

    volumes:
        - ./:/home/jovyan/work
    ports:
      - "8888:8888"
EOF
touch README.md
touch requirements.txt
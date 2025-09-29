# Install Django

Create a virtual envirenment

```sh
python -m venv ll_env

# Activate the virtual environment
source ll_env/bin/activate

# To get out of the virtual environment use 'deactivate' command
(ll_env) $ deactivate
```

## Install pip and django

```sh
pip install --upgrade pip
pip install django
```

### Creating a django project

```sh
django-admin startproject ll_project .
```

- Creating the database

```sh
python manage.py migrate
```

### Running and Viewing the project

Run server

```sh
python manage.py runserver
```

Launch web browser

```sh
firefox http://127.0.0.1:8000
```

### Starting an app

In a new terminal

```sh
source ll_env/bin/activate

# To get out of the virtual environment use 'deactivate' command

python manage.py startapp learning_logs
```

#### Modify the app

- Defining Models

```sh
learning_logs/models.py
```

- Activating Models

```sh
# File: ll_project/settings.py

python manage.py makemigrations learning_logs

python manage.py migrate
```

### The Django Admin Site

```sh
python manage.py createsuperuser

User: ll_admin
Pwd: supersecret
```

#### Registering a Model with the Admin Site

```sh
learning_logs/models.py
```

- Defining the Entry Model

```sh
learning_logs/models.py
```

- Migrating the Entry Model

```sh
python manage.py makemigrations learning_logs

python manage.py migrate
```

## Making Pages: The Learning Log Home Page

### Mapping a URL

```sh
ll_project/urls.py
```

### Setting Up User Account

#### The Account App

```sh
python manage.py startapp accounts

ls -l

ls -l accounts
```

```sh
Another user: nim, passwd: nimsecret
```

- Allowing Users to Own Their Data

```sh
python manage.py makemigrations learning_logs

python manage.py migrate
```

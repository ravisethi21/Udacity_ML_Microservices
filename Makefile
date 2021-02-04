## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	pip3 install --upgrade pip &&\
		pip3 install --trusted-host pypi.python.org -r requirements.txt

install_local_hadolint:
	# Install hadolint locally
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	sudo chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

run_docker:
	./utils/run_docker.sh

upload_docker:
	./utils/upload_docker.sh

run_kubernetes:
	./utils/run_kubernetes.sh

all: install lint test

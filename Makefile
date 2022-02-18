setup:
	pyenv install --skip-existing 3.7.12 &&\
		pyenv uninstall -f flask-ml-azure &&\
		pyenv virtualenv --force 3.7.12 flask-ml-azure &&\
		pyenv local flask-ml-azure
	
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
#	python -m pytest -vv --cov=myrepolib tests/*.py
#	python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203,W0702 --indent-string='    ' app.py

all: install lint test

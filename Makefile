username=$(shell whoami)
password=$(PW)
session=$(SS)
hub=$(H)

all:
	python3 setup.py bdist_wheel
	pip uninstall jupyterhub
	pip install dist/*.whl

run:
	jupyterhub -f config.py

session:
	curl -X POST 'http://localhost:8000/hub/login?next=' -H 'Content-Type: application/x-www-form-urlencoded' --data-raw "username=$(username)&password=$(password)" --compressed -v

open:
	google-chrome-stable http://localhost:8000/hub/session?session=$(SS)&username=$(username)&hub=$(H)

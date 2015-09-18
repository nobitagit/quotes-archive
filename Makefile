.DEFAULT_GOAL := publish

FOLDER_SCRIPTS = "scripts"
FOLDER_SRC = "src"
FOLDER_DIST = "dist"

MAIN_FILE_NAME = archive.json
MAIN_FILE_SRC  = $(FOLDER_SRC)/$(MAIN_FILE_NAME)
MAIN_FILE_DIST = $(FOLDER_DIST)/$(MAIN_FILE_NAME)

publish:
	make lint && make build && make tags

build:
	cat $(MAIN_FILE_SRC) | python $(FOLDER_SCRIPTS)/process_archive.py > $(MAIN_FILE_DIST)

# Just logs ok, no piping to stdout
lint:
	python -mjson.tool $(MAIN_FILE_SRC) 1> /dev/null 2>&1 && echo "Json is Valid"

# create a file listing all tags that are currently used in the archive
tags:
	cat $(MAIN_FILE_DIST) | python $(FOLDER_SCRIPTS)/list_tags.py > $(FOLDER_DIST)/tags.json

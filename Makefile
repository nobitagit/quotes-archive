FOLDER_SCRIPTS = "scripts"
FOLDER_SRC = "src"
FOLDER_DIST = "dist"

MAIN_FILE_NAME = archive.json
MAIN_FILE_SRC  = $(FOLDER_SRC)/$(MAIN_FILE_NAME)
MAIN_FILE_DIST = $(FOLDER_DIST)/$(MAIN_FILE_NAME)

lint:
	python -mjson.tool $(MAIN_FILE_SRC ) > /dev/null && echo "All ok."

# create a file listing all tags that are currently used in the archive
tags:
	cat $(MAIN_FILE_SRC) | python $(FOLDER_SCRIPTS)/list_tags.py > $(FOLDER_DIST)/tags.json
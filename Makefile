SUCCESS_MSG = "All ok."

lint:
	python -mjson.tool archive.json > /dev/null && echo $(SUCCESS_MSG)
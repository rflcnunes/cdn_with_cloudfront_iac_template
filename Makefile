# Build lambda function
build-lambda:
	@echo "Building lambda function"
	@cd app/IPFinder && \
		go mod tidy && \
		GOOS=linux GOARCH=amd64 go build -o bootstrap main.go && \
		zip -j ../../artifacts/lambdas/ip_finder.zip bootstrap && \
		rm bootstrap
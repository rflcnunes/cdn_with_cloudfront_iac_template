# Build lambda function
build-lambda:
	@echo "Building lambda function"
	@cd app/IPFinder && \
		go mod tidy && \
		GOOS=linux GOARCH=amd64 go build -o bootstrap main.go && \
		zip -j ../../artifacts/lambdas/ip_finder.zip bootstrap && \
		rm bootstrap && \
		cd ../..

# Build CDN
build-cdn:
	@echo "Building CDN"
	@cd app/cdn && \
		npm install && \
		npm run build && \
		cp -r dist ../../artifacts/cdn && \
		cd ../..

# Build all resources for deployment
build:
	@echo "Building resources for deployment"
	@mkdir -p artifacts/lambdas && \
		mkdir -p artifacts/cdn/dist && \
		make build-lambda && \
		make build-cdn
# Terraform Project for AWS Infrastructure template

This project uses Terraform to configure various resources on AWS, creating a template for a CDN application and a
Lambda function that checks the client's final IP. The main goal of this project is educational. I developed this
template to study the technologies used in the project and also to create something practical: a template for CDN and
Lambda using Infrastructure as Code (IaC).

## Covered Topics

* Organization of the code into reusable modules for various infrastructure components.
* Implementation of Hexagonal Architecture.
* Definition of access policies.
* Integration of CloudWatch Logs with the Lambda function.
* Configuration of the API Gateway to expose the Lambda function as an HTTP endpoint.
* Setup of a CloudFront distribution to distribute content from the S3 bucket.
* Use of variables to make the configuration flexible and reusable.
* Definition of outputs to facilitate the retrieval of important information from the created resources.
* Use of depends_on to ensure the correct order of resource creation.
* Automation of infrastructure build with a Makefile.
* Creation of a Lambda function using API Gateway events to check the client's final IP with Golang.
* Creation of an S3 Bucket to store static content and function as a CDN.
* Implementation of a CloudFront distribution to distribute content from the S3 Bucket.

### 1. Architecture resources

- **Hexagonal Architecture**: Organization of the CDN code.

### 2. AWS resources

- **S3**: Implementation of an S3 bucket with restricted access policies.
- **IAM**: Definition of IAM roles and policies to ensure the secure operation of AWS resources.
- **Lambda**: Creation of a Lambda function, configured for logging in CloudWatch.
- **API Gateway**: Establishment of an API Gateway to make the Lambda function available as an HTTP endpoint.
- **CloudFront**: Configuration of a CloudFront distribution for the delivery of content from the S3 bucket, with
  restrictions on direct access.

### 3. Resources Used for Application Construction

- **Golang**: Used to create the Lambda function that checks the client's final IP.
- **JavaScript**: Used to create the CDN application.
- **Webpack**: Used to bundle the CDN application.
- **Terraform**: Used to configure the infrastructure on AWS.
- **Makefile**: Used to automate the infrastructure build.

## Project Structure

```plaintext
  terraform/
  ├── main.tf                     # Main configuration of Terraform
  ├── variables.tf                # Variable declaration, information used in the code
  ├── outputs.tf                  # Outputs declaration, output information
  ├── providers.tf                # AWS provider configuration, region, and version
  ├── Makefile                    # File to automate the infrastructure build
  ├── artifacts/                  # Source code files and build-generated binaries used in the infrastructure
  │   ├── cdn/ 
  │   │   ├── dist/               # Built files of the CDN
  │   │   │   ├── index.min.js    # Minified JavaScript file used by the S3 Bucket
  │   ├── lambdas/                # Folder to centralize the zips of Lambda functions
  │   │   ├── ip_finder.zip/      # ZIP file of the Go Lambda function to check the final IP of the client
  ├── app/
  │   ├── cdn/                    # CDN to serve static content
  │   │   ├── src/                # Static content files, focused on Hexagonal Architecture
  │   │   │   ├── adapters/
  │   │   │   ├── application/
  │   │   │   ├── domain/
  │   │   │   ├── infrastructure/
  │   │   ├── main.js             # Main file of the application
  │   ├── IPFinder/               # Lambda function to check the final IP of the client
  │   │   ├── main.go             # Code of the Lambda function in Go
  ├── modules/                    # Reusable modules for different infrastructure components
  │   ├── s3/
  │   │   ├── main.tf             # S3 bucket configuration
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   │   └── policy.tf           # Access policy to the bucket
  │   ├── iam/
  │   │   ├── main.tf             # Configuration of IAM roles and policies
  │   │   ├── variables.tf
  │   │   └── outputs.tf
  │   ├── lambda/                 # Lambda function to check the final IP of the client
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   │   └── cloudwatch.tf       # Configuration of log groups in CloudWatch
  │   ├── api_gateway/            # API Gateway to expose the Lambda function as an HTTP endpoint
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   ├── cloudfront/             # CloudFront distribution to serve content from the S3 bucket
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   └── outputs.tf
```

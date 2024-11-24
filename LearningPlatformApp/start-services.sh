#!/bin/bash

echo "Starting Learning Platform Services..."

# Function to wait for a service to be ready
wait_for_service() {
    local service_name=$1
    local port=$2
    echo "Waiting for $service_name to be ready..."
    while ! nc -z localhost $port; do
        sleep 1
    done
    echo "$service_name is ready!"
}

# Start Service Registry (Eureka)
echo "Starting Service Registry..."
cd service-registry
mvn spring-boot:run &
wait_for_service "Service Registry" 8761

# Start Config Server
echo "Starting Config Server..."
cd ../config-server
mvn spring-boot:run &
wait_for_service "Config Server" 8888

# Start API Gateway
echo "Starting API Gateway..."
cd ../api-gateway
mvn spring-boot:run &
wait_for_service "API Gateway" 8080

# Start Core Services
echo "Starting User Service..."
cd ../user-service
mvn spring-boot:run &
wait_for_service "User Service" 8081

echo "Starting Course Service..."
cd ../course-service
mvn spring-boot:run &
wait_for_service "Course Service" 8082

# Note: The following services need to be implemented before uncommenting
# echo "Starting Content Service..."
# cd ../content-service
# mvn spring-boot:run &
# wait_for_service "Content Service" 8083

# echo "Starting Payment Service..."
# cd ../payment-service
# mvn spring-boot:run &
# wait_for_service "Payment Service" 8084

# echo "Starting Admin Service..."
# cd ../admin-service
# mvn spring-boot:run &
# wait_for_service "Admin Service" 8085

echo "All available services have been started!"
echo "Note: content-service, payment-service, and admin-service need to be implemented."

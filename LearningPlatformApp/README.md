# Learning Platform Microservices

A comprehensive e-learning platform built with Spring Boot microservices architecture.

## System Architecture

The platform consists of the following microservices:

### Core Services
- **User Service** (Port: 8081): User management, authentication, and authorization
- **Course Service** (Port: 8082): Course management and metadata
- **Content Service** (Port: 8083): Content delivery and streaming *(To be implemented)*
- **Payment Service** (Port: 8084): Payment processing and subscriptions *(To be implemented)*
- **Admin Service** (Port: 8085): Administrative functions and analytics *(To be implemented)*

### Infrastructure Services
- **Service Registry** (Port: 8761): Service discovery using Netflix Eureka
- **Config Server** (Port: 8888): Centralized configuration management
- **API Gateway** (Port: 8080): Single entry point for all client requests

## Prerequisites

- Java 11
- Maven
- Git
- netcat (for service health checks)

## Project Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd learning-platform
```

2. Build all services:
```bash
mvn clean install
```

3. Ensure configuration files are in place:
- All service configurations are in the `config-repo` directory
- The config server is configured to use local file system configuration

## Running the Services

### Option 1: Using the Startup Script

1. Make the startup script executable:
```bash
chmod +x start-services.sh
```

2. Run the script:
```bash
./start-services.sh
```

The script will start services in the correct order:
1. Service Registry (Eureka)
2. Config Server
3. API Gateway
4. Core Services

### Option 2: Manual Startup

Start each service in the following order:

1. Service Registry:
```bash
cd service-registry
mvn spring-boot:run
```

2. Config Server:
```bash
cd config-server
mvn spring-boot:run
```

3. API Gateway:
```bash
cd api-gateway
mvn spring-boot:run
```

4. User Service:
```bash
cd user-service
mvn spring-boot:run
```

5. Course Service:
```bash
cd course-service
mvn spring-boot:run
```

## Service Status Verification

1. Eureka Dashboard: http://localhost:8761
2. API Gateway: http://localhost:8080
3. User Service: http://localhost:8081
4. Course Service: http://localhost:8082

## Development Status

### Implemented Services
- ✅ Service Registry
- ✅ Config Server
- ✅ API Gateway
- ✅ User Service
- ✅ Course Service

### Pending Implementation
- ⏳ Content Service
- ⏳ Payment Service
- ⏳ Admin Service

## Security

- JWT-based authentication
- Role-based access control
- Secure communication between services
- API Gateway security filters

## Configuration

- Service-specific configurations are in `config-repo/<service-name>.yml`
- Common configurations are in `config-repo/application.yml`
- Environment-specific properties can be added as `application-{env}.yml`

## Monitoring and Management

- Each service exposes actuator endpoints for monitoring
- Health checks are available at `/actuator/health`
- Metrics are available at `/actuator/metrics`

## Next Steps

1. Implement remaining services:
   - Content Service
   - Payment Service
   - Admin Service
2. Set up proper logging aggregation
3. Implement monitoring and alerting
4. Set up CI/CD pipeline
5. Configure production-ready security measures

## Contributing

1. Create a feature branch
2. Make your changes
3. Submit a pull request

## License

This project is licensed under the Apache License 2.0

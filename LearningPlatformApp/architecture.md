# Learning Platform Microservices Architecture

## 1. System Overview

The Learning Platform is a distributed microservices-based application designed to provide a scalable and robust e-learning solution. The system supports multiple user roles and provides various functionalities including course creation, user management, payment processing, and content delivery.

## 2. Core Microservices

### 2.1 User Service (user-service)
- Handles user registration, authentication, and authorization
- Manages user profiles and roles (Content Authors, Users, Learners, Site Admin)
- JWT-based authentication
- Port: 8081
- Database: User profiles, roles, and credentials

### 2.2 Course Service (course-service)
- Manages course creation and course metadata
- Handles course catalog and search
- Course content management for authors
- Port: 8082
- Database: Course metadata, modules, lessons

### 2.3 Content Delivery Service (content-service)
- Handles video/content streaming
- Content access management
- Progress tracking
- Port: 8083
- Database: Content storage, progress tracking

### 2.4 Payment Service (payment-service)
- Processes payments
- Manages course purchases
- Handles refunds and payment history
- Port: 8084
- Database: Payment transactions, purchase history

### 2.5 Admin Service (admin-service)
- Analytics and reporting
- Package management
- Discount management
- User management (block/unblock)
- Port: 8085
- Database: Packages, discounts, analytics

## 3. Infrastructure Services

### 3.1 API Gateway (Spring Cloud Gateway)
- Single entry point for all client requests
- Route requests to appropriate services
- Handle cross-cutting concerns
- Port: 8080

### 3.2 Service Registry (Eureka Server)
- Service discovery and registration
- Health monitoring
- Port: 8761

### 3.3 Config Server
- Centralized configuration management
- Environment-specific configurations
- Port: 8888

### 3.4 Circuit Breaker (Hystrix)
- Fault tolerance
- Service degradation handling
- Default fallback mechanisms

## 4. Security Architecture

### 4.1 Authentication Flow
1. User logs in through User Service
2. JWT token generated and returned
3. Subsequent requests include JWT in Authorization header
4. API Gateway validates tokens
5. Role-based access control implemented at service level

### 4.2 Security Measures
- JWT for stateless authentication
- Role-based access control
- API Gateway security filters
- Hashicorp Vault for secrets management
- HTTPS/TLS for all communications

## 5. Database Architecture

### 5.1 Database Per Service
Each microservice maintains its own database to ensure loose coupling:
- User Service: User data (H2)
- Course Service: Course metadata (H2)
- Content Service: Content and progress data (H2)
- Payment Service: Transaction data (H2)
- Admin Service: Administrative data (H2)

## 6. Communication Patterns

### 6.1 Synchronous Communication
- REST APIs for direct service-to-service communication
- Feign clients for service calls
- Circuit breakers for fault tolerance

### 6.2 Asynchronous Communication
- Event-driven architecture for specific flows
- Message queues for decoupled operations

## 7. Deployment Architecture

### 7.1 Container-Based Deployment
- Each service packaged as a Docker container
- Scalable independently
- Managed through container orchestration

### 7.2 Configuration Management
- Spring Cloud Config Server for centralized configuration
- Environment-specific properties
- Secrets managed through Vault

## 8. Monitoring and Logging

### 8.1 Monitoring
- Health endpoints for each service
- Metrics collection
- Performance monitoring

### 8.2 Logging
- Centralized logging
- Correlation IDs for request tracking
- Error tracking and alerting

## 9. Implementation Steps

1. Set up infrastructure services:
   - Eureka Server
   - Config Server
   - API Gateway
   - Vault

2. Implement core services:
   - User Service
   - Course Service
   - Content Service
   - Payment Service
   - Admin Service

3. Implement cross-cutting concerns:
   - Security
   - Logging
   - Monitoring
   - Circuit breakers

4. Testing:
   - Unit tests
   - Integration tests
   - End-to-end tests

5. Documentation:
   - API documentation
   - Deployment guides
   - User manuals

## 10. Technology Stack

- Java 11
- Spring Boot 2.x
- Spring Cloud
- Maven
- H2 Database
- JWT
- Spring Security
- Swagger/OpenAPI
- JUnit/Mockito
- Docker
- Hashicorp Vault

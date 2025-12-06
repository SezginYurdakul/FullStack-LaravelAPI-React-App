# Full Stack App for Windows OS


## 🚀 Tech Stack

### Backend
- **Laravel** 12.x (Latest)
- **PHP** 8.4 FPM
- **PostgreSQL** 16 (Primary Database)
- **Redis** 7 (Cache, Session, Queue)
- **Elasticsearch** 8.11.3 (Search Engine)

### Frontend
- **React** 19.x
- **Vite** 7.x (Build Tool)
- **Tailwind CSS** 3.x (Styling)
- **React Router DOM** 7.x (Routing)
- **Axios** (HTTP Client)
- **TanStack Query** (React Query - Data Fetching)

### Infrastructure
- **Docker & Docker Compose**
- **Nginx** (Web Server)
- **Kibana** 8.11.3 (Elasticsearch UI)
- **pgAdmin** 4 (PostgreSQL UI)

## 📦 Docker Containers

| Container | Image | Purpose | Ports |
|-----------|-------|---------|-------|
| `sms_nginx` | nginx:alpine | Web server for API & frontend | 8888:80, 8443:443 |
| `sms_php` | php:8.4-fpm-alpine | Laravel application | 9000 (internal) |
| `sms_postgres` | postgres:16-alpine | Primary database | 5432:5432 |
| `sms_redis` | redis:7-alpine | Cache, sessions, queues | 6379:6379 |
| `sms_elasticsearch` | elasticsearch:8.11.3 | Search engine | 9200:9200, 9300:9300 |
| `sms_kibana` | kibana:8.11.3 | Elasticsearch management UI | 5601:5601 |
| `sms_node` | node:20-alpine | React development server | 5173:5173 |
| `sms_pgadmin` | pgadmin4:latest | PostgreSQL management UI | 5050:80 |

## 🛠️ Prerequisites

- Docker Engine 20.x or higher
- Docker Compose 2.x or higher
- At least 4GB RAM (2GB for Elasticsearch)
- Git

## ⚡ Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd SmartStock
```

### 2. Run Setup Script

The setup script will automatically:
- Create Laravel backend project
- Create React frontend project (optional)
- Install all dependencies
- Configure database connections
- Build Docker images
- Start all containers
- Run database migrations
- Install Laravel Sanctum for API authentication

```bash
chmod +x setup.sh
./setup.sh
```

**Installation Options:**

When you run the setup script, you'll be prompted to choose:

1. **Full-stack Mode** (Default) - Complete application with Laravel backend + React frontend
   - ✅ Laravel backend with views and API support
   - ✅ React frontend with Vite dev server
   - ✅ All database and caching services
   - ✅ Perfect for building complete web applications

2. **API-only Mode** - Optimized for REST API development
   - ✅ Laravel backend optimized for API endpoints
   - ✅ Unnecessary view files removed
   - ✅ Laravel Sanctum pre-installed
   - ✅ All database and caching services
   - ✅ Perfect for mobile apps, microservices, or separate frontend projects

### 3. Access the Application

After setup completes, you can access:

- **Frontend (Development)**: http://localhost:5173
- **Backend API**: http://localhost:8888/api
- **Kibana (Elasticsearch UI)**: http://localhost:5601
- **pgAdmin (Database UI)**: http://localhost:5050

## 🔑 Default Credentials

### PostgreSQL Database
- **Host**: localhost
- **Port**: 5432
- **Database**: laravel
- **Username**: laravel
- **Password**: secret

### pgAdmin
- **Email**: admin@admin.com
- **Password**: admin

### Elasticsearch
- **URL**: http://localhost:9200
- **Authentication**: Disabled (development only)

## 📁 Project Structure

```
SmartStock/
├── backend/              # Laravel application
│   ├── app/
│   ├── config/
│   ├── database/
│   ├── routes/
│   └── ...
├── frontend/             # React application
│   ├── src/
│   ├── public/
│   ├── index.html
│   └── vite.config.js
├── docker/               # Docker configuration
│   ├── nginx/
│   │   └── default.conf
│   └── php/
│       ├── Dockerfile
│       └── php.ini
├── docker-compose.yml    # Docker services configuration
├── setup.sh             # Automated setup script
├── README.md            # This file
└── ELASTICSEARCH.md     # Elasticsearch integration guide
```

## 🎯 Key Features

### Backend Features
- RESTful API architecture
- PostgreSQL with full ACID compliance
- Redis-based caching and session management
- Elasticsearch integration for advanced search
- Queue system for background jobs
- Laravel Scout for model searching

### Frontend Features
- Modern React with hooks
- Tailwind CSS for responsive design
- React Router for SPA navigation
- TanStack Query for efficient data fetching
- Axios for API communication
- Vite for fast HMR and builds

### Infrastructure Features
- Fully containerized with Docker
- One-command setup
- Persistent data volumes
- Development and production ready
- Horizontal scalability support

## 🔧 Useful Commands

### Docker Operations
```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# View logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f php
docker-compose logs -f nginx
docker-compose logs -f elasticsearch

# Restart a service
docker-compose restart php
```

### Backend (Laravel) Commands
```bash
# Enter PHP container
docker-compose exec php sh

# Run migrations
docker-compose exec php php artisan migrate

# Create migration
docker-compose exec php php artisan make:migration create_products_table

# Create model
docker-compose exec php php artisan make:model Product

# Create controller
docker-compose exec php php artisan make:controller ProductController

# Clear cache
docker-compose exec php php artisan cache:clear
docker-compose exec php php artisan config:clear
docker-compose exec php php artisan route:clear

# Run tests
docker-compose exec php php artisan test
```

### Frontend (React) Commands
```bash
# Enter Node container
docker-compose exec node sh

# Install new package
docker-compose exec node npm install <package-name>

# Build for production
docker-compose exec node npm run build

# Run linter
docker-compose exec node npm run lint
```

### Database Operations
```bash
# Access PostgreSQL CLI
docker-compose exec postgres psql -U laravel -d laravel

# Backup database
docker-compose exec postgres pg_dump -U laravel laravel > backup.sql

# Restore database
docker-compose exec -T postgres psql -U laravel laravel < backup.sql
```

### Elasticsearch Operations
```bash
# Check Elasticsearch health
curl http://localhost:9200/_cluster/health?pretty

# List all indices
curl http://localhost:9200/_cat/indices?v

# Import models to Elasticsearch
docker-compose exec php php artisan scout:import "App\Models\Product"

# Flush Elasticsearch index
docker-compose exec php php artisan scout:flush "App\Models\Product"
```

## 🔍 Elasticsearch Integration

For detailed Elasticsearch setup and usage, see [ELASTICSEARCH.md](ELASTICSEARCH.md).

Quick setup:
```bash
# Install Laravel Scout and Elasticsearch driver
docker-compose exec php composer require laravel/scout
docker-compose exec php composer require matchish/laravel-scout-elasticsearch

# Publish Scout configuration
docker-compose exec php php artisan vendor:publish --provider="Laravel\Scout\ScoutServiceProvider"
```

## 🌐 Environment Variables

### Backend (.env)
```env
APP_NAME="Smart Stock Management"
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret

REDIS_HOST=redis
REDIS_PORT=6379

ELASTICSEARCH_HOST=elasticsearch
ELASTICSEARCH_PORT=9200
SCOUT_DRIVER=elasticsearch
```

### Frontend (.env)
```env
VITE_API_URL=http://localhost:8888/api
```

## 🏗️ Development Workflow

### Adding a New Feature

1. **Backend**:
   ```bash
   # Create migration
   docker-compose exec php php artisan make:migration create_feature_table

   # Create model with controller
   docker-compose exec php php artisan make:model Feature -mc

   # Run migration
   docker-compose exec php php artisan migrate
   ```

2. **Frontend**:
   ```bash
   # Create component files in frontend/src/components/
   # Add routes in frontend/src/App.jsx
   ```

3. **Testing**:
   ```bash
   # Test backend
   docker-compose exec php php artisan test

   # Test frontend (after adding tests)
   docker-compose exec node npm run test
   ```

## 🚢 Production Deployment

### Building for Production

```bash
# Build frontend
docker-compose exec node npm run build

# Optimize Laravel
docker-compose exec php php artisan config:cache
docker-compose exec php php artisan route:cache
docker-compose exec php php artisan view:cache
```

### Security Recommendations

1. Enable Elasticsearch security (xpack.security.enabled=true)
2. Use strong passwords for all services
3. Configure HTTPS with SSL certificates
4. Use environment-specific .env files
5. Enable Laravel's security features (CSRF, rate limiting)

## 📊 Resource Requirements

### Minimum
- CPU: 2 cores
- RAM: 4GB
- Disk: 10GB

### Recommended
- CPU: 4 cores
- RAM: 8GB
- Disk: 20GB SSD

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Check what's using the port
lsof -i :8888
lsof -i :5173

# Change ports in docker-compose.yml if needed
```

### Permission Denied Errors
```bash
# Fix backend permissions
chmod -R 755 backend
chmod -R 777 backend/storage backend/bootstrap/cache

# Fix frontend permissions (if files are owned by root)
sudo chown -R $USER:$USER frontend
```

### Elasticsearch Won't Start
```bash
# Increase vm.max_map_count on Linux
sudo sysctl -w vm.max_map_count=262144

# Make it permanent
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
```

### Database Connection Failed
```bash
# Wait for PostgreSQL to fully start
docker-compose logs postgres

# Restart PHP container
docker-compose restart php
```

## 📝 License

[Your License Here]

## 👥 Contributing

[Contributing Guidelines]

## 📧 Support

For issues and questions:
- Create an issue in the repository
- Check [ELASTICSEARCH.md](ELASTICSEARCH.md) for search-related questions

## 🎉 Acknowledgments

- Laravel Framework
- React Team
- Docker Community
- Elasticsearch Team

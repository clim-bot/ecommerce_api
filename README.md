## eCommerce API

### Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [API Documentation (Swagger)](#api-documentation-swagger)
- [Running Tests](#running-tests)
- [Database Setup](#database-setup)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

---

### Overview

This is a **RESTful API** for a simple eCommerce platform built using **Ruby on Rails**. It provides functionality for product management, user authentication using JWT, cart management, and order processing.

---

### Features

- **User Authentication**: JWT-based authentication for secure API access.
- **Product Management**: CRUD operations for products.
- **Cart Management**: Add and remove items from the cart.
- **Order Management**: Place orders from the cart.
- **Health Check**: Check API status with `/health` endpoint.
- **API Documentation**: Interactive API documentation via Swagger UI.

---

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/ecommerce_api.git
    cd ecommerce_api
    ```

2. Install the required gems:

    ```bash
    bundle install
    ```

3. Set up environment variables:

    Create a `.env` file in the root directory of the project, and add the following variables:

    ```bash
    SECRET_KEY_BASE=<your-secret-key>
    ```

4. Install **PostgreSQL** if it's not installed already.

5. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

---

### Running the Application

To start the Rails server, run:

```bash
rails server
```

### API Documentation (Swagger)
This project uses Swagger UI to provide interactive API documentation.

1. Start the Rails server:
```bash
rails server
```

2. Visit the following URL to view the Swagger UI:
```bash
http://localhost:3000/api-docs
```
This will give you an interactive documentation page to test API endpoints.

### Running Tests
To run the test suite:

1. First, set up the test database:
```bash
RAILS_ENV=test rails db:create
RAILS_ENV=test rails db:migrate
```

2. Run the tests using RSpec:
```bash
bundle exec rspec
```

### Database Setup
The application uses PostgreSQL as the database. To set up the database, follow these steps:

1. Create the database:
```bash
rails db:create
```

2. Run the migrations:
```bash
rails db:migrate
```

3. Seed the database:
```bash
rails db:seed
```

### Technologies Used
- Ruby on Rails: The web framework used to build the API.
- PostgreSQL: The database used to store user, product, and order data.
- JWT (JSON Web Tokens): For user authentication.
- RSpec: For testing.
- Rswag: To generate and document API endpoints using Swagger.
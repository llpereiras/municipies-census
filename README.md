### municipes census

# Install
Inside the folder of application execute:

```
docker-compose up --build -d
```

### Create database development and test

execute this command for development:
```
docker exec  municipies-census_web_1 bundle e rails db:create RAILS_ENV=development
```

execute this command for test:
```
docker exec  municipies-census_web_1 bundle e rails db:create RAILS_ENV=test
```

### Create the tables

execute this command for development:
```
docker exec municipies-census_web_1 bundle e rails db:migrate RAILS_ENV=development
```

execute this command for test:
```
docker exec municipies-census_web_1 bundle e rails db:migrate RAILS_ENV=test
```

# Web app
access http://app.municipies-census.localhost
or
access http://localhost:3010

# Docker

### Exec command inside postgres container
```
docker exec  municipies-census_postgres_1 psql -U company -c 'CREATE DATABASE municipies_census_development;'
```

# Troubleshoot
### Css not compiled
```
docker exec  municipies-census_web_1 bundle e rails tailwindcss:build
```

# TODO

Endereço

2.1 Campos: `CEP, Logradouro, complemento, bairro, cidade, UF e código IBGE`;

2.2 Todos os dados são obrigatórios, exceto complemento e código IBGE;


# Pull the latest PostgreSQL image
docker pull postgres:latest

# Run PostgreSQL container
docker run --name postgres-vault \
    -e POSTGRES_PASSWORD=rootpassword \
    -p 5432:5432 \
    -d postgres:latest

podman run --name postgres-vault \
    -e POSTGRES_PASSWORD=rootpassword \
    -p 5432:5432 \
    -d postgres:17.6-alpine3.21

# Wait for PostgreSQL to start
sleep 5

# Set up the vault user and database contents
podman cp init_psql.sql postgres-vault:/init_psql.sql
podman exec postgres-vault psql -U postgres -f init_psql.sql

# Start a Vault server in dev mode
vault server -dev &

# Set the VAULT_ADDR environment variable
export VAULT_ADDR="http://127.0.0.1:8200"

# Enable the postgresql secrets engine on Vault
vault secrets enable database

# Configure the postgresql secrets engine
vault write database/config/rosterdb \
    plugin_name=postgresql-database-plugin \
    allowed_roles="roster-admin,roster-reader" \
    connection_url="postgresql://{{username}}:{{password}}@localhost:5432/postgres" \
    username="vault" \
    password="vaultpass"

# Rotate the root password
vault write -f database/rotate-root/rosterdb

-output-curl-string

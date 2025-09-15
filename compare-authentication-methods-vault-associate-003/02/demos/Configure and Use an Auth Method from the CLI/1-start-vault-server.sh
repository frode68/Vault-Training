# Spin up a dev server instance
vault server -dev

# Set the VAULT_ADDR environment variable
export VAULT_ADDR='http://127.0.0.1:8200'

# Verify root token is loaded
vault token lookup
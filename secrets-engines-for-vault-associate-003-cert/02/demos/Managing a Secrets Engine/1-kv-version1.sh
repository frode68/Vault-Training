# Start the Vault server in dev mode
vault server -dev

# Set the VAULT_ADDR environment variable
export VAULT_ADDR="http://127.0.0.1:8200"

## UI SECTION ##
# Use the UI or this command to enable the 
# KV secrets engine at the path "trader"
vault secrets enable -path=trader kv

# Create the secret app/12345 with hash and token parameters
vault kv put trader/app/12345 hash=abc123 token=xyz456

# Read the secret app/12345
vault kv get trader/app/12345

## CLI SECTION ##

# List the secrets at the path trader/app
vault kv list trader/app

# Read the secret app/12345
vault kv get trader/app/12345

# Add three more secrets to the path trader/app
vault kv put trader/app/12346 hash=abc124 token=xyz457
vault kv put trader/app/12347 hash=abc125 token=xyz458
vault kv put trader/app/12348 hash=abc126 token=xyz459

# List the secrets at the path trader/app
vault kv list trader/app

# Delete the secret app/12345
vault kv delete trader/app/12345
# Start the Vault server in dev mode
vault server -dev

# Set the VAULT_ADDR environment variable
export VAULT_ADDR="http://127.0.0.1:8200"

# Store the root token in a variable
root=$(vault print token)

# Create a token with the default policy attached
vault token create -policy=default

## UI SECTION ##
# Sign in with the token
vault login TOKEN_FROM_PREVIOUS_STEP

# Create a secret in the cubbyhole secrets engine
vault kv put cubbyhole/recipes burrito="beans, rice, cheese, salsa"

# Sign back in with the root token at the CLI
vault login $root

## CLI SECTION ##
# Try to read the secret from the cubbyhole secrets engine
vault read cubbyhole/recipes

# Revoke the previous token if you want
vault token revoke TOKEN_FROM_PREVIOUS_STEP
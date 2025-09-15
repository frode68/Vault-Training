# Spin up a dev server instance
vault server -dev

# Set the VAULT_ADDR environment variable
export VAULT_ADDR="http://127.0.0.1:8200"

# Enable the transit secrets engine
vault secrets enable transit

# View paths for the transit secrets engine
vault path-help transit/

# View the path help for the transit/config/keys path
vault path-help transit/config/keys

# View path help for a new key
vault path-help transit/keys/test

# Create a new key named taco-app
vault write -f transit/keys/taco-app

# Verify the key was created successfully
vault read transit/keys/taco-app

# Print the current vault token for the UI
vault print token

# In the UI, create a new key named burrito-app of type ecdsa-p521
# and view the key details

# You can also create a new key named burrito-app using the CLI
vault write -f transit/keys/burrito-app type=ecdsa-p521


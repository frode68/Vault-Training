# Add some secrets to the path secret/recipes
vault kv put secret/recipes/burrito "ingredients=beans, rice, cheese, salsa"
vault kv put secret/recipes/pizza "ingredients=dough, sauce, cheese, toppings"

## UI SECTION ##
# Response wrap the burrito recipe
vault kv get -wrap-ttl=30m secret/recipes/burrito

## CLI SECTION ##
# View the wrapped token properties
vault token lookup WRAPPED_TOKEN_FROM_PREVIOUS_STEP

# Read the response wrapping policy
vault policy read response-wrapping

# Unwrap the burrito recipe using the wrapped token
vault unwrap WRAPPED_TOKEN_FROM_PREVIOUS_STEP

# Wrap the burrito recipe using the CLI
vault kv get -wrap-ttl=2m secret/recipes/burrito

## UI SECTION ##
# Unwrap the burrito recipe using the UI
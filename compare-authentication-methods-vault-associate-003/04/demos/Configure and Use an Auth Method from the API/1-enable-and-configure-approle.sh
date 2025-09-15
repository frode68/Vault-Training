#!/bin/bash

# Start the Vault dev server
vault server -dev

# Set the Vault Token as a variable
VAULT_TOKEN=$(cat "$HOME/.vault-token")

# Export the VAULT_ADDR
export VAULT_ADDR='http://127.0.0.1:8200'

# Enable the AppRole auth method
curl --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data '{"type": "approle"}' \
    $VAULT_ADDR/v1/sys/auth/milliways

# Verify the AppRole authentication method is enabled
curl --header "X-Vault-Token: $VAULT_TOKEN" \
    --request GET \
    $VAULT_ADDR/v1/sys/auth/milliways | jq

# Create the marvin role
curl --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data '{"role_name": "marvin", "secret_id_num_uses": 1, "secret_id_ttl": "2h"}' \
    $VAULT_ADDR/v1/auth/milliways/role/marvin

# Read the new role
curl --header "X-Vault-Token: $VAULT_TOKEN" \
    --request GET \
    $VAULT_ADDR/v1/auth/milliways/role/marvin | jq

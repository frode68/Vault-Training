#!/bin/bash

# Set the Vault Token as a variable
VAULT_TOKEN=$(cat "$HOME/.vault-token")

# Export the VAULT_ADDR
VAULT_ADDR='http://127.0.0.1:8200'

# Get the role-id for marvin
role_id=$(curl -s --header "X-Vault-Token: $VAULT_TOKEN" "$VAULT_ADDR/v1/auth/milliways/role/marvin/role-id" | jq -r '.data.role_id')

# Get the secret-id for marvin
secret_id=$(curl -s --header "X-Vault-Token: $VAULT_TOKEN" --request POST "$VAULT_ADDR/v1/auth/milliways/role/marvin/secret-id" | jq -r '.data.secret_id')

# Authenticate with the role-id and secret-id
client_token=$(curl -s --header "X-Vault-Token: $VAULT_TOKEN" --request POST --data "{\"role_id\": \"$role_id\", \"secret_id\": \"$secret_id\"}" "$VAULT_ADDR/v1/auth/milliways/login" | jq -r '.auth.client_token')

echo $client_token

# Verify the client token
curl -H "X-Vault-Token: $client_token" "$VAULT_ADDR/v1/auth/token/lookup-self" | jq
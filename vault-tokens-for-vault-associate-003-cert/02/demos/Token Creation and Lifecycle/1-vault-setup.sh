# Start the Vault server in dev mode
vault server -dev

# Set the VAULT_ADDR environment variable
export VAULT_ADDR='http://127.0.0.1:8200'

# Create the vault-admins policy
vault policy write vault-admins vault-admins.hcl

# Enable the userpass method and create the user Arthur
vault auth enable userpass

vault write auth/userpass/users/arthur username="arthur" password="dent"

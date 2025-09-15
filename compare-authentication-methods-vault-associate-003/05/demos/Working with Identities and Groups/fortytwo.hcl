# Vault policy to allow access to the secret of life, the universe, and everything
path "secret/life" {
  capabilities = ["read"]
}
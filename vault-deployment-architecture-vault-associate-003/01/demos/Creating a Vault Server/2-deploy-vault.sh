# Create podman network for Vault
podman network create vault-network

# Deploy Vault server
echo "Deploying Vault server..."
podman run -d --name vault-0 \
  --cap-add=IPC_LOCK \
  -p 8200:8200 \
  -v "$(pwd)/config/vault-0:/vault/config" \
  -v "$(pwd)/data/vault-0:/vault/data" \
  --network vault-network \
  hashicorp/vault:1.20 server

  podman run -d \
  --name vault-0 \
  --cap-add=IPC_LOCK \
  -p 8200:8200 \
  -v "$(pwd)/config:/vault/config" \
  -v "$(pwd)/data:/vault/data" \
  -e VAULT_ADDR=http://127.0.0.1:8200 \
  -e VAULT_SKIP_VERIFY=true \
  --network vault-network \
  hashicorp/vault:1.20 server
  


# Check Vault status
export VAULT_ADDR=https://127.0.0.1:8200
export VAULT_SKIP_VERIFY=true

vault status
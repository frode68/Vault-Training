# Create data directories with proper permissions
mkdir -p data
chmod 777 data
mkdir -p config
chmod 777 config 

vim config/config.hcl
### config.hcl
storage "file" {
  path = "/vault/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

disable_mlock = true
ui = true
api_addr = "http://127.0.0.1:8200"

# Run basic server
podman run -d \
  --name vault-basic \
  --cap-add=IPC_LOCK \
  -p 8201:8200 \
  -v "$(pwd)/config:/vault/config" \
  -v "$(pwd)/data:/vault/data" \
  -e VAULT_ADDR=http://127.0.0.1:8200 \
  -e VAULT_SKIP_VERIFY=true \
  hashicorp/vault:1.20 server

# Set environment variable for Vault CLI
export VAULT_ADDR="http://127.0.0.1:8200"

# Check Vault status
vault status

# Initialize Vault
vault operator init -key-shares=3 -key-threshold=2
vault operator init -key-shares=1 -key-threshold=1
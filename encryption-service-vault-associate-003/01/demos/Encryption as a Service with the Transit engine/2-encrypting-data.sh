# View the current keys
vault list transit/keys

# Use the Vault UI to encrypt data with the taco-app key

# Encrypt a string using the Vault Transit Secrets Engine
vault write transit/encrypt/taco-app plaintext=$(echo -n 'Super secret recipe!!' | base64)

# Decrypt the data using the transit secrets engine
vault write transit/decrypt/taco-app ciphertext="CIPHERTEXT_HERE"

# Decode the decrypted base64 string
echo "PLAINTEXT_HERE" | base64 --decode 
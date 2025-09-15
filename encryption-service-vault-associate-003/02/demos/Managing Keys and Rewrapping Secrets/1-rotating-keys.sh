# Check out the current version of the taco-app key
vault read transit/keys/taco-app

# Encrypt a string using the Vault Transit Secrets Engine
v1ciphertext=$(vault write -field ciphertext transit/encrypt/taco-app plaintext=$(echo -n 'Super secret recipe!!' | base64))
echo $v1ciphertext

# Rotate the taco-app key
vault write -f transit/keys/taco-app/rotate

# Encrypt the same string again using the Vault Transit Secrets Engine
vault write -field ciphertext transit/encrypt/taco-app plaintext=$(echo -n 'Super secret recipe!!' | base64)

# Decrypt the data using the transit secrets engine
vault write -field plaintext transit/decrypt/taco-app ciphertext=$v1ciphertext | base64 --decode

# Change the min_decryption_version to 4
vault write transit/keys/taco-app/config min_decryption_version=4

# Rotate the taco-app key again
vault write -f transit/keys/taco-app/rotate

# Rewrap the v5 ciphertext to the latest key
vault write -field ciphertext transit/rewrap/taco-app ciphertext=V5CIPHERTEXT_HERE
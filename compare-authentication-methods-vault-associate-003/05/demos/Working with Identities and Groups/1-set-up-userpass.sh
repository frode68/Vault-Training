# Start vault in dev mode
vault server -dev

# Enable userpass auth method and create users
vault auth enable userpass  

vault write auth/userpass/users/arthur username=arthur password=dent  

vault write auth/userpass/users/ford username=ford password=prefect 

# Create the fortytwo policy
vault policy write fortytwo fortytwo.hcl

# Enable an audit device
vault audit enable file file_path=/tmp/vault_audit.log

# Log in as arthur
vault login -method=userpass username=arthur password=dent


vault login -method=userpass username=ford password=prefect


# Save the root token in a variable
root=$(vault print token)

# Proceed!
vault token create -h

# Create a token with the vault-admins policy attached
vault token create -policy=vault-admins


# No default policy
vault token create -policy=vault-admins -no-default-policy

# Log in with the first token
vault login TOKEN_VALUE

# Try to create a new token with the super-admins policy
vault token create -policy=super-admins

# Create a token with a display name
vault token create -display-name="admin"

vault token lookup TOKEN_VALUE

# Create a token with metadata
vault token create -metadata="app=tacotruck" -metadata="client=webfe"

# Lookup a token by its accessor
vault token lookup -accessor ACCESSOR

# Get current list of accessors
vault list auth/token/accessors

# Create a token with a 20s TTL
token create -policy=default -ttl=20s

# Lookup the token quickly!
vault token lookup -accessor ACCESSOR

# Create a token with ttl of 10m
vault token create -ttl=10m -policy=default

# Store token value in variable
tentoken=TOKEN_VALUE

# Lookup the token
vault token lookup $tentoken

# Renew the token
vault token renew $tentoken

# Renew again for 800h
vault token renew -increment=800h $tentoken

# Create a batch token with a ttl of 10m
vault token create -ttl=10m -policy=default -type=batch

# Create a periodic token for 10m
vault token create -period=10m -policy=default

vault token lookup TOKEN

# Renew for 30 minutes
vault token renew -increment=30m TOKEN

vault token lookup TOKEN

# Create a new parent token
vault token create -policy=vault-admins

parent=PARENT_TOKEN

vault login $parent

# Create a new child token
vault token create

child=CHILD_TOKEN

# Log back in with root token
vault login $root

# Lookup child token
vault token lookup $child

# Revoke the parent token
vault token revoke $parent

vault token lookup $child

# Log in as arthur
vault login -method=userpass username="arthur" password="dent"

vault token lookup

vault token create


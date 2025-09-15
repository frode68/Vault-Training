# List the current auth methods
vault auth list

# Enable the userpass auth method
vault auth enable userpass

# Tune the userpass auth method
vault auth tune -description="8h userpass" -default-lease-ttl=8h userpass

# Get detailed information about the auth methods
vault auth list -detailed

# Run it again with the yaml output
vault auth list -detailed -format=yaml

# User path-help to discover the userpass routes
vault path-help auth/userpass

# Get path-help on a specific route
vault path-help auth/userpass/users/arthur

# Create a user
vault write auth/userpass/users/arthur password=dent

# Confirm the user exists
vault list auth/userpass/users


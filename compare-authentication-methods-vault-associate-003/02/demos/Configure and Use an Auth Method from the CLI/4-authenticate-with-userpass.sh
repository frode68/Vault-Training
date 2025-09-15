# Check out the help for userpass
vault auth help userpass

# Log in as arthur
vault login -method=userpass username=arthur

# Lookup the token
vault token lookup

# Try to list auth methods
vault auth list

# Log in as root
vault login

# Disable the userpass auth method
vault auth disable userpass

# List the auth methods
vault auth list
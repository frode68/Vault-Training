# Create the role for roster-admin using the Vault API and curl
curl --header "X-Vault-Token: $(vault print token)" \
 --request POST \
 --data @roster-admin.json \
 http://127.0.0.1:8200/v1/database/roles/roster-admin

# Create the role for roster-reader using the Vault API and curl
curl --header "X-Vault-Token: $(vault print token)" \
 --request POST \
 --data @roster-reader.json \
 http://127.0.0.1:8200/v1/database/roles/roster-reader

# Get creds for roster-reader
vault read -output-curl-string database/creds/roster-reader

# Run the curl string to get the creds
curl -H "X-Vault-Request: true" -H "X-Vault-Token: $(vault print token)" \
 http://127.0.0.1:8200/v1/database/creds/roster-reader | jq '.'

# Use the creds to connect to the database and query the roster table
docker exec -it postgres-vault bash

psql -U USERNAME -d postgres -W

# Enter the password when prompted

# After logging in, run the following SQL command to query the roster table
SELECT * FROM roster.players;

# Revoke the lease
vault lease revoke LEASE_ID


vault read -output-curl-string database/creds/roster-reader
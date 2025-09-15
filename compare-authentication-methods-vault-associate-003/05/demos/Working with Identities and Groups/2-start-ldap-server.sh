# Just run the following command to start the LDAP server:
docker run --rm -it -p 10389:389 -p 10636:636 ned1313/openldap-vault:latest

# LDAP Values
# Set URL to ldap://127.0.0.1:10389
# Set User Attribute to uid
# Set binddn to cn=admin,dc=globomantics,dc=local
# Set the User DN to ou=people,dc=globomantics,dc=local
# Set the bindpass to GoodNewsEveryone
# Set the groupdn to ou=people,dc=globomantics,dc=local

# Configure on vault
vault auth enable -path=globomantics ldap

vault write auth/globomantics/config  url="ldap://127.0.0.1:10389" userattr="uid" binddn="cn=admin,dc=globomantics,dc=local" userdn="ou=people,dc=globomantics,dc=local" bindpass="GoodNewsEveryone" groupdn="ou=people,dc=globomantics,dc=local"

# Log in as bender after setting up the groups in the UI
vault login -method=ldap -path=globomantics username=bender password=bender
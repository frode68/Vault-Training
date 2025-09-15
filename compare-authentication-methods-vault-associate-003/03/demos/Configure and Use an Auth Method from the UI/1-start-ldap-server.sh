# Just run the following command to start the LDAP server:
docker run --rm -it -p 10389:389 -p 10636:636 ned1313/openldap-vault:latest

# LDAP Values
# Set URL to ldap://127.0.0.1:10389
# Set User Attribute to uid
# Set binddn to cn=admin,dc=globomantics,dc=local
# Set the User DN to ou=people,dc=globomantics,dc=local
# Set the bindpass to GoodNewsEveryone
# Set the groupdn to ou=people,dc=globomantics,dc=local

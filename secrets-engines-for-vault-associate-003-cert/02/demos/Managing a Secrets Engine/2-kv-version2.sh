# Enable the CRM secrets engine
vault secrets enable -path=CRM -version=2 kv

# List out the secrets engines
vault secrets list

# Create a couple secrets entries
vault kv put CRM/customers/greg "name=Greg Jones" "email=greg@globomantics.com" "phone=215-555-5555"
vault kv put CRM/customers/helen "name=Helen Fitz" "email=helen@globomantics.com" "phone=215-555-6666"

# Get back Greg's record
vault kv get CRM/customers/greg

# Update Greg's phone number
vault kv patch CRM/customers/greg phone="267-555-5555"

# Get back Greg's record
vault kv get CRM/customers/greg

# Uh-oh someone else updated Greg's record
vault kv put CRM/customers/greg phone="267-555-5555"

# Better fix it
vault kv rollback -version=2 CRM/customers/greg

# Show that version 3 is still there
vault kv get -version=3 CRM/customers/greg

# Delete that version of Greg's record
vault kv delete -versions=4 CRM/customers/greg

# Ah crud, wrong version!
vault kv undelete -versions=4 CRM/customers/greg

# Now delete the correct version
vault kv delete -versions=3 CRM/customers/greg

# And destroy it
vault kv destroy -versions=3 CRM/customers/greg

# Show that version 3 is gone
vault kv get -version=3 CRM/customers/greg

# Check out the metadata for Greg
vault kv metadata get CRM/customers/greg

# Show the keys for the CRM secrets engine
vault kv list CRM/customers

# Destroy Helen's record
vault kv metadata delete CRM/customers/helen

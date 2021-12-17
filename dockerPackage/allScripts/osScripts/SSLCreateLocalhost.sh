#!/bin/bash

/usr/local/openssl/bin/openssl req -x509 -out localhost.crt -keyout localhost.key \
	  -newkey rsa:2048 -nodes -sha256 \
	    -subj '/CN=localhost' -extensions EXT -config <( \
	       printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage		=digitalSignature\nextendedKeyUsage=serverAuth")

echo 'made key'

mv localhost.key /etc/pki/tls/private/

mv localhost.crt /etc/pki/tls/certs/

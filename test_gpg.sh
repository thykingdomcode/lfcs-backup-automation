#!/bin/bash

# Create a password variable
PASSWORD=Patrick
# Create and encrypt a file
echo "This is a gpg test file" > testfile.txt
gpg --batch --yes --passphrase $PASSWORD --symmetric --cipher-algo AES256 testfile.txt

# Check if encryption worked
if [ $? -eq 0 ]; then
	echo "File successfully encrypted! Beginning decryption..."
	gpg --batch --yes --passphrase "$PASSWORD" --output decrypted.txt --decrypt testfile.txt.gpg
	echo "File successfully decrypted! Beginning test file cleanup..."
	rm -f testfile.txt testfile.txt.gpg decrypted.txt
	echo "All test files have been deleted. Test complete!"
else
	echo "File encryption has failed."
	rm -f testfile.txt testfile.txt.gpg decrypted.txt
	echo "All testfiles have been deleted. Test complete!"
fi





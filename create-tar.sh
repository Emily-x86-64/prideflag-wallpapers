# Copy License to flags dir
cp LICENSE flags/LICENSE

# Create archive
tar -cf - flags/ | xz -9e -c - > flags.tar.xz 

# Delete License from flags dir
rm flags/LICENSE

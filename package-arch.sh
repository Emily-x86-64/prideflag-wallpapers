# Compact flags to archive
tar -cf - flags/ | xz -9e -c - > flags.tar.xz

# Copy flags.tar.xz to arch package
cp flags.tar.xz package/arch

# cd to arch dir
cd package/arch

# Update sha256 checksum
updpkgsums

# Test PKGBUILD is working
namcap PKGBUILD

# Test PKGBUILD builds
makepkg

# Delete test files
rm -rf src/ pkg *.tar.zst

# Tell user file has been packaged and ready to be uploaded to AUR
echo "Package has been packaged and is ready to upload to AUR. Generic AUR upload instructions can be found at https://wiki.archlinux.org/title/AUR_submission_guidelines."
echo "NOTE: REMEMBER TO UPDATE PKGBUILD VERSION!"

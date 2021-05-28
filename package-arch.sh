# cd to arch dir
cd package/arch

# Update sha256 checksum
updpkgsums

# Test PKGBUILD is working
namcap PKGBUILD

# Build into package
makepkg

# Test finished package
package=( *.tar.zst )
namcap "${package[0]}"

# Delete test files
rm -rf src/ pkg/ *.tar.xz

# Make .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Tell user file has been packaged and ready to be uploaded to AUR
echo "Package has been packaged and is ready to upload to AUR. Generic AUR upload instructions can be found at https://wiki.archlinux.org/title/AUR_submission_guidelines."
echo "NOTE: REMEMBER TO UPDATE PKGBUILD VERSION!"

echo 'Updating macOS software'
echo '======================='
softwareupdate --install --recommended
echo ''

echo 'App Store applications'
echo '======================'
mas upgrade
echo ''

echo 'Updating Homebrew'
echo '================='
brew update
echo ''

echo 'Updating Homebrew packages and casks'
echo '===================================='
brew upgrade
echo ''

echo 'Cleaning up old Homebrew packages and casks'
echo '==========================================='
brew cleanup
echo ''

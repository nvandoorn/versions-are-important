function checkRubyVersion() {
  if [ -f $PWD/.nvmrc ]; then
    VERSION=$(cat $PWD/.nvmrc)
    echo Changing to Node $VERSION...
    NVM_STATUS=$(nvm ls $VERSION | grep $VERSION)
    if [ "$NVM_STATUS" = "" ]; then
      echo Installing Node $VERSION
      nvm install
    else
      nvm use &> /dev/null
    fi
    echo Done ☕️
  fi
}

function checkNodeVersion() {
  if [ -f $PWD/.ruby-version ]; then
    VERSION=$(cat $PWD/.ruby-version)
    echo Changing to Ruby $VERSION...
    RB_STATUS=$(chruby $VERSION)
    if [ "$RB_STATUS" != "" ]; then
      echo Installing Ruby $VERSION
      ruby-install ruby $VERSION
      source /usr/local/share/chruby/chruby.sh
      chruby $VERSION
    fi
    echo Done 💎
  fi
}

function checkVersions() {
  checkNodeVersion
  checkRubyVersion
}

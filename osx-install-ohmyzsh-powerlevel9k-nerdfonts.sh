# check dependencies
command -v brew >/dev/null 2>&1 || { echo >&2 "brew is not installed, aborting"; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "git is not installed, aborting"; exit 1; }
# install oh-my-zsh without entering it
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e "s/env zsh -l/echo ---/g" | sh
# clone powerlelvel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# set zsh theme
sed -i '' -e 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel9k\/powerlevel9k"/g' ~/.zshrc
# turn off brew auto apdates for this session 
export HOMEBREW_NO_AUTO_UPDATE=1
# setup brew fonts
brew tap caskroom/fonts
# install nerd fonts
if [ -z ${ALL_FONTS} ]; then
  if [ -z ${FONT} ]; then
    brew cask install font-hack-nerd-font
  else
    brew cask install font-${FONT}-nerd-font
  fi
else
  brew cask install font-anonymouspro-nerd-font font-aurulentsansmono-nerd-font font-bitstreamverasansmono-nerd-font font-cousine-nerd-font font-dejavusansmono-nerd-font font-droidsansmono-nerd-font font-fantasquesansmono-nerd-font font-firamono-nerd-font font-hack-nerd-font font-hasklig-nerd-font font-inconsolata-nerd-font font-inconsolatago-nerd-font font-inconsolatalgc-nerd-font font-liberationmono-nerd-font font-mononoki-nerd-font font-robotomono-nerd-font font-sourcecodepro-nerd-font font-ubuntumono-nerd-font
fi
# set theme mode
sed -i '' -e '/ZSH_THEME=".*"/a\
POWERLEVEL9K_MODE="nerdfont-complete"' ~/.zshrc

echo "\

DONE!!! Don't forget to change the font of your console app and open up new window or tab!"
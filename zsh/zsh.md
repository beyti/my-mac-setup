1. Install iterm2
   ```
   brew install --cask iterm2
   ```

1. Install Oh My Zsh
   - Install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
   - Now .zshrc file is updated at `/.zshrc`

1. Add proper select capabilities
   Ref: [stackoverflow](https://stackoverflow.com/questions/5407916/zsh-zle-shift-selection)

   Add below to `/.zshrc` file:
    ```
    r-delregion() {
      if ((REGION_ACTIVE)) then
         zle kill-region
      else 
        local widget_name=$1
        shift
        zle $widget_name -- $@
      fi
    }
    
    r-deselect() {
      ((REGION_ACTIVE = 0))
      local widget_name=$1
      shift
      zle $widget_name -- $@
    }
    
    r-select() {
      ((REGION_ACTIVE)) || zle set-mark-command
      local widget_name=$1
      shift
      zle $widget_name -- $@
    }
    
    for key     kcap   seq        mode   widget (
        sleft   kLFT   $'\e[1;2D' select   backward-char
        sright  kRIT   $'\e[1;2C' select   forward-char
        sup     kri    $'\e[1;2A' select   up-line-or-history
        sdown   kind   $'\e[1;2B' select   down-line-or-history
    
        send    kEND   $'\E[1;2F' select   end-of-line
        send2   x      $'\E[4;2~' select   end-of-line
    
        shome   kHOM   $'\E[1;2H' select   beginning-of-line
        shome2  x      $'\E[1;2~' select   beginning-of-line
    
        left    kcub1  $'\EOD'    deselect backward-char
        right   kcuf1  $'\EOC'    deselect forward-char
    
        end     kend   $'\EOF'    deselect end-of-line
        end2    x      $'\E4~'    deselect end-of-line
    
        home    khome  $'\EOH'    deselect beginning-of-line
        home2   x      $'\E1~'    deselect beginning-of-line
    
        csleft  x      $'\E[1;6D' select   backward-word
        csright x      $'\E[1;6C' select   forward-word
        csend   x      $'\E[1;6F' select   end-of-line
        cshome  x      $'\E[1;6H' select   beginning-of-line
    
        cleft   x      $'\E[1;5D' deselect backward-word
        cright  x      $'\E[1;5C' deselect forward-word
    
        del     kdch1   $'\E[3~'  delregion delete-char
        bs      x       $'^?'     delregion backward-delete-char
    
      ) {
      eval "key-$key() {
        r-$mode $widget \$@
      }"
      zle -N key-$key
      bindkey ${terminfo[$kcap]-$seq} key-$key
    }
    ```

1. Add  Dracula Theme  
   Ref: [here](https://draculatheme.com/zsh)
    1. Download theme
      ```
      cd ~/.oh-my-zsh/themes
      git clone https://github.com/dracula/zsh.git dracula-theme-folder
      ln -s ~/.oh-my-zsh/themes/dracula-theme-folder/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
      ```
    1. Add Theme to .zshrc config  
      Change theme in /.zshrc file
      from: `ZSH_THEME="<something>"` to `ZSH_THEME="dracula"`

1. Enable Plugins
   1. Install zsh-syntax-highligting plugin
      ```
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
      ```

   1. Add Preferred Plugins
      ```
      plugins=(
       git
       zsh-autosuggestions
       history
       jsontools
       aws
       docker
       zsh-syntax-highlighting
       )
      ```

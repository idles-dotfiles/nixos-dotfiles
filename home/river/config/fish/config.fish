if status is-interactive
    starship init fish | source
    zoxide init fish | source
    alias cd=z
    alias docker=podman
    alias ls='eza --icons'
    export PATH="$HOME/.npm-global/bin:$PATH"
    alias kubectx='kubectl config use-context'
    alias nrs="sudo nixos-rebuild switch --flake /home/river/nixos-dotfiles#pc"
    alias config="nvim /home/river/nixos-dotfiles/hosts/pc/configuration.nix"
    alias v=nvim
end

function fish_greeting

end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

alias cea="bunx create-expo-app --no-install"

export PATH="$HOME/.local/bin:$PATH"

set -x GPG_TTY $(tty)

# OpenClaw Completion
test -f "/home/river/.openclaw/completions/openclaw.fish"; and source "/home/river/.openclaw/completions/openclaw.fish"

set -gx CLAUDE_CODE_MAX_OUTPUT_TOKENS 64000

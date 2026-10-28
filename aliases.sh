# vinayakdev aliases — works in bash and zsh.

# Laravel / PHP / npm
alias cu="composer update"
alias nuke="php artisan migrate:fresh --seed"
alias nb="npm run build"
alias nd="npm run dev"
alias pa="php artisan"

# Copy SSH public key to clipboard
if command -v pbcopy >/dev/null 2>&1; then
  alias copyssh="cat ~/.ssh/id_rsa.pub | pbcopy"
elif command -v xclip >/dev/null 2>&1; then
  alias copyssh="xclip -selection clipboard < ~/.ssh/id_rsa.pub"
fi

# Danger mode shortcuts
alias cld='claude --dangerously-skip-permissions'
alias hcld='headroom wrap claude --dangerously-skip-permissions'
alias cxd='codex --dangerously-bypass-approvals-and-sandbox'
alias hcxd='headroom wrap codex --dangerously-bypass-approvals-and-sandbox'

# Laravel Debugbar
alias debugbar-install='composer require barryvdh/laravel-debugbar --dev && php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"'
alias debugbar-remove='composer remove barryvdh/laravel-debugbar && rm -f config/debugbar.php'

# Nicer ls / cat (only if tools installed)
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -l --icons --git --group-directories-first'
  alias la='eza -la --icons --git --group-directories-first'
fi
command -v bat >/dev/null 2>&1 && alias cat='bat --paging=never'

# git add + commit (random message) + push
fkpush() {
  local messages=(
    "wip" "updates" "fix stuff" "changes" "misc" "tweaks" "yolo"
    "done" "push it" "ship it" "final" "more changes" "lgtm" "ok"
    "asdf" "work in progress" "idk" "stuff" "things" "checkpoint"
  )
  local msg
  if [ -n "$ZSH_VERSION" ]; then
    msg="${messages[RANDOM % ${#messages[@]} + 1]}"
  else
    msg="${messages[RANDOM % ${#messages[@]}]}"
  fi
  git add . && git commit -m "$msg" && git push
}

# dotaliases

Shell aliases for macOS and Linux (bash + zsh).

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/vinayakdev/dotaliases/main/install.sh | bash
```

Or clone and run `./install.sh`. Safe to re-run (updates aliases, no duplicate rc lines).

## Uninstall

```bash
./uninstall.sh
```

## Aliases

| Alias | Command |
|---|---|
| `cu` | `composer update` |
| `nuke` | `php artisan migrate:fresh --seed` |
| `nb` / `nd` | `npm run build` / `npm run dev` |
| `pa` | `php artisan` |
| `copyssh` | copy `~/.ssh/id_rsa.pub` to clipboard |
| `cld` / `hcld` | claude, dangerous mode (optionally via headroom) |
| `cxd` / `hcxd` | codex, dangerous mode (optionally via headroom) |
| `debugbar-install` / `debugbar-remove` | add/remove Laravel Debugbar |
| `ls` `ll` `la` | `eza` (only if installed) |
| `cat` | `bat` (only if installed) |
| `fkpush` | add, commit with random message, push |

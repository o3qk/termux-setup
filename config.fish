# ════════════════════════════════════════════════════
#  ~/.config/fish/config.fish
#  Termux fish 設定ファイル
# ════════════════════════════════════════════════════

# ─── ファイル操作エイリアス ───────────────────────────
alias ls='eza --group-directories-first'
alias ll='eza -la --git'
alias la='eza -a'
alias lt='eza --tree'
alias cat='bat --style=plain --pager=never'

# ─── ナビゲーション ──────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'

# ─── その他 ──────────────────────────────────────────
alias h='htop'
alias c='clear'
alias myip='curl -s ifconfig.me && echo'
alias reload='source ~/.config/fish/config.fish && echo "✔ config reloaded"'
alias fishconf='vim ~/.config/fish/config.fish'

# ─── プロンプト（1段・3色・🚀） ───────────────────────
function fish_prompt
    set -l last_status $status
    set -l cwd (prompt_pwd --full-length-dirs 2)
    set -l git_branch (git branch --show-current 2>/dev/null)

    # 🚀  cyan:ユーザー名  yellow:パス  green:gitブランチ
    printf '%s' '🚀 '
    printf '%s' (set_color cyan)(whoami)(set_color normal)':'
    printf '%s' (set_color yellow)$cwd(set_color normal)

    if test -n "$git_branch"
        printf '%s' ' '(set_color green)'['$git_branch']'(set_color normal)
    end

    # エラー時は❯を赤に
    if test $last_status -ne 0
        printf '%s' ' '(set_color red)'❯'(set_color normal)' '
    else
        printf '%s' ' ❯ '
    end
end

# 右プロンプトは使わない
function fish_right_prompt; end

# ─── fzf.fish キーバインド有効化 ─────────────────────
# Ctrl+R: 履歴検索 / Ctrl+F: ファイル検索
# （PatrickF1/fzf.fish インストール後に自動適用）


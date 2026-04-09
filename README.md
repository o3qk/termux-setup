# 🚀 Termux セットアップ

Android の Termux を **3つのコマンド** で快適な開発環境に仕上げる設定集です。  
fish シェル・モダンなCLIツール・fzf連携など、すぐに使えるようになります。

---

## 📱 必要なもの

| アプリ | 入手先 | 備考 |
|--------|--------|------|
| **Termux** | [F-Droid](https://f-droid.org/packages/com.termux/) | ★ Google Play版は非推奨 |
| **Termux:API** | [F-Droid](https://f-droid.org/packages/com.termux.api/) | Android連携に必要 |

> ⚠️ Google Play 版の Termux は古く、パッケージが動作しない場合があります。**F-Droid 版を推奨します。**

---

## ⚡ セットアップ（3ステップ）

### ① このリポジトリをクローン → Termux で実行

まず PCまたはスマホのブラウザで GitHub にリポジトリを作成し、  
このリポジトリを `termux-setup` という名前で push しておきます。

---

### Step 1 — パッケージ一括インストール

```bash
pkg update -y && pkg upgrade -y && pkg install -y git fish python nodejs openssh curl wget tmux fzf htop eza bat termux-api x11-repo && termux-setup-storage && mkdir -p ~/.termux && echo "font-size = 16" > ~/.termux/termux.properties && termux-reload-settings
```

> 📝 `termux-setup-storage` の途中で **「許可」をタップ** してください（ストレージアクセス許可）。

---

### Step 2 — Fisher（プラグインマネージャー）+ プラグイン一括インストール

```bash
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher jorgebucaran/autopair.fish jethrokuan/z patrickf1/colored_man_pages.fish edc/bass PatrickF1/fzf.fish"
```

---

### Step 3 — fish 設定を適用 + デフォルトシェルに変更

```bash
mkdir -p ~/.config/fish && curl -fsSL https://raw.githubusercontent.com/o3qk/termux-setup/main/config.fish -o ~/.config/fish/config.fish && chsh -s fish && echo "✅ 完了！ Termux を再起動してください。"
```

> 🎉 **Termux を一度閉じて再起動** すると fish が起動し、設定が反映されます。

---

## 📦 インストールされるもの

### シェル・プラグイン

| パッケージ | 説明 |
|-----------|------|
| `fish` | 高機能シェル。設定ゼロでも補完・サジェストが動く |
| `fisher` | fish のプラグインマネージャー |
| `autopair.fish` | `(`や`"`などを自動で閉じてくれる |
| `z` (jethrokuan) | よく行くディレクトリに `z proj` 一発で移動 |
| `colored_man_pages` | `man` コマンドがカラー表示になる |
| `bass` | bash スクリプトを fish から実行できる |
| `fzf.fish` | Ctrl+R で履歴、Ctrl+F でファイルをあいまい検索 |

### CLIツール

| パッケージ | 説明 | 代替元 |
|-----------|------|--------|
| `eza` | モダンな `ls`。色分け・git状態表示 | `ls` |
| `bat` | シンタックスハイライト付き `cat` | `cat` |
| `fzf` | あいまい検索ツール。履歴・ファイル検索に使う | — |
| `htop` | インタラクティブなプロセスモニター | `top` |
| `tmux` | ターミナルマルチプレクサ。セッション管理 | — |
| `git` | バージョン管理 | — |
| `python` | Python 3 | — |
| `nodejs` | Node.js | — |
| `openssh` | SSH クライアント・サーバー | — |
| `curl` / `wget` | ファイルダウンロード | — |

### リポジトリ・Android連携

| パッケージ | 説明 |
|-----------|------|
| `x11-repo` | GUI・X11 系パッケージが使えるようになる追加リポジトリ |
| `termux-api` | バッテリー残量・GPS・通知など Android 機能との連携 |

---

## ⌨️ キーボードショートカット（fish デフォルト）

| ショートカット | 動作 |
|----------------|------|
| `→`（右矢印） | グレーサジェストを確定（コマンド補完） |
| `Tab` | 補完候補を表示 |
| `Ctrl + R` | fzf で履歴をあいまい検索 |
| `Ctrl + F` | fzf でファイルをあいまい検索 |
| `Ctrl + C` | コマンドをキャンセル |
| `Ctrl + L` | 画面クリア |
| `Alt + ← / →` | 単語単位でカーソル移動 |
| `Ctrl + W` | 直前の単語を削除 |

---

## 🗂️ エイリアス一覧

### ファイル操作（eza / bat）

| コマンド | 実行内容 |
|----------|----------|
| `ls` | `eza --group-directories-first` |
| `ll` | `eza -la --git`（詳細 + git 状態） |
| `la` | `eza -a`（隠しファイル含む） |
| `lt` | `eza --tree`（ツリー表示） |
| `cat` | `bat --style=plain --pager=never`（ハイライト付き） |

### ナビゲーション

| コマンド | 実行内容 |
|----------|----------|
| `..` | `cd ..` |
| `...` | `cd ../..` |

### その他

| コマンド | 実行内容 |
|----------|----------|
| `h` | `htop`（プロセスモニター） |
| `c` | `clear` |
| `myip` | 自分の外部 IP を表示 |
| `reload` | config.fish を再読み込み |
| `fishconf` | config.fish を vim で開く |
| `z <キーワード>` | 以前訪れたディレクトリに一発移動 |

---

## 🎨 プロンプトのデザイン

```
🚀 u0:~/projects [main] ❯
```

| 色 | 意味 |
|----|------|
| 🔵 シアン | ユーザー名 |
| 🟡 イエロー | 現在のディレクトリ |
| 🟢 グリーン | git ブランチ名 |
| 🔴 レッド（エラー時のみ） | `❯` がエラーを示す |

---

## 🔤 フォント設定（任意・推奨）

Nerd Font を使うと `eza` などのアイコンが正しく表示されます。  
**UDEV Gothic NF** を推奨します。

```bash
# GitHub Releases から最新版をダウンロードして配置
# https://github.com/yuru7/udev-gothic/releases
# zip を展開し、UDEVGothicNF-Regular.ttf を以下のパスに置く
mkdir -p ~/.termux
cp UDEVGothicNF-Regular.ttf ~/.termux/font.ttf
termux-reload-settings
```

---

## 🤖 AI & LLM 連携 (GeminiCLI + MCP + llama.cpp)

Nothing Phone 3a (Snapdragon 7s Gen 3) のパワーを最大限に活かす AI 開発環境の構築方法です。

### 1. GeminiCLI & MCP サーバーのセットアップ

モバイル環境（Termux）では `npx` の遅延を避けるため、**グローバルインストール** を推奨します。

#### 💻 A: 拡張機能とサーバーのインストール
```bash
# GeminiCLI の拡張機能 (Code-Review)
gemini extensions install https://github.com/gemini-cli-extensions/code-review

# MCP サーバーをグローバルインストール (爆速化のため)
npm install -g @obra/superpowers @modelcontextprotocol/server-filesystem @modelcontextprotocol/server-system-info @modelcontextprotocol/server-sequential-thinking
```

#### 💻 B: `~/.gemini/settings.json` の設定
インストール後、設定ファイルに以下を記述してください（`command` に `npx` を使わず直接指定するのがコツです）。

```json
{
  "mcpServers": {
    "superpowers": { "command": "superpowers" },
    "filesystem": { "command": "mcp-server-filesystem", "args": ["/data/data/com.termux/files/home/projects"] },
    "system-info": { "command": "mcp-server-system-info" },
    "sequential-thinking": { "command": "mcp-server-sequential-thinking" }
  }
}
```

### 2. ローカル LLM (llama.cpp) の導入

軽量な日本語 LLM (GGUF 形式) を Termux 上で直接動かします。

#### 💻 ビルドとモデルの取得
```bash
# 必要なツールのインストール
pkg install clang cmake ninja

# llama.cpp のクローンとビルド
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp && cmake -B build -G Ninja && cmake --build build --config Release

# モデルのダウンロード例 (例: Swallow-7b 等の軽量版)
# ~/models/ 配下などに .gguf ファイルを配置してください
```

---

## 🔧 カスタマイズ

設定ファイルは `~/.config/fish/config.fish` です。  
`fishconf` コマンドですぐに開けます。

```bash
fishconf   # vim で設定ファイルを開く
reload     # 変更を即反映
```

---

## 🖥️ SSH でこの Android に接続する方法

詳細は別途セッションにて手順を確認してください。  
準備として openssh サーバーを起動しておきます：

```bash
# 鍵を生成（初回のみ）
ssh-keygen -A
# SSHサーバーを起動（ポート 8022）
sshd
# IPアドレスを確認
ip addr show wlan0 | grep 'inet '
```

Linux/Mac からの接続：
```bash
ssh -p 8022 ユーザー名@Androidの-IPアドレス
```

---

## ❓ よくある質問

**Q: `pkg` コマンドが遅い / エラーが出る**  
A: `pkg update` を再実行してください。ミラーサーバーの選択を求められたら Enter を押して自動選択します。

**Q: `eza` や `bat` がインストールできない**  
A: `pkg update -y && pkg upgrade -y` を先に実行してからもう一度試してください。

**Q: fish が起動しない**  
A: `which fish` でパスを確認し、`chsh -s $(which fish)` を再実行してください。

**Q: アイコンが豆腐（□）になる**  
A: Nerd Font が設定されていません。上記の「フォント設定」を参照してください。

---

## 📄 ライセンス

MIT

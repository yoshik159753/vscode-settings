#!/usr/bin/env bash
#
# VSCode 拡張機能のインストールスクリプト
# (configuration/site.yml をシェルスクリプトに変換したもの)
#
# ref. https://code.visualstudio.com/docs/languages/overview

set -u

EXTENSIONS_DIR="${HOME}/.vscode/extensions"

if ! command -v code >/dev/null 2>&1; then
  echo "ERROR: 'code' コマンドが見つかりません。VSCode をインストールし、PATH を通してください。" >&2
  exit 1
fi

install_extension() {
  local extension="$1"

  # インストール済みであればスキップ (publisher.name で始まるディレクトリの存在で判定)
  if [ -d "${EXTENSIONS_DIR}" ] && \
     compgen -G "${EXTENSIONS_DIR}/${extension}*" >/dev/null; then
    echo "[SKIP] ${extension} は既にインストール済みです"
    return 0
  fi

  echo "[INSTALL] ${extension}"
  code --install-extension "${extension}"
}

# ####################
# HTML
# ####################
install_extension "abusaidm.html-snippets"
# install_extension "ecmel.vscode-html-css"
# install_extension "zignd.html-css-class-completion"
# install_extension "mkaufman.htmlhint"
install_extension "vincaslt.highlight-matching-tag"
install_extension "techer.open-in-browser"

# ####################
# CSS, SCSS, Less
# ####################
# install_extension "ecmel.vscode-html-css"
# install_extension "zignd.html-css-class-completion"
# install_extension "michelemelluso.code-beautifier"
# install_extension "shinnn.stylelint"
# 個人的に追加
install_extension "thekalinga.bootstrap4-vscode"

# ####################
# TypeScript
# ####################
# install_extension "johnpapa.angular2"
# install_extension "joelday.docthis"
# install_extension "dskwrk.vscode-generate-getter-setter"

# ####################
# Markdown
# ####################
# linter, 色, 目次, 見出しに番号付与, テーブル生成, リンク生成, etc...
install_extension "davidanson.vscode-markdownlint"
install_extension "ms-vscode.theme-markdownkit"
install_extension "joffreykern.markdown-toc"
install_extension "mdickin.markdown-shortcuts"
# github スタイル, 数式, 絵文字, gitbucket スタイル
install_extension "bierner.markdown-preview-github-styles"
install_extension "goessner.mdmath"
install_extension "bierner.markdown-emoji"
install_extension "bierner.emojisense"
install_extension "hbrok.markdown-preview-bitbucket"

# ####################
# C/C++
# ####################
install_extension "ms-vscode.cpptools"

# ####################
# Java
# ####################
# 公式が必須として推奨しているもの
install_extension "redhat.java"
install_extension "vscjava.vscode-java-debug"
install_extension "vscjava.vscode-java-test"
install_extension "vscjava.vscode-maven"
install_extension "vscjava.vscode-java-dependency"
install_extension "visualstudioexptteam.vscodeintellicode"
# 公式が人気があるとして推奨しているもの
install_extension "vmware.vscode-spring-boot"
install_extension "vscjava.vscode-spring-initializr"
install_extension "vscjava.vscode-spring-boot-dashboard"
install_extension "adashen.vscode-tomcat"
install_extension "summersun.vscode-jetty"
install_extension "shengchen.vscode-checkstyle"

# ####################
# PHP
# ####################
install_extension "formulahendry.code-runner"
install_extension "xdebug.php-debug"
# install_extension "ecmel.vscode-html-css"
# 個人的に追加
install_extension "junstyle.php-cs-fixer"
install_extension "neilbrayfield.php-docblocker"
install_extension "bmewburn.vscode-intelephense-client"

# ####################
# Python
# ####################
install_extension "ms-python.python"
install_extension "formulahendry.code-runner"
install_extension "visualstudioexptteam.vscodeintellicode"
# install_extension "ms-python.anaconda-extension-pack"
install_extension "ms-python.vscode-pylance"
install_extension "ms-python.isort"

# ####################
# Go
# ####################
install_extension "golang.go"

# ####################
# CSharp
# ####################
# install_extension "ms-vscode.csharp"
# install_extension "formulahendry.code-runner"
# install_extension "jchannon.csharpextensions"
# install_extension "k--kato.docomment"

# ####################
# Ruby
# ####################
install_extension "rebornix.ruby"

# ####################
# Docker
# ####################
install_extension "ms-azuretools.vscode-docker"

# ####################
# Ansible
# ####################
install_extension "redhat.ansible"

# ####################
# Vue
# ####################
install_extension "vue.volar"
install_extension "vue.vscode-typescript-vue-plugin"

# ####################
# React
# ####################
install_extension "mgmcdermott.vscode-language-babel"

# ####################
# JavaScript
# ####################
install_extension "msjsdiag.debugger-for-chrome"
install_extension "dbaeumer.vscode-eslint"
install_extension "esbenp.prettier-vscode"

# ####################
# Laravel
# ####################
install_extension "onecentlin.laravel-blade"
install_extension "onecentlin.laravel5-snippets"
install_extension "ryannaddy.laravel-artisan"
install_extension "codingyu.laravel-goto-view"

# ####################
# Remote Development
# ####################
install_extension "ms-vscode-remote.remote-ssh"
install_extension "ms-vscode-remote.remote-containers"
# install_extension "ms-vscode-remote.remote-wsl"

# ####################
# Rust
# ####################
install_extension "rust-lang.rust-analyzer"
install_extension "vadimcn.vscode-lldb"
install_extension "serayuzgur.crates"
install_extension "bungcip.better-toml"
install_extension "swellaby.vscode-rust-test-adapter"

# ####################
# Git
# ####################
install_extension "eamodio.gitlens"
install_extension "donjayamanne.githistory"
install_extension "mhutchie.git-graph"

# ####################
# Other
# ####################
install_extension "ms-ceintl.vscode-language-pack-ja"
install_extension "redhat.vscode-yaml"
# install_extension "johnstoncode.svn-scm"
install_extension "jebbs.plantuml"
# install_extension "vscodevim.vim"
install_extension "kelvin.vscode-sshfs"
install_extension "liximomo.sftp"
install_extension "mikestead.dotenv"
install_extension "rogalmic.bash-debug"
install_extension "asciidoctor.asciidoctor-vscode"
install_extension "hashicorp.terraform"
install_extension "ms-vscode.hexeditor"
install_extension "grapecity.gc-excelviewer"
install_extension "mechatroner.rainbow-csv"
install_extension "adpyke.vscode-sql-formatter"
install_extension "humao.rest-client"
install_extension "mongodb.mongodb-vscode"
install_extension "arjun.swagger-viewer"
install_extension "hediet.vscode-drawio"
install_extension "anthropic.claude-code"

echo ""
echo "完了しました。"

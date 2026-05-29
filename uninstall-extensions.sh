#!/usr/bin/env bash
#
# VSCode にインストール済みの拡張機能を全てアンインストールする

set -u

if ! command -v code >/dev/null 2>&1; then
  echo "ERROR: 'code' コマンドが見つかりません。VSCode をインストールし、PATH を通してください。" >&2
  exit 1
fi

extensions="$(code --list-extensions)"

if [ -z "${extensions}" ]; then
  echo "インストール済みの拡張機能はありません。"
  exit 0
fi

echo "以下の拡張機能をアンインストールします:"
echo "${extensions}" | sed 's/^/  - /'
echo ""

while IFS= read -r ext; do
  [ -z "${ext}" ] && continue
  echo "[UNINSTALL] ${ext}"
  code --uninstall-extension "${ext}"
done <<< "${extensions}"

echo ""
echo "完了しました。"

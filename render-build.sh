#!/bin/bash
# render-build.sh

set -e

# RSS-Bridge を clone（サブモジュールとして）
if [ ! -d "rss-bridge" ]; then
  git clone https://github.com/RSS-Bridge/rss-bridge.git
fi

# パーミッション調整（Render用）
chmod -R 755 rss-bridge

# シンボリックリンク（必要であれば）
ln -sfn rss-bridge index

echo "✅ RSS-Bridge fetched and prepared."

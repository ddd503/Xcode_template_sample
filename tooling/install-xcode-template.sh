#!/usr/bin/env sh

# ユーザーのホームDirからテンプレート置き場用のDirまでのpathを用意
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/Animal'
# このfileの置かれているpathを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# テンプレート置き場用のDirにこのファイルと同じ階層に置いてあるテンプレート用のDirをコピーする処理を用意
xcodeTemplate () {
  echo "==> 〜のXcodeファイルテンプレートをコピーしています..."

  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"

  cp -r $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
}

# 実行
xcodeTemplate

# 成功通知
echo "==> ... 成功!"
echo "==> テンプレートの設定が完了しました。Xcodeで「New File...」を選択すると、テンプレートが使用できます。"

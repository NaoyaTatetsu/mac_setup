# Macbook pro Setup

# 環境
## MacBook Pro (2020), Catalina 10.15.7


# 1. Homebrewのインストール
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

# 2. 実行手順

## 2-1. ホームディレクトリで`develop`フォルダを作成
```
mkdir develop
```
### develop直下にmac_setupをクローンしてくる

## 2-2. パッケージのインストール
```
sh app.sh
```
以下のパッケージがインストールされる
- adobe-acrobat-reader (pdf閲覧用)
- appcleaner (アプリをきれいに削除してくれるアプリ)
- cyberduck (サーバーいじるやつ)
- discord (開発用sns)
- excel, powerpoint, word, teams
- google-drive (ローカルからドライブにアクセスできる)
- good note (ipadと連携してるメモアプリ)
- iterm2 (terminalの上位互換)
- nodenv (Node.jsのヴァージョン管理)
- LINE
- macs-fan-control (ファンを制御するアプリ)
- mas (mas-cli)
- mysides (システム環境設定をいじるためのコマンド)
- mysql
- nordvpn (有料vpn)
- notion (メモ、プロジェクト管理)
- pyenv (pythonのヴァージョン管理)
- pipenv (pythonのライブラリ管理)
- postgresql
- slack (仕事用sns)
- vlc (動画再生アプリ)
- youtube-dl
- zoom

## 2-3. pythonとnode.jsのインストール
### version
python : 3.8.2、3.9.6
node.js : 14.17.3
```
sh programming.sh
```

## 2-4. `.zprofile`と`.zshrc`にパスなどを記述
事前にpreztoやoh my zeshなどの設定を済ませておく。
```
sh zprofile.sh
```
```
sh zshrc.sh
```

## 2-5. システム環境設定
```
sh system_preference.sh
```
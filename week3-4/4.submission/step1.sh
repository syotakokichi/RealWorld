#!/bin/bash

# パスワード情報を保存するファイル名
password_file="passwords_step1.txt"

# 挨拶メッセージ
echo "パスワードマネージャーへようこそ！"

# サービス名の入力
echo "サービス名を入力してください："
read service_name

# ユーザー名の入力
echo "ユーザー名を入力してください："
read user_name

# パスワードの入力
echo "パスワードを入力してください："
read password

# ファイルに情報を保存
echo "$service_name:$user_name:$password" >> "$password_file"

# 完了メッセージ
echo "Thank you!"

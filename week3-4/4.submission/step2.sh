#!/bin/bash

# パスワード情報を保存するファイル名
password_file="passwords.txt"

while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read option

    case "$option" in
        "Add Password")
            echo "サービス名を入力してください："
            read service_name
            echo "ユーザー名を入力してください："
            read user_name
            echo "パスワードを入力してください："
            read password

            echo "$service_name:$user_name:$password" >> "$password_file"
            echo "パスワードの追加は成功しました。"
            ;;

        "Get Password")
            echo "サービス名を入力してください："
            read service_name

            result=$(grep "^$service_name:" "$password_file")

            if [ -z "$result" ]; then
                echo "そのサービスは登録されていません。"
            else
                IFS=":" read -r service user pass <<< "$result"
                echo "サービス名：$service"
                echo "ユーザー名：$user"
                echo "パスワード：$pass"
            fi
            ;;

        "Exit")
            echo "Thank you!"
            exit 0
            ;;

        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done

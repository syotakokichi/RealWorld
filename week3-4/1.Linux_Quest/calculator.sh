#!/bin/bash

echo "数字を２つ選んでください:"
read num1
read num2

echo "選んだ数字で四則演算を行ってください (+, -, *, /):"
read operator

case $operator in
    "+")
        result=$(echo "$num1 + $num2" | bc)
        ;;
    "-")
        result=$(echo "$num1 - $num2" | bc)
        ;;
    "*")
        result=$(echo "$num1 * $num2" | bc)
        ;;
    "/")
        if [ "$num2" -eq "0" ]; then
            echo "エラー：ゼロによる除算は許可されていません"
            exit 1
        else
            result=$(echo "scale=2; $num1 / $num2" | bc)
        fi
        ;;
    *)
        echo "エラー: 無効な演算子です"
        exit 1
        ;;
esac

echo "答え: $result"

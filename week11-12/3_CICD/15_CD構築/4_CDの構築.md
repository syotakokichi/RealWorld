# CD の構築

GitHub の main ブランチに push された際に、デプロイが実行されるように CD を構築してください。

実装ができたら、GitHub の main　ブランチにプルリクエストをマージ、もしくは直接 push して CD が実行されることを確認してください。

参考までに、以下に CD の設定例を記載しておきます。CD のイメージを掴みましょう。

.github/workflows/deploy.yml

name: Deploy

on:
  push:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Set up Ruby
        uses: ruby/setup-ruby@ec02537da5712d66d4d50a0f33b7eb52773b5ed1
        with:
          ruby-version: '3.2'

      - name: Install dependencies
        run: bundle install

      - name: Rubocop
        run: bundle exec rubocop

  deploy:
    needs: test
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Deploy in Amazon EC2
        env:
          PRIVATE_KEY: ${{ secrets.AWS_PRIVATE_KEY  }}
          HOSTNAME : ${{ secrets.HOSTNAME  }}
          USER_NAME : ${{ secrets.USER_NAME  }}

        run: |
          echo "$PRIVATE_KEY" > private_key && chmod 600 private_key
          ssh -o StrictHostKeyChecking=no -i private_key ${USER_NAME}@${HOSTNAME} '
            # 最新のリポジトリを取得し、既存のポート番号4567のプロセスを終了し、デタッチモードでアプリを起動する
            cd /home/ec2-user/{リポジトリ名} &&
            git fetch --all &&
            git reset --hard origin/main &&
            bundle install &&
            lsof -t -i:4567 | xargs --no-run-if-empty kill -9 &&
            screen -dm bundle exec ruby app.rb -o 0.0.0.0
            '
なお、上のファイルでは AWS_PRIVATE_KEY、HOSTNAME、USER_NAME という名前のシークレット (機密情報) を使用しています。これらのシークレットは GitHub のリポジトリの Settings > Secrets and variables > Actions > New repository secrets から登録してください。

HOSTNAME : EC2 のパブリック IP (52.194.252.150 など)
USER_NAME : EC2 に接続する際のユーザー名 (Amazon Linux 2023 の場合は ec2-user)
AWS_PRIVATE_KEY : EC2 に接続する際に使用する秘密鍵 (pem ファイル) の内容
pem ファイルの例。

-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAq2FzZrPixR9TQIqtfq+AvQYrkbPLKKsl2JJYUDfY2SYmCu/g
kSr0zCBW+9YtHQTllPP08aoN2DFOtCJrGYAUewaWkqkBwG/UCz1c64O
GiatlbuO2OtKbh3UTERh7DMEP+LZAa78fKAcFCjPOwoIy9nHOAKpJ4WMvnzzn/be
lcfRld2cIsvE20Fd68xT+T3mx0pEhttAUt2OqMsDSo3UvV3xu9wz17pXMlDQroSU
PDzaKKCob18etiSSZAE0UVXZeT6an91EdlNXfbPLI7NB84UnoR5AoVdOK4qjWGmm
irvmEHRK1G5mK9SH0log
-----END RSA PRIVATE KEY-----

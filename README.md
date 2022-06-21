# TreatmentRecordBackend
このアプリは畜産農家における牛の個体管理と治療管理を行うためのアプリです。
フロントエンドはReact、バックエンドはRuby on RailsのAPIモードで動作しています。
このリポジトリはバックエンド部分です。フロントエンドは [treatment_record_frontend](https://github.com/DeargGlen/treatment_record_frontend) を参照してください。

## 使用技術
- Ruby 3.0.3
- Ruby on Rails 6.1.5
- MySQL 5.7
- Nginx
- Puma
- AWS
  - VPC 
  - EC2
  - RDS
  - Route53

## 機能
- 牛の個体の管理(登録、一覧表示、詳細表示)
- 牛の治療管理(登録、一覧表示、詳細表示)
- 牛群移動(牛舎間で牛を一括で移動する機能)
- その他設定(牛舎の設定、牛のタグ、治療のタグの設定など)

※現状では個人での使用を想定しており、既存のユーザーのみが新規のユーザー登録をできるようにしています。

## インストール方法

git clone するか、zipファイルを直接ダウンロードしてください。
```bash
git clone https://github.com/DeargGlen/treatment_record_backend.git
```
以下で必要なパッケージをインストールします。
```bash
bundle install
```
database.yml, development.rb, production.rb, devise.rbに必要な環境変数を.envなどで用意してください。

データベースを作成、マイグレーションを行います。
```bash
rails db:create
rails db:migrate
```
アプリケーションを起動します。
```
rails s
```


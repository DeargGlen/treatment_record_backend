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
- 牛の個体の管理
  - 登録(タグ付けによる管理)
  - 一覧表示(タグ・属性による絞り込み)
  - 詳細表示
  - 情報の更新
  - 削除
- 牛の治療管理
  - 登録(タグ付けによる管理)
  - 一覧表示(タグ・属性による絞り込み)
  - 詳細表示
  - コメント機能
  - 情報の更新
  - 削除
- 牛群移動
  - 牛の場所の情報を一括で更新
- ホーム画面
  - 場所を指定してそこにいる牛の一覧を表示
  - 最新の治療へのコメントを表示
- その他設定
  - 牛舎(牛のいる場所)の設定
  - 牛のタグ、治療(症状・疾病・投薬)のタグの設定

※現状では個人での使用を想定しており、既存のユーザーのみが新規のユーザー登録をできるようにしています。

## インストール方法

git clone するか、zipファイルを直接ダウンロードしてください。
```bash
$ git clone https://github.com/DeargGlen/treatment_record_backend.git
```
以下で必要なパッケージをインストールします。
```bash
$ bundle install
```
database.yml, development.rb, production.rb, devise.rbに必要な環境変数を.envなどで用意してください。

データベースを作成、マイグレーションを行います。
```bash
$ rails db:create
$ rails db:migrate
```
アプリケーションを起動します。
```
$ rails s
```


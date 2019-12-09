# README

## アプリ概要
フリマアプリ メルカリのクローンアプリ

## 実装機能一覧
Basic認証/新規登録/reCAPTCHA/クレジットカード登録/ログイン,ログアウト機能/商品一覧表示/マイページ表示/商品出品,購入,編集,削除/出品中,購入済商品表示/カテゴリ別商品表示/パンくず/外部認証機能（開発環境のみ）

## 開発環境
- Ruby version: 2.5.1
- rails version: 5.2.3
- DB: mysql
- deploy: AWS EC2

### データベース作成,移行
$ bundle exec rails db:create, db:migrate

### テスト実行
$ bundle exec rspec



## usersテーブル 

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|unique: true|
|password|string|unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_year_id|integer|null: false|
|birth_month_id|integer|null: false|
|birth_day_id|integer|null: false|

### Association
- has_many :buyed_items,foreign_key:"buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_one :address
- has_many :comments

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル 

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|state|string|null: false|
|size|string| 
|method|string|null: false|
|region|string|null: false|
|date|string|null: false|
|price|integer|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|
|carriage|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|bland_id|integer|foreign_key: true|

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :photos
- belongs_to :brand
- belongs_to :category
- has_many :comments

## photosテーブル 

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||null: false|

### Association
- has_many :items

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string| 

### Association
- has_many :items

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

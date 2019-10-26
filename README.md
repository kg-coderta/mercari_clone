# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## userテーブル 

|Column|Type|Options|
|------|----|-------|
|email|string|unique: true|
|password|string|unique: true|
|item_id|integer|foreign_key: true|

### Association
- has_many :buyed_items,foreign_key:"buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

## itemテーブル 

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

### Association

- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :photos
- belongs_to :brand
- belongs_to :category

## photoテーブル 

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string| 

### Association

- has_many :items
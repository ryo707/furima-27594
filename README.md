# README

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

## usersテーブル

|Column              |Type      |Options    |
|--------------------|----------|-----------|
|nickname            |string    |null: false|
|email               |string    |null: false, unique: true|
|encrypted_password  |string    |null: false|
|first_name          |string    |null: false|
|last_name           |string    |null: false|
|first_name_kana     |string    |null: false|
|last_name_kana      |string    |null: false|
|birthday            |date      |null: false|



### Association
- has_many :items
- has_many :orders

## addressesテーブル

|Column         |Type      |Options    |
|---------------|----------|-----------|
|postal_code    |string    |null: false|
|prefecture_id  |integer   |null: false|	
|city           |string    |null: false|	
|street         |string    |null: false|	
|building       |string    |           |	
|phone          |string    |null: false|
|order_id       |integer   |null: false, foreign_key: true|

### Association
- belongs_to :order


## itemsテーブル

|Column        |Type      |Options    |
|--------------|----------|-----------|
|name          |string    |null: false|
|price         |integer   |null: false|
|description   |text      |null: false|
|prefecture_id |integer   |null: false|
|user          |references|null: false, foreign_key: true|
|category_id   |integer   |null: false|
|condition_id  |integer   |null: false|
|delivery_day_id|integer    |null: false|
|shipping_charge_id|integer |null: false|


### Association
- belongs_to :user
- has_one :order

## ordersテーブル

|Column   |Type      |Option           |
|---------|----------|-----------------|
|user     |references|foreign_key: true|
|item     |references|foreign_key: true|

### Association
- has_one :address
- belongs_to :item
- belongs_to :user

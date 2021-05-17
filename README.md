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
- has_one :addresses

## addressesテーブル

|Column         |Type      |Options    |
|---------------|----------|-----------|
|postal_code    |string    |null: false|
|prefectures_id |integer   |null: false|	
|city           |string    |null: false|	
|street         |string    |null: false|	
|building       |string    |           |	
|phone          |string    |null: false|
|user_id        |integer   |null: false, foreign_key: true|

### Association
- belongs_to :transacts


## itemsテーブル

|Column        |Type      |Options    |
|--------------|----------|-----------|
|name          |string    |null: false|
|price         |integer   |null: false|
|description   |text      |null: false|
|prefectures_id|integer   |null: false|
|seller_id     |resources |null: false|
|category_id   |integer    |null: false|
|condition_id  |integer    |null: false|
|area_id       |integer    |null: false|
|delivery_days_id|integer    |null: false|
|shipping_charges_id|integer |null: false|


### Association
- belongs_to :users
- has_one :transact

## transactsテーブル

|Column   |Type      |Option           |
|---------|----------|-----------------|
|user_id  |references|foreign_key: true|
|item_id  |resources |foreign_key: true|

### Association
- has_one :transact
- belongs_to :items
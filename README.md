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
- has_many :transacts

## addressesテーブル

|Column         |Type      |Options    |
|---------------|----------|-----------|
|postal_code    |string    |null: false|
|prefectures_id |integer   |null: false|	
|city           |string    |null: false|	
|street         |string    |null: false|	
|building       |string    |           |	
|phone          |string    |null: false|
|transact       |references|null: false, foreign_key: true|

### Association
- belongs_to :transact


## itemsテーブル

|Column        |Type      |Options    |
|--------------|----------|-----------|
|name          |string    |null: false|
|price         |integer   |null: false|
|description   |text      |null: false|
|prefectures_id|integer   |null: false|
|user          |reference |null: false|
|category_id   |integer    |null: false|
|condition_id  |integer    |null: false|
|area_id       |integer    |null: false|
|delivery_days_id|integer    |null: false|
|shipping_charges_id|integer |null: false|


### Association
- belongs_to :user
- has_one :transact

## transactsテーブル

|Column   |Type      |Option           |
|---------|----------|-----------------|
|user     |references|foreign_key: true|
|item     |references|foreign_key: true|

### Association
- has_one :addresse
- belongs_to :item
- belongs_to :user

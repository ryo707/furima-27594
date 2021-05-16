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

|Column      |Type      |Options    |
|------------|----------|-----------|
|postal_code |string    |null: false|
|prefectures |string    |null: false|	
|city        |string    |null: false|	
|street      |string    |null: false|	
|building    |string    |null: false|	
|phone       |string    |null: false|	

### Association
- belongs_to :users


## itemsテーブル

|Column      |Type      |Options    |
|------------|----------|-----------|
|name        |string    |null: false|
|price       |string    |null: false|
|description |string    |null: false|
|size        |string    |null: false|
|seller_id   |resources |null: false|
|category    |string    |null: false|
|condition   |string    |null: false|
|area        |string    |null: false|

### Association
- belongs_to :users
- has_one :transacts

## transactsテーブル

|Column   |Type     |Option           |
|---------|---------|-----------------|
|seller_id|resources|foreign_key: true|
|buyer_id |resources|foreign_key: true|
|item_id  |resources|foreign_key: true|

### Association
-belongs_to :users
-belongs_to :items
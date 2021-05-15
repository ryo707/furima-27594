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

|Column    |Type      |Options    |
|----------|----------|-----------|
|nickname  |string    |null: false|
|email     |string    |null: false|
|password  |string    |null: false|
|first_name|string    |null: false|
|last_name |string    |null: false|
|profile   |string    |null: false|



### Association
- has_many :items
- has_one :addresses


## addressesテーブル

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|address |string    |null: false, foreign_key: true|

### Association
- belongs_to :users


## itemsテーブル

|Column      |Type      |Options    |
|------------|----------|-----------|
|name        |string    |null: false|
|price       |string    |null: false|
|description |string    |null: false|

### Association
- belongs_to :users


## transactsテーブル

|Column   |Type     |Option           |
|---------|---------|-----------------|
|seller_id|resources|foreign_key: true|
|buyer_id |resources|foreign_key: true|
|item_id  |resources|foreign_key: true|
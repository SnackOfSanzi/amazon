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


## users table

|Column|Tyoe|Options|
|------|----|-------|
|product|references|foreign_key:true|
|review|references|foreign_key:true|
|name|string|null:false,unique:true|
|adress|text|null:false|
|age|integer|null:false|
|gender|string|null:false|
|tel|integer|null:false|


### Association
- has_many :reviews, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :credit_cards, dependent: :destroy


## reviews table
|Column|Tyoe|Options|
|------|----|-------|
|message|text|null:fals|
|rate|integer|null:false|
|avatar|image|
|main_subject|text|null:fals|
|product|references|foreign_key:true|
|user|references|foreign_key:true|


### Association
- belongs_to :user
- belongs_to :product


## products table
|Column|Tyoe|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|productInfo|text|null: false|
|registrationInf|string|null: false|
|description|text|
|rating|integer|
|stock|integer|null: false|


### Association
- has_many :productImages
- has_many :reviews
- has_many :cart_items
- has_many :carts, through: :cart_items
- has_many :order_items
- has_many :order, through: :order_items
- belongs_to :user
- belongs_to :parent_category
- belongs_to :child_category


## productImages table
|Column|Tyoe|Options|
|------|----|-------|
|name|string|null: false, foreigne_key: true|
|product|references|null: false, foreign_key: true|


### Association
- belongs_to :product


## parent_categories table
|Column|Type|Options|
|------|----|-------|
|title|string|index: true, null: false|


### Association
- has_many :prodacts
- has_many :child_categories


## child_categories table
|Column|Type|Options|
|------|----|-------|
|title|string|index: true, null: false|


### Association
- belongs_to :parent_category
- has_many :prodacts


## carts table
|Column|Tyoe|Options|
|------|----|-------|
|totalPrice|integer|


### Association
- has_many :cart_items
- has_many :products, through: :cart_items


### cart_items table
|Column|Tyoe|Options|
|------|----|-------|
|cart|references|null: false, foreign_key: true|
|product|references|null: flase, foreign_key: true|
|quantity|integer|null: falase|


### Association
- belongs_to :cart
- belongs_to :product


## deliveries table
|Column|Tyoe|Options|
|------|----|-------|
|name|string|
|price|decimal|
|delivery_date|date|null: false|
|user|references|null: false, foreign_key: true|


### Association
- has_many :orders


## credit_cards
|Column|Tyoe|Options|
|------|----|-------|
|number|string|null: false|
|cvv|string|null: false|
|name|string|null: false|
|month_year|string|null: false|
|user|references|null: false, foreign_key: true|
|oreder|references|null: false, foreign_key: true|


### Association
- has_many :orders, dependent: :destroy
- belong_to :user


## orders table
|Column|Tyoe|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|shipping_date|date|null: false|


### Association
- has_many :order_items, dependent: :destroy
- has_many :prodacts, throgh: :order_items
- belongs_to :delivery
- belongs_to :user
- belongs_to :credit_card


## order_items table
|Column|Tyoe|Options|
|------|----|-------|
|order|references|null: false, foreign_key: true|
|prodact|references|null: false, foreign_key: true|
|quantity|integer|null: falase|


### Association
- belongs_to :order
- belongs_to :prodact

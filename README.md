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

|Column|Type|Options|
|------|----|-------|
|name|string|null:false,unique:true|
|address|text|null:false|
|age|integer|null:false|
|gender|string|null:false|
|tel|integer|null:false|


### Association
- has_many :reviews, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :credit_cards, dependent: :destroy


## reviews table
|Column|Type|Options|
|------|----|-------|
|body|text|null:fals|
|rate|integer|null:false|
|avatar|text|
|main_subject|text|null:fals|
|product|references|foreign_key:true|
|user|references|foreign_key:true|


### Association
- belongs_to :user
- belongs_to :product


## products table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|product_info|text|null: false|
|registration_inf|string|null: false|
|description|text|
|rating|integer|
|stock|integer|null: false|


### Association
- has_many :product_images
- has_many :reviews
- has_many :cart_products
- has_many :carts, through: :cart_products
- has_many :order_products
- has_many :order, through: :order_products
- belongs_to :user
- belongs_to :parent_category
- belongs_to :child_category


## product_images table
|Column|Type|Options|
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
- has_many :products
- has_many :child_categories


## child_categories table
|Column|Type|Options|
|------|----|-------|
|title|string|index: true, null: false|


### Association
- belongs_to :parent_category
- has_many :products


## carts table
|Column|Type|Options|
|------|----|-------|
|total_price|integer|


### Association
- has_many :cart_products
- has_many :products, through: :cart_products


### cart_products table
|Column|Type|Options|
|------|----|-------|
|cart|references|null: false, foreign_key: true|
|product|references|null: flase, foreign_key: true|
|quantity|integer|null: falase|


### Association
- belongs_to :cart
- belongs_to :product


## deliveries table
|Column|Type|Options|
|------|----|-------|
|name|string|
|price|decimal|
|delivery_date|date|null: false|
|user|references|null: false, foreign_key: true|


### Association
- has_many :orders


## credit_cards
|Column|Type|Options|
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
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|shipping_date|date|null: false|


### Association
- has_many :order_products, dependent: :destroy
- has_many :products, throgh: :order_products
- belongs_to :delivery
- belongs_to :user
- belongs_to :credit_card


## order_products table
|Column|Type|Options|
|------|----|-------|
|order|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
|quantity|integer|null: falase|


### Association
- belongs_to :order
- belongs_to :product

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
|name|string|null:false,unique:true|
|address|text|null:false|
|age|integer|null:false|
|gender|string|null:false|
|tel|integer|null:false|


### Association
- has_many :reviews, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :creditCards, dependent: :destroy


## reviews table
|Column|Tyoe|Options|
|------|----|-------|
|body|text|null:fals|
|rate|integer|null:false|
|avatar|image|
|mainSubject|text|null:fals|
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
- has_many :cartProducts
- has_many :carts, through: :cartProducts
- has_many :orderProducts
- has_many :order, through: :orderProducts
- belongs_to :user
- belongs_to :parentCategory
- belongs_to :childCategory


## productImages table
|Column|Tyoe|Options|
|------|----|-------|
|name|string|null: false, foreigne_key: true|
|product|references|null: false, foreign_key: true|


### Association
- belongs_to :product


## parentCategories table
|Column|Type|Options|
|------|----|-------|
|title|string|index: true, null: false|


### Association
- has_many :products
- has_many :childCategories


## childCategories table
|Column|Type|Options|
|------|----|-------|
|title|string|index: true, null: false|


### Association
- belongs_to :parentCategory
- has_many :products


## carts table
|Column|Tyoe|Options|
|------|----|-------|
|totalPrice|integer|


### Association
- has_many :cartProducts
- has_many :products, through: :cartProducts


### cartProducts table
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
|deliveryDate|date|null: false|
|user|references|null: false, foreign_key: true|


### Association
- has_many :orders


## creditCards
|Column|Tyoe|Options|
|------|----|-------|
|number|string|null: false|
|cvv|string|null: false|
|name|string|null: false|
|monthYear|string|null: false|
|user|references|null: false, foreign_key: true|
|oreder|references|null: false, foreign_key: true|


### Association
- has_many :orders, dependent: :destroy
- belong_to :user


## orders table
|Column|Tyoe|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|shippingDate|date|null: false|


### Association
- has_many :orderProducts, dependent: :destroy
- has_many :products, throgh: :orderProducts
- belongs_to :delivery
- belongs_to :user
- belongs_to :creditCard


## orderProducts table
|Column|Tyoe|Options|
|------|----|-------|
|order|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
|quantity|integer|null: falase|


### Association
- belongs_to :order
- belongs_to :product

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

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | string | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column           | Type   | Options                     |
| ---------------- | ------ | ----------------------------|
| nickname         | string | null:false,foreign_key:true |
| email            | string | null: false                 |
| password         | text   | null: false                 |
| last_name        | integer| null: false                 |
| first_name       | integer| null: false                 |
| last_name_kana   | integer| null: false                 |
| first_name_kana  | integer| null: false                 |
| birth_date       | integer| null: false                 |

### Association

- belong_to :users
- has_one :purchases
- has_many :item_images

## purchases テーブル

| Column           | Type       | Options                     |
| ---------------- | -----------| ----------------------------|
| item             | referenses | null:false,foreign_key:true |
| user             | referenses | null:false,foreign_key:true |

### Association

- belong_to :users
- belong_to :items
- has_one :addresses

## item_image テーブル

| Column           | Type       | Options                     |
| ---------------- | -----------| ----------------------------|
| image            | string     | null:false                  |
| item             | referenses | null:false,foreign_key:true |

### Association

- belong_to :items

## addresses テーブル

| Column           | Type        | Options                     |
| ---------------- | ----------- |-----------------------------|
| post_code        | integer     | null:false                  |
| prefecture_id    | string      | null:false,foreign_key:true |
| city    | text   | string      | null: false                 |
| building_name    | string      |                             |
| phone_number     | string      | null: false                 |
| purchase_item    | referenses  | null:false,foreign_key:true |

### Association

- belong_to :purchases

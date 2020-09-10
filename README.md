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
| birth_date       | date   | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column           | Type       | Options                     |
| ---------------- | ---------- | ----------------------------|
| user             | references | null:false,foreign_key:true |
| name             | string     | null: false                 |
| description      | text       | null: false                 |
| category_id      | integer    | null: false                 |
| condition_id     | integer    | null: false                 |
| delivery_fee     | integer    | null: false                 |
| prefecture_id    | integer    | null: false                 |
| handringtime_id  | integer    | null: false                 |
| price            | integer    | null: false                 |

### Association

- belong_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options                     |
| ---------------- | -----------| ----------------------------|
| item             | references | null:false,foreign_key:true |
| user             | references | null:false,foreign_key:true |

### Association

- belong_to :user
- belong_to :item
- has_one :address

## addresses テーブル

| Column           | Type        | Options                     |
| ---------------- | ----------- |-----------------------------|
| post_code        | string      | null:false                  |
| prefecture_id    | integer     | null:false                  |
| city             | string      | null:false                  |
| block_number     | string      | null:false                  |
| building_name    | string      |                             |
| phone_number     | string      | null: false                 |
| purchase         | references  | null:false,foreign_key:true |

### Association

- belong_to :purchase

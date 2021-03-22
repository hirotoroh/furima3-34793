# README

# テーブル設計

## usersテーブル

| Column             | Type   | Option       |
| ------------------ | ------ | ------------ |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| family_name        | string | null: false  | 
| last_name          | string | null: false  | 
| family_name_kana   | string | null: false  |
| last_name_kana     | string | null: false  |
| birth_day          | date   | null: false  |

### Association
- has_many :items
- belongs_to :purchase
- belongs_to :address

## itemsテーブル

| Column            | Type    | Option      |
| ----------------- | ------- | ----------- |
| name         　　　| string  | null: false | 
| description       | text    | null: false |
| category_id       | integer | null: false | 
| status_id         | integer | null: false |
| shipping_cost_id  | integer | null: false |
| shipping_area_id  | integer | null: false |
| days_id           | integer | null: false |
| price             | numeric | null: false |

### Association
- belongs_to :items
- belongs_to :purchase

## purchaseテーブル

| Column            | Type    | Option      |
| ----------------- | ------- | ----------- |
| user_id           | integer | null: false |
| item_id           | integer | null: false |

## addressテーブル

| Column            | Type    | Option      |
| ----------------- | ------- | ----------- |
| postal_code       | string  | null: false |
| prefecture_id     | integer | null: false |
| city              | string  | null: false |
| house_number      | string  | null: false |
| build_name        | string  |             |
| phone_number      | string  | null: false |

### Associations
- belongs_to :users
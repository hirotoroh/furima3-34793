# README

# テーブル設計

## usersテーブル

| Column            | Type   | Option      |
| ----------------- | ------ | ----------- |
| email             | string | null: false |
| password          | string | null: false |
| nickname          | string | null: false |
| family_name       | string | null: false | 
| last_name         | string | null: false | 
| family_name_kana  | string | null: false |
| last_name_kana    | string | null: false |
| birth_day         | date   | null: false |

### Association
- has_many :items
- belongs_to :cards
- belongs_to :address

## itemsテーブル

| Column            | Type   | Option      |
| ----------------- | ------ | ----------- |
| item_name         | string | null: false | 
| description       | string | null: false |
| category          | string | null: false | 
| status            | string | null: false |
| shipping_cost     | string | null: false |
| shipping_area     | string | null: false |
| days              | string | null: false |
| price             | string | null: false |

### Association
- belongs_to :items

## cardsテーブル

| Column            | Type   | Option      |
| ----------------- | ------ | ----------- |
| card_number       | string | null: false |
| expiration_month  | string | null: false |
| expiration_date   | string | null: false |
| security_code     | string | null: false |

### Associations
- belongs_to :users

## addressテーブル

| Column            | Type   | Option      |
| ----------------- | ------ | ----------- |
| postal_code       | string | null: false |
| prefecture        | string | null: false |
| city              | string | null: false |
| house_number      | string | null: false |
| build_name        | string |             |
| phone_number      | string | null: false |

### Associations
- belongs_to :users
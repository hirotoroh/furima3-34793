# README

# テーブル設計

## usersテーブル

| Column             | Type   | Option                   |
| ------------------ | ------ | ------------------------ |
| email              | string | unique: true, null: false|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| family_name        | string | null: false              | 
| last_name          | string | null: false              | 
| family_name_kana   | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_day          | date   | null: false              |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| name         　　　| string     | null: false                    | 
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |  
| status_id         | integer    | null: false                    |
| shipping_cost_id  | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| city              | string     | null: false                    | 
| house_number      | string     | null: false                    |
| build_name        | string     |                                |
| phone_number      | string     | null: false                    |
| purchase          | references | null: false, foreign_key: true |

### Associations
- belongs_to :purchase
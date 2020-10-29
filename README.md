# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false | 
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last          | string | null: false |
| kana_first         | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :logs

## items テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| name         | string  | null: false                    |
| description  | text    | null: false                    |
| category_id  | integer | null: false                    |
| condition_id | integer | null: false                    |
| ship_id      | integer | null: false                    |
| area_id      | integer | null: false                    |
| days_id      | integer | null: false                    |
| price        | integer | null: false                    |
| user_id      | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :log 

## Addresses テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| zip      | string  | null: false                    |
| pre_id   | integer | null: false                    |
| city     | string  | null: false                    |
| street   | string  | null: false                    |
| building | string  |                                |
| phone    | string  | null: false                    |
| log_id   | integer | null: fasle, foreign_key: true |

### Association

- belongs_to :log

## Logs テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| item_id    | integer | null: false, foreign_key: true |
| user_id    | integer | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

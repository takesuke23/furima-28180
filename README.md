# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| password_digest | string | null: false |

### Association

- has_many :items, logs

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | string     | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| shippment_id | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| price        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :log

## Addresses テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| zipcode         | string     | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false,|
| street          | string     | null: false |
| apartment       | string     | null: false |
| phone           | integer    | null: false |

### Association

- belongs_to :log

## Log テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| created_at | string     | null: false, foreign_key: true |
| price      | integer     | null: false, foreign_key: true |

### Association

- has_many :addresses
- belongs_to :item
- belongs_to :user

# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items, logs

## items テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| name      | string    | null: false                    |
| image     | reference | null: false, foreign_key: true |
| text      | string    | null: false                    |
| category  | string    | null: false                    |
| condition | string    | null: false                    |
| shippment | string    | null: false                    |
| area      | string    | null: false                    |
| days      | string    | null: false                    |
| price     | string    | null: false                    |
| seller    | string   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :log

## Addresses テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| zipcode | string     | null: false |
| state   | string     | null: false |
| city    | string     | null: false,|
| street  | string     | null: false |
| phone   | string     | null: false |

### Association

- belongs_to :log

## Log テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| created_at | string     | null: false, foreign_key: true |
| price      | string     | null: false, foreign_key: true |

### Association

- has_many :addresses
- belongs_to :item
- belongs_to :user

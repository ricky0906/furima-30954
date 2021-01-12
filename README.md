# DB設計

## usersテーブル

| column                    | type    | options     |
| ------------------------- | ------- | ----------- |
| nickname                  | string  | null: false |
| email                     | string  | null: false |
| encrypted_password        | string  | null: false |
| first_name                | string  | null: false |
| last_name                 | string  | null: false |
| first_name_kana           | string  | null: false |
| last_name_kana            | string  | null: false |
| birthday                  | date    | null: false |

### association
has_many: orders
has_many: items

## itemsテーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    | 
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### association
belongs_to: user
has_one: order

## ordersテーブル

| column        | type       | options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### association 
belongs_to: user
belongs_to: item
has_one: address

## addressesテーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    | 
| address            | string     | null: false                    | 
| building           | string     |                                |
| phone              | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### association
belongs_to: order

# DB設計

## usersテーブル

| column          | type    | options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | integer | null: false |

### association
has_many: orders
has_many: items

## itemsテーブル

| column          | type       | options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    | 
| condition       | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| shipping_area   | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### association
belongs_to: user
has_one: order

## ordersテーブル

| column        | type       | options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| card_expire   | integer    | null: false                    |
| security_cord | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### association 
belongs_to: user
belongs_to: item
has_one: addresses

## addressesテーブル

| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    | 
| address     | string     | null: false                    | 
| building    | string     |                                |
| phone       | integer    | null: false                    |
| order_id    | references | null: false, foreign_key: true |

### association
belongs_to: orders

# テーブル設計

## usersテーブル

| Column                | Type    | Options                   |
|-----------------------|---------|---------------------------|
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| nickname              | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date            | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| name                   | string     | null: false       |
| info                   | text       | null: false       |
| category_id            | integer    | null: false       |
| sales_status_id        | integer    | null: false       |
| shopping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- has_one :purchase_record
- belongs_to :user


## purchase_recordsテーブル

| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addressesテーブル

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_code     | integer    | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| addresses       | string     | null: false       |
| building        | string     |                   |
| phone_number    | integer    | null: false       |
| purchase_record | references | foreign_key: true |

### Association

- belongs_to :purchase_records

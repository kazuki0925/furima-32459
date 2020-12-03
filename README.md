# テーブル設計

## usersテーブル

| Column                | Type    | Options                   |
|-----------------------|---------|---------------------------|
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| nickname              | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date_y          | integer | null: false               |
| birth_date_m          | integer | null: false               |
| birth_date_d          | integer | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| name                | test       | null: false       |
| image               |            | null: false       |
| info                | text       | null: false       |
| category            | string     | null: false       |
| sales_status        | string     | null: false       |
| shopping_fee_status | string     | null: false       |
| prefecture          | string     | null: false       |
| scheduled_delivery  | string     | null: false       |
| price               | integer    | null: false       |
| user_id             | references | foreign_key: true |

### Association

- has_one :purchase_record
- belongs_to :user


## purchase_recordsテーブル

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| user_id             | references | foreign_key: true |
| item_id             | references | foreign_key: true |
| shopping_address_id | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype
- belongs_to :shipping_address


## shipping_addressesテーブル

| Column       | Type    | Options     |
|--------------|---------|-------------|
| number       | integer | null: false |
| exp_month    | integer | null: false |
| exp_year     | integer | null: false |
| cvc          | integer | null: false |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- has_many :purchase_records

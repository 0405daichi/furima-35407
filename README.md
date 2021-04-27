## usersテーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null: false             |
| email              | string  | null: false unique:true |
| encrypted_password | string  | null: false             |
| family_name        | string  | null: false             |
| first_name         | string  | null: false             |
| family_ruby        | string  | null: false             |
| first_ruby         | string  | null: false             |
| birthday           | date    | null: false             |

### Association

- has_many :items
- has_many :comments
- has_many :sold_items


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| item_category_id   | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| item_price         | integer    | null: false                    |
| shipping_burden_id | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| date_guideline_id  | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :sold_item

## sold_itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- has_one :profile
- belongs_to :item
- belongs_to :user


## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | string     | null: false                    |
| item       | preference | null: false, foreign_key: true |
| user       | preference | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item


## profilesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| sold_item         | references | null: false, foreign_key: true |

### Association

- belongs_to :sold_item
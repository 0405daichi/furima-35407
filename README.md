## usersテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| name       | string  | null: false |
| name_ruby  | string  | null: false |
| birthday   | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :sold_items
- has_one :profile
- has_one :credit_cards


## itemsテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| item_name         | text      | null: false                    |
| item_description  | text      | null: false                    |
| item_status       | string    | null: false                    |
| item_price        | string    | null: false                    |
| shipping_burden   | string    | null: false                    |
| shipment_source   | string    | null: false                    |
| date_guideline    | string    | null: false                    |
| user              | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## sold_itemsテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| user              | reference | null: false, foreign_key: true |
| item              | reference | null: false, foreign_key: true |

### Association

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


## credit_cardsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| number     | string     | null: false                    |
| deadline   | string     | null: false                    |
| user       | preference | null: false, foreign_key: true |


### Association

- belongs_to :user


## profilesテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| postal_code       | integer   | null: false                    |
| prefecture        | string    | null: false                    |
| municipality      | string    | null: false                    |
| address           | integer   | null: false                    |
| building_name     | string    | null: false                    |
| phone_number      | integer   | null: false                    |
| user              | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
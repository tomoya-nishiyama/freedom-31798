# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |

### Association

- has_many :origin
- has_many :likes

## origins テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| book_title       |   string   | null: false |
| category_id      |  integer   | null: false |
| text             |    text    | null: false |
| youtube_url      |   string   | null: false |
| amazon           |   text     | null: false | 

### Association

- belongs_to :user
- has_many   :likes

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| origin | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item



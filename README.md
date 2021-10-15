# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## アプリケーション名
MSN (Management Stiky Note)

## アプリケーション概要
自分のスケジュール管理はもちろん他人との情報共有、仕事（タスク・やるべきこと）の優先順位付け。
期間の設定はもちろん付箋紙みたいに終わればすぐ削除できる情報共有アプリ


## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |

### Association

- has_many :posts
- has_many :task_users
- has_many :tasks, through: :group_users
- has_many :task_messages

## posts テーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| title                  | string     | null: false                   |
| text                   | text       | null: false                   |
| name                   | string     | null: false                   |
| start_on               | time       |                               |
| end_on                 | time       |                               |
| date                   | datetime   | null: false                   |
| user_id                | references | null: false, foreign_key:true |


### Association

- belongs_to :users
- belongs_to :tasks

## tasksテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| task_name          | string | null: false              |

- has_many :users, through: :task_users
- has_many :posts

## task_usersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| task_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :taska

## task_messagesテーブル
| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| user_id   | references  | null: false, foreign_key: true |
| task_id   | references  | null: false, foreign_key: true |
| messages  | string      | null: false                    |

### Association

- belongs_to :users
- belongs_to :taska
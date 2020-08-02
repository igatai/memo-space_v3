# README


## Application Name
    MemoSpace

## Overview ##
    In this application, text and images can be recorded and linked to multiple tags for management.
    By performing a search using AND conditions with multiple tags, you can easily find desired memo from a large number of memos.

## Functions ##
    This application has following functions.
  * Posting memos.
  * Listing memos posted by user.
  * Display detail view of posted memo.
  * Register user.
  * Login as registered user.
  * Controlling transaction.
  * Uploading images.
  * Pagination.

## Technical elements ##
  * Carrierwave gem for uploading images.
  * Devise gem for user management.
  * Heroku as deploy environment.
  * Docker container for application environment.
  * TravisCI to deploy as CICD pipeline.
  * MySQL as database on developping envoronment.
  * Postgresql on production environment.
  * Relation between Tag and Memo are many to many.

## Database Design

###  users table

  |Column|Type|Options|
  |------|----|-------|
  |email|string|null: false|
  |password|string|null: false|
  |name|string|null: false, index: true|

  * has_many :memos
  * has_many :tags
  * has_many :event

###   memos table

  |Column|Type|Options|
  |------|----|-------|
  |title|string|null: false|
  |text|string||
  |image|string||
  |user|references|null: false, foreign_key: true|
  |event|bigint||

  * has_many :tag_memos
  * has_many :tags, through: tag_memos
  * belongs_to :user
  * has_one :memo

###   tags table

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false, index: true|
  |user_id|references|null: false, foreign_key: true|
  |folder_id|references|foreign_key|

  * has_many :tag_memos
  * has_many :memos, through: tag_memos
  * belongs_to :user
  * belongs_to :folder

###   tag_memos table

  |Column|Type|Options|
  |------|----|-------|
  |memo|references|null: false, foreign_key: true|
  |tag|references|null: false, foreign_key: true|

  * belongs_to :memo
  * belongs_to :tag

### Folders table

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |user|references|foreign_key: true|

  * has_many :tags

### Events table

  |Column|Type|Options|
  |------|----|-------|
  |start|datetime||
  |end|datetime||
  |color|varchar||
  |allday|tinyint||
  |user_id|references|null: false, foreign_key: true|

  * belongs_to :user
  * has_one :memo

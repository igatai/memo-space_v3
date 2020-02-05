# README
### ##############################
## 
##    MemoSpace  Database Design
## 
### ##############################

### ##################

## users table
  |Column|Type|Options|
  |------|----|-------|
  |email|string|null: false|
  |password|string|null: false|
  |name|string|null: false, index: true|
## Association
  -- has_many :memos
  -- has_many :tags

### ##################

## memos table
  |Column|Type|Options|
  |------|----|-------|
  |title|string|null: false|
  |content|string||
  |image|string||
## Association
  -- has_many :memos_tags
  -- has_meny :tags, through: memos_tags
  -- belongs_to :user

### ##################

## tags table
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false, index: true|
## Association
  -- has_many :memos_tags
  -- has_many :memos, through: memos_tags
  -- belongs_to :user

### ##################

## memos_tags table
  |Column|Type|Options|
  |------|----|-------|
  |memo|references|null: false, foreign_key: true|
  |tag|references|null: false, foreign_key: true|
## Association
  -- belongs_to :memo
  -- belongs_to :tag

### ##################
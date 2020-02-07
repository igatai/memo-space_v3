class Memo < ApplicationRecord
  has_many :tag_memos
  has_meny :tags, through: tag_memos
  belongs_to :user
end

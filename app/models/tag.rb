class Tag < ApplicationRecord
  has_many :tag_memos
  has_many :memos, through: :tag_memos
  belongs_to :user
end

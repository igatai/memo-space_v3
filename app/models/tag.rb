class Tag < ApplicationRecord
  belongs_to :user
  has_many :memos, through: :tag_memos
end

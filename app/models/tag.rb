class Tag < ApplicationRecord
  has_many :tag_memos
  has_many :memos, through: :tag_memos, dependent: :destroy
  belongs_to :user
  belongs_to :folder
  # belongs_to :folder, dependent: :destroy
end

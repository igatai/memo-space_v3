class Memo < ApplicationRecord

  has_many :tag_memos
  has_many :tags, through: :tag_memos
  belongs_to :user

  mount_uploader :image, ImageUploader

end

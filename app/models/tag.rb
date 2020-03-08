class Tag < ApplicationRecord
  has_many :tag_memos
  has_many :memos, through: :tag_memos
  belongs_to :user

  # def checked(ids: [])
  #   return Memo.where( tag_ids: ids )
  # end

  # def self.filter(search)
  #   return Memo.all unless search
  #   Memo.where('text LIKE(?)', "%#{search}%")
  # end

end

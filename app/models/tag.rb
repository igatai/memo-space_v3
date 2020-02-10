class Tag < ApplicationRecord
  has_many :tag_memos
  has_many :memos, through: :tag_memos
  belongs_to :user
  
  # def value_check(tag_name, tag_instances)
  #   tag_instances.name.each do |name|
  #     if tag_name == name || tag_name == null
  #       return false
  #     else
  #       return true
  #     end
  #   end
  # end
end

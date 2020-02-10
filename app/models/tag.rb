class Tag < ApplicationRecord
  belongs_to :user
  has_many :memos, through: :tag_memos

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

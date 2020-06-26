class Memo < ApplicationRecord

  has_many :tag_memos
  has_many :tags, through: :tag_memos, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ImageUploader

  def self.filter(selected_tag_ids) # Tag id array checked with form.
    selected_memo_ids = TagMemo.where(tag_id: selected_tag_ids).pluck(:memo_id).uniq.sort # Memo id array associated to checked tag.
    return Memo.all unless selected_tag_ids 
    memo_filtered = [] # Memo id array associated to all tags checked with form.
    selected_memo_ids.each do |id|
      loop_count = 0
      while selected_tag_ids.length > loop_count do
        break unless Memo.includes(:tags).find(id).tags.pluck(:id).include?(selected_tag_ids[loop_count].to_i)
        loop_count += 1; # Get memo id that associated tag id is equall to all tag id selected.
      end
      memo_filtered << id if loop_count == selected_tag_ids.length
    end
    return memo_filtered
  end
end
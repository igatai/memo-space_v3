class TagMemo < ApplicationRecord
  belongs_to :tag
  belongs_to :memo

  # def taged_memo(selected_tag_ids)
  #   memos = []
  #   selected_tag_ids.each do |id|
  #     memo_ids << TagMemo[tag_id: id]
  #   end
  #   return memo_ids
  # end




end
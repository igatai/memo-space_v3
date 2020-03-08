class Memo < ApplicationRecord

  has_many :tag_memos
  has_many :tags, through: :tag_memos
  belongs_to :user

  mount_uploader :image, ImageUploader

  # def self.search(search)
  #   return Memo.all unless search
  # end

  # def self.filter(search)
  #   return Memo.all unless search
  #   Memo.where('text LIKE(?)', "%#{search}%")
  # end

  # def filter(selected_tag_ids)
  def self.filter(selected_tag_ids)
    selected_memo_ids = TagMemo.where(tag_id: selected_tag_ids).pluck(:memo_id).uniq.sort
    # binding.pry
    return Memo.all unless selected_tag_ids
    # @memos = Memo.includes(:tags).where(tag_id: selected_tag_ids).references(":tags").pluck(:id).uniq.sort
    # @memos_cheked = Memo.includes(:tags).where("tags.id": selected_tag_ids).references(":tags").pluck(:id).uniq.sort
    # @memos_checked = Memo.where("id": selected_memo_ids).references(":tags").uniq.sort
    memo_filtered = []
    selected_memo_ids.each do |id|
      loop_count = 0
      while selected_tag_ids.length > loop_count do
        if Memo.includes(:tags).find(id).tags.pluck(:id).include?(selected_tag_ids[loop_count].to_i)
          loop_count += 1;
        else
          break
        end
      end
      if loop_count == selected_tag_ids.length
        memo_filtered << id
      end
    end
    # binding.pry
    return memo_filtered
  end
  #         if Tag.includes(:memos).where("memos.id": id).pluck(:id).include?(selected_tag_ids[loop_count])

  #       # if Memo.includes(:tags).find(id) ==  Memo.includes(:tags).where("tags.id": selected_tag_ids[loop_count]).references(":tags")
  #       if Memo.includes(:tags).where("tags.id": selected_tag_ids[loop_count]).references(":tags").pluck(:id)
  #       # if Memo.includes(:tags).find(id) ==  Memo.includes(:tags).where(tag_id: selected_tag_ids[loop_count]).references(":tags")
  #         loop_count += 1;
  #       else
  #         break;
  #       end
  #       if loop_count == @selected_tag_ids.length
  #         memo_filtered << memo.id
  #       end
  #     end
  #   end
  # end
  # @memos = Memo.includes(:tags).where(tag_id: selected_tag_ids)
  # @memos = Memo.includes(:tags).where(tag_id: selected_tag_ids).references(":tags").pluck(:id).uniq.sort
  # @memos = Memo.includes(:tags).filter(selected_tag_ids).references(":tags").pluck(:id).uniq.sort
end

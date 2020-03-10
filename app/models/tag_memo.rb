class TagMemo < ApplicationRecord
  belongs_to :tag
  belongs_to :memo
end
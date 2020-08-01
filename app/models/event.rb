class Event < ApplicationRecord
  belongs_to :user
  has_one :memo, dependent: :destroy
  # has_many :memos, dependent: :destroy
  # accepts_nested_attributes_for :memos, allow_destroy: true
  accepts_nested_attributes_for :memo, allow_destroy: true
end

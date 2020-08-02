class Event < ApplicationRecord
  belongs_to :user
  has_one :memo, dependent: :destroy
  accepts_nested_attributes_for :memo, allow_destroy: true
end

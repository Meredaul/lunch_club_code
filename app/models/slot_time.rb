class SlotTime < ApplicationRecord

  has_many :occurences
  has_many :groups, through: :occurences

end

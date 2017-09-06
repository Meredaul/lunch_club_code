class Occurence < ApplicationRecord
  belongs_to :slot_time
  belongs_to :group
end

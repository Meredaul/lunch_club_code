class Presence < ApplicationRecord
  belongs_to :user
  belongs_to :occurence
end

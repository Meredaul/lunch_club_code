class Group < ApplicationRecord

  has_many :occurences
  has_many :slot_times, through: :occurences
  has_many :participations
  has_many :balances
  has_many :users, through: :participations
  belongs_to :user

end

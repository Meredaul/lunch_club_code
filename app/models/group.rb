class Group < ApplicationRecord

  has_one :creation
  has_one :user, through: :creation

  has_many :participations
  has_many :users, through: :participations

  has_many :balances
  has_many :messages
  has_many :occurences
  has_many :slot_times, through: :occurences

end

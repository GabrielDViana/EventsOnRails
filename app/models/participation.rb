class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :cap

  has_and_belongs_to_many :users

  accepts_nested_attributes_for :users
end

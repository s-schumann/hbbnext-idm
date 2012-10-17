class Device < ActiveRecord::Base
  attr_accessible :address, :alias, :display_name, :user_ids

  has_many :users, :through => :udr
end

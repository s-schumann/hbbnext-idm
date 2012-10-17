class Device < ActiveRecord::Base
  attr_accessible :address, :alias, :display_name, :udr_ids, :user_ids

  has_many :udrs
  has_many :users, :through => :udrs
end

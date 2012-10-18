class Device < ActiveRecord::Base
  attr_accessible :address, :alias, :display_name, :udr_ids, :user_ids
  attr_protected :uuid

  has_many :udrs
  has_many :users, :through => :udrs

  accepts_nested_attributes_for :udrs
end
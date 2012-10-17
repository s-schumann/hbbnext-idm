class User < ActiveRecord::Base
  attr_accessible :alias, :password, :pin, :username, :udr_ids, :device_ids

  has_many :udrs
  has_many :devices, :through => :udrs

  accepts_nested_attributes_for :udrs
end

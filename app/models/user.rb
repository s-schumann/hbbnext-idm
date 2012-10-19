class User < ActiveRecord::Base
  attr_accessible :alias, :password, :pin, :username, :udr_ids, :device_ids, :role_ids
  attr_protected :uuid

  has_many :udrs, :dependent => :destroy
  has_many :devices, :through => :udrs
  has_many :roles, :through => :udrs

  accepts_nested_attributes_for :udrs
end

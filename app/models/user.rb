class User < ActiveRecord::Base
  attr_accessible :alias, :password, :pin, :username, :device_ids

  has_many :devices, :through => :udr
end

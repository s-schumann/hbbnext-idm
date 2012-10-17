class User < ActiveRecord::Base
  attr_accessible :alias, :password, :pin, :username
end

class Udr < ActiveRecord::Base
  attr_accessible :user_id, :device_id

  belongs_to :user
  belongs_to :device
end

class Udr < ActiveRecord::Base
  attr_accessible :user_id, :device_id, :cr_ids, :context_ids, :role, :name, :uuid, :users_attributes, :devices_attributes

  belongs_to :user
  belongs_to :device
  has_many :crs
  has_many :contexts, :through => :crs
end

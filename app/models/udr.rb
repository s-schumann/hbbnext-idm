class Udr < ActiveRecord::Base
  attr_accessible :user_id, :device_id, :cr_ids, :context_ids, :name, :uuid, :role_id

  belongs_to :user
  belongs_to :device
  belongs_to :role
  has_many :crs
  has_many :contexts, :through => :crs
end

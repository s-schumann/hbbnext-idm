class Udr < ActiveRecord::Base
  attr_accessible :user_id, :device_id, :context_ids

  belongs_to :user
  belongs_to :device
  has_many :contexts, :through => :cr
end

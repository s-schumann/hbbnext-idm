class Cr < ActiveRecord::Base
  attr_accessible :context_id, :udr_id, :active, :name, :uuid, :last_login, :created_by

  belongs_to :context
  belongs_to :udr
end

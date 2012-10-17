class Cr < ActiveRecord::Base
  attr_accessible :context_id, :udr_id, :active, :name, :uuid

  belongs_to :context
  belongs_to :udr
end

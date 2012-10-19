class Role < ActiveRecord::Base
  attr_accessible :udr_ids
  attr_protected :name, :uuid

  has_many :udrs

  accepts_nested_attributes_for :udrs
end

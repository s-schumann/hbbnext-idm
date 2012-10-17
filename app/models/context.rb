class Context < ActiveRecord::Base
  attr_accessible :alias, :display_name, :cr_ids, :udr_ids, :uuid

  has_many :crs
  has_many :udrs, :through => :crs

  accepts_nested_attributes_for :crs
end

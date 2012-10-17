class Context < ActiveRecord::Base
  attr_accessible :alias, :display_name, :cr_ids, :udr_ids

  has_many :crs
  has_many :udrs, :through => :crs
end

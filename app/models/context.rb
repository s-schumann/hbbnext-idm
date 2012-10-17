class Context < ActiveRecord::Base
  attr_accessible :alias, :display_name, :udr_ids

  has_many :udrs, :through => :cr
end

class Roles < ActiveRecord::Base
  attr_protected :name, :uuid

  has_many :udrs
end

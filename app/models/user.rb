class User < ActiveRecord::Base
  attr_accessible :alias, :password, :pin, :username, :udr_ids, :device_ids, :role_ids, :mmi_face, :mmi_voice, :birthday, :gender, :email, :avatar, :pref_price, :pref_usability, :pref_responsiveness
  attr_protected :uuid, :created_by

  has_many :udrs, :dependent => :destroy
  has_many :devices, :through => :udrs
  has_many :roles, :through => :udrs

  accepts_nested_attributes_for :udrs
end

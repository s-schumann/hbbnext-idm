object @user
attributes :id, :alias, :username, :uuid

child(@user => :credentials) {
	attributes :password, :pin 
}

child(@user => :info) {
	attributes :gender, :birthday
}	

child(@user => :contact) {
	attribute :email
}

node(:mmi) {
	attributes :voice =>  Random.rand().round(2), :face => Random.rand().round(2)
}

child(@user => :links) {
	attributes :udr_ids, :device_ids, :role_ids
}

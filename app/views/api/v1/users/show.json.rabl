object @user
attributes :id, :alias, :username, :uuid

node(:credentials) {
	attributes :password, :pin 
}

node(:mmi) {
	attributes :voice =>  Random.rand().round(2), :face => Random.rand().round(2)
}

node(:links) {
	attributes :udr_ids, :device_ids, :role_ids
}

object @user
attributes :id, :alias, :username, :uuid

node(:credentials) {
	attributes :password, :pin 
}

node(:links) {
	attributes :udr_ids, :device_ids, :role_ids
}

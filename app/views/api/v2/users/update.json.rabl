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

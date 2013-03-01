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

node(:meta) {
	attribute :description => "User updated.", :success => true, :created_by => "n/a", :created_at => @user.created_at, :updated_at => @user.updated_at, :version => "v3"
}

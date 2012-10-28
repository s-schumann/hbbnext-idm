collection @users
attributes :id, :alias, :username

node(:web_url) {
	|user| user_url(user)
}

node(:href) {
	|user| api_v1_user_url(user)
}
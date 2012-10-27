collection @users

extends "api/v1/users/show"

node(:web_url) {
	|user| user_url(user)
}

node(:href) {
	|user| api_v1_user_url(user)
}

collection @users

extends "api/v1/users/show"

node(:web_url) {
	|user| user_url(user)
}

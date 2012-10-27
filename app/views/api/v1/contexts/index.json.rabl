collection @contexts

extends "api/v1/contexts/show"

node(:web_url) {
	|context| context_url(context)
}

node(:href) {
	|context| api_v1_context_url(context)
}

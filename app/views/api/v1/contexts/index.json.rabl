collection @contexts

extends "api/v1/contexts/show"

node(:web_url) {
	|context| context_url(context)
}

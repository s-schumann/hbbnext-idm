collection @contexts
attributes :id, :alias

node(:web_url) {
	|context| context_url(context)
}

node(:href) {
	|context| api_v2_context_url(context)
}

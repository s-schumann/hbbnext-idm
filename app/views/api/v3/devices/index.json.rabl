collection @devices
attributes :id, :alias

node(:web_url) {
	|device| device_url(device)
}

node(:href) {
	|device| api_v3_device_url(device)
}

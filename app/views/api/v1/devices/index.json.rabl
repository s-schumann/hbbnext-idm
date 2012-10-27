collection @devices

extends "api/v1/devices/show"

node(:web_url) {
	|device| device_url(device)
}

node(:href) {
	|device| api_v1_device_url(device)
}

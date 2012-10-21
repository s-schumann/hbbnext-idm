object false
node() {
	attributes :apiVersion => "1", :swaggerVersion => "1.1", :basePath => "http://hbbnext.ngidm.org/api/v1"
}

node(:apis) {
  	attributes :path => "users/resources", :description => "Operations about users"
}

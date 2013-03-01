object @device
attributes :id, :alias, :display_name, :address, :uuid

node(:meta) {
	attribute :description => "Device updated.", :success => true, :created_by => "n/a", :created_at => @device.created_at, :updated_at => @device.updated_at, :version => "v3"
}

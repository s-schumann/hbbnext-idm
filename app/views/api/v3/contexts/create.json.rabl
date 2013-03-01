object @context
attributes :id, :alias, :display_name, :uuid

node(:meta) {
	attribute :description => "Context created.", :success => true, :created_by => "n/a", :created_at => @context.created_at, :updated_at => @context.updated_at, :version => "v2"
}

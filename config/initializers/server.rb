#unless Rails.env.production?
#  ENV['HTTP_USER'] = 'testuser'
#  ENV['HTTP_PASS'] = 'testpass'
#end
$currentDomain = "hbbnext.ngidm.org"
unless Rails.env.production?
	$currentDomain = "localhost:3000"
end
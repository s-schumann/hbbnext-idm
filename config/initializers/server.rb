#unless Rails.env.production?
#  ENV['HTTP_USER'] = 'testuser'
#  ENV['HTTP_PASS'] = 'testpass'
#end
if Rails.env.production
	$currentDomain = "hbbnext.ngidm.org"
else
	$currentDomain = "localhost:3000"
end
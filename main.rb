class MapSwitcherServer < Sinatra::Base
	before do
		content_type 'application/json'
	end
	get '/test' do
		@foo = 'bar'
	end

	post '/mailbox' do
		string = request.body.read
		hsy = JSON.parse(string)

		File.open('store-sample', 'a') do |f|
			f.write(JSON.dump(hsy) + "\n\n\n\n")
		end
	end
	get '/json' do
		content = ""
		File.open('store-sample','r') do |f|
			content = f.readlines("\n\n\n\n").last
		end
		# coder = HTMLEntities.new
		# hsy = JSON.parse(content)
		# htmlBody = coder.decode(hsy['HtmlBody'])
		# <<-EOF
		# From: #{hsy['From']}
		# At  : #{hsy['Date']}
		# Html: #{htmlBody}
		# EOF
		content
	end
end

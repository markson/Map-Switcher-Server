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
		# headers({
		# 	"Access-Control-Allow-Headers" => "*",
		# 	'Access-Control-Request-Method' => '*'
		# })
		content = ""
		re = /^{"From":"#{params[:username]}"/

		File.open('store-sample','r').each("\n\n\n\n") do |l|
			if l =~ re
				content = l
			end
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

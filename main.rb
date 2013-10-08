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

		File.open('mails', 'a') do |f|
			f.write(JSON.dump(hsy) + "\n\n\n\n")
		end
	end
	get '/mailbox' do
		content = ""
		File.open('mails','r') do |f|
			content = f.readlines("\n\n\n\n").last
		end
		coder = HTMLEntities.new
		hsy = JSON.parse(content)
		HtmlBody = coder.decode(hsy['HtmlBody'])
		binding.pry
		<<-EOF
		From: #{hsy['From']}
		At  : #{hsy['Date']}
		
		EOF
	end
	get '/'
end

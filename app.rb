require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")
require('./lib/phone_book')

get ("/") do
	@contacts = Contact.all()
	erb(:index)
end

post ("/contacts") do
	@name = params.fetch("name")
	@number = params.fetch("number")
	new_contact = Contact.new({:name => @name, :number => @number})
	new_contact.save()
	@contacts = Contact.all()
	erb(:index)
end

get('/contacts_page/:name') do
  name = params.fetch('name')
  @name1 = params.fetch('name')
  @search_name = Contact.list_numbers(name)
  erb(:contacts_page)
end
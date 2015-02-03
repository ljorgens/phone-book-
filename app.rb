require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")
require('./lib/phone_book')
require('./lib/phone')
require('pry')

get ("/") do
	@contacts = Contact.all()
	erb(:index)
end

post ("/add_contact") do
	@new_contact = Contact.new({:name => params.fetch("new_contact")})
	@new_contact.save()
	@contacts = Contact.all()
	erb(:index)
end

get ("/contacts_page/:id") do
	@new_contact = Contact.find(params.fetch("id").to_i())
	erb(:contacts_page)
end

post ("/add_phone_number/:id") do
	@new_contact = Contact.find(params.fetch("id").to_i())
	new_phone = Phone.new({:number => params.fetch("new_phone_number"), :type => params.fetch("type")})
	@new_contact.add_number(new_phone)
	erb(:contacts_page)	
end
require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")
require('./lib/phone_book')
require('./lib/phone')

get ("/") do
	@phone = Phone.all()
	erb(:index)
end

post("/phones") do
	name = params.fetch('name')
	Phone.new(name).save()
	@phones = Phone.all()
	erb(:index)
end

post ("/contacts") do
	@name = params.fetch("name")
	@number = params.fetch("number")
	@new_contact = Contact.new({:name => @name, :number => @number})
	@new_contact.save()
	@new_type = Phone.find(params.fetch('phone_id').to_i())
	@new_type.number_type(@new_contact)
	erb(:index)
end
  
  get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id'))
  erb(:contact1)
end

get('/phones/:id') do
  @phone = Phone.find(params.fetch('id').to_i())
  erb(:phone1)
end
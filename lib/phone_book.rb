class Contact
	attr_reader(:name, :number)
	
	@@contact_list = []
	
	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@number = attributes.fetch(:number)
		@id = @@contact_list.length().+(1)
	end
	
	define_method(:id) do
		@id
	end
	
	define_method(:save) do
		@@contact_list.push(self)
	end
	
	define_singleton_method(:all) do
		@@contact_list 
	end
	
	define_singleton_method(:clear) do
		@@contact_list = []
	end
	
	define_singleton_method(:list_names) do
		contact_names = []
		@@contact_list.each() do |contacts|
			contact_names.push(contacts.name())
		end
		contact_names.sort()
	end
	define_singleton_method(:list_numbers) do |contact|
		contact_number = []
	 	@@contact_list.each() do |contacts|
			if contacts.name() == contact
				contact_number.push(contacts.number())
			end
		end
		contact_number
	end
end
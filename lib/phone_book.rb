class Contact
	attr_reader(:name)
	
	@@contact_list = []
	
	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@contact = []
		@id = @@contact_list.length().+(1)
	end
	
	define_method(:id) do
		@id
	end
	
	define_method(:save) do
		@@contact_list.push(self)
	end
	
	define_method(:add_number) do |number|
		@contact.push(number)
	end
	
	define_method(:contact) do
		@contact
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
	
	define_singleton_method(:find) do |id|
    	found_number = nil
    	@@contact_list.each() do |numbers|
      		if numbers.id().eql?(id)
        		found_number = numbers
      		end
    	end
   		found_number
  	end
end
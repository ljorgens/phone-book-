class Phone
	@@number_list = []
	
	define_method(:initialize) do |number|
	@number	= number
	@contact = []
	@id = @@number_list.length().+(1)
	end
	
	define_method(:number) do
	@number
	end
	
	define_method(:contact) do
	@contact
	end
	
	define_method(:id) do
    @id
  	end
	
	define_singleton_method(:all) do
		@@number_list
	end
	
	define_method(:save) do
    	@@number_list.push(self)
  	end
  
   	define_singleton_method(:clear) do
    	@@number_list = []
  	end
  	define_method(:number_type) do |type|
  		@name.push(type)
	end
	define_singleton_method(:find) do |id|
    	found_number = nil
    	@@number_list.each() do |numbers|
      		if numbers.id().eql?(id)
        		found_number = numbers
      		end
    	end
   		found_number
  	end
end
class Contact
	attr_reader(:name, :number)
	
	@@contact_list = []
	
	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@number = attributes.fetch(:number)
	end
	define_method(:save) do
		@@contact_list.push(self)
		self
	end
	define_singleton_method(:all) do
		@@contact_list 
	end
	define_singleton_method(:clear) do
		@@contact_list = []
	end
end
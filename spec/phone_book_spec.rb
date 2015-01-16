require("rspec")
require("phone_book.rb")

describe(Contact) do
	before() do
		Contact.clear()
	end
	describe("name") do
		it("returns a name when name is called") do
			test_contact = Contact.new({:name => "Steve Smith", :number => "555-555-5555"})
			expect(test_contact.name()).to(eq("Steve Smith"))
		end
	end
	describe("number") do 
		it("returns a number when number is called") do
			test_contact = Contact.new({:name => "Steve Smith", :number => "555-555-5555"})
			expect(test_contact.number()).to(eq("555-555-5555"))
		end
	end
	describe("save") do
		it("saves a contact to be called later") do
			test_contact = Contact.new({:name => "Steve Smith", :number => "555-555-5555"})
			test_contact.save()
			expect(Contact.all()).to(eq([test_contact]))
		end
	end
	describe(".all") do
		it("shows everything in the contact_list array") do
			expect(Contact.all()).to(eq([]))
		end
	end
	describe(".clear") do
		it("clears out contact list") do
			test_contact = Contact.new({:name => "Steve Smith", :number => "555-555-5555"})
			test_contact.save()
			expect(Contact.clear()).to(eq([]))
		end
	end
end
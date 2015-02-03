require("rspec")
require("phone_book.rb")

describe(Contact) do
	before() do
		Contact.clear()
	end
	describe("name") do
		it("returns a name when name is called") do
			test_contact = Contact.new({:name => "Steve Smith"})
			expect(test_contact.name()).to(eq("Steve Smith"))
		end
	end
	
	describe("#add_number") do
    	it('displays the current contacts phone number') do
      		test_phone = Phone.new({:number => "555-555-5555"})
      		test_contact = Contact.new({:name => "Hermone"})
      		test_contact.add_number(test_phone)
      		test_contact.save()
      	expect(test_contact.contact()).to(eq([test_phone]))
    end

    	it('saves and displays more than one phone') do
      		test_phone = Phone.new({:number => "555-555-5555"})
      		test_phone2 = Phone.new({:number => "222-222-2222"})
      		test_contact = Contact.new({:name => "thermon"})
      		test_contact.add_number(test_phone)
      		test_contact.add_number(test_phone2)
      		test_contact.save()
      		expect(test_contact.contact()).to(eq([test_phone, test_phone2]))
   		end
  	end
  	
	describe("save") do
		it("saves a contact to be called later") do
			test_contact = Contact.new({:name => "Steve Smith"})
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
			test_contact = Contact.new({:name => "Steve Smith"})
			test_contact.save()
			expect(Contact.clear()).to(eq([]))
		end
	end
	describe(".list_names") do
		it("lists all contacts in the contact list by name") do
			test_contact = Contact.new({:name => "Steve Smith"})
			test_contact.save()
			test_contact1 = Contact.new({:name => "Summer Day"})
			test_contact1.save()
			expect(Contact.list_names()).to(eq(["Steve Smith", "Summer Day"]))
		end
	end

	describe(".find") do
    	it("returns a contact by its id number") do
     		test_contact1 = Contact.new({:name => "Aldon Smith"})
      		test_contact1.save()
      		test_contact2 = Contact.new({:name => "kevin Alder"})
      		test_contact2.save()
      	expect(Contact.find(test_contact1.id())).to(eq(test_contact1))
    end
  end
end
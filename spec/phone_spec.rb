require('rspec')
require('phone_book')
require('phone')

describe(Phone) do
	before() do
    	Phone.clear()
  	end

  describe('#number') do
    it("returns the number of the new number") do
      test_contact1 = Phone.new("707-3535-4566 Work")
      expect(test_contact1.number()).to(eq("707-3535-4566 Work"))
    end
  end

  describe('#id') do
    it("returns the id of the number") do
      test_contact1 = Phone.new("707-3535-4566 Work")
      expect(test_contact1.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a number to the array of saved numbers") do
      test_contact1 = Phone.new("707-3535-4566 Work")
      test_contact1.save()
      expect(phone.all()).to(eq([test_contact1]))
    end
  end
  
  describe('#number_type') do
    it("adds a new number to a contact") do
      test_contact1 = Phone.new("707-3535-4566 Work")
      test_contact2 = Contact.new("James Todd", "123-456-7890")
      test_contact1.number_type(test_contact2)
      expect(test_contact1.name()).to(eq([test_contact2]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved numbers") do
      Phone.new("707-3535-4566 Work").save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a number by its id number") do
      test_contact1 = Phone.new("707-3535-4566 Work")
      test_contact1.save()
      test_contact2 = Phone.new("707-3535-4566 Work")
      test_contact12.save()
      expect(Phone.find(test_contact1.id())).to(eq(test_contact1))
    end
  end
end

require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
    
    test "author first_name presence" do
        a = make_author(false)
        a.first_name = nil
        assert !a.valid?
        assert_match "First name can\'t be blank", a.errors.full_messages.first.to_s
    end
    
    test "author last_name presence" do
        a = make_author(false)
        a.last_name = nil
        assert !a.valid?
        assert_match "Last name can\'t be blank", a.errors.full_messages.first.to_s
    end
    
    test "author first_name alphanumeric only" do
        a = make_author(false)
        a.first_name = "&Whateverfirstname__*"
        assert !a.valid?
        assert_match "First name is invalid", a.errors.full_messages.first.to_s
    end
    
    test "author last_name alphanumeric only" do
        a = make_author(false)
        a.last_name = "&Whateverlastname__*"
        assert !a.valid?
        assert_match "Last name is invalid", a.errors.full_messages.first.to_s
    end
    
    test "unique authors" do
        a1 = make_author(true)
        a2 = make_author(false)
        a2.last_name = a1.last_name
        a2.first_name = a1.first_name
        assert !a2.valid?
        assert_match "First name has already been taken", a2.errors.full_messages.first.to_s
    end
    
    test "successful author creation" do
        a = make_author(false)
        assert a.valid?
        b = make_book(false)
        b.author_id = a.id
        a.books << b
        assert a.valid?
        assert a.save
    end
    
end

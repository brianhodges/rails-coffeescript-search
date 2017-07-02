require 'test_helper'

class BookTest < ActiveSupport::TestCase
    
    test "unique book titles for author" do
        b1 = make_book(true)
        b2 = make_book(false)
        b2.title = b1.title
        b2.author_id = b1.author_id
        assert !b2.valid?
        assert_match "Title has already been taken", b2.errors.full_messages.first.to_s
    end
    
    test "book needs author" do
        b = make_book(false)
        b.author_id = nil
        assert !b.valid?
        assert_match "Author must exist", b.errors.full_messages.first.to_s
    end
    
    test "book needs title" do
        b = make_book(false)
        b.title = nil
        assert !b.valid?
        assert_match "Title can\'t be blank", b.errors.full_messages.first.to_s
    end
    
end

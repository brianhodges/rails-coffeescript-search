require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
    
    def random_string(len)
        RCSLib.random_string len
    end
    
    def random_alphanumeric_string(len)
        RCSLib.random_alphanumeric_string len
    end
    
    def make_author(save)
        a = Author.new
        a.first_name = random_alphanumeric_string 25
        a.last_name = random_alphanumeric_string 25
        assert a.save, "make_author" if save
        a
    end
  
    def make_author_params
        author = {}
        author[:first_name] = random_alphanumeric_string 25
        author[:last_name] = random_alphanumeric_string 25
        author 
    end
  
    def make_book(save)
        b = Book.new
        b.title = random_string 25
        b.author_id = make_author(true).id
        assert b.save, "make_book" if save
        b
    end
  
end

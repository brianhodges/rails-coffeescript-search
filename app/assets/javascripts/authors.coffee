# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#search bar input from /search
@search = () ->
    input = $('#search_input').val().toLowerCase()
    $('.book').each ->
        t = $(@)
        if t.text().toLowerCase().includes(input)
            t.show()
        else
            t.hide()

#append partial _fields to form    
@addAssociated = (widget) ->
    time = new Date().getTime()
    regexp = new RegExp($(widget).data('id'), 'g')
    newFlds = $(widget).data('fields').replace(regexp, time)
    $(widget).after(newFlds)
    
#uppercase string
@uppercase = (str) ->  
  array1 = str.split(' ')  
  newarray1 = []  
  x = 0  
  while x < array1.length  
    newarray1.push array1[x].charAt(0).toUpperCase() + array1[x].slice(1)  
    x++  
  newarray1.join ' ' 
    
#inject all authors/books into list
@loadAuthors = () ->
    $('#book_list').empty()
    $('#search_input').val("")
    $.ajax({  
      url: "/authors.json", 
      type: "GET"
    })
    .done (serverData) ->
        for k,v of serverData
            author = v["first_name"] + " " + v["last_name"]
            for i,b of v["books"]
                title = '<a style="text-decoration: none" href="/authors/' + v["id"] + '">' + uppercase(author + " - " + b["title"]) + '</a>'
                $('#book_list').append($('<li class="book"></li>').val(i).html(title))
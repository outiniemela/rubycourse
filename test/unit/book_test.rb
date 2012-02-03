require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  
  test "a book with all attributes should be valid" do
#    @book = Book.new(title: 'Steppenwolf', authors: 'Hermann Hesse', description: 'A great book')
# steppenwolf on yml-filussa fixtures-folderissa
    @book= books(:steppenwolf)
    assert @book.valid?
  end

  test "a book without a title should not be valid" do
    @book = books(:steppenwolf)
    @book.title = ''
    assert @book.invalid?
  end

  test "a book without authors should not be valid" do
    book = books(:steppenwolf)
    book.authors = ''
    assert book.invalid?
  end

  test "book title must be unique" do
    book = books(:steppenwolf)
    other_book = book.dup
    assert other_book.invalid?
  end

  test "book ISBN can not be empty" do
    book = books(:steppenwolf)
    book.isbn= ''
    assert book.invalid?
  end
  
end

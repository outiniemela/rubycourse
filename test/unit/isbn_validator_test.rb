require 'test_helper'
#vain yksittäiset hipsut requireen!
#activesupport on nyt superina
class IsbnValidatorTest < ActiveSupport::TestCase
#  test "true is true" do
#    assert true
#    assert false

  test "an ISBN with dashes is valid" do
    assert IsbnValidator.new.valid?("951-98548-9-4")
  end

  test "an ISBN with whitespace is valid" do
    assert IsbnValidator.new.valid?("951 98548 9 4")
  end
  
  test "an emptry string is not valid" do
    assert !IsbnValidator.new.valid?("")
  end
  
  test "a string with letters other than x is not valid" do
    assert !IsbnValidator.new.valid?("951-98548-9-p")
  end
  
  test "a string with 14 digits is not valid" do
    assert !IsbnValidator.new.valid?("12345678901234")
  end

end

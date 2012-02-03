require 'test_helper'
#vain yksittäiset hipsut requireen!
#activesupport on nyt superina
class IsbnValidatorTest < ActiveSupport::TestCase
#  test "true is true" do
#    assert true
#    assert false

  test "an ISBN with dashes is valid" do
    v = IsbnValidator.new("951-98548-9-4")
    assert v.valid?
  end

  test "an ISBN with whitespaces is valid" do
    v = IsbnValidator.new("95 1-98 54  8-9-4")
    assert v.valid?
  end

  test "an empty ISBN is not valid" do
    v= IsbnValidator.new("")
    assert !v.valid?
  end

  test "an ISBN with letters other than x is not valid" do
    v= IsbnValidator.new("9a1-98x48-9-4")
    assert !v.valid?
  end

  test "an ISBN with more than 13 letters is not valid" do
    v= IsbnValidator.new("951-98548-9-44")
    assert !v.valid?
  end

end

require 'minitest/autorun'
require './lib/customer'
require './lib/movie'
require './lib/rental'

class CustomerTest < Minitest::Test
  def test_statement
    customer = Customer.new('terachan')

    movie1 = Movie.new("on the load", 2)
    rental1 = Rental.new(movie1, 10)
    customer.add_rental(rental1)

    movie2 = Movie.new("mask", 0)
    rental2 = Rental.new(movie2, 23)
    customer.add_rental(rental2)

    movie3 = Movie.new("jojo", 1)
    rental3 = Rental.new(movie3, 23)
    customer.add_rental(rental3)

    expected = "Rental Record for terachan\n"
    expected += "\ton the load\t12.0\n"
    expected += "\tmask\t33.5\n"
    expected += "\tjojo\t3\n"
    expected += "Amount owed is 48.5\n"
    expected += "You earned 4 frequent renter points"

    assert_equal expected, customer.statment

  end
end
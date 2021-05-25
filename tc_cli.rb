#ruby
#!/usr/bin/env ruby
require_relative "cli"
require "test/unit"

class TestCli < Test::Unit::TestCase

  def test_is_pal
    #assert_equal("hello Julius", CliGuess.make_guess("Julius") )
    #assert_equal("hello Fred", CliGuess.make_guess("")  )
    assert_equal(true, CliGuess.is_pal("hannah"))
    assert_equal(true, CliGuess.is_pal(1028201))
    assert_equal(true, CliGuess.is_pal("Mr Owl ate my metal worm"))
    assert_equal(true, CliGuess.is_pal("Go hang a salami, I'm a lasagna hog."))
    assert_equal(true, CliGuess.is_pal(""))
    assert_equal(true, CliGuess.is_pal(1))
    assert_equal(true, CliGuess.is_pal(02/02/2020))


    #hannah
    #racecar
    #1028201
    #02/02/2020
    #Mr Owl ate my metal worm
    #Go hang a salami, I'm a lasagna hog.
    #Notes and guidance
    #Please bear in mind the following,
    #Go hang a salami, I'm a lasagna hog.
  end

end

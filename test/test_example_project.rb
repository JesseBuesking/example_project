gem "minitest"
require "minitest/autorun"
require "example_project"

class TestExampleProject < Minitest::Test
  def test_simple_function
    actual = 'One'
    expected = ExampleProject.simple_function()
    assert_equal actual, expected
    assert_equal actual.encoding, expected.encoding
  end

  def test_c_code_function
    actual = 'One'
    expected = ExampleProject.c_code_function()
    assert_equal actual, expected
    assert_equal actual.encoding, expected.encoding
  end
end


require 'test/unit'
require 'base62'
require 'base62/ext'

class Base62Test < Test::Unit::TestCase
  TEST_CASES = {
    '0' => 0,
    'A' => 10,
    'z' => 61,
    '9V' => 589,
    '6Dp' => 23921,
    'ZdDW' => 8492234,
    'idIaC' => 659525012,
    'Q6tdzb' => 23921373423,
    '2gVcAqBx' => 9457803309413,
    '15vUV0p7l' => 239213734292125,
    'HelloWorld' => 239032307299047885
  }

  def test_encode62
    TEST_CASES.each do |k,v|
      assert_equal k, Base62.encode62(v)
    end
  end

  def test_decode62
    TEST_CASES.each do |k,v|
      assert_equal v, Base62.decode62(k)
    end
  end

  def test_negative_int
    assert_raises ArgumentError do
      Base62.encode62(-1)
    end
  end

  def test_empty_str
    assert_raises ArgumentError do
      Base62.decode62('')
    end
  end

  def test_invalid_str
    assert_raises ArgumentError do
      Base62.decode62('3-D')
    end
  end
end

class StringTest < Test::Unit::TestCase
  def test_to_i_62
    assert_equal 987654321, '14q60P'.to_i_62
  end
end

class FixnumTest < Test::Unit::TestCase
  def test_to_s_62
    assert_equal '14q60P', 987654321.to_s_62
  end
end

require 'test/unit'
require 'rebase'
require 'rebase/ext'

class RebaseTest < Test::Unit::TestCase
  def test_encode
    LG_TEST_CASES.each do |base, (str, int)|
      assert_equal str, Rebase(base).encode(int)
    end

    SM_TEST_CASES.each do |base, (str, int)|
      assert_equal str, Rebase(base).encode(int)
    end
  end

  def test_decode
    LG_TEST_CASES.each do |base, (str, int)|
      assert_equal int, Rebase(base).decode(str)
    end

    SM_TEST_CASES.each do |base, (str, int)|
      assert_equal int, Rebase(base).decode(str)
    end
  end

  def test_invalid_base
    assert_raises ArgumentError do
      Rebase(1)
    end

    assert_raises ArgumentError do
      Rebase(['a'])
    end

    assert_raises ArgumentError do
      Rebase(:nope)
    end
  end

  def test_negative_int
    assert_raises ArgumentError do
      Rebase(62).encode(-1)
    end
  end

  def test_empty_str
    assert_raises ArgumentError do
      Rebase(62).encode('')
    end
  end

  def test_invalid_str
    assert_raises ArgumentError do
      Rebase(62).decode('3-D')
    end
  end
end

class StringTest < Test::Unit::TestCase
  def test_decode_base
    LG_TEST_CASES.each do |base, (str, int)|
      assert_equal int, str.decode_base(base)
    end

    SM_TEST_CASES.each do |base, (str, int)|
      assert_equal int, str.decode_base(base)
    end
  end
end

class IntegerTest < Test::Unit::TestCase
  def test_encode_base
    LG_TEST_CASES.each do |base, (str, int)|
      assert_equal str, int.encode_base(base)
    end

    SM_TEST_CASES.each do |base, (str, int)|
      assert_equal str, int.encode_base(base)
    end
  end
end

LG_TEST_CASES = {
  2 => ['111101100110010110100010111010111011000110001011111010001011001', 8877388119578899545],
  3 => ['1002201221001120112101200020210220211010', 4463525865301478013],
  4 => ['11230310002330031022111202023300', 6571890689634083568],
  5 => ['320130310113214430432421314', 5085774489728404584],
  6 => ['1211135403503221354333322', 6477461992762061522],
  7 => ['206532552321522333620', 170631270478391786],
  8 => ['727103766770353564240', 8487173615780817056],
  9 => ['88541251732736012', 16596205323334481],
  10 => ['5836475510742011381', 5836475510742011381],
  11 => ['16432519016A0746318', 8789867971751995037],
  12 => ['370B2A96A684540AA9', 7964456496068986401],
  13 => ['9CC448343C270140C', 6651548204702013313],
  14 => ['2C42C621B0C635325', 6269464518998498165],
  15 => ['239B2DD74CB6676B', 982334838669428801],
  16 => ['6D4B8C9BF1E1F23A', 7875542974793380410],
  17 => ['C7G43146352G4GB', 2099331205338458142],
  18 => ['DE0A01706G4B98H', 5164738246521049949],
  19 => ['303GG5GIGE41E2', 126611781334814144],
  20 => ['53B45BCE9JFCCA9', 8483692357759301009],
  21 => ['109AJABAAHC5BAD', 3313950450660276748],
  22 => ['11EE6DG7AH5E53C', 6692957775099146178],
  23 => ['30L2IKACIID69E', 1532234966661371884],
  24 => ['99G3D6AN2AMJLI', 8241650335775879370],
  25 => ['12274LD2029DAN', 1614779895508742773],
  26 => ['2PPO1LLNKBBNBI', 7443186276307878036],
  27 => ['1OK85HH9H2111F', 7767697851382171542],
  28 => ['10CJ7HEKQAARJ7', 6607341945493131339],
  29 => ['AF5AE7QLO5QHQ', 3723411226278712706],
  30 => ['5QAPTTEL44OF1', 3124203846849670051],
  31 => ['8ROOGETIR7U9L', 7007650834042024664],
  32 => ['2KUQVTT6M2HGA', 3061145853128427018],
  33 => ['1FFV9JPUPBLJI', 2450447054373123087],
  34 => ['AXSRD55AJTM4', 771761885266085116],
  35 => ['2FUUTKVJ4YLPW', 8291865915638511882],
  36 => ['W87B7PFYXIJC', 4241886346313083416],
  37 => ['U2ZQOHH1LXFQ', 5351788130651508775],
  38 => ['YGHXWPQN6RH9', 8214856986711129691],
  39 => ['SE8SSAO9JU4R', 9005112693213473487],
  40 => ['C88OcaFOcHab', 5119311693375900677],
  41 => ['5a3JL2cZ05Qb', 3235998856970670587],
  42 => ['2e1J8XCWDOdb', 2118537235981421299],
  43 => ['5EMLfXKT5Id7', 4960343295618315782],
  44 => ['642chZ1MSS8E', 7290676790839462958],
  45 => ['WFf2TeTEEEi', 1101660750741644774],
  46 => ['3W0FWJaPI6Fa', 7211841919960537902],
  47 => ['2ZCeadCM5fCU', 6799688737247617808],
  48 => ['26GbJ9P15j8f', 6645051926566864553],
  49 => ['28d09IClRNiC', 8521494714680087425],
  50 => ['1PLfYD3T7IAl', 7366862704244670547],
  51 => ['1JeN0bMCSoaN', 8427389596319880041],
  52 => ['LdI7fiCbQlo', 3145043853424462494],
  53 => ['7dbICF58dnQ', 1355228098270633491],
  54 => ['RHJk7c2o1Y2', 5760286739524819298],
  55 => ['YcX3ie6cdHs', 8789808467639188714],
  56 => ['6qKQHrsaqtc', 2103453550600773934],
  57 => ['1JYFEK91hmP', 486529515692828557],
  58 => ['1Y1feEbGr4i', 683564726838628248],
  59 => ['JRZDvth8i5', 168649034944668150],
  60 => ['8thBZR9Vc8W', 5398822155838673312],
  61 => ['bdn1QnF764', 440314059202477733],
  62 => ['6sqx2kOxGEV', 5778360485571791275]
}

SM_TEST_CASES = {
  2 => ['10001101101000010', 72514],
  3 => ['2212001220', 56184],
  4 => ['100132213', 67495],
  5 => ['10241222', 87062],
  6 => ['1301043', 70227],
  7 => ['501034', 84403],
  8 => ['171441', 62241],
  9 => ['105222', 62876],
  10 => ['12373', 12373],
  11 => ['19118', 26760],
  12 => ['32787', 66775],
  13 => ['183B2', 46789],
  14 => ['6D91', 19139],
  15 => ['9520', 31530],
  16 => ['8F44', 36676],
  17 => ['2610', 11577],
  18 => ['36G7', 19735],
  19 => ['963E', 63968],
  20 => ['4DEF', 37495],
  21 => ['9481', 85282],
  22 => ['452C', 45068],
  23 => ['364D', 39780],
  24 => ['1A9C', 19812],
  25 => ['39D7', 52832],
  26 => ['2P58', 52190],
  27 => ['17A3', 25059],
  28 => ['2CM3', 53931],
  29 => ['13K4', 27496],
  30 => ['3A8Q', 90266],
  31 => ['1SBO', 57064],
  32 => ['26T6', 72614],
  33 => ['1SND', 67201],
  34 => ['21V3', 80821],
  35 => ['NCC', 28607],
  36 => ['17KF', 56463],
  37 => ['K21', 27455],
  38 => ['11LD', 57127],
  39 => ['G50', 24531],
  40 => ['6MZ', 10515],
  41 => ['1GJ0', 96596],
  42 => ['4UJ', 8335],
  43 => ['g76', 77965],
  44 => ['Th3', 58039],
  45 => ['SNX', 57768],
  46 => ['ZJi', 74978],
  47 => ['Bg2', 26275],
  48 => ['IPX', 42705],
  49 => ['CIY', 29728],
  50 => ['JZL', 49271],
  51 => ['AJi', 27023],
  52 => ['2aP', 7305],
  53 => ['MUI', 63406],
  54 => ['4Rk', 13168],
  55 => ['EJf', 43436],
  56 => ['3iq', 11924],
  57 => ['N82', 75185],
  58 => ['J3C', 64102],
  59 => ['C4m', 42056],
  60 => ['Dla', 49656],
  61 => ['BiR', 43642],
  62 => ['Irj', 72523]
}

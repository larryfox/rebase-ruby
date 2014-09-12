module Base62 extend self
  def encode62(int)
    raise ArgumentError, 'Integer cant be negative' if int < 0
    return ALPHABET[int] if int.zero?
    encode62_rec('', int)
  end

  def decode62(str)
    raise ArgumentError, 'String cant be empty' if str.empty?
    decode62_rec(0, 0, str)
  end

  private

  def encode62_rec(acc, int)
    return acc if int.zero?
    encode62_rec(ALPHABET[int % BASE] + acc,
                 int / BASE)
  end

  def decode62_rec(acc, pow, str)
    return acc if str.empty?
    decode62_rec(acc + (BASE ** pow) * ALPHABET_INDEX[str[-1]],
                 pow.next,
                 str[0...-1])
  end

  ALPHABET = %w[
    0 1 2 3 4 5 6 7 8 9
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    a b c d e f g h i j k l m n o p q r s t u v w x y z
  ]

  BASE = ALPHABET.size

  ALPHABET_INDEX = Hash[ALPHABET.each_with_index.to_a]

  ALPHABET_INDEX.default_proc = proc do
    raise ArgumentError, 'Invalid base 62 string.'
  end
end

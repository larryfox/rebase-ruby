class Rebase
  attr_reader :alphabet, :base

  def initialize(alphabet)
    @alphabet =
      case alphabet
      when :binary then get_base(2)
      when :hex    then get_base(16)
      when Fixnum  then get_base(alphabet)
      when Array   then build_alphabet(alphabet)
      else         raise ArgumentError, 'Invalid input'
      end
    @base = @alphabet.size
  end

  def encode(int)
    raise ArgumentError, 'Integer cant be negative' if int < 0
    return alphabet[int] if int.zero?
    encode_rec('', int)
  end

  def decode(str)
    raise ArgumentError, 'String cant be empty' if str.empty?
    decode_rec(0, 0, str)
  end

  private

  def encode_rec(acc, int)
    return acc if int.zero?
    encode_rec(alphabet[int % base] + acc,
               int / base)
  end

  def decode_rec(acc, pow, str)
    return acc if str.empty?
    decode_rec(base ** pow * alphabet_index[str[-1]] + acc,
               pow.next,
               str[0...-1])
  end

  def alphabet_index
    @alphabet_index ||= begin
      Hash[alphabet.each_with_index.to_a].tap do |h|
        h.default_proc = proc do |_,k|
          raise ArgumentError, "Invalid character in input: #{k}"
        end
      end
    end
  end

  def build_alphabet(array)
    raise ArgumentError, "Alphabet to short" if array.size < 2
    array.map(&:to_s)
  end

  def get_base(int)
    raise ArgumentError, "Invalid base: #{int}" if int < 2 || int > 62
    self.class.const_get("B#{int}")
  end

  B62 = %w[
    0 1 2 3 4 5 6 7 8 9
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    a b c d e f g h i j k l m n o p q r s t u v w x y z
  ]

  (2...62).map { |i| const_set("B#{i}", B62[0...i]) }
end

def Rebase(alphabet, int=nil)
  base = Rebase.new(alphabet)
  int ? base.encode(int) : base
end

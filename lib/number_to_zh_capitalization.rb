class NumberToZhCapitalization
  VERSION = '0.0.1'.freeze
  ZH_NUMS = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'].freeze
  ZH_SPLIT_DELIMITER = ['', '万', '亿', '兆', '京'].freeze
  ZH_NUM_DELIMITER = ['仟', '佰', '拾', ''].freeze
  ZH_CENTS = ['角', '分'].freeze

  def initialize(number)
    @number = number.to_s.to_d.round(ZH_CENTS.length)
  end

  def output
    return get_zh_num(0) if @number == 0

    int, cent = split_int_and_cent(@number.abs)
    minus_word + int_words(int, ZH_NUM_DELIMITER.length) + cent_words(cent)
  end

  alias_method :to_s, :output

  private

  def split_int_and_cent(num)
    int = num.to_i
    values = [int.to_s]

    values << (carry_num(num) - carry_num(int)).to_s.rjust(ZH_CENTS.length, '0') if int != num
    values
  end

  def carry_num(num)
    (num * (10**ZH_CENTS.length)).to_i
  end

  def get_zh_num(char)
    ZH_NUMS[char.to_i]
  end

  def minus_word
    @number < 0 ? '负' : ''
  end

  def int_words(int, length)
    return '' if int == '0'
    raise 'your number length is too more' if int.length > (ZH_SPLIT_DELIMITER.length * length)

    slice_arr = int.split('').reverse.each_slice(length).map do |i|
      i.reverse.join.rjust(length, '0').sub(/0+$/, '')
    end

    slice_arr.map.with_index do |num_str, idx|
      words = ""
      words << get_num_delimiter_words(num_str) if num_str.length > 0
      if num_str.length > 0 || (num_str.length == 0 && idx.even? && slice_arr[idx + 1].to_s.length > 0)
        words << ZH_SPLIT_DELIMITER[idx]
      end
      words
    end.compact.reverse.join.gsub(/零+/, '零').sub(/^零/, '') + '元'
  end

  def get_num_delimiter_words(str_num)
    str_num.each_char.map.with_index do |char, idx|
      [get_zh_num(char), char != '0' ? ZH_NUM_DELIMITER[idx] : ''].join
    end.join
  end

  def cent_words(str_num)
    return '整' if str_num.to_i == 0
    str_num.each_char.map.with_index do |char, idx|
      [get_zh_num(char), ZH_CENTS[idx]].join if char != '0'
    end.compact.join
  end
end

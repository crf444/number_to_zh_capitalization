# number_to_zh_capitalization


# for use
# 调用
# support ruby2.0
require 'number_to_zh_capitalization'

NumberToZhCapitalization.new(0).output -> "零"

NumberToZhCapitalization.new(0.3).output -> "叁角"

NumberToZhCapitalization.new(0.99).output -> "玖角玖分"

NumberToZhCapitalization.new(2003).output -> "贰仟零叁元整"

NumberToZhCapitalization.new(2003.3).output -> "贰仟零叁元叁角"

NumberToZhCapitalization.new(2333.2333).output -> "贰仟叁佰叁拾叁元贰角叁分"

NumberToZhCapitalization.new(2333.03).output -> "贰仟叁佰叁拾叁元叁分"

NumberToZhCapitalization.new(2333.3).output -> "贰仟叁佰叁拾叁元叁角"

NumberToZhCapitalization.new(23302003).output -> "贰仟叁佰叁拾万贰仟零叁元整"

NumberToZhCapitalization.new(20000000).output -> "贰仟万元整"

NumberToZhCapitalization.new(20010010).output -> "贰仟零壹万零壹拾元整"

NumberToZhCapitalization.new(233300000000).to_s -> "贰仟叁佰叁拾叁万亿元整"

NumberToZhCapitalization.new(233300000000).output -> "贰仟叁佰叁拾叁万亿元整"

NumberToZhCapitalization.new(2333_0000_0000_0000_0000).output -> "贰仟叁佰叁拾叁亿亿元整"

NumberToZhCapitalization.new(2333_0001_0000_0000_0000).to_s -> "贰仟叁佰叁拾叁亿亿零壹万亿元整"

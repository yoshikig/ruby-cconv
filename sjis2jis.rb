require 'convbase'

# cf. http://www.unixuser.org/~euske/doc/kanjicode/index.html

class Sjis2jis
	def conv(instr)
		ary = instr.bytes.to_a
		outstr = ""
		i = 0
		kanji = false
		while i < ary.length
			c = ary[i]
			cc = ary[i+1]

			if kanji
				# kanji
				if (0x81 <= c && c <= 0x9f) || (0xe0 <= c && c <= 0xff)
					if 0x9f <= cc && cc <= 0xfc
						b = 1
						cc -= 0x7e
					elsif 0x80 <= cc && cc <= 0x9e
						b = 0
						cc -= 0x20
					elsif 0x40 <= cc && cc <= 0x7e
						b = 0
						cc -= 0x1f
					else
						raise InvalidInputstringException
					end
					
					if 0xe0 <= c
						c -= 0xc1
					else
						c -= 0x81
					end
					c <<= 1
					c += b
					c += 0x21
					outstr += c.chr
					outstr += cc.chr

					i += 2
				else
					outstr += 0x1B.chr
					outstr += 0x28.chr
					outstr += 0x42.chr
					kanji = false
					next
				end
			else
				# kanji
				if (0x81 <= c && c <= 0x9f) || (0xe0 <= c && c <= 0xff)
					outstr += 0x1B.chr
					outstr += 0x24.chr
					outstr += 0x42.chr
					kanji = true
					next
				else
					outstr += c.chr
					i += 1
				end
			end
		end
		return outstr
	end
end


conv = Sjis2jis.new
puts conv.conv("hoge")






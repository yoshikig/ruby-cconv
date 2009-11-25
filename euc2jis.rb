
class Euc2jis
	def conv(instr)
		ary = instr.bytes.to_a
		outstr = ""
		i = 0
		kanji = false
		while i < ary.length
			c = ary[i]

			if kanji
				if c >= 128
					outstr += (c-128).chr
				else
					outstr += 0x1B.chr
					outstr += 0x28.chr
					outstr += 0x42.chr
					kanji = false
					next
				end
			else
				if c >= 128
					outstr += 0x1B.chr
					outstr += 0x24.chr
					outstr += 0x42.chr
					kanji = true
					next
				else
					outstr += c.chr
				end
			end
			i += 1
		end
		return outstr
	end
end


#conv = Jis2euc.new
#puts conv.conv("hoge")








# cf. http://www.unixuser.org/~euske/doc/kanjicode/index.html

class Jis2sjis
        def conv(instr)
                ary = instr.bytes.to_a
                outstr = ""
                i = 0
                kanji = false
                while i < ary.length
			c = ary[i]
			cc = ary[i+1]
                        if c == 0x1B
                                if ary[i+1] == 0x24 && ary[i+2] == 0x42
                                        kanji = true
                                elsif ary[i+1] == 0x28 && ary[i+2] == 0x42
                                        kanji = false
                                end
                                i += 3
                                next
                        end

                        if kanji
				c -= 0x21
				b = c & 0x1
				c >>= 1
				if c <= 0x1E
					outstr += (c+0x81).chr
				else
					outstr += (c+0xc1).chr
				end
				if b == 0
					cc += 0x1f
					if cc <= 0x7e
						outstr += cc.chr
					else
						outstr += (cc+0x1).chr
					end
				else
					cc += 0x7e
					outstr += cc.chr
				end
				i += 2
                        else
                                outstr += ary[i].chr
				i += 1
                        end
                end
                return outstr
        end
end


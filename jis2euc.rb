
class Jis2euc
        def conv(instr)
                ary = instr.bytes.to_a
                outstr = ""
                i = 0
                kanji = false
                while i < ary.length
                        if ary[i] == 0x1B
                                if ary[i+1] == 0x24 && ary[i+2] == 0x42
                                        kanji = true
                                elsif ary[i+1] == 0x28 && ary[i+2] == 0x42
                                        kanji = false
                                end
                                i += 3
                                next
                        end

                        if kanji
                                outstr += (ary[i]+128).chr
                        else
                                outstr += ary[i].chr
                        end
                        i += 1
                end
                return outstr
        end
end


require 'test/unit'
require 'pp'
require 'jis2euc'
require 'jis2sjis'
require 'euc2jis'
require 'euc2sjis'
require 'sjis2jis'
require 'sjis2euc'

$jis = (<<'eofeof').unpack('u')[0]
M1FER<W0@4W1A9V4@&R1"(3DQ(3%^2R%+?D]3&RA"(%-E8V]N9"!3=&%G92`;
M)$)0)TU:&RA"($AI<F%G86YA(!LD0B0B)"0D)B0H)"HD;R1R)',;*$(*2V%T
M86MA;F$@&R1")2(E)"4F)2@E*B5O)7(E<QLH0B!+:6=O=2`;)$(A)B%G(S`C
/029!)E@G(B=!*$`;*$(*
eofeof

$sjis = (<<'eofeof').unpack('u')[0]
M1FER<W0@4W1A9V4@@5B)0(F>ED"6GIAR(%-E8V]N9"!3=&%G92"8I9=Y($AI
M<F%G86YA((*@@J*"I(*F@JB"[8+P@O$*2V%T86MA;F$@@T&#0X-%@T>#28./
>@Y*#DR!+:6=O=2"!18&'@D^"8(._@]:$081@A+X*
eofeof

$euc = (<<'eofeof').unpack('u')[0]
M1FER<W0@4W1A9V4@H;FQH;'^RZ'+_L_3(%-E8V]N9"!3=&%G92#0I\W:($AI
M<F%G86YA(*2BI*2DIJ2HI*JD[Z3RI/,*2V%T86MA;F$@I:*EI*6FI:BEJJ7O
>I?*E\R!+:6=O=2"AIJ'GH["CP:;!IMBGHJ?!J,`*
eofeof

class TC_Conv < Test::Unit::TestCase
	def setup
	end

	def teardown
	end

	def test_euc2jis
		obj = Euc2jis.new
		assert_equal($jis, obj.conv($euc))
	end

	def test_euc2sjis
		obj = Euc2sjis.new
		assert_equal($sjis, obj.conv($euc))
	end

	def test_jis2euc
		obj = Jis2euc.new
		assert_equal($euc, obj.conv($jis))
	end

	def test_jis2sjis
		obj = Jis2sjis.new
		assert_equal($sjis, obj.conv($jis))
	end

	def test_sjis2jis
		obj = Sjis2jis.new
		assert_equal($jis, obj.conv($sjis))
	end

	def test_sjis2euc
		obj = Sjis2euc.new
		assert_equal($euc, obj.conv($sjis))
	end
end


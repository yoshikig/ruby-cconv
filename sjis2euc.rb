require 'jis2euc'
require 'sjis2jis'

class Sjis2euc
	def initialize
		@jis2euc = Jis2euc.new
		@sjis2jis = Sjis2jis.new
	end

	def conv(instr)
		jis = @sjis2jis.conv(instr)
		euc = @jis2euc.conv(jis)
		return euc
	end
end


require 'euc2jis'
require 'jis2sjis'

class Euc2sjis
	def initialize
		@euc2jis = Euc2jis.new
		@jis2sjis = Jis2sjis.new
	end

	def conv(instr)
		jis = @euc2jis.conv(instr)
		sjis = @jis2sjis.conv(jis)
		return sjis
	end
end


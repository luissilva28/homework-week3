class Bowling
	def score(moves)
		score = strikes_score(moves)
		score += spares_score(moves)
		moves = clean_moves_from(moves, [/X/, /Y/, /-/]) #Consider (X) a Strike; Consider (Y) a Spare; Consider (-) a fail 
		score += count_hits(moves) unless moves.empty?
		return score
	end

	def spares_score(moves)
		moves.count('Y') * 15
	end

	def strikes_score(moves)
		moves.count('X') * 30
	end

	private

	def count_hits(moves)
		moves.chars.collect(&:to_i).inject(&:+)
	end

	def clean_moves_from(moves, to_remove)
		to_remove.each { |pattern| moves.gsub!(pattern, '') }
		moves
	end
end
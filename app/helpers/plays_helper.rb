module PlaysHelper
	def word_with_score(play)
		"#{play.word.downcase} - #{play.score}"
	end
end

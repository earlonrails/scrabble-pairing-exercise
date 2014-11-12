class Play < ActiveRecord::Base
	validates :word,
		presence: true,
		uniqueness: true,
		length: { maximum: 7 },
		format: { with: /\A[A-Za-z]*\z/ }

	def self.recent
		limit(3).order(created_at: :desc)
	end

  def score(options = {})
  	multiplier = case options[:word_multiplier]
	  	when :double then 2
	  	when :triple then 3
	  	else 1
  	end

  	word.upcase.chars.reduce(0) do |sum, char|
  		sum += LETTER_SCORES[char]
  	end * multiplier
  end

  LETTER_SCORES = {
  	"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
    "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
    "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10
  }
end

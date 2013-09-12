# Part 2: Strings

def palindrome?(string)
	str = string.downcase
	str = string.gsub(/[\W]/, "")
	if str == str.reverse
		return true
	end
	return false
end

def count_words(string)
	str = string.downcase
	str = str.gsub(/[^\w, ^\s]/, "")
	a = Array.new
	a = str.split(/[\s,]+/)
	puts a
	h = Hash.new
	a.each{|x|
		i = 0
		a.each{|y|
			if x == y
				i+=1
			end
		}
		h[x] = i
	}
	return h
end

# Part 3: Rock Paper Scissors
class WrongNumberOfPlayersError < StandardError
end
class NoSuchStrategyError < StandardError
end


def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	game.each{|name, strategy|
		if strategy != "R" and strategy != "P" and strategy != "S"
			raise NoSuchStrategyError
		end
	}

	p1Name = game[0][0]
	p1Strat = game[0][1]
	p2Name = game[1][0]
	p2Strat = game[1][1]
	
	if p1Strat == "R" and p2Strat == "S"
		return game[0]
	elsif p1Strat == "P" and p2Strat == "R"
		return game[0]
	elsif p1Strat == "S" and p2Strat == "P"
		return game[0]
	elsif p1Strat == p2Strat
		return game[0]
	else
		return game[1]
	end

end

def rps_tournament_winner(games)
	if games[0][0].instance_of? String
		return(rps_game_winner([games[0],games[1]]))
	else
		return rps_tournament_winner([rps_tournament_winner(games[0]),rps_tournament_winner(games[1])])
	end
end

bracket = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

print rps_tournament_winner(bracket)
puts

# Part 4: Anagrams

def sortChar(string)
	str = string.downcase
	str = str.chars.sort.join
	return str
end

def combine_anagrams(words)
	a = Array.new
	words.each{|x|
		b = Array.new
		str1 = sortChar(x)
			words.each{|y|
				str2 = sortChar(y)
				if str1 == str2 
					b.push(y)
				end
			}
		a.push(b)
	}
	return a&a
end

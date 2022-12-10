
shape_scores = {
	['rock'] = 1,
	['paper'] = 2,
	['scissors'] = 3,
}

outcome_scores = {
	['win'] = 6,
	['lose'] = 0,
	['draw'] = 3,
}

shapes = {
	['A'] = 'rock',
	['B'] = 'paper',
	['C'] = 'scissors',
	['X'] = 'rock',
	['Y'] = 'paper',
	['Z'] = 'scissors'
}

p2_outcomes = {
	['X'] = 'lose',
	['Y'] = 'draw',
	['Z'] = 'win'
}

function calculate_score_p1(shapecode1, shapecode2)
	shape1 = shapes[shapecode1]
	shape2 = shapes[shapecode2]

	score = shape_scores[shape2]
	
	if shape1 == shape2 then
		score = score + outcome_scores.draw
	elseif 
		(shape2 == 'rock' and shape1 == 'scissors')
		or  
		(shape2 == 'paper' and shape1 == 'rock')
		or  
		(shape2 == 'scissors' and shape1 == 'paper') then
		score = score + outcome_scores.win
	else
		score = score + outcome_scores.lose
	end
	return score
end

function calculate_score_p2(shapecode1,outcomecode)
	score = 0
	shape1 = shapes[shapecode1]
	shape2 = ''
	outcome = p2_outcomes[outcomecode]
	if outcome == 'draw' then
		shape2 = shape1
	elseif outcome == 'win' then
		if shape1 == 'rock' then shape2 = 'paper' end
		if shape1 == 'paper' then shape2 = 'scissors' end
		if shape1 == 'scissors' then shape2 = 'rock' end
	else
		if shape1 == 'rock' then shape2 = 'scissors' end
		if shape1 == 'paper' then shape2 = 'rock' end
		if shape1 == 'scissors' then shape2 = 'paper' end
	end
	score = score + outcome_scores[outcome] + shape_scores[shape2]
	return score
end

total_p1 = 0
total_p2 = 0

for line in io.lines('day2.txt') do
	for opponent,response in string.gmatch(line,'([%w])%s(%w)') do
		total_p1 = total_p1 + calculate_score_p1(opponent,response)
		total_p2 = total_p2 + calculate_score_p2(opponent,response)
	end
end

-- day 2 part 1 
print(total_p1)

-- day 2 part 1 
print(total_p2)
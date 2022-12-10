require('util')

function get_priority(letter)
	code = string.byte(letter)
	offset = 96
	if code > 64 and code < 97 then
		offset = 38
	end
	return code - offset
end

function calc_priority(line)
	l = #line
	for i = 1,l/2 do
		for j = l/2+1,l do
			char1 = string.sub(line,i,i)
			char2 = string.sub(line,j,j)
			if char1 == char2 then
				return get_priority(char1)
			end
		end
	end
end


total = 0
for line in io.lines('day3.txt') do
	total = total + calc_priority(line)
end

-- day 3 part 1
print(total)

function compare(s1,s2)
	common = ''
	for i = 1,#s1 do
		for j = 1,#s2 do
			l1 = string.sub(s1,i,i)
			l2 = string.sub(s2,j,j)
			if l1 == l2 then
				common = common .. l1
			end	
		end
	end
	return common
end


total = 0
group = {}
count = 0
for line in io.lines('day3.txt') do
	count = count + 1
	group[count] = line
	if count == 3 then
		total = total + get_priority(compare(compare(group[1],group[2]),compare(group[2],group[3])):sub(1,1))
		count = 0
		group = {}
	end 
end

print(total)
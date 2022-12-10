sums = {}
sum = 0
for line in io.lines('day1.txt') do
	if line ~= '' then
		sum = sum + tonumber(line)
	else
		table.insert(sums,sum)
		sum = 0
	end
end
print(sum)
table.insert(sums,sum)	
table.sort(sums)

-- day 1 part 1
print(sums[#sums])

topThree = 0
for i = 0,2 do
	topThree = topThree + sums[#sums-i]
end

-- day 1 part 2
print(topThree)
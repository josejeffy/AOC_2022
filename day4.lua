counta = 0
countb = 0
for line in io.lines('day4.txt') do
	for n1,m1,n2,m2 in string.gmatch(line,'(%d+)-(%d+),(%d+)-(%d+)') do
		if (n2-n1) * (m2-m1) <= 0 then
			counta = counta + 1
		end
		if (m2-n1) * (n2-m1) < 0 then
			countb = countb + 1
		end
	end
end

print(counta)
print(countb)
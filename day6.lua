function is_uniq(s)
	for i = 1,#s do
		for j = i+1,#s do
			if s:sub(i,i) == s:sub(j,j) then
				return false
			end
		end
	end
	return true
end

for line in io.lines('day6.txt') do
	for i = 1,#line-4 do
		segment = line:sub(i,i+3)
		if is_uniq(segment) then
			print("start-of-packet " .. i+3)
			break
		end
	end
	for i = 1,#line-14 do
		segment = line:sub(i,i+13)
		if is_uniq(segment) then
			print("start-of-packet " .. i+13)
			break
		end
	end
end
data = {}
function xy(x,y)
	return data[x]:sub(y,y)
end

for line in io.lines('day8.txt') do
	table.insert(data,line)
end

distances = {}
n = #data
count = 0
for i = 2,n-1 do
	for j = 2,n-1 do
		visible = {true,true,true,true}
		distance = {0,0,0,0}
		h = xy(i,j)
		for z = i-1,1,-1 do
			if visible[1] then distance[1] = distance[1] + 1 end
			if h<=xy(z,j) then 
				visible[1] = false 
			end
		end
		for z = i+1,n do
			if visible[2] then distance[2] = distance[2] + 1 end
			if h<=xy(z,j) then 
				visible[2] = false 
			end
		end
		for z = j-1,1,-1 do
			if visible[3] then distance[3] = distance[3] + 1 end
			if h<=xy(i,z) then 
				visible[3] = false 
			end
		end
		for z = j+1,n do
			if visible[4] then distance[4] = distance[4] + 1 end
			if h<=xy(i,z) then 
				visible[4] = false 
			end
		end
		if 	visible[1] == true or 
			visible[2] == true or 
			visible[3] == true or 
			visible[4] == true then 
			count = count + 1
		end
		table.insert(distances,distance[1]*distance[2]*distance[3]*distance[4])
	end
end

print(2*(n+n-2) + count)

table.sort( distances )
print(distances[#distances])
visited = {}
visitedchain = {}
Point = {}
function Point.new()
	position = {}
	position.x = 1
	position.y = 1
	return position
end
function Point.move(p,x,y)
	p.x = p.x + x
	p.y = p.y + y
	return p
end

function sign(x)
	return x/math.abs(x)
end

function Point.follow(h,t)
	if h.x == t.x and math.abs(h.y-t.y)>1 then
		t.y = t.y + 1 * sign(h.y-t.y) 
	elseif h.y == t.y and math.abs(h.x-t.x)>1 then
		t.x = t.x + 1 * sign(h.x-t.x)
	elseif math.abs(h.x-t.x)>1 or math.abs(h.y-t.y)>1 then
		t.y = t.y + 1 * sign(h.y-t.y) 
		t.x = t.x + 1 * sign(h.x-t.x)
	end
	return t
end

head = Point.new()
tail = Point.new()
tailchain = {
	Point.new(),Point.new(),Point.new(),
	Point.new(),Point.new(),Point.new(),
	Point.new(),Point.new(),Point.new()
}

for line in io.lines('day9.txt') do
	direction, distance = line:gmatch('(%S)%s(%d+)')()
	for _ = 1,distance do
		if direction == 'R' then
			Point.move(head,1,0)
		elseif direction == 'L' then
			Point.move(head,-1,0)
		elseif direction == 'U' then
			Point.move(head,0,1)
		elseif direction == 'D' then
			Point.move(head,0,-1)
		end
		tail = Point.follow(head,tail)
		for i = 1,9 do
			if i == 1 then
				tailchain[i] = Point.follow(head,tailchain[i])
			else
				tailchain[i] = Point.follow(tailchain[i-1],tailchain[i])
			end
		end
		visitedchain[tailchain[9].x .. '|' .. tailchain[9].y] = 1
		visited[tail.x .. '|' .. tail.y] = 1
	end
end

len = 0
for k,_ in pairs(visited) do
	len = len + 1
end
print(len)


len = 0
for k,_ in pairs(visitedchain) do
	len = len + 1
end
print(len)
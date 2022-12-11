require('util')

cycles = 0
value = 1
strength = 0
spriteposition = {}
crt = {}

for i = 0,6*40-1 do
	crt[i] = " "
end
crt[0] = "#"

function resetsprite()
	for i = 0,39 do
		spriteposition[i] = "."
	end
end

spriteposition[0],spriteposition[1],spriteposition[2] = "#","#","#"

function printsprite()
	sprite = ""
	for index,i in pairs(crt) do
		sprite = sprite .. i
		if index%40 == 0 then
			print(sprite)
			sprite = ""
		end
	end
end

function update(n)
	for i = 1,n do
		resetsprite()
		spriteposition[value-1],spriteposition[value],spriteposition[value+1]="#","#","#"
		if spriteposition[cycles%40] == "#" then 
			crt[cycles+1] = "#"
		end
		cycles = cycles + 1
		for _,cutoff in pairs({20,60,100,140,180,220}) do
			if cycles == cutoff then
				strength = strength + cycles * value
			end
		end
	end
end

for line in io.lines('day10.txt') do
	command,offset = line:gmatch('(%S+)%s(%-?%d+)')()
	if command == 'addx' then
		update(2)
		value = value + tonumber(offset)
		
	else
		update(1)
	end
end

print(strength)
printsprite(crt)
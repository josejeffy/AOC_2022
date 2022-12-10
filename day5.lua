require 'util'

stackCount = 9
stack = {}



function move(num,source,destination,mode)
	temp = ''
	for i = 1,num do
		if mode == 'multiple' then
			temp =  util.last_char(stack[source]) .. temp
		else
			stack[destination] = stack[destination] .. util.last_char(stack[source])
		end
		stack[source] = util.drop_last(stack[source])
	end
	stack[destination] = stack[destination] .. temp
end


datatype = 'stack'
for line in io.lines('day5.txt') do
	if line == '' then
		datatype = 'moves'
	else
		if datatype == 'stack' then
			for i = 0,stackCount-1 do
				n = 2+i*4
				c = line:sub(n,n)
				if tonumber(c) == nil then
					if c ~= ' ' then 
						key = tostring(i+1)
						current = stack[key]
						if current == nil then current = '' end 
						stack[key] = c .. current
					end
				end
			end
		else
			for n,s,d in string.gmatch(line,'move (%d+) from (%d+) to (%d+)') do
				move(n,tostring(s),tostring(d),'multiple')
			end	
		end
	end
end



top = ''
for i = 1,stackCount do
	top = top .. util.last_char(stack[tostring(i)])
end


print(top)
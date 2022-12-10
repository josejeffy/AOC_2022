require 'util'
fs = {}
dirs = {}
level = {}
max = 70000000
min = 30000000
current = 0

function join(t,n)
  if n == nil then n = #t end
  joined = ''
  for i,v in pairs(t) do
    if i<=n then
      joined = joined .. v
    end
  end
  return joined
end


for line in io.lines('day7.txt') do
  if line:sub(3,4) == 'cd' then
    dir = line:sub(6,#line)
    
    if dir ~= '..' then
      table.insert(level,dir)
    else
      table.remove(level)
    end
  else
    for i = 1,#level do
      key = join(level,i)
      if fs[key] == nil then fs[key] = 0 end

      sz = line:gmatch('(%d+)')()
      if sz ~= nil then
        fs[key] = fs[key] + sz
      end
    end
  end
end

total = 0
for k,v in pairs(fs) do
  if v < 100000 then 
    total = total + v 
  end
  if v > current then current = v end
end

tofree = 10e10
for k,v in pairs(fs) do
  if max - current + v > min then
    if v < tofree then tofree = v end
  end
end
print(tofree)
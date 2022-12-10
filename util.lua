util = {}

util.print = function (t)
	if type(t) == 'table' then
		for k,v in pairs(t) do
			-- print(k)
			print(k .. "=>" .. util.print(v))
		end
	else
		return t
	end
end

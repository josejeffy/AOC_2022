util = {}

function util.print(t)
	if type(t) == 'table' then
		for k,v in pairs(t) do
			-- print(k)
			print(k .. "=>" .. util.print(v))
		end
	else
		return t
	end
end

function util.nth_char(s,n)
	return string.sub(s,n,n)
end

function util.last_char(s,n)
	return util.nth_char(s,#s)
end

function util.drop_last(s)
	return string.sub(s,1,#s-1)
end
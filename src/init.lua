local Package = script

local Discord = { }

function Discord.Get(Class)
	local FromPackage = Package:FindFirstChild(Class)
	if FromPackage then
		return require(FromPackage)
	end
end

return setmetatable(Discord, {
	__index = function(self, Index)
		return Discord.Get(Index)
	end;
	
	__call = function(self, ...)
		return Discord.Get(...)
	end;
})

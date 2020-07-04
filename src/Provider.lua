local Package = script.Parent

local Formatter = require(Package.Formatter)

local Provider = { }

Provider.DataTypes = {"Name", "Url"}

function Provider:__index(Index)
	if string.sub(Index, 1, 3) == "Set" then
		local Property = string.sub(Index, 4)
		return function(self, Value)
			self[Property] = Value
			return self
		end
	else
		return self[Index]
	end
end


function Provider:GetRaw()
	return Formatter.Format(Provider)
end


function Provider.new()
	local CreatedProvider = setmetatable({ }, Provider)
	return CreatedProvider
end


return Provider

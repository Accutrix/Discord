local Package = script.Parent

local Formatter = require(Package.Formatter)

local Author = { }

Author.DataTypes = {"Name", "Url", "IconUrl", "ProxyIconUrl"}

function Author:__index(Index)
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


function Author:GetRaw()
	return Formatter.Format(Author)
end


function Author.new()
	local CreatedAuthor = setmetatable({ }, Author)
	return CreatedAuthor
end


return Author

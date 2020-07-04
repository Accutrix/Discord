local Package = script.Parent

local Formatter = require(Package.Formatter)

local Thumbnail = { }

Thumbnail.DataTypes = {"IconUrl", "ProxyIconUrl", "Height", "Width"}

function Thumbnail:__index(Index)
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


function Thumbnail:GetRaw()
	return Formatter.Format(Thumbnail)
end


function Thumbnail.new()
	local CreatedThumbnail = setmetatable({ }, Thumbnail)
	return CreatedThumbnail
end


return Thumbnail

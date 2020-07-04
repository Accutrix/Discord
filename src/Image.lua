local Package = script.Parent

local Formatter = require(Package.Formatter)

local Image = { }

Image.DataTypes = {"IconUrl", "ProxyIconUrl", "Height", "Width"}

function Image:__index(Index)
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


function Image:GetRaw()
	return Formatter.Format(Image)
end


function Image.new()
	local CreatedImage = setmetatable({ }, Image)
	return CreatedImage
end


return Image

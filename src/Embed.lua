local Package = script.Parent

local Formatter = require(Package.Formatter)

local Embed = { }

Embed.DataTypes = {"Title", "Type", "Description", "Url", "Timestamp", "Color", "Footer", "Image", "Thumbnail", "Video", "Provider", "Author", "Fields"}

function Embed:__index(Index)
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


function Embed:GetRaw()
	return Formatter.Format(Embed)
end


function Embed.new(EmbedData)
	local CreatedEmbed = setmetatable({ }, Embed)
	CreatedEmbed.Type = "rich"
	for Name, Element in pairs(EmbedData or { }) do
		CreatedEmbed[Name] = Element
	end
	return CreatedEmbed
end


return Embed

local Package = script.Parent

local Formatter = require(Package.Formatter)

local Footer = { }

Footer.DataTypes = {"Text", "IconUrl", "ProxyIconUrl"}

function Footer:__index(Index)
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


function Footer:GetRaw()
	return Formatter.Format(Footer)
end


function Footer.new()
	local CreatedFooter = setmetatable({ }, Footer)
	return CreatedFooter
end


return Footer

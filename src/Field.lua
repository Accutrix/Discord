local Package = script.Parent

local Formatter = require(Package.Formatter)

local Field = { }

Field.DataTypes = {"Name", "Value", "InLine"}

function Field:__index(Index)
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


function Field:GetRaw()
	return Formatter.Format(Field)
end


function Field.new()
	local CreatedField = setmetatable({ }, Field)
	return CreatedField
end


return Field

CustomColor3 = setmetatable({
	toHex = function(color3)
		local result = "#"
		
		for _, element in pairs({color3.r, color3.g, color3.b}) do
			local hex = ""
			element = element * 255
			
			while element > 0 do
				local index = math.fmod(element, 16) + 1
				element = math.floor(element / 16)
				hex = string.sub("0123456789abcdef", index, index) .. hex			
			end
	
			if string.len(hex) == 0 then
				hex = "00"
			elseif string.len(hex) == 1 then
				hex = "0" .. hex
			end
	
			result = result .. hex
		end
		return result
	end;
	
	toHexInt = function(color3)
		local hex = CustomColor3.toHex(color3)
		local hexInt = string.gsub(hex, "#", "0x")
		return tonumber(hexInt)
	end;

	fromHex = function(hex)
		hex = hex:gsub("#","")
	    return Color3.fromRGB(
			tonumber("0x" .. string.sub(hex, 1, 2)),
			tonumber("0x" .. string.sub(hex, 3, 4)),
			tonumber("0x" .. string.sub(hex, 5, 6))
		)
	end;
	
	toRGB = function(color3)
		return{
			r = math.clamp(math.ceil(color3.R * 255), 0, 255);
			g = math.clamp(math.ceil(color3.G * 255), 0, 255);
			b = math.clamp(math.ceil(color3.B * 255), 0, 255);
		}
	end;
}, {__index = Color3})

return CustomColor3

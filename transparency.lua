-- Script to handle transparency through scrolling using transset-df

function inc_opacity()
	change_opacity("transset-df --inc -p .03")
end

function dec_opacity()
	change_opacity("transset-df --dec -p .03")
end

function change_opacity(command)
	local handle = io.popen(command)
	local result = handle:read("*a")
	handle:close()

	local opacity = string.gsub(result, "Set Property to ", "")
	opacity = tonumber(opacity)
	opacity = opacity * 100

	mp.osd_message("Opacity: " .. opacity .. "%")
end

mp.add_key_binding("MOUSE_BTN3", "inc_opacity", function() inc_opacity() end)
mp.add_key_binding("MOUSE_BTN4", "dec_opacity", function() dec_opacity() end)

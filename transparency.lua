-- Script to handle transparency through scrolling using transset-df

function inc_opacity()
	local handle = io.popen("transset-df --inc -p .03")
	local result = handle:read("*a")
	handle:close()

	local opacity = string.gsub(result, "Set Property to ", "")
	opacity = tonumber(opacity)
	opacity = opacity * 100

	mp.osd_message("Opacity: " .. opacity .. "%")
end

function dec_opacity()
	local handle = io.popen("transset-df --dec -p .03")
	local result = handle:read("*a")
	handle:close()

	local opacity = string.gsub(result, "Set Property to ", "")
	opacity = tonumber(opacity)
	opacity = opacity * 100

	mp.osd_message("Opacity: ".. opacity .. "%")
end

function toggle_opacity()
	os.execute("transset-df -t -p")
	mp.osd_message("Toggled Opacity")
end

mp.add_key_binding("MOUSE_BTN3", "inc_opacity", function() inc_opacity() end)
mp.add_key_binding("MOUSE_BTN4", "dec_opacity", function() dec_opacity() end)
mp.add_key_binding("MOUSE_BTN1", "toggle_opacity", function() toggle_opacity() end)

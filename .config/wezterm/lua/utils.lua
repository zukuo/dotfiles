local wezterm = require("wezterm")

local module = {}

module.is_linux = function()
    return wezterm.target_triple:find("linux") ~= nil
end

module.is_mac = function()
    return wezterm.target_triple:find("darwin") ~= nil
end

return module

-- Setup ssh hosts for wezterm integrated connection
-- Source: wez's docs (modified)
-- Author: Zukuo
local wezterm = require 'wezterm'

local module = {}

function module.setup(config)
    local ssh_domains = {}
    for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
      table.insert(ssh_domains, {
        name = host,
        remote_address = host,
        multiplexing = "None",
        assume_shell = 'Posix',
      })
    end
    config.ssh_domains = ssh_domains
end

return module

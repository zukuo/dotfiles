-- Config for colorizing tab bar
-- Source: wez's docs (modified)
-- Author: Zukuo
local module = {}

function module.custom_tabs(config)
  -- Custom Tab Colors
  config.colors = {
    tab_bar = {
      background = '#0b0022',
      active_tab = {
        bg_color = '#2b2042',
        fg_color = '#c0c0c0',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',
      },
      inactive_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
      },
      new_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',
      },
      new_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
      },
    },
  }
end

return module

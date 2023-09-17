-- Config for colorizing tab bar
-- Source: wez's docs, github discussion page #628 (modified)
-- Author: Zukuo
local wezterm = require 'wezterm'

local module = {}

local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- TODO: Change colors at some point to tokyo-night tmux colors
local TAB_BAR_BG = '#0b0022'

local ACTIVE_TAB_BG = '#2b2042'
local ACTIVE_TAB_FG = '#c0c0c0'

local INACTIVE_TAB_BG = '#1b1032'
local INACTIVE_TAB_FG = '#808080'

local HOVER_TAB_BG = '#3b3052'
local HOVER_TAB_FG = '#909090'

local NEW_TAB_BG = '#1b1032'
local NEW_TAB_FG = '#808080'

function module.setup(config)
  -- Custom Tab Colors
  config.colors = {
    tab_bar = {
      background = TAB_BAR_BG,
      active_tab = {
        bg_color = ACTIVE_TAB_BG,
        fg_color = ACTIVE_TAB_FG,
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = INACTIVE_TAB_BG,
        fg_color = INACTIVE_TAB_FG,
      },
      inactive_tab_hover = {
        bg_color = HOVER_TAB_BG,
        fg_color = HOVER_TAB_FG,
        italic = true,
      },
      new_tab = {
        bg_color = NEW_TAB_BG,
        fg_color = NEW_TAB_FG,
      },
      new_tab_hover = {
        bg_color = HOVER_TAB_BG,
        fg_color = HOVER_TAB_FG,
        italic = true,
      },
    },
  }

  -- Custom New Plus Button
  config.tab_bar_style = {
    new_tab = wezterm.format {
      { Background = { Color = INACTIVE_TAB_BG } },
      { Foreground = { Color = TAB_BAR_BG } },
      { Text = SOLID_RIGHT_ARROW },
      { Background = { Color = INACTIVE_TAB_BG } },
      { Foreground = { Color = INACTIVE_TAB_FG } },
      { Text = " + " },
      { Background = { Color = TAB_BAR_BG } },
      { Foreground = { Color = INACTIVE_TAB_BG } },
      { Text = SOLID_RIGHT_ARROW },
    },
    new_tab_hover = wezterm.format{
      { Attribute = { Italic = false } },
      { Background = { Color = HOVER_TAB_BG } },
      { Foreground = { Color = TAB_BAR_BG } },
      { Text = SOLID_RIGHT_ARROW },
      { Background = { Color = HOVER_TAB_BG } },
      { Foreground = { Color = HOVER_TAB_FG } },
      { Text = " + " },
      { Background = { Color = TAB_BAR_BG } },
      { Foreground = { Color = HOVER_TAB_BG } },
      { Text = SOLID_RIGHT_ARROW },
    },
  }
end

-- Custom Powerline Tabs
function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local background = NEW_TAB_BG
  local foreground = NEW_TAB_FG

  local is_first = tab.tab_id == tabs[1].tab_id
  local is_last = tab.tab_id == tabs[#tabs].tab_id

  if tab.is_active then
    background = ACTIVE_TAB_BG
    foreground = ACTIVE_TAB_FG
  elseif hover then
    background = HOVER_TAB_BG
    foreground = HOVER_TAB_FG
  end

  local leading_bg = background
  local leading_fg = NEW_TAB_FG

  local trailing_bg = NEW_TAB_BG
  local trailing_fg = background

  if is_first then
    leading_fg = TAB_BAR_BG
  else
    leading_fg = NEW_TAB_BG
  end

  if is_last then
    trailing_bg = TAB_BAR_BG
  else
    trailing_bg = NEW_TAB_BG
  end

  function check_start_arrow()
    if not is_first then
      return SOLID_RIGHT_ARROW
    else
      return " "
    end
  end

  local title = tab_title(tab)

  title = wezterm.truncate_right(title, max_width - 2)

  -- TODO: Make the tab bar background as gaps
  --       between each powerline tab
  return {
    { Background = { Color = leading_bg } },
    { Foreground = { Color = leading_fg } },
    { Text = check_start_arrow() },

    { Attribute = { Intensity = "Half" } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = string.format(" %s", tab.tab_index + 1) },
    { Attribute = { Intensity = "Normal" } },

    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = " " .. title .. " " },

    { Background = { Color = trailing_bg } },
    { Foreground = { Color = trailing_fg } },
    { Text = SOLID_RIGHT_ARROW },
  }
end
)

return module

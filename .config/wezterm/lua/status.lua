-- Config for setting up right status line on tab bar
-- Source: wez's docs (modified)
-- Author: Zukuo
local wezterm = require('wezterm')

wezterm.on('update-right-status', function(window, pane)
  local cells = {}

  -- Hostname Cell
  local hostname = wezterm.hostname()

  -- Remove dots in hostname
  local dot = hostname:find '[.]'
  if dot then
    hostname = hostname:sub(1, dot - 1)
  end

  table.insert(cells, hostname)

  -- Date Cell
  local date = wezterm.strftime '%d-%m-%y'
  table.insert(cells, date)

  -- Time Cell
  local time = wezterm.strftime '%l:%M %p'
  table.insert(cells, time)

  -- Battery Cell
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format('BAT: %.0f%%', b.state_of_charge * 100))
  end

  -- Filled Left Powerline Arrow
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Color palette for the backgrounds of each cell
  local colors = {
    '#1b1032',
    '#2b2042',
    '#3b3052',
    '#4B3D68',
  }

  -- Foreground color for the text across the fade
  local text_fg = '#c0c0c0'

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Arrow for last cell
  table.insert(elements, { Foreground = { Color = colors[1] } })
  table.insert(elements, { Text = SOLID_LEFT_ARROW })

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements))
end)

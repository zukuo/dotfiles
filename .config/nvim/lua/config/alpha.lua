local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "⠀⠐⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢂⠆",
    "⠠⢵⡀⡑⠢⡀⡔⣄⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⡠⢢⢀⠔⢈⢀⡮⡄",
    "⠈⢂⠈⡪⢦⣌⠺⡌⠒⢄⡱⡑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⢊⢎⡠⠂⣠⠗⣡⣔⢕⠉⡰⠁",
    "⠀⠣⡉⡪⢖⣭⣻⡿⣦⡀⠈⢽⣄⡈⠒⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠂⠁⣤⡯⠁⢀⣴⢿⣻⣭⡲⢕⢍⠜⠀",
    "⠀⠀⢪⡚⠱⢮⣭⣟⣛⣍⡐⠈⣦⢍⠀⠀⠈⠒⢄⠀⠀⠀⠀⠀⢰⢢⡤⣀⠀⠀⠀⠀⠀⠀⣀⢤⡔⡆⠀⠀⠀⠀⠀⡠⠒⠁⠀⠀⡩⣴⠁⢂⣩⣛⣻⣭⡴⠎⢒⡝⠀⠀",
    "⠀⠀⠀⠫⡒⢑⡶⠶⢿⣿⣏⡁⠸⣖⠄⠀⢢⡀⠈⠱⣄⠀⠀⠀⢸⢀⠉⠈⠱⢒⢒⡒⡒⠎⠁⠁⣀⡇⠀⠀⠀⡠⠊⠀⢀⡐⠀⠠⣺⠃⢈⣹⣿⡿⠶⢶⡉⢒⠝⠀⠀⠀",
    "⠀⠀⠀⠀⠫⣉⡸⢛⣛⣿⣿⣯⣁⡀⠱⢖⣂⠸⢥⠠⠈⠓⠤⣄⣀⠗⡳⠷⡄⠻⣄⣢⠏⢠⠾⢞⠺⣀⣀⠤⠊⠠⠠⡭⢃⣐⡲⠎⢀⣈⣽⣿⣟⣛⢛⢇⣉⠝⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠐⠪⠬⠙⠓⠷⣿⣿⣲⣤⠤⠑⢶⣀⡙⠒⠦⠴⢾⣯⢐⢭⠐⣩⢆⣿⣯⡰⣍⠂⡭⠂⣿⡷⠦⠴⠒⢉⣀⡶⠪⠤⣤⣶⣿⡿⠞⠛⠙⢬⠐⠃⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠉⠲⣚⢺⢤⡻⠾⣛⣽⣯⣤⣄⣉⣛⣻⢶⣿⣿⡄⡈⠀⠨⢈⣧⣼⡉⠅⠀⢁⢠⣿⣿⢶⣟⣋⣉⣤⣤⣼⣯⣟⠷⢯⡴⣛⣒⠖⠁⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢠⣝⣫⣝⢾⣻⡿⣿⣿⣷⣾⣾⣽⣿⡿⣷⣾⣾⣽⣿⣿⣯⣶⣶⣿⢟⣿⣯⣷⣶⣾⣿⣿⢿⣟⡗⣫⣟⣣⡆⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠚⠧⠱⡝⡿⣿⣿⣿⣿⣿⣿⣟⣓⠶⠭⠉⠀⠀⠉⠭⠶⣚⣻⣿⣿⣿⣿⣿⣿⢿⢽⠎⠺⠓⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠚⠾⢻⣿⣿⠿⡿⠚⡮⣂⡒⠀⠀⢒⣑⠵⠓⢿⠿⣿⣿⡟⠷⠓⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠥⣰⣷⣶⠏⠎⠐⢄⡢⠊⠱⢹⣾⣾⣆⠬⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠢⠬⢛⠻⢻⣴⠄⢠⣀⠠⣦⡟⠟⡻⠥⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡱⡺⢸⣟⣿⣿⣿⡇⢗⢎⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⢅⠞⢁⢮⢹⣿⣿⡏⡗⡈⠳⡌⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠪⠥⢤⠴⠁⡾⡿⣿⠧⡘⠤⡄⠨⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠂⢆⠖⢁⠇⢸⡈⠲⡠⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠣⡸⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀ Z E O V I M ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Type"
    return b
end

local function footer()
    local plugins = require("lazy").stats().count
    local v = vim.version()
    local datetime = os.date " %d-%m-%Y   %H:%M:%S"
    return string.format(" %d   v%d.%d.%d  %s", plugins, v.major, v.minor, v.patch, datetime)
end

dashboard.section.buttons.val = {
    button("e", "  New file", "<Cmd>ene <CR>"),
    button("SPC f b", "  File Browser"),
    button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
    button("SPC f o", "  Recent File", ":Telescope oldfiles<CR>"),
    button("q", "  Quit", "<Cmd>qa<CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Number"
dashboard.section.header.opts.hl = "AlphaHeader"

-- Set padding
dashboard.config.layout[1].val = 1

alpha.setup(dashboard.config)

-- Hide tabline and statusline on startup screen
vim.cmd(string.format(
  [[
  augroup alpha_tabline
    au!
    au FileType alpha set showtabline=0 laststatus=0 noruler | au BufUnload <buffer> set showtabline=2 ruler laststatus=%d
  augroup END
  ]],
  vim.fn.has "nvim-0.7" == 1 and 3 or 2
))

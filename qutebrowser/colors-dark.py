black = "#000000"
darkgrey = "#2e3440"
lightgrey = "#616E88"
white = "#ffffff"
offwhite = "#d8dee9"
green = "#AEC694"
lime = "#92d64a"
red = "#bf616a"
red2 = "#e10600"
blue = "#8FAAC9"
purple = "#B48EAD"

# webpage
c.colors.webpage.bg = 'black'
c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'

# completion
c.colors.completion.even.bg = darkgrey
c.colors.completion.odd.bg = c.colors.completion.even.bg
c.colors.completion.fg = offwhite
c.colors.completion.category.fg = blue
c.colors.completion.category.bg = darkgrey
c.colors.completion.category.border.bottom = c.colors.completion.category.bg
c.colors.completion.category.border.top = c.colors.completion.category.bg
c.colors.completion.item.selected.fg = darkgrey
c.colors.completion.item.selected.bg = blue
c.colors.completion.item.selected.border.top = c.colors.completion.item.selected.bg
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.bg
c.colors.completion.match.fg = red2
c.colors.completion.item.selected.match.fg = c.colors.completion.match.fg

# tabs
## selected
c.colors.tabs.selected.even.fg = darkgrey
c.colors.tabs.selected.even.bg = blue
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg

## unselected
c.colors.tabs.even.fg = offwhite
c.colors.tabs.even.bg = darkgrey
c.colors.tabs.odd.fg = c.colors.tabs.even.fg
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.indicator.stop = blue

# statusbar
## normal mode
c.colors.statusbar.normal.fg = offwhite
c.colors.statusbar.normal.bg = darkgrey
c.colors.statusbar.command.fg = offwhite
c.colors.statusbar.command.bg = darkgrey
c.colors.statusbar.insert.fg = darkgrey
c.colors.statusbar.insert.bg = lime
c.colors.statusbar.passthrough.fg = darkgrey
c.colors.statusbar.passthrough.bg = lightgrey
c.colors.statusbar.url.fg = offwhite
c.colors.statusbar.url.success.https.fg = lime

## private mode
c.colors.statusbar.private.fg = offwhite
c.colors.statusbar.private.bg = purple
c.colors.statusbar.command.private.fg = offwhite
c.colors.statusbar.command.private.bg = purple
# c.colors.statusbar.insert.private.bg = lime
# c.colors.statusbar.insert.fg = darkgrey
c.colors.statusbar.url.fg = offwhite
c.colors.statusbar.url.success.https.fg = lime

# download bar
c.colors.downloads.bar.bg = darkgrey

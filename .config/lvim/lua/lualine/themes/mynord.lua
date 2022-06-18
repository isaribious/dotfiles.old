local colors = require("mynord.colors")

local mycolor = {
  gray0_gui = "#121212",
  gray1_gui = "#262626",
  gray2_gui = "#303030",
  gray3_gui = "#4e4e4e",
  gray4_gui = "#585858",
  gray5_gui = "#606060",
  gray6_gui = "#808080",
  gray7_gui = "#8a8a8a",
  gray8_gui = "#9e9e9e",
  gray9_gui = "#bcbcbc",
  gray10_gui = "#d0d0d0",

  dark0_gui = "#005f5f", -- darkestcyan
  dark1_gui = "#005f87", -- darkestblue
  dark2_gui = "#0087af", -- darkblue
  dark3_gui = "#5f0000", -- darkestred
}

local nord = {}

nord.normal = {
  a = { fg = mycolor.gray2_gui, bg = colors.nord6_gui },
  b = { fg = colors.nord4_gui, bg = mycolor.gray3_gui },
  c = { fg = mycolor.gray9_gui, bg = mycolor.gray2_gui },
}

nord.insert = {
  a = { fg = mycolor.dark1_gui, bg = colors.nord4_gui },
  b = { fg = colors.nord4_gui, bg = mycolor.dark2_gui },
  c = { fg = colors.nord4_gui, bg = mycolor.dark1_gui },
  y = { fg = colors.nord5_gui, bg = mycolor.dark2_gui },
}

nord.visual = {
  a = { fg = colors.nord4_gui, bg = mycolor.gray4_gui },
  b = { fg = mycolor.gray1_gui, bg = mycolor.gray6_gui },
  y = { fg = colors.nord4_gui, bg = mycolor.gray3_gui },
  z = { fg = mycolor.gray2_gui, bg = colors.nord6_gui },
}

nord.replace = {
  a = { fg = mycolor.dark3_gui, bg = colors.nord4_gui },
  b = { fg = colors.nord4_gui, bg = mycolor.dark3_gui },
  y = { fg = colors.nord4_gui, bg = mycolor.gray3_gui },
  z = { fg = mycolor.gray2_gui, bg = colors.nord6_gui },
}

nord.command = {
  a = { fg = mycolor.gray2_gui, bg = colors.nord6_gui, gui = "bold" },
  b = { fg = colors.nord4_gui, bg = mycolor.gray3_gui },
  y = { fg = colors.nord4_gui, bg = mycolor.gray3_gui },
  z = { fg = mycolor.gray2_gui, bg = colors.nord6_gui },
}

nord.inactive = {
  a = { fg = mycolor.gray3_gui, bg = mycolor.gray1_gui, gui = "bold" },
  b = { fg = mycolor.gray3_gui, bg = mycolor.gray1_gui },
  c = { fg = colors.nord4_gui, bg = mycolor.gray2_gui },
}

return nord

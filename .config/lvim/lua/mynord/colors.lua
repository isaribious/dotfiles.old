local nord = {
  --16 colors
  nord0_gui = "#2E3440"        ,
  nord1_gui = "#3B4252"        ,
  nord2_gui = "#434C5E"        ,
  nord3_gui = "#4C566A"        ,
  nord3_gui_bright = "#616E88" ,
  nord4_gui = "#D8DEE9"        ,
  nord5_gui = "#E5E9F0"        ,
  nord6_gui = "#ECEFF4"        ,
  nord7_gui = "#8FBCBB"        ,
  nord8_gui = "#88C0D0"        ,
  nord9_gui = "#81A1C1"        ,
  nord10_gui = "#5E81AC"       ,
  -- nord11_gui = "#BF616A"       ,
  nord11_gui = "#f38276"       ,
  nord12_gui = "#D08770"       ,
  nord13_gui = "#EBCB8B"       ,
  -- nord14_gui = "#A3BE8C"       ,
  nord14_gui = "#c3c399"       ,
  -- nord15_gui = "#B48EAD"       ,
  nord15_gui = "#c19696"       ,
  none =          'NONE'
}

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.nord_contrast == true then
  nord.sidebar = nord.nord1_gui
  nord.float = nord.nord1_gui
else
  nord.sidebar = nord.nord0_gui
  nord.float = nord.nord0_gui
end

if vim.g.nord_cursorline_transparent == true then
  nord.cursorlinefg = nord.nord0_gui
else
  nord.cursorlinefg = nord.nord1_gui
end

return nord

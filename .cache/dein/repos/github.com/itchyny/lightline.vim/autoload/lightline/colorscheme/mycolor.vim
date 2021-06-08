" =============================================================================

" Filename: autoload/lightline/colorscheme/powerline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 15:54:41.
" =============================================================================

let s:base02 = [ '#30302c', 236 ]
let s:base01 = [ '#4e4e43', 239 ]
let s:base3 = [ '#e8e8d3', 253 ]
let s:white = [ '#d0d0d0', 252 ]
let s:peach = [ '#d7afaf', 210 ]
let s:magenta = [ '#df5f87', 168 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['gray4', 'white', 'bold'], ['white', 'gray4'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['darkestred', 'white', 'bold'], ['white', 'darkred'] ]
let s:p.visual.left = [ ['white', 'gray4', 'bold'], ['gray1', 'gray6'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
"let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
"let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
"let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
"let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.tabline.left = [ [ 'gray7', 'gray3' ] ]
let s:p.tabline.tabsel = [ [ 'gray10', 'gray2' ] ]
let s:p.tabline.middle = [ [ 'gray3', 'gray7' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let g:lightline#colorscheme#disk7#palette = lightline#colorscheme#fill(s:p)

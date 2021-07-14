" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible
""call plug#begin('~/.vim/plugged')
""Plug 'easymotion/vim-easymotion' "添加要安装的插件
""call plug#end()


" detect file type
filetype on
filetype plugin on


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

"set ignorecase " 搜索模式里忽略大小写
"set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set autoindent " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent " 智能对齐方式
set tabstop=4 " 设置制表符(tab键)的宽度
set softtabstop=4 " 设置软制表符的宽度
set expandtab
%ret! 4
set shiftwidth=4 " (自动) 缩进使用的4个空格
set cindent " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
"set backspace=2 " 设置退格键可用
set showmatch " 设置匹配模式，显示匹配的括号
set linebreak " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes) "使用鼠标
set number " Enable line number "显示行号
set rnu " Enable line relative number "显示相对行号
set previewwindow " 标识预览窗口
set history=50 " set command history to 50 "历史记录50条

"--状态行设置--
set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

"--命令行设置--
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

"--find setting--
set incsearch " 输入字符串就显示匹配点
set hlsearch

set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 修改关键字体颜色
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
let g:solarized_termtrans=1 "使用终端背景颜色
let g:solarized_termcolors=256 "使用256颜色"
"let g:solarized_degrade   =1
"let g:solarized_bold      =0
"let g:solarized_underline =0
"let g:solarized_italic    =0
"let g:solarized_contrast  ="high"
"let g:solarized_visibility="high"
syntax enable
set background=dark
colorscheme solarized

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
syntax on " 语法高亮
endif

hi CursorLine   cterm=NONE ctermbg=237 ctermfg=51 guibg=NONE guifg=NONE
"修改字符串颜色
hi String ctermfg=241
"修改类型颜色
hi Type ctermfg=yellow
"修改数字颜色
hi Number ctermfg=darkblue
"修改常量颜色
hi Constant ctermfg=blue
"修改声明颜色
hi Statement ctermfg=1
"修改注释颜色
hi comment ctermfg=239
" 如果在.vimrc上配置没有效果，需要修改/usr/share/vim/vim80/syntax/c.vim文件，在最末尾添加如下syn语句
" 如果修改c.vim没有权限，开机时按住cmd+r进入恢复模式，然后打开终端，输出
" csrutil disable即可，然后重新启动，用root权限修改文件；
"syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
"syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=darkyellow
hi cppFunctions cterm=bold  ctermfg=darkyellow
""hi Identifier term=underline cterm=bold ctermfg=Cyan guifg=#40ffff
""hi cParen ctermfg=106
""hi cFormat ctermfg=blue
""hi cStructure ctermfg=106
""hi cCppParen ctermfg=106


set tags=.tag/tags;
":set tags+=~/project/git_ws/hik_robot_project/service_robot/ros_project/src/pi_trees_lib/tags
":set tags+=~/project/git_ws/hik_robot_project/service_robot/ros_project/src/pi_trees_ros/tags

set autochdir

let Tlist_Show_One_File           = 1  "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow         = 1  "如果taglist是最后一个窗口，则退出vim
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
"let Tlist_Auto_Open               = 1
let Tlist_JS_Settings             = "javascript;s:string;a:array;o:object;f:function"


" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=40
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1

"powerline"
let g:Powerline_colorscheme='solarized256'

"indentline"
""let g:indentLine_char='┆'        
let g:indentLine_enabled = 1
let g:indentLine_concealcursor='inc'       
let g:indentLine_conceallevel= 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable(".tag/cscope.out")
      cs add .tag/cscope.out 
  endif
  set csverb
endif
set nocscopeverbose
"cs add ~/bitcoin/src/cscope.out 
"set cscopequickfix=s-,c-,d-,i-,t-,e-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理器
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

" 配置快捷键 前面加上<Esc>有声音发出
"nmap zq <Esc>:TlistToggle<CR>
nmap zq :TlistToggle<CR>
nmap zp :NERDTreeToggle<CR>
"nmap zp <Esc>:NERDTreeToggle<CR>
nmap mn :bp<CR>
nmap mm :bn<CR>
"到行首
nmap mh ^
"到行尾
nmap ml $
"把当前行移动到首行"
nmap zk zt
"把当前行移动到尾行"
nmap zj zb
"切换标签
nmap gw gt
nmap gq gT
nmap \m :let @/=expand('<cword>')<cr>

"用easymotion快速跳到当前页面需要到的字符串位置
nmap ff <Plug>(easymotion-s2)
nmap \f <Plug>(easymotion-s2)
vmap ff <Plug>(easymotion-s2)
vmap \f <Plug>(easymotion-s2)

"在插入模式下通过组合键实现上下左右移动"
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"后退
:nnoremap <F1> <C-t> 
:nnoremap <S-Tab> <C-t>
"跳转到定义的地方
:nnoremap <F2> <C-]> 
:nnoremap <Tab> <C-]>
"搜索文件内相同的字符串并高亮
:nnoremap <F3> <S-*>N 
"取消高亮
:nnoremap <F4> :nohlsearch<CR> 
"查找工程中调用函数的地方
:nnoremap <F5> :cs find s <C-R>=expand("<cword>")<CR><CR> 
"在当前目录及子目录查找cpp/c/h文件"
":nnoremap <F8> :vimgrep /<C-R><C-W>/j **/*.cpp **/*.h **/*.c <CR>:cw<CR>
:nnoremap <F6> :vimgrep /<C-R><C-W>/j **/*.cpp **/*.h <CR>:cw<CR><CR>
:nnoremap <F9> :vertical res 
"":nnoremap <F12> :close<CR>
:nnoremap <F12> :q<CR>
:nnoremap <space> za
:nnoremap <C-space> zfa{
""nmap <C-s> :w<CR>
""nmap <C-c> :close<CR> 
"nmap <C-c> :tabc<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-f> :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-i> :cs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>

map <F8> :call PRUN()<CR>
func! PRUN()
	exec "w"
	if &filetype == 'python'
		exec "!python %"
	elseif &filetype == 'sh'
		:!time bash %
	endif
endfunc
 

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
""call vundle#begin()
""
""Plugin 'gmarik/Vundle.vim'
""Bundle 'Valloric/YouCompleteMe'
""
""call vundle#end()
filetype plugin indent on


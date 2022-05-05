alias mktags='mkdir .tag; find `pwd` -name "*.[ch]" -o -name "*.cc" -o -name "*.cpp" -o -name "*.py" > .tag/cscope.files; cd .tag; ctags -R ../; cscope -Rbq -i cscope.files; cd ..'
alias mkgitkeep='echo "# Ignore everything in this directory" > .gitkeep'
export SVGA_VGPU10=0
export CSCOPE_EDITOR=vim

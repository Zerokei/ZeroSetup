" 开始代码高亮
syntax on

" 设置行号
set number
set relativenumber

" 设置默认的缩进设置
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" 定义不同文件类型的缩进设置
augroup custom_indent
  autocmd!
  autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2
  " 添加其他文件类型的设置...
augroup END
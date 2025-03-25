if &compatible
  set nocompatible
endif

" 外部設定ファイルの読み込み
runtime! option.vim
runtime! keymap.vim
runtime! dein.vim
" シンタックスハイライトをONにする
syntax enable

let g:rustfmt_autosave = 1

" treesitter setting
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "python","c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
" bufferline
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

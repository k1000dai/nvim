" NOTE:
"  - lazy.nvim へ移行したので、メイン設定は init.lua です。
"  - 古い Vimscript 設定を編集しても反映されない可能性があります。

if has('nvim')
  lua dofile(vim.fn.stdpath('config') .. '/init.lua')
endif

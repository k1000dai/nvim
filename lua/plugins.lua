return {
  -- Colorscheme
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("everforest")
    end,
  },
  { "cocopon/iceberg.vim" },

  -- Core dependencies
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- LSP/Completion (keeps your existing coc setup)
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = ":call coc#util#install()",
    config = function()
      local coc_vim = vim.fn.stdpath("config") .. "/plugins/coc.vim"
      vim.cmd("source " .. coc_vim)
    end,
  },

  -- UI / Navigation
  {
    "preservim/nerdtree",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Leader>e", ":NERDTreeToggle<CR>", silent = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "NERD_tree_*",
        command = "normal R",
      })
      vim.api.nvim_create_autocmd("FocusGained", {
        pattern = "NERD_tree_*",
        command = "normal R",
      })
    end,
  },

  -- Editing helpers
  {
    "cohama/lexima.vim",
    event = "InsertEnter",
  },

  -- Languages
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
  },

  -- Copilot
  {
    "github/copilot.vim",
    lazy = false,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<Leader>ff", "<cmd>Telescope find_files<CR>", silent = true },
      { "<Leader>fg", "<cmd>Telescope live_grep<CR>", silent = true },
      { "<Leader>fb", "<cmd>Telescope buffers<CR>", silent = true },
      { "<Leader>fh", "<cmd>Telescope help_tags<CR>", silent = true },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
        },
        highlight = {
          enable = true,
          disable = {},
        },
      })
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged_enable = true,
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = { follow_files = true },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
    end,
  },

  -- Buffer/tab line
  {
    "romgrk/barbar.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Leader><S-Tab>", ":BufferPrevious<CR>", silent = true },
      { "<Leader><Tab>", ":BufferNext<CR>", silent = true },
      { "<Leader>q", ":BufferClose<CR>", silent = true },
    },
  },
}

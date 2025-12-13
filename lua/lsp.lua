-- LSP Configuration

-- Setup mason (LSP installer)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "pyright",
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "rust_analyzer",
  },
})

-- LSP keymaps (set when LSP attaches to buffer)
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Hover (was <Leader>info)
  vim.keymap.set("n", "<Leader>info", vim.lsp.buf.hover, opts)

  -- Go to definition (was <Leader>df)
  vim.keymap.set("n", "<Leader>df", vim.lsp.buf.definition, opts)

  -- Format (was <space>fmt)
  vim.keymap.set("n", "<Leader>fmt", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Quick fix / Code action (was <space>fx)
  vim.keymap.set("n", "<Leader>fx", vim.lsp.buf.code_action, opts)

  -- Additional useful LSP keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup each LSP server
local lspconfig = require("lspconfig")

-- clangd (C/C++)
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
})

-- pyright (Python)
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- ts_ls (TypeScript/JavaScript)
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- html
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- cssls (CSS)
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- jsonls (JSON)
lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- rust_analyzer
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Diagnostic signs (similar to your CoC highlighting)
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

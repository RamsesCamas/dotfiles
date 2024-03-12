local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require("lsp-zero").cmp_action()
local lspkind = require('lspkind')

vim.opt.signcolumn = 'yes'
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer', 'clangd', 'bashls', 'elixirls', 'dockerls', 'emmet_ls', 'eslint', 'html', 'graphql', 'gopls', 'ltex', 'lua_ls', 'cssls', 'intelephense', 'spectral', 'pylsp', 'ruby_ls', 'solidity', 'taplo', 'swift_mesonls', 'terraformls', 'vuels', 'lemminx', 'yamlls'},
  handlers = {
    lsp_zero.default_setup,
  }
})

lsp_zero.configure("clangd", {
  capabilities = {
    offsetEncoding = "utf-8",
  },
})

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(), 
	},
	formatting = { format = require("lspkind").cmp_format({ mode = "symbol" }) }
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>m", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
end)

lsp_zero.setup()

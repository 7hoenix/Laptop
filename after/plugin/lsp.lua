local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	"elmls",
	"tsserver",
	"rust_analyzer",
})

lsp.on_attach(function(client, bufnr)
  -- lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.lsp.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

--  vim.api.nvim_create_autocmd("CursorHold", {
--	  buffer = bufnr,
--	  callback = function()
--		  local diagnostic_window_opts = {
--			  focusable = false,
--			  close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--			  border = 'rounded',
--			  source = 'always',
--			  prefix = ' ',
--			  scope = 'cursor',
--		  }
--		  vim.diagnostic.open_float(nil, diagnostic_window_opts)
--	  end
--  })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

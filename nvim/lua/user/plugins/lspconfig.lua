local util = require('lspconfig.util')

vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting_seq_sync, {})

vim.keymap.set('n', '<leader>ca', ':CodeActionMenu<CR>')
vim.keymap.set('v', '<leader>ca', ':CodeActionMenu<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- vim.lsp.set_log_level("debug")

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

require('lspconfig').jedi_language_server.setup{}

--require('lspconfig').bashls.setup{}

--require('lspconfig').html.setup{}

--require('lspconfig').jsonls.setup({
  --settings = {
    --json = {
      --schemas = require('schemastore').json.schemas(),
    --},
  --},
--})

--require('lspconfig').sqls.setup{}

--require('lspconfig').sumneko_lua.setup({
  --cmd = { '/opt/lua-language-server/bin/lua-language-server' },
  --settings = {
    --Lua = {
      --runtime = {
        --version = 'LuaJIT',
      --},
      --diagnostics = {
        ---- Get the language server to recognize the `vim` global
        ---- ['undefined-global'] = false,
        --globals = { 'vim' },
      --},
      --workspace = {
        ---- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file('', true),
      --},
      --telemetry = { enable = false },
    --},
  --},
--})

--require('lspconfig').tailwindcss.setup({})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true,  silent=true}
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, bufopts)
  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  client.server_capabilities.hoverProvider = false
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--require'lspconfig'.jedi_language_server.setup{
  --on_attach = on_attach,
  --capabilities = capabilities,
--}

require'lspconfig'.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

require'lspconfig'.glint.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.ember.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

--require'lspconfig'.pylyzer.setup{
  --on_attach = on_attach,
  --capabilities = capabilities,
  ----root_dir = function()
    ----return vim.fn.getcwd()
  ----end,
--}

--require'lspconfig'.pylsp.setup{
  --on_attach = on_attach,
  --capabilities = capabilities,
  --root_dir = function()
    --return vim.fn.getcwd()
  --end,
  --settings = {
    --configurationSources = {'flake8'},
    --pylsp = {
      --plugins = {
        --pycodestyle = {
          --enabled = false
        --},
        --mccabe = {
          --enabled = false
        --},
        --pyflakes = {
          --enabled = false
        --},
        --flake8 = {
          --enabled = true
        --},
        --black = {
          --enabled = true,
          --line_length = 120,
        --},
      --}
    --}
  --}
--}


-- some pretty bad performance issues with pyright, would love to use it though
--require'lspconfig'.pyright.setup{
  --on_attach = on_attach,
  --capabilities = capabilities,
  --root_dir = function()
    --return vim.fn.getcwd()
  --end,
  --settings = {
    --python = {
      --analysis = {
        --autoImportCompletion = false,
        --autoSearchPaths = false,
        --useLibraryCodeForTypes = false,
        --diagnosticMode = "workspace",
        --typeCheckingMode = "off",
      --},
    --},
  --},
--}

--require('lspconfig').ruff_lsp.setup {
  --on_attach = on_attach,
  --init_options = {
    --settings = {
       ----Any extra CLI arguments for `ruff` go here.
      --args = { '--line-length=120' },
    --}
  --}
--}

--require'lspconfig'.sumneko_lua.setup{
  --on_attach = on_attach,
  --capabilities = capabilities,
--}

require'lspconfig'.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

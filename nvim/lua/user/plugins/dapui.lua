local dap, dapui = require("dap"), require("dapui")

vim.keymap.set('n', '<leader>dc', dap.continue, {})
vim.keymap.set('n', '<leader><Right>', dap.step_over, {})
vim.keymap.set('n', '<leader><Down>', dap.step_into, {})
vim.keymap.set('n', '<leader><Up>', dap.step_out, {})
vim.keymap.set('n', '<leader>du', dapui.toggle, {})

-- Start the debugger
local debug_current_file = function ()
  local args = vim.fn.input('pytest args? ')
  vim.cmd('botright vsplit')
  vim.cmd('vertical resize 120')
  if #args > 0 then
    vim.cmd('exe "term pants --loop  test --debug-adapter % -- ' .. args .. '"')
  else
    vim.cmd('exe "term pants --loop  test --debug-adapter %"')
  end
end

vim.keymap.set('n', '<Leader>sd', debug_current_file, {})

-- DAP setup
dap.adapters.python = {
  type = 'server';
  port = 5678;
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
    request = "attach";
    justMyCode = false;
  },
}

-- DAP UI setup
dapui.setup({
  icons = { expanded = "▸", collapsed = "+", current_frame = "->" },
  mappings = {
  -- Use a table to apply multiple mappings
  expand = { "<CR>", "<2-LeftMouse>" },
  open = "o",
  remove = "d",
  edit = "e",
  repl = "r",
  toggle = "t",
  },
  layouts = {
    {
        elements = {
          "repl",
          -- "console",
          "scopes",
          -- { id = "scopes", size = 0.75 },
        },
        size = 0.25,
        position = "bottom",
    },
    {
        elements = {
          -- { id = "scopes", size = 0.25 },
          -- "breakpoints",
          "stacks",
          -- "watches",
        },
      size = 40,
      position = "left",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

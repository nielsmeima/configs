local map = require("utils").map

-- dap
local dap = require("dap")

-- Configs

-- Python / pyright
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- Go / delve
dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = {nil, stdout},
    args = {"dap", "-l", "127.0.0.1:" .. port},
    detached = true
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)
  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(
    function()
      callback({type = "server", host = "127.0.0.1", port = port})
    end,
    100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}


-- Mappings
options = { silent = true }

map("n", "<leader>dct", "<cmd>lua require('dap').continue()<CR>", options)
map("n", "<leader>dsv", "<cmd>lua require('dap').step_over()<CR>", options)
map("n", "<leader>dsi", "<cmd>lua require('dap').step_into()<CR>", options)
map("n", "<leader>dso", "<cmd>lua require('dap').step_out()<CR>", options)
map("n", "<leader>dtb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", options)
map("n", "<leader>dsc", "<cmd>lua require('dap.ui.variables').scopes()<CR>", options)
map("n", "<leader>dhh", "<cmd>lua require('dap.ui.variables').hover()<CR>", options)
map("v", "<leader>dhv", "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", options)
map("n", "<leader>duh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", options)
map("n", "<leader>duf", "<cmd>lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", options)

map("n", "<leader>dsbr", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", options)
map("n", "<leader>dsbm", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", options)
map("n", "<leader>dro", "<cmd>lua require('dap').repl.open()<CR>", options)
map("n", "<leader>drl", "<cmd>lua require('dap').repl.run_last()<CR>", options)

-- telescope-dap
map("n", "<leader>dcc", "<cmd>lua require('telescope').extensions.dap.commands{}<CR>", options)
map("n", "<leader>dco", "<cmd>lua require('telescope').extensions.dap.configurations{}<CR>", options)
map("n", "<leader>dlb", "<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<CR>", options)
map("n", "<leader>dv", "<cmd>lua require('telescope').extensions.dap.variables{}<CR>", options)
map("n", "<leader>df", "<cmd>lua require('telescope').extensions.dap.frames{}<CR>", options)

-- dap-virtual-text
vim.g.dap_virtual_text = true

-- NOTE: this is more trouble than it is worth, just automate through ansible
-- local function install_servers()
-- 	local debug_servers  = require("consts").debug_servers
-- 	local dap_install = require("dap-install.tools.tool_install.init")
-- 	for _, debug_server in pairs(debug_servers) do
-- 		dap_install.install_debugger(debug_server)
-- 	end
-- end


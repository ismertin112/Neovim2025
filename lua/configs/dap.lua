local dap = require("dap")
local dapui = require("dapui")

-- basic debugging ui
dapui.setup()
require("nvim-dap-virtual-text").setup()

-- auto open/close dap ui
local open = function()
  dapui.open()
end
local close = function()
  dapui.close()
end

dap.listeners.after.event_initialized["dapui_config"] = open
dap.listeners.before.event_terminated["dapui_config"] = close
dap.listeners.before.event_exited["dapui_config"] = close

-- go specific adapters
require("dap-go").setup()

-- Neovim command to manage vim.pack plugins
-- Run inside nvim: :PackUpdate, :PackClean, :PackList

local pack_dir = vim.fn.stdpath("config") .. "/pack/theovim"
local start_dir = pack_dir .. "/start"
local opt_dir = pack_dir .. "/opt"

local function exec_cmd(cmd)
  local result = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify("Command failed: " .. result, vim.log.levels.ERROR)
    return false
  end
  return true
end

local function list_plugins()
  local plugins = { start = {}, opt = {} }
  
  for name in vim.fs.dir(start_dir) do
    if name ~= "." and name ~= ".." then
      table.insert(plugins.start, name)
    end
  end
  
  for name in vim.fs.dir(opt_dir) do
    if name ~= "." and name ~= ".." then
      table.insert(plugins.opt, name)
    end
  end
  
  table.sort(plugins.start)
  table.sort(plugins.opt)
  return plugins
end

-- :PackList - List all plugins
vim.api.nvim_create_user_command("PackList", function()
  local plugins = list_plugins()
  
  local lines = { "START plugins (loaded on startup):" }
  for _, p in ipairs(plugins.start) do
    table.insert(lines, "  • " .. p)
  end
  
  table.insert(lines, "")
  table.insert(lines, "OPT plugins (lazy-loaded):")
  for _, p in ipairs(plugins.opt) do
    table.insert(lines, "  • " .. p)
  end
  
  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end, {})

-- :PackUpdate - Update all plugins
vim.api.nvim_create_user_command("PackUpdate", function()
  vim.notify("Updating plugins...", vim.log.levels.INFO)
  local config_dir = vim.fn.fnamemodify(vim.fn.stdpath("config"), ":h:h")
  
  if exec_cmd("cd " .. vim.fn.shellescape(config_dir) .. " && git submodule update --remote") then
    vim.notify("✓ Plugins updated", vim.log.levels.INFO)
  end
end, {})

-- :PackInstall - Install plugins (init submodules)
vim.api.nvim_create_user_command("PackInstall", function()
  vim.notify("Installing plugins...", vim.log.levels.INFO)
  local config_dir = vim.fn.fnamemodify(vim.fn.stdpath("config"), ":h:h")
  
  if exec_cmd("cd " .. vim.fn.shellescape(config_dir) .. " && git submodule update --init --recursive") then
    vim.notify("✓ Plugins installed", vim.log.levels.INFO)
  end
end, {})

-- :PackClean - Remove all plugins
vim.api.nvim_create_user_command("PackClean", function()
  local confirm = vim.fn.input("Remove all plugins? (y/n): ")
  if confirm == "y" then
    vim.fn.system("rm -rf " .. vim.fn.shellescape(start_dir) .. "/* " .. vim.fn.shellescape(opt_dir) .. "/*")
    vim.notify("✓ Plugins removed", vim.log.levels.INFO)
  else
    vim.notify("Cancelled", vim.log.levels.WARN)
  end
end, {})

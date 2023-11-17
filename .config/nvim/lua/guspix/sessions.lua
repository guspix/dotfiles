-- Create a dedicated session directory
local session_dir = vim.fn.stdpath('data') .. '/sessions/'

-- Ensure the session directory exists
if vim.fn.isdirectory(session_dir) == 0 then
  vim.fn.mkdir(session_dir, 'p')
end

local function get_session_file_path()
  local current_dir = vim.fn.getcwd()
  -- Create a hash of the current_dir to ensure uniqueness
  local session_file_name = vim.fn.sha256(current_dir) .. '.vim'
  return session_dir .. session_file_name
end

-- Commands to save and restore the session
vim.api.nvim_create_user_command('SaveSession', function()
  vim.cmd('mksession! ' .. get_session_file_path())
end, {})

vim.api.nvim_create_user_command('RestoreSession', function()
  local session_file = get_session_file_path()
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd('source ' .. session_file)
  else
    print('No session found for this directory')
  end
end, {})

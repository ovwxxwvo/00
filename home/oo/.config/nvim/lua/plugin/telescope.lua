-- NEOVIM lua script,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.10.28


vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  command = "setlocal nofoldenable",
})

-- require('telescope').load_extension('media_files')
-- require('telescope').setup{
--   extensions = {
--     media_files = {
--       -- filetypes whitelist
--       -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
--       filetypes = {"png", "webp", "jpg", "jpeg"},
--       -- find command (defaults to `fd`)
--       find_cmd = "rg"
--     }
--   },
-- }






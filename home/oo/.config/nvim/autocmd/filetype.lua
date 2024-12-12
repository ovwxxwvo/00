-- NVIM config,
-- Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
-- Last Change: 2024.11.28


local t = {

  { {"*.sh"   ,"*.ash"  ,"*.bsh","*.dsh",} , "bash"   , "bashls"               },
  { {"*.lua"  ,"*.luc"  ,                } , "lua"    , "lua_ls"               },
  { {"*.vim"  ,"*.vimrc",                } , "vim"    , "vimls"                },
  { {"*.py"   ,"*.pyw"  ,                } , "python" , "jedi_language_server" },
  { {"*.yaml" ,"*.yml"  ,                } , "yaml"   , "yamlls"               },
  { {"*.toml" ,"*.tml"  ,                } , "toml"   , "taplo"                },
  { {"*.json" ,"*.jsn"  ,                } , "json"   , "josnls"               },
  { {"*.rs"   ,                          } , "rust"   , "rust_analyzer"        },

  { {"*.conf" ,"*.cfg"  ,                } , "dosini" ,                        },
  { {"*.tmux" ,"*.tmx"  ,                } , "tmux"   ,                        },
  { {"*.fish" ,"*.fsh"  ,                } , "fish"   ,                        },

  { {"*.cpp"  ,"*.esp"  ,"rasi",         } , "cpp"    ,                        },

  }


for i,v in ipairs(t) do
  local ext    = v[1]
  local type   = v[2]
  -- local server = v[3]
  vim.api.nvim_create_autocmd( {"BufNewFile","BufRead"}, {
    pattern = ext ,
    callback = function()
      vim.api.nvim_buf_set_option(0, "filetype", type)
      -- print(ext[1],type,server)
      end
    })
  end



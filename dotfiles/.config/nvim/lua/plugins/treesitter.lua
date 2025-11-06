return {
  {
    -- "nvim-treesitter/nvim-treesitter",
    dir = "~/.config/nvim/lua/plugins/nvim-treesitter",
    config = function()
      require('nvim-treesitter.configs').setup {
        --ensure_installed = { "c", "cpp", "lua", "python" }, -- Add languages you need
        highlight = {
          enable = true,
        },
      }
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      -- install c parser from local path
      parser_config.c = {
        install_info = {
          url = "~/.config/nvim/assets/tree-sitter-c",
          files = { "src/parser.c" }
        },
        filetype = "c",
      }
      -- install cpp parser from local path
      parser_config.cpp = {
        install_info = {
          url = "~/.config/nvim/assets/tree-sitter-cpp",
          files = { "src/parser.c", "src/scanner.c" }
        },
        filetype = "cpp",
      }
      -- install lua parser from local path
      parser_config.lua = {
        install_info = {
          url = "~/.config/nvim/assets/tree-sitter-lua",
          files = { "src/parser.c" }
        },
        filetype = "lua",
      }
      -- install python parser from local path
      parser_config.python = {
        install_info = {
          url = "~/.config/nvim/assets/tree-sitter-python",
          files = { "src/parser.c", "src/scanner.c" }
        },
        filetype = "py",
      }
    end,
    build = ':TSUpdate',
  },
}

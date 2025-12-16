return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- dir = "~/.config/nvim/lua/plugins/nvim-treesitter",
    build = ':TSUpdate',
    --[[
    config = function()
      require'nvim-treesitter'.install { 'c', 'cpp', 'lua', 'python' }
    --]]
    opts = {
      -- custom handling of parsers
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
      },
    },
    config = function(_, opts)
      -- install parsers from custom opts.ensure_installed
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        require("nvim-treesitter").install(opts.ensure_installed)
        -- register and start parsers for filetypes
        for _, parser in ipairs(opts.ensure_installed) do
          local filetypes = parser -- In this case, parser is the filetype/language name
          vim.treesitter.language.register(parser, filetypes)
   
          vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = filetypes,
            callback = function(event)
              vim.treesitter.start(event.buf, parser)
            end,
          })
        end
      end
      --[[ Remove block comment to install from local paths
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "cpp", "lua", "python" }, -- Add languages you need
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
    --]]
    end,
  },
}

return {
  -- ty (Python type checker from Astral)
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Register ty if not already in lspconfig
      local configs = require("lspconfig.configs")
      if not configs.ty then
        configs.ty = {
          default_config = {
            cmd = { "ty", "server" },
            filetypes = { "python" },
            root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "ty.toml", ".git"),
            single_file_support = true,
          },
        }
      end

      -- Add ty to servers
      opts.servers = opts.servers or {}
      opts.servers.ty = {}
    end,
  },

  -- ruff for linting/formatting (uses system ruff from uv)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
  },
}

return {
  -- =========================================================================
  -- 1. Rustaceanvim (Rustサポートのコア)
  -- =========================================================================
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- メジャーバージョンを指定（2026年時点の最新安定版）
    lazy = false, -- 非常に軽量なので、Rustファイルを開いた時に即座に動くよう手動管理
    config = function()
      -- LSPが起動した時に有効化したいキーマップなどをここに定義
      vim.g.rustaceanvim = {
        -- LSPの設定
        server = {
          on_attach = function(client, bufnr)
            -- Neovim 0.10以降の標準Inlay Hintsを有効化
            if vim.lsp.inlay_hint then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

            -- ショートカットキーの設定例
            local opts = { silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", opts)
            vim.keymap.set("n", "<leader>ca", "<cmd>RustLsp codeAction<CR>", opts)
            vim.keymap.set("n", "<leader>dr", "<cmd>RustLsp debuggables<CR>", opts)
          end,
          default_settings = {
            -- rust-analyzer の詳細設定
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true, -- 全てのfeatureを有効化（競プロ等で便利）
                loadOutDirsFromCheck = true,
              },
              checkOnSave = {
                command = "clippy", -- 保存時に cargo check ではなく clippy を走らせてコードを綺麗にする
              },
              -- 快適なインレイヒントの設定
              inlayHints = {
                bindingModeHints = { enable = true },
                closureCaptureHints = { enable = true }, -- クロージャのキャプチャ（move等）を可視化
                closureReturnTypeHints = { enable = "always" },
                discriminantHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
              },
            },
          },
        },
      }
    end,
  },

  -- =========================================================================
  -- 2. デバッガ (nvim-dap) の設定
  -- =========================================================================
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- 必要に応じて、Mason等でインストールした `codelldb` のパスを紐付けます
      -- rustaceanvim が自動で nvim-dap を検知して連携してくれます
    end,
  },
}

-- local lsp = require("lsp-zero")
--
--
-- lsp.preset("recommended")
--
-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
-- 	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
-- 	["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 	["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- lsp.setup_nvim_cmp({
-- 	mapping = cmp_mappings,
-- })
--
-- lsp.set_preferences({
-- 	suggest_lsp_servers = false,
-- 	sign_icons = {
-- 		error = "",
-- 		warn = "",
-- 		hint = "",
-- 		info = "",
-- 	},
-- })
--
-- vim.diagnostic.config({
-- 	virtual_text = true,
-- })
--
-- require("mason").setup({
-- 	ui = {
-- 		icons = {
-- 			package_installed = "✓",
-- 			package_pending = "➜",
-- 			package_uninstalled = "✗",
-- 		},
-- 	},
-- })
-- require("mason-lspconfig").setup({
-- 	ensure_installed = {},
-- 	handlers = {
-- 		lsp.default_setup,
-- 	},
-- })
--
-- lsp.setup({})
--

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        })
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end
  }
}

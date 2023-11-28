-- removing package.json (and more) as a project pattern below
-- to avoid dashboard being registered as a project
lvim.builtin.project.patterns = { ".git" }


lvim.keys.normal_mode["<leader>zr"] = "<cmd>Telescope lsp_references<cr>"


-- toggle with <leader>td
vim.diagnostic.config({ virtual_text = false })

-- erase all white space on save:
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
  end
})

vim.cmd([[
autocmd FileType clojure let g:clojure_fuzzy_indent_patterns+=['^dofor$', '^GET$', '^POST$', '^PUT$', '^PATCH$', '^DELETE$', '^ANY$']
]])


--
-- Trying to not have spaces after vim-wrap commands
vim.g.sexp_insert_after_wrap = 0

-- Disable automatic bb REPL & read repl out as edn
vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

lvim.colorscheme = 'tokyonight-storm'

--macros
vim.fn.setreg('d', ',walog/daff lywhi pl(')
vim.fn.setreg('s', ',walog/spy ')
vim.fn.setreg('p', 'v%p')
vim.fn.setreg('x', 'v%x')
vim.fn.setreg('y', 'v%y')

--leaders
lvim.leader = "space"
vim.g.maplocalleader = ","

--vim S-expression keymaps
lvim.keys.normal_mode["<localleader>kr"] = "<Plug>(sexp_raise_element)"
lvim.keys.normal_mode["<localleader>ms"] = "<Plug>(sexp_splice_list)"
lvim.keys.normal_mode["<C-Left>"] = "<Plug>(sexp_emit_tail_element)"
lvim.keys.normal_mode["<C-Right>"] = "<Plug>(sexp_capture_next_element)"
lvim.keys.normal_mode["("] = "<Plug>(sexp_move_to_prev_bracket)"
lvim.keys.normal_mode[")"] = "<Plug>(sexp_move_to_next_bracket)"
lvim.keys.normal_mode["<localleader>i"] = "<Plug>(sexp_round_head_wrap_list)"
lvim.keys.normal_mode["<localleader>["] = "<Plug>(sexp_square_head_wrap_list)"
lvim.keys.normal_mode["<M-k>"] = "<Plug>(sexp_swap_list_backward)"
lvim.keys.normal_mode["<M-j>"] = "<Plug>(sexp_swap_list_forward)"
lvim.keys.normal_mode["<M-h>"] = "<Plug>(sexp_swap_element_backward)"
lvim.keys.normal_mode["<M-l>"] = "<Plug>(sexp_swap_element_forward)"
lvim.keys.normal_mode["<localleader>{"] = "<Plug>(sexp_curly_head_wrap_list)"
lvim.keys.normal_mode["<localleader>}"] = "<Plug>(sexp_curly_tail_wrap_list)"
lvim.keys.normal_mode["<localleader>w"] = "<Plug>(sexp_round_head_wrap_element)"
lvim.keys.normal_mode["<localleader>e["] = "<Plug>(sexp_square_head_wrap_element)"
lvim.keys.normal_mode["<localleader>e]"] = "<Plug>(sexp_square_tail_wrap_element)"
lvim.keys.normal_mode["<localleader>e{"] = "<Plug>(sexp_curly_head_wrap_element)"
lvim.keys.normal_mode["<localleader>e}"] = "<Plug>(sexp_curly_tail_wrap_element)"
lvim.keys.normal_mode["<localleader>lb"] = "<plug>(sexp_capture_prev_element)"
lvim.keys.insert_mode["\""] = "<Plug>(sexp_insert_double_quote)"
lvim.keys.insert_mode["("] = "<Plug>(sexp_insert_opening_round)"
lvim.keys.insert_mode[")"] = "<Plug>(sexp_insert_closing_round)"
lvim.keys.insert_mode["["] = "<Plug>(sexp_insert_opening_square)"
lvim.keys.insert_mode["]"] = "<Plug>(sexp_insert_closing_square)"
lvim.keys.insert_mode["{"] = "<Plug>(sexp_insert_opening_curly)"
lvim.keys.insert_mode["}"] = "<Plug>(sexp_insert_closing_curly)"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"

lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["a"] = { "<cmd>Alpha<cr>", "Home" }

lvim.builtin.which_key.mappings["w"] = nil
lvim.builtin.which_key.mappings["w"] = {
  name = "Window/Buffer Nav",
  c = { "<C-w>c", "Close Current window" },
  k = { "<cmd>bufdo bd<CR>", "Kill all other buffers" },
  o = { "<C-w>o", "Close Other windows" },
  s = { "<C-w>s", "Open duplicate window (south) UNDERNEATH" },
  v = { "<C-w>v", "Open duplicate window (vertical) TO THE RIGHT" },
  w = { "<C-w>w", "Jump to other Window" },
}

lvim.builtin.which_key.mappings["c"] = nil
lvim.builtin.which_key.mappings["c"] = {
  name = "Conjure",
  b = { "<cmd>normal @b<cr>", "Eval Buffer" },
  c = { "<cmd>normal @k<cr>", "Eval Root To Comment" },
  C = { "<cmd>normal @z<cr>", "Eval Form To Comment" },
  f = { "<cmd>normal @n<cr>", "Eval File" },
  i = { "<cmd>normal @o<cr>", "Interrupt Repl (cancel)" },
  s = { "<cmd>ConjureConnect local.aclaimant.com 7000<cr>", "Connect To Service" },
  a = { "<cmd>ConjureConnect local.aclaimant.com 7002<cr>", "Connect To Alerter" },
  t = { "<cmd>ConjureConnect local.aclaimant.com 7004<cr>", "Connect To Twilio" },
  j = { "<cmd>ConjureConnect local.aclaimant.com 7001<cr>", "Connect To Jobs" },
  l = { "<cmd>ConjureShadowSelect app<cr>", "Connect to ShadowCLJS" },
  v = { "<cmd>normal @v<cr>", "Vertical Conjure Window" },
  z = { "<cmd>normal @h<cr>", "Horizontal Conjure Window" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "clojure",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Additional Plugins
lvim.plugins = {
  { "Olical/conjure" },
  { "sainnhe/gruvbox-material" },
  { "guns/vim-sexp" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-sexp-mappings-for-regular-people" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
  }
}


-- general
--lvim.log.level = "warn"
-- lvim.format_on_save.enabled = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
--
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
---- My Keybindings

--lvim.keys.[normal|visual|insert]_mode
--
-- Insert --
-- Visual Block --
-- Move text up and down
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
--lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

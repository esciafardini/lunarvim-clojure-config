--leaders
lvim.leader = "space"
vim.g.maplocalleader = ","

-- colorscheme
lvim.colorscheme = 'tokyonight-storm'

-- removing package.json (and more) as a project pattern below
-- to avoid dashboard being registered as a project
lvim.builtin.project.patterns = { ".git" }

-- virtual text is annoying
vim.diagnostic.config({ virtual_text = false })

-- erase all white space on save:
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
  end
})

-- prevent bad formatting
vim.cmd([[
autocmd FileType clojure let g:clojure_fuzzy_indent_patterns+=['^dofor$', '^GET$', '^POST$', '^PUT$', '^PATCH$', '^DELETE$', '^ANY$']
]])

-- no space for vim-wrap
vim.g.sexp_insert_after_wrap = 0

-- disable automatic bb REPL & read repl out as edn
vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

-- macros
vim.fn.setreg('d', ',walog/daff lywhi pl(')
vim.fn.setreg('s', ',walog/spy ')
vim.fn.setreg('p', 'v%p')
vim.fn.setreg('x', 'v%x')
vim.fn.setreg('y', 'v%y')

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

require("treesitter-sexp").setup {
  -- Enable/disable
  enabled = true,
  -- Move cursor when applying commands
  set_cursor = true,
  -- Set to false to disable all keymaps
  keymaps = {
    -- Set to false to disable keymap type
    commands = {
      -- Set to false to disable individual keymaps
      swap_prev_elem = "<e",
      swap_next_elem = ">e",
      swap_prev_form = "<f",
      swap_next_form = ">f",
      promote_elem = "<LocalLeader>O",
      promote_form = "<LocalLeader>o",
      splice = "<LocalLeader>@",
      slurp_left = "<(",
      slurp_right = ">)",
      barf_left = ">(",
      barf_right = "<)",
      insert_head = "<I",
      insert_tail = ">I",
    },
    motions = {
      form_start = "(",
      form_end = ")",
      prev_elem = "[e",
      next_elem = "]e",
      prev_elem_end = "[E",
      next_elem_end = "]E",
      prev_top_level = "[[",
      next_top_level = "]]",
    },
    textobjects = {
      inner_elem = "ie",
      outer_elem = "ae",
      inner_form = "if",
      outer_form = "af",
      inner_top_level = "iF",
      outer_top_level = "aF",
    },
  },
}

-- Additional Plugins
lvim.plugins = {
  { "Olical/conjure" },
  { "PaterJason/nvim-treesitter-sexp" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-sexp-mappings-for-regular-people" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" }
}

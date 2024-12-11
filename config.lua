--leaders
lvim.leader = "space"
vim.g.maplocalleader = ","

require("mason-lspconfig").setup {
    ensure_installed = { "solargraph", "lua_ls", "rust_analyzer" },
}

-- why did you delete this silly boy?
-- This prevents package.json from registering Dashboard as a project
lvim.builtin.project.patterns = { ".git" }

lvim.builtin.telescope.defaults.path_display = nil

-- colorscheme
lvim.colorscheme = 'tokyonight-storm'

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "vendor/*",
  "resources/cluvio/*",
  "%.lock",
  "__pycache__/*",
  "%.sqlite3",
  "%.ipynb",
  "node_modules/*",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  ".git/",
  "%.webp",
  ".dart_tool/",
  ".github/",
  ".gradle/",
  ".idea/",
  ".vscode/",
  "__pycache__/",
  "build/",
  "env/",
  "gradle/",
  "node_modules/",
  "target/",
  "%.pdb",
  "%.dll",
  "%.class",
  "%.exe",
  "%.cache",
  "%.ico",
  "%.pdf",
  "%.dylib",
  "%.jar",
  "%.docx",
  "%.met",
  "smalljre_*/*",
  ".vale/",
}

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

-- fck i need GOD and a ginger ALE
-- trying rubuy shit
vim.g.neoterm_size = 16
vim.g.neoterm_autoscroll = '1'

vim.cmd([[
  command! -nargs=+ TT Topen | T
]])


-- no space for vim-wrap
vim.g.sexp_insert_after_wrap = 0

-- disable automatic bb REPL & read repl out as edn
vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
vim.g["conjure#client#sql#stdio#command"] = "psql -U svc_user -p 5432 -h local.aclaimant.com -d aclaimant"

-- macros
vim.fn.setreg('d', ',walog/daff lywhi pl(')
vim.fn.setreg('s', ',walog/spy ')
vim.fn.setreg('p', 'v%p')
vim.fn.setreg('x', 'v%x')
vim.fn.setreg('y', 'v%y')
vim.fn.setreg('b', 'ggVG,w')

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
  "ruby",
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
-- weird treesitter bug prevention:
lvim.builtin.treesitter.indent = false

-- Additional Plugins
lvim.plugins = {
  { "Olical/conjure" },
  { "folke/tokyonight.nvim" },
  { "guns/vim-sexp" },
  { "kassio/neoterm" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-sexp-mappings-for-regular-people" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" }
}

vim.keymap.set('n', '<localleader>kr', '<localleader>O', { remap = true })

--vimterm shit
vim.keymap.set('n', '<localleader>0', ':Ttoggle<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<localleader>w', ':TREPLSendSelection<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<localleader>w', ':TREPLSendLine<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<localleader>3', ':Tmap<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<localleader>b', '@b', { noremap = true, silent = true })

-- Set neoterm_automap_keys to <F5>
vim.g.neoterm_automap_keys = '<F5>'

lvim.autocommands = {
    {
        "BufReadPost",
        {
            pattern = { "*.erb", "*.eruby" },
            command = "set syntax=html",
        }
    },
}

lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#e6ddb3', bold = false })
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#FFFFFF', bold = true })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#919294", underline = false, bold = false, italic = true })
      end,
    },
  },
}

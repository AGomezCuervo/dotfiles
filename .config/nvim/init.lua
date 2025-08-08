vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true
vim.o.scrolloff = 4
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true
vim.o.expandtab = true
vim.o.smartindent = true

vim.opt.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.opt.guicursor = ""
vim.o.colorcolumn = "80"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({"n", "x"}, "<leader>y", '"+y"')
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.opt.wildignore = "*/node_modules/**"
vim.o.wildignorecase=true

vim.api.nvim_create_user_command(
        'ChangeIndent',
        function(opts)
                local value = tonumber(opts.args)
                if value then
                        vim.opt.shiftwidth = value
                        vim.opt.tabstop = value
                        print("Shiftwidth & Tabstop changed to " .. value)
                else
                        print("Use a valid number")
                end
        end,
        { nargs = 1 }
)

vim.pack.add({
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require "mason".setup()
require("nvim-treesitter.configs").setup({
        ensure_installed = { "typescript", "vue", "lua", "c" },
        sync_install = false,
        ignore_install = {},
        auto_install = true,
        highlight = {
                additional_vim_regex_highlighting = false,
                enable = true,
        },
        modules = {}
})


vim.lsp.enable({"lua_ls", "vtsls", "vue_ls"})

vim.lsp.config("lua_ls", {
        settings = {
                Lua = {
                        workspace = {
                                library = vim.api.nvim_get_runtime_file("", true)
                        }
                }
        }
})

vim.cmd("colorscheme minioding")

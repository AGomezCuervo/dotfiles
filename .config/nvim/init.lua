-- remap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({"n", "x"}, "<leader>y", '"+y"') --x covers all visual modes
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --gv reselects the las selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<esc>", ":set hls! <CR>")
vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
end, opts)

-- options
vim.o.timeoutlen = 300
vim.o.relativenumber = true
vim.o.number = true
vim.o.guicursor = ""
vim.o.cursorline = true
vim.o.scrolloff = 4
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true -- change between buffers without saving
vim.o.colorcolumn = "80"

-- default size of TAB is 8 spaces. Perfect :)
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true
-- vim.opt.tags:append({'/home/agomez/.config/nvim/tags', 'tags'})

vim.opt.wildignore:append("**/node_modules/**")
vim.o.wildignorecase=true
vim.opt.path:append("**")

vim.cmd("colorscheme minioding")

-- package manager: Lazyvim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "--branch=stable",
                lazyrepo,
                lazypath
        })

        if vim.v.shell_error ~= 0 then
                vim.api.nvim_echo({
                        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                        { out, "WarningMsg" },
                        { "\nPress any key to exit..." },
                }, true, {})
                vim.fn.getchar()
                os.exit(1)
        end
end
vim.opt.rtp:prepend(lazypath)

-- remap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({"n", "x"}, "<leader>y", '"+y"') --x covers all visual modes
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --gv reselects the las selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<esc>", ":set hls! <CR>")
vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
end, opts)

-- options
vim.o.timeoutlen = 300
vim.o.relativenumber = true
vim.o.guicursor = ""
vim.o.scrolloff = 4
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hidden = true -- change between buffers without saving
vim.o.colorcolumn = "80"
-- vim.o.path = vim.o.path .. ",**"
-- vim.o.wildignore = vim.o.wildignore .. ",**/node_modules/**"

-- default size of TAB is 8 spaces. Perfect :)
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true


vim.cmd("colorscheme minioding")

-- Fzf Plugin
-- local fzf_actions = require("fzf-lua.actions")
local fzf = {
        "ibhagwan/fzf-lua",
        config = function()
                vim.keymap.set("n", "<leader>pf", require('fzf-lua').files, { desc = "Fzf Files" })
                vim.keymap.set("n", "<leader>ps", require('fzf-lua').live_grep, { desc = "Fzf live_grep" })
                local actions = require "fzf-lua.actions"
                require'fzf-lua'.setup {
                        winopts = {
                                border = false,
                                fullscreen = true,
                                preview = {
                                        hidden = 'hidden',
                                },
                        },
                        keymap = {
                                builtin = {
                                        false,
                                        ["<M-Esc>"] = "hide",
                                        ["<F1>"] = "toggle-help",
                                        ["<F2>"] = "toggle-fullscreen",
                                        ["<F3>"] = "toggle-preview-wrap",
                                        ["<F4>"] = "toggle-preview",
                                        ["<F5>"] = "toggle-preview-ccw",
                                        ["<F6>"] = "toggle-preview-cw",
                                        ["<S-down>"] = "preview-page-down",
                                        ["<S-up>"] = "preview-page-up",
                                        ["<M-S-down>"] = "preview-down",
                                        ["<M-S-up>"] = "preview-up",
                                },
                                fzf = {
                                        false,
                                        ["ctrl-z"] = "abort",
                                        ["ctrl-u"] = "unix-line-discard",
                                        ["ctrl-f"] = "half-page-down",
                                        ["ctrl-b"] = "half-page-up",
                                        ["ctrl-a"] = "beginning-of-line",
                                        ["ctrl-e"] = "end-of-line",
                                        ["alt-a"] = "toggle-all",
                                        ["alt-g"] = "last",
                                        ["alt-G"] = "first",
                                        ["f3"]= "toggle-preview-wrap",
                                        ["f4"]= "toggle-preview",
                                        ["shift-down"] = "preview-page-down",
                                        ["shift-up"] = "preview-page-up",
                                },
                        },
                        actions = {
                                files = {
                                        false,
                                        ["ctrl-y"] = actions.file_edit_or_qf,
                                        ["enter"] = actions.file_edit_or_qf,
                                        ["ctrl-s"] = actions.file_split,
                                        ["ctrl-v"] = actions.file_vsplit,
                                        ["ctrl-t"] = actions.file_tabedit,
                                        ["alt-q"] = actions.file_sel_to_qf,
                                        ["alt-Q"] = actions.file_sel_to_ll,
                                },
                        },
                }
        end
}

-- Harpoon
local harpoon = {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
                "nvim-lua/plenary.nvim"
        },
        config = function()
                local harpoon =  require("harpoon"):setup()

                vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
                vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

                vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
                vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
                vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
                vim.keymap.set("n", "<C-n>", function() harpoon:list():select(4) end)
                vim.keymap.set("n", "<C-m>", function() harpoon:list():select(5) end)

                vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
                vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        end,
}

-- Treesitter Plugin
local treesitter = {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
                require("nvim-treesitter.configs").setup({
                        ensure_installed = {
                                "gitignore", "go", "vue", "vimdoc", "json",
                                "javascript",  "typescript", "python", "bash",
                                "c", "cpp","lua", "css", "html"
                        },
                        indent = {enable = false},
                        autotag = {
                                enable = true,
                        },
                        sync_install = false,
                        auto_install = true,
                        highlight = {
                                enable = true,
                        },
                        incremental_selection = {
                                enable = true,
                                keymaps = {
                                        init_selection = '<CR>',
                                        scope_incremental = '<CR>',
                                        node_incremental = '<TAB>',
                                        node_decremental = '<S-TAB>',
                                },
                        }
                })
        end
}

-- Configuración del plugin LSP
local lsp = {
        "neovim/nvim-lspconfig",
        dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/nvim-cmp",
        },

        config = function()
                local cmp_lsp = require("cmp_nvim_lsp")
                local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
                )

                require("mason").setup()
                require("mason-lspconfig").setup({
                        ensure_installed = {
                                "cssls", "gopls", "html", "lua_ls", "volar"
                        },
                        handlers = {
                                function(server_name)
                                        require("lspconfig")[server_name].setup {
                                                capabilities = capabilities,
                                        }
                                end,

                                ["lua_ls"] = function()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.lua_ls.setup {
                                                capabilities = capabilities,
                                                settings = {
                                                        Lua = {
                                                                diagnostics = {
                                                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                                                }
                                                        }
                                                }
                                        }
                                end,

                                ["volar"] = function ()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.volar.setup {
                                                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                                                init_options = {
                                                        vue = {
                                                                hybridMode = false
                                                        }
                                                }
                                        }
                                end
                        }
                })

                vim.diagnostic.config({
                        float = {
                                focusable = true,
                                style = "minimal",
                                border = "rounded",
                                source = "always",
                                header = "",
                                prefix = "",
                        },
                })
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { noremap = true, silent = true })
        end
}

-- Configuración de nvim-cmp, con mapeos y fuentes
local nvim_cmp = {
        "hrsh7th/nvim-cmp",
        dependencies = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
                local cmp = require("cmp")

                cmp.setup({
                        mapping = {
                                ['<C-p>'] = cmp.mapping.select_prev_item(),
                                ['<C-n>'] = cmp.mapping(function(fallback)
                                        if cmp.visible() then
                                                cmp.select_next_item()
                                        else
                                                cmp.complete()
                                        end
                                end, { 'i', 'c' }),
                                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        },
                        sources = {
                                { name = 'nvim_lsp'},
                                { name = 'buffer' },
                                { name = 'path' },
                        },
                        formatting = {
                                format = function(entry, vim_item)
                                        vim_item.menu = ({
                                                buffer = "[Buffer]",
                                                path = "[Path]",
                                                nvim_lsp = "[LSP]"
                                        })[entry.source.name]
                                        return vim_item
                                end,
                        },
                        preselect = cmp.PreselectMode.Item,
                        completion = {
                                autocomplete = false,
                                completeopt = "menu,menuone,noinsert"
                        },
                        window = {
                                documentation = cmp.config.disable
                        }
                })
        end
}

-- Setup lazy.nvim
require("lazy").setup({
        spec = {
                treesitter,
                fzf,
                harpoon,
                lsp,
                nvim_cmp
        },
        install = { colorscheme = { "minioding" } },
})

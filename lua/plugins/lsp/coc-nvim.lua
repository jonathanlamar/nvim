return {
    "neoclide/coc.nvim",
    branch = "release",
    build = "npm ci",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Extensions
        vim.g.coc_global_extensions = {
            "coc-java",
            "coc-json",
            "coc-pairs",
            "coc-prettier",
            "coc-pyright",
            "coc-scala",
            "coc-sumneko-lua",
            "coc-tsserver",
        }

        -- Autocomplete
        function _G.check_back_space()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
        end

        -- Use Tab for trigger completion with characters ahead and navigate
        -- NOTE: There's always a completion item selected by default, you may want to enable
        -- no select by setting `"suggest.noselect": true` in your configuration file
        -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
        -- other plugins before putting this into your config
        local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
        vim.keymap.set(
            "i",
            "<TAB>",
            'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
            opts
        )
        vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

        -- Make <CR> to accept selected completion item or notify coc.nvim to format
        -- <C-g>u breaks current undo, please make your own choice
        vim.keymap.set(
            "i",
            "<cr>",
            [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
            opts
        )

        -- Use <c-j> to trigger snippets
        vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
        -- Use <c-space> to trigger completion
        vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

        -- Use `[g` and `]g` to navigate diagnostics
        -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
        vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
        vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

        -- GoTo code navigation
        vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
        vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
        vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
        vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

        -- Use K to show documentation in preview window
        function _G.show_docs()
            local cw = vim.fn.expand("<cword>")
            if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
                vim.api.nvim_command("h " .. cw)
            elseif vim.api.nvim_eval("coc#rpc#ready()") then
                vim.fn.CocActionAsync("doHover")
            else
                vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
            end
        end
        vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

        -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
        vim.api.nvim_create_augroup("CocGroup", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "CocGroup",
            command = "silent call CocActionAsync('highlight')",
            desc = "Highlight symbol under cursor on CursorHold",
        })
        -- TODO Convert this to lua, or don't
        vim.cmd([[autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif]])

        -- Symbol renaming
        vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

        -- Setup formatexpr specified filetype(s)
        vim.api.nvim_create_autocmd("FileType", {
            group = "CocGroup",
            pattern = "typescript,json",
            command = "setl formatexpr=CocAction('formatSelected')",
            desc = "Setup formatexpr specified filetype(s).",
        })

        -- Update signature help on jump placeholder
        vim.api.nvim_create_autocmd("User", {
            group = "CocGroup",
            pattern = "CocJumpPlaceholder",
            command = "call CocActionAsync('showSignatureHelp')",
            desc = "Update signature help on jump placeholder",
        })

        -- Apply codeAction to the selected region
        -- Example: `<leader>aap` for current paragraph
        local opts = { silent = true, nowait = true }
        vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
        vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

        -- Remap keys for apply code actions at the cursor position.
        vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
        -- Remap keys for apply source code actions for current file.
        vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
        -- Apply the most preferred quickfix action on the current line.
        vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

        -- Remap keys for apply refactor code actions.
        vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
        vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
        vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

        -- Run the Code Lens actions on the current line
        vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

        -- Map function and class text objects
        -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
        vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)", opts)
        vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)", opts)
        vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)", opts)
        vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)", opts)
        vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)", opts)
        vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)", opts)
        vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)", opts)
        vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)", opts)

        -- Remap <C-f> and <C-b> to scroll float windows/popups
        ---@diagnostic disable-next-line: redefined-local
        local opts = { silent = true, nowait = true, expr = true }
        vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
        vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
        vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
        vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
        vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

        -- Use CTRL-S for selections ranges
        -- Requires 'textDocument/selectionRange' support of language server
        vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
        vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })

        -- Add `:Format` command to format current buffer
        vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

        -- " Add `:Fold` command to fold current buffer
        vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })

        -- Add `:OR` command for organize imports of the current buffer
        vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
    end,
}

local on_attach = function(client, bufnr)

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end

    local cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
                   -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                     -- set to 0 if you do not want any API comments be shown
                     -- This setting only take effect in insert mode, it does not affect signature help in normal
                     -- mode
        hint_prefix = "▸ ",
        handler_opts = {
            border = "single"   -- double, single, shadow, none
        },
        decorator = {"`", "`"},  -- decoractor can be `decorator = {"***", "***"}`  `decorator = {"**", "**"}` `decorator = {"**_", "_**"}`
                                 -- `decorator = {"*", "*"} see markdown help for more details
                                 -- <u></u> ~ ~ does not supported by nvim

        hint_enable = true, -- virtual hint enable
        use_lspsaga = false,  -- set to true if you want to use lspsaga popup
    }

    -- I don't get this whole on_attach thing.
    require('lsp_signature').on_attach(cfg)
end


local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- LSPs
local servers = { "pyright",  "metals", "tsserver" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { 
        capabilities = capabilities;
        on_attach = on_attach;
        -- init_options = {
        --     onlyAnalyzeProjectsWithOpenFiles = true,
        --     suggestFromUnimportedLibraries = false,
        --     closingLabels = true,
        -- };
    }
end

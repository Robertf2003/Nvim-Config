return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            lua = { 'stylua' },
            python = { 'black' },
            rust = { 'rustfmt' },
            sh = { 'shfmt' },
            typescript = { 'prettier' },
            javascript = { 'prettier' },
            json = { 'prettier' },
            yaml = { 'prettier' },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    init = function() 
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}

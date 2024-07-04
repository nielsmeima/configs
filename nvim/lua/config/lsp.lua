-- require("nvim-lsp-installer").setup {
-- 	automatic_installation = true
-- }

local servers = require("consts").language_servers

require("mason-lspconfig").setup {
	automatic_installation = true
}


vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>zz', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>zz', opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<space>h', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<space>s', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	--vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in pairs(servers) do
	local settings = lsp.settings

	if lsp.name ~= "rust_analyzer" then
		if lsp['cmd'] ~= nil then
			settings['cmd'] = lsp['cmd']
		end

		require('lspconfig')[lsp.name].setup {
			on_attach = on_attach,
			-- cmd = { "/usr/local/bin/ra-multiplex", "client" },
			capabilities = capabilities,
			settings = lsp.settings

		}
	end
end

require('lspconfig').rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	-- cmd = { "/usr/local/bin/ra-multiplex", "client" },
	settings = {
		["rust-analyzer"] = {
			server = {
				path = "/Users/nielsmeima/.local/share/nvim/mason/bin/rust-analyzer"
			},
			completion = {
				autoimport = {
					enable = true
				},
			},
			checkOnSave = true,
			check = {
				command = "clippy"
				-- extraArgs = { "--target", "x86_64-unknown-linux-musl" }
			},
			cargo = {
				autoreload = true,
				buildScripts = {
					enable = true,
				}
			}
		}
	}
}

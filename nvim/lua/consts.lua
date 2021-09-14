
-- based around LSP
local language_servers = {
	"bashls", 		-- Bash: npm i -g bash-language-server
	"dockerls", 		-- Dockerfile: npm install -g dockerfile-language-server-nodejs
	"gopls", 		-- Golang: GO111MODULE=on go get golang.org/x/tools/gopls@latest
	"jsonls", 		-- JSON: npm i -g vscode-langservers-extracted
	"julials", 		-- Julia: julia -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'
	"pyright", 		-- Python: npm install -g pyright
	"rust_analyzer",			-- Rust: rustup update && rustup component add rls rust-analysis rust-src
	"sumneko_lua",  	-- Lua: git clone https://github.com/sumneko/lua-language-server && cd lua-language-server && git submodule update --init --recursive && cd 3rd/luamake && compile/install.sh && cd ../.. && ./3rd/luamake/luamake rebuild
	"texlab",       	-- Latex: cargo install --git https://github.com/latex-lsp/texlab.git --locked
	"tsserver", 		-- TypeScript: npm install -g typescript typescript-language-server
	"yamlls", 		-- YAML: yarn global add yaml-language-server
}

return { 
	language_servers = language_servers, 
	debug_servers = debug_servers 
}

-- Native LSP setup -- {{{
-- Installing a GUI for lsps
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
-- Defining the parameters.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- Ensuring synchronization
local on_attach = function(client,bufnr)
    
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end                                  	

	local opts = {noremap = true, silent = true}

	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
	
end
-- Server setup for different languages
local servers = {'pyright', 'rust_analyzer', 'gopls', 'clangd', 'jdtls'}
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup{
		capabilities = capabilities,
		on_attach = on_attach,
	}
end
-- endof setup -- }}}








-- Setting up nvim-cmp -- {{{

-- set completeopt=menu,menuone,noselect
-- The above line is equivalent to the below one in lua
vim.opt.completeopt={"menu", "menuone", "noselect"}
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' }, 
    }, {
      { name = 'buffer', keyword_length = 5 },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

-- endof setup -- }}}




-- Telescope setup -- {{{
local action_state = require('telescope.actions.state') -- loads in runtime (PlugInstall) the module in lua/telescope/actions/state.lua
require('telescope').setup{
	defaults = {
		prompt_prefix = ">>> ",
		mappings = {
			i = {
				["<c-f>"] = function() print('qberg did this!') end
			}		
		}	
	}
}
require('telescope').load_extension('fzf')

-- Doing the key mappings in lua.
-- By default all variables in lua are global.
-- local is how we specify variables are not global.
 local mappings = {
 
 }
 mappings.ff = function()	
 	require('telescope.builtin').find_files()
 end
 mappings.curr_buff = function()
 	-- local opt = require('telescope.themes').get_dropdown({height=10}) 
 	require('telescope.builtin').current_buffer_fuzzy_find()
 end
 return mappings

 -- endof setup -- }}}

local map = vim.keymap.set

local function load_mappings()
	local maps = {
		["<Tab>"] = ":bnext!<CR>",
		["<S-Tab>"] = ":bprevious!<CR>",
		["<Del>"] = ":bdelete<CR>",
		["<S-Del>"] = ":bdelete!<CR>",
		["<C-a>"] = ":badd ",
		["<C-j>"] = "<C-W><C-J>",
		["<C-k>"] = "<C-W><C-K>",
		["<C-l>"] = "<C-W><C-L>",
		["<C-h>"] = "<C-W><C-H>",
		["<Esc>"] = ":noh<CR>",
		["<leader>e"] = ":NvimTreeToggle<CR>",
		["<leader>l"] = ":Lazy<CR>",
		["<leader>f"] = ":Telescope find_files<CR>",
		["<leader>b"] = ":Telescope buffers<CR>",
		["<leader>g"] = ":Telescope live_grep<CR>",
		["<leader>s"] = ":Telescope grep_string<CR>",
		["<C-d>"] = "<C-d>zz",
		["<C-u>"] = "<C-u>zz",
		["<C-v>"] = "<C-W><C-v>",
		["<C-s>"] = "<C-W><C-s>",
		["<A-Left>"] = "<C-W><",
		["<A-Right>"] = "<C-W>>",
		["<A-Down>"] = "<C-W>+",
		["<A-Up>"] = "<C-W>-",
	}

	for name, value in pairs(maps) do
		map("n", name, value)
	end

end

load_mappings()

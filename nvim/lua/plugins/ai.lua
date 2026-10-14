return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"nickjvandyke/opencode.nvim",
		dependencies = {
			{
				---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
				"folke/snacks.nvim",
				optional = true,
				opts = {
					input = {}, -- Enhances `ask()`
					picker = { -- Enhances `select()`
						actions = {
							opencode_send = function(picker)
								local items = vim.tbl_map(function(item)
									return item.file
										and require("opencode").format({ path = item.file, from = item.pos, to = item.end_pos })
										or item.text
									end, picker:selected({ fallback = true }))

								require("opencode").prompt(table.concat(items, ", ") .. " ")
							end,
						},
						win = {
							input = {
								keys = {
									["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
								},
							},
						},
					},
				},
			},
		},
		config = function()
			local opencode_cmd = "opencode"
			---@type snacks.terminal.Opts
			local snacks_terminal_opts = {
				win = {
					position = "right",
					enter = false,
				},
			}

			---@type opencode.Opts
			vim.g.opencode_opts = {
				server = {
					start = function()
						require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
					end,
				},
			}

			vim.o.autoread = true -- Required for `opts.events.reload`

			-- Recommended/example keymaps
			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ")
			end, { desc = "Ask opencode…" })
			vim.keymap.set({ "n", "x" }, "<leader>op", function()
				require("opencode").select()
			end, { desc = "Execute opencode action…" })
			vim.keymap.set({ "n", "t" }, "<A-o>", function()
				require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
			end, { desc = "Toggle opencode" })

			vim.keymap.set({ "n", "x" }, "go", function()
				return require("opencode").operator("@this")
			end, { desc = "Add range to opencode", expr = true })
			vim.keymap.set("n", "goo", function()
				return require("opencode").operator("@this") .. "_"
			end, { desc = "Add line to opencode", expr = true })

			vim.keymap.set("n", "<leader>os", function()
				local terminal = require("snacks.terminal").get(opencode_cmd, { create = false })
				if terminal then
					terminal:close()
				end
			end, { desc = "Close opencode terminal" })

			-- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
			vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
			vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
		end,
	},
}

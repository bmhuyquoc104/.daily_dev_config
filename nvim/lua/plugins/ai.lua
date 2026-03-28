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
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("codecompanion").setup({
	-- 			prompt_library = {
	-- 				["Code Expert"] = {
	-- 					strategy = "chat",
	-- 					description = "Get some special advice from an LLM",
	-- 					opts = {
	-- 						short_name = "expert",
	-- 						auto_submit = true,
	-- 						stop_context_insertion = true,
	-- 						user_prompt = true,
	-- 					},
	-- 					prompts = {
	-- 						{
	-- 							role = "system",
	-- 							content = function(context)
	-- 								return "I want you to act as a senior "
	-- 									.. context.filetype
	-- 									.. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
	-- 							end,
	-- 						},
	-- 						{
	-- 							role = "user",
	-- 							content = function(context)
	-- 								local text = require("codecompanion.helpers.actions").get_code(
	-- 									context.start_line,
	-- 									context.end_line
	-- 								)
	--
	-- 								return "I have the following code:\n\n```"
	-- 									.. context.filetype
	-- 									.. "\n"
	-- 									.. text
	-- 									.. "\n```\n\n"
	-- 							end,
	-- 							opts = {
	-- 								contains_code = true,
	-- 							},
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 			display = {
	-- 				chat = {
	-- 					auto_scroll = false,
	-- 					icons = {
	-- 						chat_context = "📎️", -- You can also apply an icon to the fold
	-- 					},
	-- 					intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
	-- 					show_header_separator = false,
	-- 					separator = "─",
	-- 					fold_context = true,
	-- 					show_references = true,
	-- 					show_settings = false,
	-- 					show_token_count = true,
	-- 					start_in_insert_mode = false, -- Open the chat buffer in insert mode?
	-- 					window = {
	-- 						position = "right",
	-- 					},
	-- 				},
	-- 			},
	-- 			interactions = {
	-- 				chat = {
	-- 					opts = {
	-- 						completion_provider = "blink",
	-- 					},
	-- 					roles = {
	-- 						user = "Huyne104",
	-- 					},
	-- 					adapter = {
	-- 						name = "copilot",
	-- 						model = "gpt-5.4",
	-- 					},
	-- 				},
	-- 				inline = {
	-- 					adapter = {
	-- 						name = "copilot",
	-- 						model = "gpt-5.4",
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<CR>", { noremap = true, silent = true })
	-- 		vim.keymap.set(
	-- 			{ "n", "v" },
	-- 			"<leader>co",
	-- 			"<cmd>CodeCompanionChat Toggle<cr>",
	-- 			{ noremap = true, silent = true }
	-- 		)
	-- 		vim.keymap.set({ "v" }, "<leader>ce", "<cmd>CodeCompanion /expert<cr>", { noremap = true, silent = true })
	-- 	end,
	-- },

	{
		"nickjvandyke/opencode.nvim",
		version = "*", -- Latest stable release
		dependencies = {
			{
				---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
				"folke/snacks.nvim",
				optional = true,
				opts = {
					input = {}, -- Enhances `ask()`
					picker = { -- Enhances `select()`
						actions = {
							opencode_send = function(...)
								return require("opencode").snacks_picker_send(...)
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
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any; goto definition on the type or field for details
			}

			vim.o.autoread = true -- Required for `opts.events.reload`

			-- Recommended/example keymaps
			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "Ask opencode…" })
			vim.keymap.set({ "n", "x" }, "<leader>op", function()
				require("opencode").select()
			end, { desc = "Execute opencode action…" })
			vim.keymap.set({ "n", "t" }, "<leader>ot", function()
				require("opencode").toggle()
			end, { desc = "Toggle opencode" })

			vim.keymap.set({ "n", "x" }, "go", function()
				return require("opencode").operator("@this ")
			end, { desc = "Add range to opencode", expr = true })
			vim.keymap.set("n", "goo", function()
				return require("opencode").operator("@this ") .. "_"
			end, { desc = "Add line to opencode", expr = true })

			vim.keymap.set("n", "<S-C-u>", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "Scroll opencode up" })
			vim.keymap.set("n", "<S-C-d>", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "Scroll opencode down" })

			vim.keymap.set("n", "<leader>os", function()
				require("opencode.terminal").stop()
			end, { desc = "Stop opencode server" })

			-- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
			vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
			vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
		end,
	},
}

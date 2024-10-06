vim.api.nvim_create_user_command(
  'Rspec',
  function(opts)
    -- Use vim.fn.expand to get the current file if no argument is passed
    local test_path
    if opts.args ~= "" then
      test_path = opts.args  -- Use the argument passed to the command
    else
      test_path = vim.api.nvim_call_function("expand", {"%"})  -- Get the current file
    end

    -- Run the test for the specified path with a callback to open output after test completes
    require("neotest").run.run(test_path, function()
      -- This function will be called once the test is completed
      require("neotest").output.open({ enter = true })
    end)
  end,
  { nargs = "?" } -- Allow either zero or one argument
)


return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = '*', -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      -- for example
      providers = {
        openai = {
          endpoint = 'https://api.openai.com/v1',
          model = 'gpt-4o', -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- timeout in milliseconds
          extra_request_body = {
            temperature = 0, -- adjust if needed
            max_tokens = 4096,
          },
        },
        gemini = {
          model = 'gemini-2.5-pro',
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'echasnovski/mini.icons',
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}

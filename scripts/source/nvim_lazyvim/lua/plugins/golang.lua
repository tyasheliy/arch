return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            buildFlags = { "-tags=integration" },
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = false,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
    },
  },
}

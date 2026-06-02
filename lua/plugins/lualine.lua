return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local conditions = {
            screen_width = function(width)
                return function()
                    return vim.fn.winwidth(0) > width
                end
            end,
        }

        -- Rebuild the statusline from kanagawa's palette for the active background.
        -- Re-run on every ColorScheme event so toggling light/dark updates the colors.
        local function build()
            local variant = vim.o.background == "light" and "lotus" or "dragon"
            local theme = require('kanagawa.colors').setup({ theme = variant }).theme
            local colors = {
                fg     = theme.ui.fg,
                bg     = theme.ui.bg,
                green  = theme.vcs.added,
                orange = theme.vcs.changed,
                red    = theme.diag.error,
                yellow = theme.diag.warning,
                cyan   = theme.diag.info,
            }

            local config = {
                options = {
                    theme = {
                        normal = { c = { fg = colors.fg, bg = colors.bg } },
                        inactive = { c = { fg = colors.fg, bg = colors.bg } },
                    },
                    component_separators = "",
                    section_separators = "",
                },
                sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            }

            local function ins_left(component)
                table.insert(config.sections.lualine_c, component)
            end
            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
            end

            ins_left({
                "branch",
                icon = " ",
                color = { fg = colors.fg, bg = colors.bg, gui = "bold" },
            })
            ins_left({
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = "x ", warn = "w ", info = "i " },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.cyan },
                },
            })

            ins_right {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = { added = '+ ', modified = '/ ', removed = '- ' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
            }
            ins_right({
                "location",
                color = { fg = colors.fg_dark },
                cond = conditions.buffer_not_empty,
            })
            ins_right({
                "encoding",
            })
            ins_right({
                "filetype",
            })

            require('lualine').setup(config)
        end

        build()
        vim.api.nvim_create_autocmd("ColorScheme", { callback = build })
    end,
}

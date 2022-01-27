# My NeoVim Configuration


## Structure

Each plugin to be installed is defined in `plugins.lua` and each plugin has its own configuration file (if necessary) in `lua/config` which is loaded by packer.

```
.
├── after
│   └── ftplugin      # file specific settings
├── init.lua          # main entry point
├── lua
│   ├── autocmd.lua   # vim autocommands
│   ├── config/       # each plugin configuration is in its own file
│   ├── mappings.lua  # Vim keymaps defintions -> config/which.lua for more
│   ├── options.lua   # non plugin related (vim) options
│   └── plugins.lua   # define plugins to be managed via Packer
├── plugin            # packer_compiled
├── snippets          # snippets for vsnip
└── spell             # my spell files linked from another repo
```

## Useful non leader bindings

| Mode | key           | binding                                  |
| ---- | ------------- | ---------------------------------------- |
| n    | space         | Leader key                               |

## Inspiration

- [Allaman](https://github.com/Allaman/nvim.git)



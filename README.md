# os-locale-lune

## Install
```
git submodule add submodule/os-locale-lune
```

## example
```lua
--!strict
local osLocale = require'path'
print(osLocale())
--// ko-KR
```

## Parameters
```lua
local osLocale = require'path'

--// spawn (boolean)
osLocale(spawn: boolean?)
```

## make a type
```lua
local fs = require'@lune/fs'
local icid = require('Icid')
local result = 'export type icid = '

for k, v in icid do
    result = if result ~= '' then `{result} | "{v:gsub('_', '-')}"` else `"{v:gsub('_', '-')}"`
end

fs.writeFile('type.luau', result)
```

## note by [os-locale](https://github.com/sindresorhus/os-locale)
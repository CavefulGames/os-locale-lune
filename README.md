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
osLocale(spawn: boolean)
```

## note by os-[locale](https://github.com/sindresorhus/os-locale)
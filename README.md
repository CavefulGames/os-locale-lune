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
type inverted = osLocale.inverted

--// spawn (boolean)
osLocale(spawn: boolean?): inverted
```

## note by [os-locale](https://github.com/sindresorhus/os-locale)
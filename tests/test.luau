local init = require'../init'
print(init())
--// ko_KR.UTF-8

local resultEnv = (require'@lune/process'.env)

local t = resultEnv.LC_ALL or resultEnv.LC_MESSAGES or resultEnv.LANG or resultEnv.LANGUAGE
print(t)
--// ko_KR.UTF-8
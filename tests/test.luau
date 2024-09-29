--!strict
local init = require'../init'
print(init())
--// ko_KR

-- local resultEnv = (require'@lune/process'.env)

-- local regex = require'../submodule/luau-regex/src'

-- local function replace(str, pattern, replacement:((string) -> string) | string | { [string]: string }?)
--     return string.gsub(str, pattern, if replacement then replacement else '')
-- end

-- function getLocale(string) {
-- 	return (string && string.replace(/[.:].*/, ''));
-- }

-- function getLocale(str: string)
--     return str and str:gsub(('[.:].*'), "")
-- end

-- local t = resultEnv.LC_ALL or resultEnv.LC_MESSAGES or resultEnv.LANG or resultEnv.LANGUAGE
-- print(getLocale(t))

-- local function convert_locale_string(input)
--     -- 첫 번째로 밑줄을 대시로 변환
--     -- local result = input:gsub("_", "-")
    
--     -- 두 번째로 마침표(.) 또는 콜론(:) 이후의 모든 부분을 제거
--     input = input:gsub("[.:].*", "")
    
--     return input
-- end

-- 사용 예시
-- local input = "ko_KR.UTF-8"
-- local output = convert_locale_string(input)
-- print(output)  -- 출력: ko-KR


-- print(replace(t, require'../submodule/luau-regex/src''/[.:].*/':exec(t)))
-- print()
-- print(t)
--// ko_KR.UTF-8
--!strict

local process = require"@lune/process"

local inverted = require'Icid'

local function replace(str, pattern, replacement:((string) -> string) | string | { [string]: string }?)
    return string.gsub(str, pattern, if replacement then replacement else '')
end

local defaultOptions = true;
local defaultLocale = 'en-US';

local osLocale = {}

function osLocale.getStdOut(command, args)
    return process.spawn(command, args).stdout
end 

function osLocale.getEnvLocale(env: { LANG: any?, LANGUAGE: any?, LC_ALL: any?, LC_MESSAGES: any? }?)
    local resultEnv = if env == nil then process.env else env :: any
    return resultEnv.LC_ALL or resultEnv.LC_MESSAGES or resultEnv.LANG or resultEnv.LANGUAGE
end

function osLocale.parseLocale(str: string)
    local env = process.env
    for k, v in str:split('\n') do
        local result = v.split('=')
        env[result[1]] = replace(result[2], '^"|"$')
    end
    return osLocale.getEnvLocale(env);
end

function osLocale.getLocale(str: string) 
    return if str then replace(str, '[.:].*') else nil
end

function osLocale.getLocales()
    return osLocale.getStdOut('locale', { '-a' })
end

function osLocale.getSupportedLocale(locale, locales)
    locales = if locales == nil then '' else locales :: string 
	return if locales:find(locale) then locale else defaultLocale
end

function osLocale.getAppleLocale() 
	local results = {
		osLocale.getStdOut('defaults', { 'read', '-globalDomain', 'AppleLocale' }),
		osLocale.getLocales(),
    }

	return osLocale.getSupportedLocale(results[1], results[2]);
end

function osLocale.getUnixLocale() 
	return osLocale.getLocale(osLocale.parseLocale(osLocale.getStdOut('locale')));
end

function osLocale.getWinLocale()
	local stdout = osLocale.getStdOut('wmic', { 'os', 'get', 'locale' });
	local lcidCode =  tonumber(replace(stdout, 'Locale'), 16) :: number
    
	return inverted[lcidCode];
end

function normalise(input)
	return replace(input, '_', '-');
end

local cache = {};

return function(spawn: boolean?): inverted.icid
	spawn = if spawn == nil then defaultOptions else spawn
    if cache[spawn] then 
		return cache[spawn]
    end 

	local locale;

    local envLocale = osLocale.getEnvLocale() 

    if envLocale or spawn == false then
        locale = osLocale.getLocale(envLocale)
    elseif process.os == 'windows' then
        locale = osLocale.getWinLocale()
    elseif process.os == 'macos' then
        locale = osLocale.getAppleLocale()
    else
        locale = osLocale.getUnixLocale()
    end

    local normalised = normalise(locale or defaultLocale)
	cache[spawn] = normalised

	return normalised :: inverted.icid
end

 
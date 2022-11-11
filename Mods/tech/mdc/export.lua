local lfs = require('lfs')
local dataPath = lfs.writedir() .. 'Data\\mdc\\'

local logFile = io.open(lfs.writedir() .. "Logs\\mdc.log", "w")

local previousExports = {
	luaExportActivityNextEvent = LuaExportActivityNextEvent,
	luaExportStart = LuaExportStart
}

local buttons = {
	-- A-10C
	CDU_LSK_3L = { 9, 3001 },
	CDU_LSK_5L = { 9, 3002 },
	CDU_LSK_7L = { 9, 3003 },
	CDU_LSK_9L = { 9, 3004 },
	CDU_LSK_3R = { 9, 3005 },
	CDU_LSK_5R = { 9, 3006 },
	CDU_LSK_7R = { 9, 3007 },
	CDU_LSK_9R = { 9, 3008 },
	CDU_SYS = { 9, 3009 },
	CDU_NAV = { 9, 3010 },
	CDU_WP = { 9, 3011 },
	CDU_OSET = { 9, 3012 },
	CDU_FPM = { 9, 3013 },
	CDU_PREV = { 9, 3014 },
	CDU_1 = { 9, 3015 },
	CDU_2 = { 9, 3016 },
	CDU_3 = { 9, 3017 },
	CDU_4 = { 9, 3018 },
	CDU_5 = { 9, 3019 },
	CDU_6 = { 9, 3020 },
	CDU_7 = { 9, 3021 },
	CDU_8 = { 9, 3022 },
	CDU_9 = { 9, 3023 },
	CDU_0 = { 9, 3024 },
	CDU_POINT = { 9, 3025 },
	CDU_SLASH = { 9, 3026 },
	CDU_A = { 9, 3027 },
	CDU_B = { 9, 3028 },
	CDU_C = { 9, 3029 },
	CDU_D = { 9, 3030 },
	CDU_E = { 9, 3031 },
	CDU_F = { 9, 3032 },
	CDU_G = { 9, 3033 },
	CDU_H = { 9, 3034 },
	CDU_I = { 9, 3035 },
	CDU_J = { 9, 3036 },
	CDU_K = { 9, 3037 },
	CDU_L = { 9, 3038 },
	CDU_M = { 9, 3039 },
	CDU_N = { 9, 3040 },
	CDU_O = { 9, 3041 },
	CDU_P = { 9, 3042 },
	CDU_Q = { 9, 3043 },
	CDU_R = { 9, 3044 },
	CDU_S = { 9, 3045 },
	CDU_T = { 9, 3046 },
	CDU_U = { 9, 3047 },
	CDU_V = { 9, 3048 },
	CDU_W = { 9, 3049 },
	CDU_X = { 9, 3050 },
	CDU_Y = { 9, 3051 },
	CDU_Z = { 9, 3052 },

	-- FA-18C_hornet
	UFC_OS1 = { 25, 3010 },
	UFC_OS2 = { 25, 3011 },
	UFC_OS3 = { 25, 3012 },
	UFC_OS4 = { 25, 3013 },
	UFC_OS5 = { 25, 3014 },
	UFC_IP = { 25, 3015 }, 
	UFC_EMC = { 25, 3017 },
	UFC_0 = { 25, 3018 },
	UFC_1 = { 25, 3019 },
	UFC_2 = { 25, 3020 },
	UFC_3 = { 25, 3021 },
	UFC_4 = { 25, 3022 },
	UFC_5 = { 25, 3023 },
	UFC_6 = { 25, 3024 },
	UFC_7 = { 25, 3025 },
	UFC_8 = { 25, 3026 },
	UFC_9 = { 25, 3027 },
	UFC_CLR = { 25, 3028 },
	UFC_ENT = { 25, 3029 },
	AMPCD_PB_01 = { 37, 3011 },
	AMPCD_PB_02 = { 37, 3012 },
	AMPCD_PB_03 = { 37, 3013 },
	AMPCD_PB_04 = { 37, 3014 },
	AMPCD_PB_05 = { 37, 3015 },
	AMPCD_PB_06 = { 37, 3016 },
	AMPCD_PB_07 = { 37, 3017 },
	AMPCD_PB_08 = { 37, 3018 },
	AMPCD_PB_09 = { 37, 3019 },
	AMPCD_PB_10 = { 37, 3020 },
	AMPCD_PB_11 = { 37, 3021 },
	AMPCD_PB_12 = { 37, 3022 },
	AMPCD_PB_13 = { 37, 3023 },
	AMPCD_PB_14 = { 37, 3024 },
	AMPCD_PB_15 = { 37, 3025 },
	AMPCD_PB_16 = { 37, 3026 },
	AMPCD_PB_17 = { 37, 3027 },
	AMPCD_PB_18 = { 37, 3028 },
	AMPCD_PB_19 = { 37, 3029 },
	AMPCD_PB_20 = { 37, 3030 },

	-- F-16C_50
	ICP_1 = { 17, 3003 },
	ICP_2 = { 17, 3004 },
	ICP_3 = { 17, 3005 },
	ICP_4 = { 17, 3006 },
	ICP_5 = { 17, 3007 },
	ICP_6 = { 17, 3008 },
	ICP_7 = { 17, 3009 },
	ICP_8 = { 17, 3010 },
	ICP_9 = { 17, 3011 },
	ICP_0 = { 17, 3002 },
	ICP_ENTR = { 17, 3016 },
	ICP_RTN = { 17, 3032, -1 },
	ICP_SEQ = { 17, 3033 },
	ICP_UP = { 17, 3034 },
	ICP_DN = { 17, 3035, -1 },
	ICP_INC = { 17, 3030 },
	ICP_DEC = { 17, 3031 },

	-- F-14B
	RIO_CAP_BTN_1 = { 23, 3518 },
	RIO_CAP_BTN_2 = { 23, 3519 },
	RIO_CAP_BTN_3 = { 23, 3520 },
	RIO_CAP_BTN_4 = { 23, 3521 },
	RIO_CAP_BTN_5 = { 23, 3522 },
	RIO_CAP_BTN_6 = { 23, 3523 },
	RIO_CAP_BTN_7 = { 23, 3524 },
	RIO_CAP_BTN_8 = { 23, 3525 },
	RIO_CAP_BTN_9 = { 23, 3526 },
	RIO_CAP_BTN_10 = { 23, 3527 },
	RIO_CAP_BRG_0 = { 23, 3535 },
	RIO_CAP_LAT_1 = { 23, 3536 },
	RIO_CAP_NBR_2 = { 23, 3537 },
	RIO_CAP_SPD_3 = { 23, 3538 },
	RIO_CAP_ALT_4 = { 23, 3539 },
	RIO_CAP_RNG_5 = { 23, 3540 },
	RIO_CAP_LONG_6 = { 23, 3541 },
	RIO_CAP_7 = { 23, 3542 },
	RIO_CAP_HDG_8 = { 23, 3543 },
	RIO_CAP_9 = { 23, 3544 },
	RIO_CAP_SW = { 23, 3532 },
	RIO_CAP_NE = { 23, 3533 },
	RIO_CAP_CLEAR = { 23, 3531 },
	RIO_CAP_ENTER = { 23, 3534 },
	
	-- AH-64
	R_MPD_U1 = { 43, 3001 },
	R_MPD_U2 = { 43, 3002 },
	R_MPD_U3 = { 43, 3003 },
	R_MPD_U4 = { 43, 3004 },
	R_MPD_U5 = { 43, 3005 },
	R_MPD_U6 = { 43, 3006 },

	R_MPD_R1 = { 43, 3007 },
	R_MPD_R2 = { 43, 3008 },
	R_MPD_R3 = { 43, 3009 },
	R_MPD_R4 = { 43, 3010 },
	R_MPD_R5 = { 43, 3011 },
	R_MPD_R6 = { 43, 3012 },
	
	R_MPD_B6 = { 43, 3013 },
	R_MPD_B5 = { 43, 3014 },
	R_MPD_B4 = { 43, 3015 },
	R_MPD_B3 = { 43, 3016 },
	R_MPD_B2 = { 43, 3017 },
	R_MPD_B1 = { 43, 3018 },	
	
	R_MPD_L6 = { 43, 3019 },
	R_MPD_L5 = { 43, 3020 },
	R_MPD_L4 = { 43, 3021 },
	R_MPD_L3 = { 43, 3022 },
	R_MPD_L2 = { 43, 3023 },
	R_MPD_L1 = { 43, 3024 },
	
	R_MPD_STERN = { 43, 3025 },
	R_MPD_VID = { 43, 3026 },
	R_MPD_COM = { 43, 3027 },
	R_MPD_AC = { 43, 3028 },
	R_MPD_TSD = { 43, 3029 },	
	R_MPD_WPN = { 43, 3030 },
	R_MPD_FCR = { 43, 3031 },	

	KU_CLR = { 29, 3001 },
	KU_BACK = { 29, 3002 },
	KU_SPACE = { 29, 3003 },
	KU_LEFT = { 29, 3004 },
	KU_RIGHT = { 29, 3005 },
	KU_ENTER = { 29, 3006 },
	
	KU_A = { 29, 3007 },
	KU_B = { 29, 3008 },
	KU_C = { 29, 3009 },
	
	KU_D = { 29, 3010 },
	KU_E = { 29, 3011 },
	KU_F = { 29, 3012 },
	KU_G = { 29, 3013 },
	KU_H = { 29, 3014 },
	KU_I = { 29, 3015 },
	KU_J = { 29, 3016 },
	KU_K = { 29, 3017 },
	KU_L = { 29, 3018 },
	KU_M = { 29, 3019 },
	
	KU_N = { 29, 3020 },
	KU_O = { 29, 3021 },
	KU_P = { 29, 3022 },
	KU_Q = { 29, 3023 },
	KU_R = { 29, 3024 },
	KU_S = { 29, 3025 },
	KU_T = { 29, 3026 },
	KU_U = { 29, 3027 },
	KU_V = { 29, 3028 },
	KU_W = { 29, 3029 },
	
	KU_X = { 29, 3030 },	
	KU_Y = { 29, 3031 },
	KU_Z = { 29, 3032 },	
	KU_1 = { 29, 3033 },
	KU_2 = { 29, 3034 },
	KU_3 = { 29, 3035 },
	KU_4 = { 29, 3036 },
	KU_5 = { 29, 3037 },
	KU_6 = { 29, 3038 },
	KU_7 = { 29, 3039 },
	
	KU_8 = { 29, 3040 },	
	KU_9 = { 29, 3041 },
	KU_DOT = { 29, 3042 },
	KU_0 = { 29, 3043 },
	KU_PLUS_MINUS = { 29, 3044 },	
	KU_SLASH = { 29, 3045 },		
	KU_MINUS = { 29, 3046 },	
	KU_DURCH = { 29, 3047 },
	KU_PLUS = { 29, 3048 },
	KU_MAL = { 29, 3049 },

	-- AV-8B N/A
	AV8BNA_ODU1 = { 24, 3250 },
	AV8BNA_ODU2 = { 24, 3251 },
	AV8BNA_ODU3 = { 24, 3252 },
	AV8BNA_ODU4 = { 24, 3248 },
	AV8BNA_ODU5 = { 24, 3249 },

	AV8BNA_UFC_IP = { 23, 3297 },
	AV8BNA_UFC_ENTER = { 23, 3314 },
	
	AV8BNA_UFC_1 = { 23, 3302 },
	AV8BNA_UFC_2 = { 23, 3303 },
	AV8BNA_UFC_3 = { 23, 3304 },
	AV8BNA_UFC_4 = { 23, 3306 },
	AV8BNA_UFC_5 = { 23, 3307 },
	AV8BNA_UFC_6 = { 23, 3308 },
	AV8BNA_UFC_7 = { 23, 3310 },
	AV8BNA_UFC_8 = { 23, 3311 },
	AV8BNA_UFC_9 = { 23, 3312 },
	AV8BNA_UFC_0 = { 23, 3315 },
	AV8BNA_UFC_PUNKT = { 23, 3316 },
	AV8BNA_LEFT_MPCD_LEFT_BUTTON2 = { 26, 3201},
}

local cdu_map = {
	["0"] = buttons.CDU_0,
	["1"] = buttons.CDU_1,
	["2"] = buttons.CDU_2,
	["3"] = buttons.CDU_3,
	["4"] = buttons.CDU_4,
	["5"] = buttons.CDU_5,
	["6"] = buttons.CDU_6,
	["7"] = buttons.CDU_7,
	["8"] = buttons.CDU_8,
	["9"] = buttons.CDU_9,
	["A"] = buttons.CDU_A,
	["B"] = buttons.CDU_B,
	["C"] = buttons.CDU_C,
	["D"] = buttons.CDU_D,
	["E"] = buttons.CDU_E,
	["F"] = buttons.CDU_F,
	["G"] = buttons.CDU_G,
	["H"] = buttons.CDU_H,
	["I"] = buttons.CDU_I,
	["J"] = buttons.CDU_J,
	["K"] = buttons.CDU_K,
	["L"] = buttons.CDU_L,
	["M"] = buttons.CDU_M,
	["N"] = buttons.CDU_N,
	["O"] = buttons.CDU_O,
	["P"] = buttons.CDU_P,
	["Q"] = buttons.CDU_Q,
	["R"] = buttons.CDU_R,
	["S"] = buttons.CDU_S,
	["T"] = buttons.CDU_T,
	["U"] = buttons.CDU_U,
	["V"] = buttons.CDU_V,
	["W"] = buttons.CDU_W,
	["X"] = buttons.CDU_X,
	["Y"] = buttons.CDU_Y,
	["Z"] = buttons.CDU_Z,
}

local ufc_map = {
	["0"] = buttons.UFC_0,
	["1"] = buttons.UFC_1,
	["2"] = buttons.UFC_2,
	["3"] = buttons.UFC_3,
	["4"] = buttons.UFC_4,
	["5"] = buttons.UFC_5,
	["6"] = buttons.UFC_6,
	["7"] = buttons.UFC_7,
	["8"] = buttons.UFC_8,
	["9"] = buttons.UFC_9,
	["E"] = buttons.UFC_6,
	["N"] = buttons.UFC_2,
	["S"] = buttons.UFC_8,
	["W"] = buttons.UFC_4,
}

local icp_map = {
	["0"] = buttons.ICP_0,
	["1"] = buttons.ICP_1,
	["2"] = buttons.ICP_2,
	["3"] = buttons.ICP_3,
	["4"] = buttons.ICP_4,
	["5"] = buttons.ICP_5,
	["6"] = buttons.ICP_6,
	["7"] = buttons.ICP_7,
	["8"] = buttons.ICP_8,
	["9"] = buttons.ICP_9,
	["E"] = buttons.ICP_6,
	["N"] = buttons.ICP_2,
	["S"] = buttons.ICP_8,
	["W"] = buttons.ICP_4,
}

local cap_map = {
	["0"] = buttons.RIO_CAP_BRG_0,
	["1"] = buttons.RIO_CAP_LAT_1,
	["2"] = buttons.RIO_CAP_NBR_2,
	["3"] = buttons.RIO_CAP_SPD_3,
	["4"] = buttons.RIO_CAP_ALT_4,
	["5"] = buttons.RIO_CAP_RNG_5,
	["6"] = buttons.RIO_CAP_LONG_6,
	["7"] = buttons.RIO_CAP_7,
	["8"] = buttons.RIO_CAP_HDG_8,
	["9"] = buttons.RIO_CAP_9,
	["E"] = buttons.RIO_CAP_NE,
	["N"] = buttons.RIO_CAP_NE,
	["S"] = buttons.RIO_CAP_SW,
	["W"] = buttons.RIO_CAP_SW,
}

local ku_map = {
	["0"] = buttons.KU_0,
	["1"] = buttons.KU_1,
	["2"] = buttons.KU_2,
	["3"] = buttons.KU_3,
	["4"] = buttons.KU_4,
	["5"] = buttons.KU_5,
	["6"] = buttons.KU_6,
	["7"] = buttons.KU_7,
	["8"] = buttons.KU_8,
	["9"] = buttons.KU_9,
	["A"] = buttons.KU_A,
	["B"] = buttons.KU_B,
	["C"] = buttons.KU_C,
	["D"] = buttons.KU_D,
	["E"] = buttons.KU_E,
	["F"] = buttons.KU_F,
	["G"] = buttons.KU_G,
	["H"] = buttons.KU_H,
	["I"] = buttons.KU_I,
	["J"] = buttons.KU_J,
	["K"] = buttons.KU_K,
	["L"] = buttons.KU_L,
	["M"] = buttons.KU_M,
	["N"] = buttons.KU_N,
	["O"] = buttons.KU_O,
	["P"] = buttons.KU_P,
	["Q"] = buttons.KU_Q,
	["R"] = buttons.KU_R,
	["S"] = buttons.KU_S,
	["T"] = buttons.KU_T,
	["U"] = buttons.KU_U,
	["V"] = buttons.KU_V,
	["W"] = buttons.KU_W,
	["X"] = buttons.KU_X,
	["Y"] = buttons.KU_Y,
	["Z"] = buttons.KU_Z,
}

local AV8BNA_UFC_map = {
	["0"] = buttons.AV8BNA_UFC_0,
	["1"] = buttons.AV8BNA_UFC_1,
	["2"] = buttons.AV8BNA_UFC_2,
	["3"] = buttons.AV8BNA_UFC_3,
	["4"] = buttons.AV8BNA_UFC_4,
	["5"] = buttons.AV8BNA_UFC_5,
	["6"] = buttons.AV8BNA_UFC_6,
	["7"] = buttons.AV8BNA_UFC_7,
	["8"] = buttons.AV8BNA_UFC_8,
	["9"] = buttons.AV8BNA_UFC_9,
	["E"] = buttons.AV8BNA_UFC_6,
	["N"] = buttons.AV8BNA_UFC_2,
	["S"] = buttons.AV8BNA_UFC_8,
	["W"] = buttons.AV8BNA_UFC_4,
}

local log = function(str)
	logFile:write(str .. "\n")
	logFile:flush()
end

log("Let's do this ...")

function table.val_to_str ( v )
  if "string" == type( v ) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and table.tostring( v ) or
      tostring( v )
  end
end

function table.key_to_str ( k )
  if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str( k ) .. "]"
  end
end

function table.tostring( tbl )
  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

local theRoutine = nil

local unit = nil

function pushButton(button)
	log("pushButton: " .. table.tostring(button))
	GetDevice(button[1]):performClickableAction(button[2], button[3] or 1)
	coroutine.yield()
	GetDevice(button[1]):performClickableAction(button[2], 0)
	coroutine.yield()
end

function selectWaypointPage()
	log("selectWaypointPage")
	pushButton(buttons.CDU_WP)
	pushButton(buttons.CDU_LSK_3R)
end

function charToCduButton(char)
	return cdu_map[char]
end

function charToUfcButton(char)
	return ufc_map[char]
end

function charToIcpButton(char)
	return icp_map[char]
end

function charToAV8BNAUFCButton(char)
	return AV8BNA_UFC_map[char]
end

function charToKUButton(char)
	return ku_map[char]
end

function charToCapButton(char)
	return cap_map[char]
end

function enterScratch(str)
	str = str:upper()
	for i = 1, #str do
		local button = charToCduButton(str:sub(i, i))
		if button then
			pushButton(button)
		end
	end
end

function createWaypointWithName(str)
	enterScratch(str)
	pushButton(buttons.CDU_LSK_7R)
end

function enterLatitude(str)
	log("enterLatitude:"..str)
	enterScratch(str)
	pushButton(buttons.CDU_LSK_7L)
end

function enterLongitude(str)
	log("enterLongitude:"..str)
	enterScratch(str)
	pushButton(buttons.CDU_LSK_9L)
end

function enterElevation(str)
	log("enterElevation:"..str)
	if string.len(str) > 0 then
		enterScratch(str)
		pushButton(buttons.CDU_LSK_5L)
	end
end

function addCduWaypoint(name, latitude, longitude, elevation, tot)
	createWaypointWithName(name)
	enterLatitude(latitude)
	coroutine.yield()
	enterLongitude(longitude)
	coroutine.yield()
	enterElevation(elevation)
end

function wait(ds)
	for w = 1, ds do
		coroutine.yield()
	end
end

function enterUfc(str)
	log("enterUfc:"..str)
	str = str:upper()
	for i = 1, #str do
		local button = charToUfcButton(str:sub(i, i))
		if button then
			pushButton(button)
		end
	end
	pushButton(buttons.UFC_ENT)
	wait(5)
end

function addUfcWaypoint(latitude, longitude, elevation, tot)
	pushButton(buttons.AMPCD_PB_12) -- increase wp number
	pushButton(buttons.AMPCD_PB_05) -- UFC
	pushButton(buttons.UFC_OS1) -- POSN
	enterUfc(latitude:sub(1, 5))
	enterUfc(latitude:sub(6))
	enterUfc(longitude:sub(1, 6))
	enterUfc(longitude:sub(7))
	pushButton(buttons.UFC_OS3) -- ELEV
	pushButton(buttons.UFC_OS1) -- FEET
	enterUfc(elevation)
end

function enterIcp(str)
	log("enterIcp:"..str)
	str = str:upper()
	for i = 1, #str do
		local button = charToIcpButton(str:sub(i, i))
		if button then
			pushButton(button)
		end
	end
	pushButton(buttons.ICP_ENTR)
end

function addIcpWaypoint(latitude, longitude, elevation, tot)
	enterIcp(latitude)
	pushButton(buttons.ICP_DN)
	enterIcp(longitude)
	pushButton(buttons.ICP_DN)
	enterIcp(elevation)
	pushButton(buttons.ICP_UP)
	pushButton(buttons.ICP_UP)
	pushButton(buttons.ICP_INC)
end

function enterCap(str)
	for i = 1, #str do
		local button = charToCapButton(str:sub(i, i))
		if button then
			pushButton(button)
		end
	end
	pushButton(buttons.RIO_CAP_ENTER)
end

function addCapWaypoint(wpButton, latitude, longitude, elevation)
	pushButton(wpButton)
	pushButton(buttons.RIO_CAP_CLEAR)
	pushButton(buttons.RIO_CAP_LAT_1)
	enterCap(latitude)
	pushButton(buttons.RIO_CAP_CLEAR)
	pushButton(buttons.RIO_CAP_LONG_6)
	enterCap(longitude)
	if elevation ~= "" then
		pushButton(buttons.RIO_CAP_CLEAR)
		pushButton(buttons.RIO_CAP_ALT_4)
		enterCap(elevation)
	end
end

programA10Flightplan = function(time)
	log("Start programming A-10C...")
	selectWaypointPage()

	for i, wp in ipairs(mdc.waypoints) do
		log("Add Waypoint ..." .. wp.cdu)
		local parts = {}
		for part in string.gmatch(wp.cdu, "%S+") do
			table.insert(parts, part)
		end
		addCduWaypoint(wp.name, parts[1], parts[2], wp.alt, wp.tot)
	end

	pushButton(buttons.CDU_FPM)
	pushButton(buttons.CDU_LSK_3R)

	pushButton(buttons.CDU_LSK_3R)
	enterScratch("0")
	pushButton(buttons.CDU_LSK_7L)

	for i = table.getn(mdc.waypoints), 1, -1 do
		pushButton(buttons.CDU_LSK_3R)
		enterScratch(tostring(i))
		pushButton(buttons.CDU_LSK_7L)
	end

	log("programming DONE!")
end

programF18Flightplan = function(time)
	log("Start programming FA-18C_hornet...")

	pushButton(buttons.AMPCD_PB_10) -- DATA
	pushButton(buttons.AMPCD_PB_19) -- PRECISE

	for i, wp in ipairs(mdc.waypoints) do
		log("Add Waypoint ... " .. wp.cdu)
		local parts = {}
		for part in string.gmatch(wp.cdu, "%S+") do
			table.insert(parts, part)
		end
		addUfcWaypoint(parts[1], parts[2], wp.alt, wp.tot)
	end

	pushButton(buttons.AMPCD_PB_01) -- WP SEQUENCE
	for i = 0, table.getn(mdc.waypoints) do
		pushButton(buttons.UFC_OS4) -- INS
		enterUfc(tostring(i))
	end
	pushButton(buttons.AMPCD_PB_10) -- HSI
	pushButton(buttons.AMPCD_PB_15) -- SEQ

	log("programming DONE!")
end

programF16Flightplan = function(time)
	log("Start programming F-16C_50 ...")

	pushButton(buttons.ICP_RTN)
	pushButton(buttons.ICP_RTN)
	pushButton(buttons.ICP_4) -- STPT
	pushButton(buttons.ICP_DN)
	pushButton(buttons.ICP_DN)

	for i, wp in ipairs(mdc.waypoints) do
		log("Add Waypoint ... " .. wp.cdu)
		local parts = {}
		for part in string.gmatch(wp.cdu, "%S+") do
			table.insert(parts, part)
		end
		addIcpWaypoint(parts[1], parts[2], wp.alt, wp.tot)
	end

	for i = 1, table.getn(mdc.waypoints) do
		pushButton(buttons.ICP_DEC)
	end

	pushButton(buttons.ICP_RTN)

	log("programming DONE!")
end

programF14Flightplan = function(time)
	log("Start programming F-14 ...")

	-- WP1, WP2, WP3, FP, IP, ST, HB
	local wp_btn_map = {
		[1] = buttons.RIO_CAP_BTN_1,
		[2] = buttons.RIO_CAP_BTN_2,
		[3] = buttons.RIO_CAP_BTN_3,
		[4] = buttons.RIO_CAP_BTN_4,
		[5] = buttons.RIO_CAP_BTN_5,
		[6] = buttons.RIO_CAP_BTN_9,
		[7] = buttons.RIO_CAP_BTN_6,
	}

	for i, wp in ipairs(mdc.waypoints) do
		local wp_btn = wp_btn_map[i]
		if wp_btn ~= nil then
			log("Add Waypoint ... " .. wp.cdu)
			local parts = {}
			for part in string.gmatch(wp.cdu, "%S+") do
				table.insert(parts, part)
			end
			addCapWaypoint(wp_btn, parts[1], parts[2], wp.alt)
		end
	end
	log("programming DONE!")
end

function enterKU(str)
	log("enterKU:"..str)
	str = str:upper()
	for i = 1, #str do
		local button = charToKUButton(str:sub(i, i))
		if button then
			pushButton(button)
		end
	end
	pushButton(buttons.ICP_ENTR)
end

function addMPDWaypoint(latitude, longitude, elevation, tot, name)

	pushButton(buttons.R_MPD_L2)
	pushButton(buttons.R_MPD_L1)	
	pushButton(buttons.KU_ENTER)
	-- NAME
	enterKU(name:sub(1, 3))
	pushButton(buttons.KU_ENTER)
	
	-- COORDS
	pushButton(buttons.KU_CLR)	
	enterKU(latitude:sub(1, 7))
	enterKU(longitude:sub(1, 8))
	pushButton(buttons.KU_ENTER)
	
	-- ALT
	enterKU(elevation)
	pushButton(buttons.KU_ENTER)	
end

function addMPDRoute(i)

	if (i == 1) then
		-- POINT
		pushButton(buttons.R_MPD_L1)	
		
		pushButton(buttons.KU_W)
		pushButton(buttons.KU_0)
		pushButton(buttons.KU_1)	
		pushButton(buttons.KU_ENTER)
		
		pushButton(buttons.R_MPD_R5)	
	end
	
	if (i == 2) then
		-- POINT
		pushButton(buttons.R_MPD_L1)	
		
		pushButton(buttons.KU_W)
		pushButton(buttons.KU_0)
		pushButton(buttons.KU_2)	
		pushButton(buttons.KU_ENTER)
		
		pushButton(buttons.R_MPD_R4)	
	end
	
	if (i == 3) then
		-- POINT
		pushButton(buttons.R_MPD_L1)	
		
		pushButton(buttons.KU_W)
		pushButton(buttons.KU_0)
		pushButton(buttons.KU_3)	
		pushButton(buttons.KU_ENTER)
		
		pushButton(buttons.R_MPD_R3)	
	end
	
	if (i == 4) then
		-- POINT
		pushButton(buttons.R_MPD_L1)	
		
		pushButton(buttons.KU_W)
		pushButton(buttons.KU_0)
		pushButton(buttons.KU_4)
		pushButton(buttons.KU_ENTER)
		
		pushButton(buttons.R_MPD_R2)	
	end
	
	if (i >= 5) then
		-- POINT
		pushButton(buttons.R_MPD_L1)	
		
		pushButton(buttons.KU_W)
		if (i <= 9) then
			pushButton(buttons.KU_0)
		end
		enterKU(tostring(i))
		pushButton(buttons.KU_ENTER)
		pushButton(buttons.R_MPD_R1)	
		pushButton(buttons.R_MPD_R2)	
	end
		
end


programAH64Flightplan = function(time)
	log("Start programming AH-64 ...")
	
	-- Enter TSD
	pushButton(buttons.R_MPD_TSD)
	-- Enter Point Mode
	pushButton(buttons.R_MPD_B6)
	
	for i, wp in ipairs(mdc.waypoints) do
		log("Add Waypoint ... " .. wp.cdu)
		local parts = {}
		for part in string.gmatch(wp.cdu, "%S+") do
			table.insert(parts, part)
		end
		addMPDWaypoint(parts[1], parts[2], wp.alt, wp.tot, wp.name)
	end	
		
	-- ADD LZ
	pushButton(buttons.R_MPD_L2)
	pushButton(buttons.R_MPD_L1)	
	pushButton(buttons.KU_L)
	pushButton(buttons.KU_Z)
	pushButton(buttons.KU_ENTER)
	pushButton(buttons.KU_L)
	pushButton(buttons.KU_Z)
	pushButton(buttons.KU_ENTER)
	pushButton(buttons.KU_ENTER)
	pushButton(buttons.KU_ENTER)

	-- Leave Point Mode
	pushButton(buttons.R_MPD_B6)	
	
	-- ENTER ROUTE Mode	
	pushButton(buttons.R_MPD_B5)	
	-- ADD
	pushButton(buttons.R_MPD_L2)
	
	log("Add Route Start")
	for i, wp in ipairs(mdc.waypoints) do
		log("Add Route ... " .. i)
		addMPDRoute(i)
		count = i
	end
	-- LZ
	addMPDRoute(count+1)
	log("Add Route Ende ")	
	
	-- LEAVE ROUTE Mode	
	pushButton(buttons.R_MPD_B5)		
		
	log("programming DONE!")
end

function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function enterAV8BNAUFC(str)
	log("enterAV8BNAUFC:"..str)
	str = str:upper()
	for i = 1, #str do
		local button = charToAV8BNAUFCButton(str:sub(i, i))
		if button then
			pushButton(button)
			wait(5)
		end
	end
	pushButton(buttons.AV8BNA_UFC_ENTER)
	wait(5)
end

function addAV8BNAWaypoint(latitude, longitude)

	--Next Waypoint - 77 is always next free WP
	pushButton(buttons.AV8BNA_UFC_7)
	wait(5)
	pushButton(buttons.AV8BNA_UFC_7)
	wait(5)
	pushButton(buttons.AV8BNA_UFC_ENTER)
	wait(5)
	-- ODU Option 2 to enter position mode
	pushButton(buttons.AV8BNA_ODU2)
	wait(5)
	
	-- Split LAT
	AV8BNA_Lat_NorthSouth = latitude:sub(1,1)
	AV8BNA_Lat_Hours = latitude:sub(2,3)
	AV8BNA_Lat_Minutes = latitude:sub(4,5)
	AV8BNA_Lat_DecimalMinutes = latitude:sub(6,8)
	-- Convert decimalminutes to seconds
	AV8BNA_Lat_Seconds = round(AV8BNA_Lat_DecimalMinutes * 0.06)
	if AV8BNA_Lat_Seconds == 60 then
		AV8BNA_Lat_Seconds = 59
	end
	if AV8BNA_Lat_Seconds < 10 then
		AV8BNA_Lat_Seconds = "0" .. AV8BNA_Lat_Seconds
	end
	AV8BNA_Lat_Converted = "" .. AV8BNA_Lat_NorthSouth .. "" .. AV8BNA_Lat_Hours .. "" .. AV8BNA_Lat_Minutes .. "" .. AV8BNA_Lat_Seconds
	enterAV8BNAUFC(AV8BNA_Lat_Converted)
	wait(5)

	AV8BNA_Long_EastWest = longitude:sub(1,1)
	AV8BNA_Long_Hours = longitude:sub(2,4)
	AV8BNA_Long_Minutes = longitude:sub(5,6)
	AV8BNA_Long_DecimalMinutes = longitude:sub(7,9)
	-- Convert decimalminutes to seconds
	AV8BNA_Long_Seconds = round(AV8BNA_Long_DecimalMinutes * 0.06)
	if AV8BNA_Long_Seconds == 60 then
		AV8BNA_Long_Seconds = 59
	end
	if AV8BNA_Long_Seconds < 10 then
		AV8BNA_Long_Seconds = "0" .. AV8BNA_Long_Seconds
	end
	AV8BNA_Long_Converted = "" .. AV8BNA_Long_EastWest .. "" .. AV8BNA_Long_Hours .. "" .. AV8BNA_Long_Minutes .. "" .. AV8BNA_Long_Seconds
	enterAV8BNAUFC(AV8BNA_Long_Converted)
	wait(5)
	-- ODU Option 1 Waypoint
	pushButton(buttons.AV8BNA_ODU1)
	wait(5)
	log("WP finished")
end

programAV8BNAFlightplan = function(time)
	log("Start programming AV-8B NA...")
	
	--Enter Data Mode
	pushButton(buttons.AV8BNA_LEFT_MPCD_LEFT_BUTTON2) -- DATA OSB
	wait(5)
	
	for i, wp in ipairs(mdc.waypoints) do
		log("Add Waypoint ... " .. wp.cdu)
		local parts = {}
		for part in string.gmatch(wp.cdu, "%S+") do
			table.insert(parts, part)
		end
		addAV8BNAWaypoint(parts[1], parts[2])
	end	
	--Leave Data Mode
	pushButton(buttons.AV8BNA_LEFT_MPCD_LEFT_BUTTON2) -- DATA OSB
	log("programming DONE!")
end

mdc = nil

function loadMdc()
	dofile(dataPath..'mdc.lua')
end

LuaExportActivityNextEvent = function(current)
	local data = LoGetSelfData()
	if data ~= nil then
		if theRoutine == nil then		    
			unit = data.Name
			if unit == "A-10C" or unit == "A-10C_2" then
				if GetDevice(0):get_argument_value(464) == 1 then -- CDU_UNUSED-DOT
					loadMdc()
					theRoutine = coroutine.create(programA10Flightplan)
				end
			elseif unit == "FA-18C_hornet" then
				if GetDevice(0):get_argument_value(7) == 1 or GetDevice(0):get_argument_value(133) == 1 then -- HUD Video BIT or BCN
					loadMdc()
					theRoutine = coroutine.create(programF18Flightplan)
				end
			elseif unit == "F-16C_50" then
				if GetDevice(0):get_argument_value(187) == 1 then -- UFC FLIR WX
					loadMdc()
					theRoutine = coroutine.create(programF16Flightplan)
				end
			elseif unit == "F-14B" then
				if GetDevice(0):get_argument_value(1814) == 1 then -- RIO_CCM_VGS
					loadMdc()
					theRoutine = coroutine.create(programF14Flightplan)
				end
			elseif unit == "AH-64D_BLK_II" then
				if GetDevice(0):get_argument_value(356) == 1 then -- Pilot Defog
					loadMdc()
					theRoutine = coroutine.create(programAH64Flightplan)
				end
			elseif unit == "AV8BNA" then
				if GetDevice(0):get_argument_value(297) == 1 then -- UFC I/P Button
					loadMdc()
					theRoutine = coroutine.create(programAV8BNAFlightplan)
				end
			end
		elseif coroutine.status(theRoutine) == "suspended" then
			coroutine.resume(theRoutine)
		end
	end

	if previousExports.luaExportActivityNextEvent then
		previousExports.luaExportActivityNextEvent(current)
	end
	return current + 0.1
end

local previousValue = 0

LuaExportStart = function()
	log("LuaExportStart")

	if previousExports.luaExportStart then
		previousExports.luaExportStart()
	end
end

log("MDC EXPORT Initialized")


-- definePushButton("CDU_NA1", 9, 3053, 464, "CDU", "No Function 1")
-- function BIOS.util.definePushButton(msg, device_id, device_command, arg_number, category, description)
-- -> BIOS.util.defineTumb(msg, device_id, device_command, arg_number, 1, {0, 1}, nil, false, category, description)
--    function BIOS.util.defineTumb(msg, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
--      local value = GetDevice(0):get_argument_value(arg_number)

-- GetDevice(device_id):performClickableAction(command, limits[1] + step*new_n)

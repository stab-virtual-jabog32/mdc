-- 06 - packages
local lfs = require('lfs')
local dataPath = lfs.writedir() .. 'Data\\mdc\\'
local modPath = lfs.writedir() .. 'Mods\\tech\\mdc\\'

dofile(modPath..'mdc.lua')
dofile(dataPath..'mdc.lua')

headline(0, "PACKAGES")

local row = 1

for i, package in ipairs(mdc.packages) do
	local ownLabel = ""
	if package.is_own then
		ownLabel = "OWN"
	end

	columns = 12
	headline(row, string.format("%s   AO %s   FREQ %s   %s", package.task, package.ao, package.frequency, ownLabel))
	row = row + 1

	columns = 10
	multihead(row, 0, row, 1, "CALLSIGN")
	multihead(row, 2, row, 3, "MISSION")
	multihead(row, 4, row, 5, "AIRFRAME")
	head(row, 6, "FREQ")
	head(row, 7, "TCN")
	head(row, 8, "GRP")
	head(row, 9, "LSR")
	row = row + 1

	for j, flight in ipairs(package.flights) do
		local callsign = flight.callsign
		if flight.is_lead then
			callsign = "(L) " .. callsign
		end
		if flight.is_self then
			callsign = callsign .. " *"
		end

		multicell(row, 0, row, 1, callsign)
		multicell(row, 2, row, 3, flight.mission)
		multicell(row, 4, row, 5, flight.airframe)
		cell(row, 6, flight.comms)
		cell(row, 7, flight.tacan)
		cell(row, 8, flight.group_id)
		cell(row, 9, flight.laser_mask)
		row = row + 1

		head(row, 1, "AO")
		multicell(row, 2, row, 4, flight.ao)
		head(row, 5, "TASK")
		multicell(row, 6, row, 9, flight.task)
		row = row + 1
	end

	row = row + 1
end

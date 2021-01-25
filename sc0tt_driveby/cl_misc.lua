-- stop shooting behind you fucks
function lookingBehind()
	local coordA = GetEntityCoords(GetPlayerPed(-1), 1)
	local coordB = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, sc0tt_driveby.dist, 0.0)
    --DrawMarker(1,coordB,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
    local onScreen,_x,_y=World3dToScreen2d(coordB.x,coordB.y,coordB.z)
   	return onScreen
end

Util.Tick(function()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then
		local canshoot = true
		if sc0tt_driveby.driver == false then
			local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
				canshoot = false -- no shooty shooty driver
			end
		end
		if sc0tt_driveby.driveby == false then
			canshoot = false -- no shooty shooty ever
		end
		if canshoot and not sc0tt_driveby.rear then
			canshoot = not lookingBehind()
		end

	    SetPlayerCanDoDriveBy(sc0tt_driveby.player, canshoot)
	end
end)

SetPlayerCanDoDriveBy(sc0tt_driveby.player, true)

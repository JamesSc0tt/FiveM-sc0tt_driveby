sc0tt_driveby = {}

sc0tt_driveby.ped = GetPlayerPed(-1)
sc0tt_driveby.player = PlayerId()

sc0tt_driveby['driveby'] = true -- can anybody shoot?
sc0tt_driveby['driver'] = false  -- can driver shoot?
sc0tt_driveby['rear'] = false -- can shoot behind?
sc0tt_driveby['dist'] = -8.0 -- how far behind the ped is the cut off point? (the closer it is, the less backwards they will be able to shoot)
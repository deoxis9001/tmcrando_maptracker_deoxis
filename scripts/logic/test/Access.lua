function AccessEasternHills()
    if CanDestroyTrees() == 1 then
        return 1
    end 
 if SHFWindCrest() == 1 then
        return 1
    end 
 if AccessMinishWoods() == 1 then
        if  OverworldBlocks() == 1 then
            return 1
        else
            return 0
        end
    else
        return 0
    end 
end

function AccessLonLon()
    if has("ocarina") == 1 then
        return 1
    end 
 if CanDestroyTrees() == 1 then
        if has("llrkey") == 1 then
            return 1
        end 
 if has("cape") == 1 then
            return 1
        end 
 if LonLonNorthShortcut() == 1 then
            return 1
        end 
 if has("flippers") == 1 then
            if has("mitts") == 1 then
                return 1
            end
        end
    end
    return 0
end


function AccessSouthLake() 
	if AccessLonLon() == 1 then
		if CapeExtension() == 1 then
			return 1
		end
	end 
 if AccessNorthMinish() == 1 then
		if has("mitts") then
			return 1
		end
	end 
	return 0
end

function AccessMinishWoods()
	if CanDestroyTrees() == 1 then
		return 1
	end 
 if has("ocarina") then
		return 1
	else
		return 0
	end 
end

function AccessNorthMinish() 
	if AccessMinishWoods() == 1 then
		if has("flippers") == 1 then
			return 1
		end 
 if has("cape") == 1 then
			return 1
		end 
 if LonLonSouthShortcut() == 1 then
			return 1
		end 
 if AccessLonLon() == 1 then
			if has("cane") then
				return 1
			end
		end
	end 
	return 0
end

function AccessTreasureCave() 
	if AccessMinishWoods() == 1 then
		if has("mitts") == 1 then
			if has("cape") == 1 then
				return 1
			end
		end
	end 
	return 0
end

function AccessBelari() 
	if AccessMinishWoods() == 1 then
		if OverworldBlocks() == 1 then
			return 1
		end 
 if CompleteDeepwood() == 1 then
			return 1
		end
	end 
 if MinishWindCrest() == 1 then
		return 1
	end
	return 0
end


function AccessTrilby() 
	if AccessWestern_Settings()==1 then
		return 1
	end 
 if WesternShortcut()==1 then
		return 1
	end 
 if has("flippers") then
		return 1
	end 
 if has("cape") then
		return 1
	end 
 if HasSword()==1 and HasSpin()==1 then
		return 1
	end 
 if GuardSkip()==1 then
		return 1
	end 
 if CrenelWindCrest()==1 then
		if UpperBean()==1 then
			return 1
		end 
 if has("grip") then
			return 1
		end
	end
	return 0
end

function AccessWestern_Settings() 
	if WesternShortcut() == 1 then
		return 1
	else
		if SwampWindCrest() == 1 then
			if HasBow() == 1 or has("boots") or has("cape") then
				return 1
			end
		end
	end
	return 0
end

function AccessWestern()
    if AccessWestern_Settings() == 1 then
        return 1
    end 
 if AccessTrilby() == 1 then
        if CanSplit2() == 1 then
            return 1
        end 
 if CanSplit3() == 1 then
            return 1
        end 
 if CanSplit4() == 1 then
            return 1
        end 
 if TrilbyShortcut() == 1 then
            return 1
        end
    end
    return 0
end

function AccessCrenel() 
    if AccessTrilby() == 1 then
        if LowerBean() == 1 then
            if CrenelDust() == 1 then
                if has("grip") then
                    return 1
                end 
 if BombWalls() == 1 then
                    if UpperBean() == 1 then
                        return 1
                    end 
 if OverworldBlocks() == 1 then
                        return 1
                    end
                end 
 if has("cape") then
                    if CrenelDust() == 1 then
                        if UpperBean() == 1 then
                            return 1
                        end 
 if BombWalls() == 1 then
                            if OverworldBlocks() == 1 then
                                return 1
                            end
                        end
                    end
                end
            end
        end
    end 
 if CrenelWindCrest() == 1 then
        return 1
    end 
    return 0
end

function AccessMelari()
	if CrenelWindCrest() == 1 then
		return 1
	end 
 if AccessCrenel() == 1 then
		if has("cane") then
			if has("grip") then
				return 1
			end 
 if CrenelMushroom() == 1 then
				return 1
			end
		end
		if has("grip") then
			if CrenelSwitch() == 1 then
				if has("cape") then
					return 1
				end
				if LightArrowBreak() == 1 then
					return 1
				end 
 if has("gust") then
					return 1
				end
			end
		end
	end
	return 0
end

function AccessSwamp() 
	if SwampWindCrest() == 1 then
		return 1
	end
	if AccessWestern() == 1 then
		if has("boots") then
			return 1
		end 
 if has("cape") then
			return 1
		end
	end
	return 0
end

function GotScrolls() 
	if ( Tracker:ProviderCountForCode("sevenscrolls") >= 7 )	then
		return 1
	else
		return 0
	end 
end
function AccessRuins() 
	if RuinsFusion() == 1 then
		if AccessSwamp() == 1 then
			if has("cape") then
				return 1
			end 
 if has("boots") then
				if has("flippers") then
					return 1
				end 
 if HasBow() == 1 then
					return 1
				end 
 if SwampShortcut() == 1 then
					return 1
				end 
 if SwampWindCrest() == 1 then
					return 1
				end
			end
		end
	end 
	
	return 0
end

function AccessValley() 
	if CanSplit3() == 1 then
		if OverworldBlocks() == 1 then
			return 1
		end 
 if CapeExtension() == 1 then
			return 1
		end
	end 
 if CanSplit4() == 1 then
		if OverworldBlocks() == 1 then
			return 1
		end 
 if CapeExtension() == 1 then
			return 1
		end
	end
	return 0
end

function AccessCrypt() 
	if AccessValley() == 1 then
		if DarkRooms() == 1 then
			if Graveyard() == 1 then
				if CryptEntrance() == 1 then
					return 1
				end
			end
		end
	end 
	
	return 0
end

function AccessFalls()
	if OverworldBlocks() == 1 then
		if FallsFusion() == 1 then
			if DarkRooms() == 1 then
				if has("grip") then
					return 1
				end
			end
		end
	end 
 if FallsWindCrest() == 1 then
		return 1
	end 
 if has("grip") then
		if CloudWindCrest() == 1 then
			return 1
		end 
 if StrangerFusion() == 1 then
			if CompletedGolds() == 1 then
				return 1
			end
		end
	end
	return 0
end


function AccessClouds()
	if AccessFalls() == 1 then
		if has("grip") then
			return 1
		end
	end 
 if CloudWindCrest() == 1 then
		return 1
	end 
 if StrangerFusion() == 1 then
		if CompletedGolds() == 1 then
			return 1
		end
	end
	return 0
end

function AccessWindTribe() 
	if StrangerFusion() == 1 then
		if CompletedGolds() == 1 then
			return 1
		end
	end 
 if AccessClouds() == 1 then
		if CloudFusions() == 1 then
			return 1
		end
	end 
 if CloudWindCrest() == 1 then
		return 1
	end 
	return 0
end


function AccessDeepwood()
	if Festari()==1 then
		if AccessMinishWoods()==1 then
			return 1
		end 
	end 
	return 0
end
function AccessCoF()
	if AccessMelari()==1 then
		return 1
	else
		return 0
	end 
end
function CoFBasementAccess()
	if CoFRedWarp() == 1 then
		return 1
	end 
 if CoFBlueWarp() == 1 then
		if BombWalls() == 1 then
			if CoFSpikeBeetle() == 1 then
				if CoF1stDoor() == 1 then
					if HasSword() == 1 then
						if CoF2ndDoor() == 1 then
							if has("cane") then
								return 1
							end
						end
					end
				end
			end
		end 
 if Bobombs() == 1 then
			if CoFSpikeBeetle() == 1 then
				if CoF1stDoor() == 1 then
					if HasSword() == 1 then
						if CoF2ndDoor() == 1 then
							if has("cane") then
								return 1
							end
						end
					end
				end
			end
		end
	end
	return 0
end
function AccessFortress()
	if ( AccessRuins()==1 ) then
		if ( HasSword()==1 ) then
			return 1
		end 
	end 
	return 0
end
function AccessDroplets()
	if ( AccessLonLon()==1 ) then
		if ( CapeExtension()==1 ) then
			return 1
		end
	end 
		return 0
end
function AccessPalace()
	if ( AccessWindTribe()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoW2ndHalf()
	if PowDungeons() == 1 then
		if has("cape") then
			if CanSplit3() == 1 then
				if PoWJump() == 1 then
					if PoW1stDoor() == 1 then
						if PoWBossDoor() == 1 then
							return 1
						end
					end
				end
			end 
 if CanSplit4() == 1 then
				if PoWJump() == 1 then
					if PoW1stDoor() == 1 then
						if PoWBossDoor() == 1 then
							return 1
						end
					end
				end
			end
		end
	end
	return 0
end
function AccessDHC()
	if DhcDungeons() == 1 then
		if has("dhc_open") == 1 then
				return 1
		end 
 if has("dhc_closed") == 1 then
			if CompletePed() == 1 then
				return 1
			end
		end 
 if has("dhc_ped") == 1 then
			if CompletePed() == 1 then
				return 1
			end
		end
	end
	return 0
end

function DHCBlackKnight()
	if DHCBlackKnightFight() == 1 then
		if DHCBlueWarp() == 1 then
			return 1
		end 
 if DHCRedWarp() == 1 then
			if DHCChainSoldiers() == 1 then
				if DHCGrateRoom() == 1 then
					if OverworldBlocks() == 1 then
						return 1
					end
				end
			end 
 if DHC1stDoor() == 1 then
				if DHC2ndCanon() == 1 then
					if BombWalls() == 1 then
						if DHCThrone() == 1 then
							if CanSplit4() == 1 then
								if DHCOutsideSwitch() == 1 then
									if DHCSwitchPuzzles() == 1 then
										if DHCChainSoldiers() == 1 then
											if DHCGrateRoom() == 1 then
												if OverworldBlocks() == 1 then
													return 1
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return 0
end

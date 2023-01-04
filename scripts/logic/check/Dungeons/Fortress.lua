function 1() 
    Fortress_Entrance_1F_LeftChest			:Fortress;	Minor;				0x18-0x00-0x00;													(|(&Helpers.AccessFortress, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Entrance_1F_LeftWizrobeChest	:Fortress;	Minor;				0x58-0x23-0x00;													(|(&Helpers.AccessFortress, Items.MoleMitts, Helpers.FoWWizrobes), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Entrance_1F_RightItem			:Fortress;	`RupMinor`;			0x0F3E67;														Helpers.Rupee, (|(&Helpers.AccessFortress, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Left_2F_DigChest				:Fortress;	Minor;				0x18-0x01-0x00;													(|(&Helpers.AccessFortress, Helpers.FoWEyeSwitch, Helpers.FoWStalfosFight, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Left_2F_Item					:Fortress;	`RupMinor`;			0x0F3F37;														Helpers.Rupee, (|(&Helpers.AccessFortress, Helpers.FoWEyeSwitch, Helpers.FoWStalfosFight), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Left_3F_SwitchChest			:Fortress;	Minor;				0x18-0x02-0x00;													(|(&Helpers.AccessFortress, Helpers.FoWEyeSwitch, Helpers.FoWStalfosFight, Helpers.FoWDigSwitch), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Left_3F_Eyegore_BigChest		:Fortress;	`COMPASS`;			0x58-0x00-0x00;													(|(&Helpers.AccessFortress, Helpers.FoWEyeSwitch, Helpers.FoWStalfosFight, Helpers.FoWCloneSwitch), Helpers.Hundo);																								`FoW_Map`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Left_3F_ItemDrop				:Fortress;	`SMALL_KEY`;		fowLeftItem:Define:FirstByte,fowLeftSub:Define:SecondByte;		(|(&Helpers.AccessFortress, Helpers.FoWLeftDrop), Helpers.Hundo);																																				`FoW_Small`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Middle_2F_BigChest				:Fortress;	`COMPASS`;			0x58-0x19-0x00;													(|(&Helpers.AccessFortress, (|Helpers.FoWEyegores, Helpers.FoWBlueWarp)), Helpers.Hundo);																														`FoW_Compass`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Middle_2F_StatueChest			:Fortress;	Minor;				0x18-0x01-0x01;													(|(&Helpers.AccessFortress, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Right_2F_LeftChest				:Fortress;	Minor;				0x58-0x1D-0x00;													(|Helpers.AccessFortress, Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Right_2F_RightChest			:Fortress;	Minor;				0x58-0x1D-0x01;													(|Helpers.AccessFortress, Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Right_2F_DigChest				:Fortress;	Minor;				0x18-0x01-0x02;													(|(&Helpers.AccessFortress, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Right_3F_DigChest				:Fortress;	Minor;				0x18-0x02-0x01;													(|(&Helpers.AccessFortress, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Right_3F_ItemDrop				:Fortress;	`SMALL_KEY`;		fowRightItem:Define:FirstByte,fowRightSub:Define:SecondByte;	(|(&Helpers.AccessFortress, Helpers.FoWRightDrop), Helpers.Hundo);																																				`FoW_Small`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Entrance_1F_RightHP			:Fortress;	Major;				0x0E2DD7;														(|(&Helpers.AccessFortress, Helpers.FoWCloneSwitch), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
	Fortress_BackLeft_BigChest				:Fortress;	Major;				0x18-0x03-0x00;													(|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, (&Helpers.FoWEyegores, Helpers.FoWLeftDoor, Helpers.FoWDarknut)), Helpers.BombWalls), Helpers.Hundo);
    if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BackLeft_SmallChest			:Fortress;	Minor;				0x18-0x03-0x01;													(|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, (&Helpers.FoWEyegores, Helpers.FoWLeftDoor, Helpers.FoWDarknut)), Helpers.BombWalls, Items.MoleMitts), Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BackRight_Statue_ItemDrop		:Fortress;	`SMALL_KEY`;		0x0E1E8B;														(|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, Helpers.FoWEyegores), Helpers.FoWRightDoor, Helpers.FoWCloneSwitch), Helpers.Hundo);																			`FoW_Small`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BackRight_Minish_ItemDrop		:Fortress;	`SMALL_KEY`;		0x0F424F;														(|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, Helpers.FoWEyegores), Helpers.FoWRightDoor, Helpers.HasHandDamage, Helpers.FoWMiddleDoor, Items.MoleMitts), Helpers.Hundo);									`FoW_Small`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BackRight_DigRoom_TopPot		:Fortress;	`ObsMinor`;			0x0F3FC7:FirstByte, 0x0F3FC9:SecondByte;						Helpers.Obscure, (|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, Helpers.FoWEyegores), Helpers.FoWRightDoor, Helpers.HasHandDamage, Helpers.FoWMiddleDoor, Items.MoleMitts), Helpers.Hundo);	
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BackRight_DigRoom_BottomPot	:Fortress;	`ObsMinor`;			0x0F3FD7:FirstByte, 0x0F3FD9:SecondByte;						Helpers.Obscure, (|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, Helpers.FoWEyegores), Helpers.FoWRightDoor, Helpers.HasHandDamage, Helpers.FoWMiddleDoor, Items.MoleMitts), (&Helpers.AccessFortress, Helpers.FoWPot), Helpers.Hundo);	
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BackRight_BigChest				:Fortress;	`BIG_KEY`;			0x58-0x1B-0x00;													(|(&Helpers.AccessFortress, (|Helpers.FoWBlueWarp, Helpers.FoWEyegores), Helpers.FoWRightDoor, Helpers.HasHandDamage, Helpers.FoWMiddleDoor, Items.MoleMitts, Helpers.FoWLastDoor), Helpers.Hundo);				`FoW_Big`
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    CompleteFortress						:Fortress;	Helper;	;	Helpers.AccessFortress, Items.MoleMitts, Helpers.FoWBossDoor, Helpers.HasMazaalDamage, Helpers.HasBow;
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_BossItem						:Fortress;			Major;	mazaalContainerItem:Define:FirstByte, mazaalContainerSub:Define:SecondByte;	(|Helpers.CompleteFortress, Helpers.Hundo);																																								Items.HeartContainer
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function 1() 
    Fortress_Prize							:`ELEMENT_DUNGEON`;	Major;	0x09C9E6:FirstByte, 0x09C9E8:SecondByte;									(|Helpers.CompleteFortress, Helpers.Hundo);
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end

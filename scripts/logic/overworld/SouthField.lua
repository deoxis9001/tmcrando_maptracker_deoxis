

function Smith_House_Chest() 
    return 1
   end
   function Smith_Floor_Item1() 
    return 1
   end
   function Smith_Floor_Item2() 
    return 1
   end
   function SouthField_PuddleFusion_Item()
       if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions58") ) ) and ( function_Cached("CanDestroyTrees")==1 or has("cape") or has("flippers") or function_Cached("AccessWestern")==1 ) ) then
           return 1
       else
           return 0
       end 
   end
   function SouthField_Fusion_Chest()
       if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions53") ) ) and function_Cached("AccessEasternHills")==1 ) then
           return 1
       elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions53") ) ) and function_Cached("AccessEasternHills")==2 ) then
           return 2
       else
           return 0
       end 
   end
   function SouthField_TreeFusion_HP()
       if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions32") ) ) and function_Cached("AccessEasternHills")==1 ) then
           return 1
       elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions32") ) ) and function_Cached("AccessEasternHills")==2 ) then
           return 2
       else
           return 0
       end 
   end
   function SouthField_MinishSize_WaterHole_HP() 
       if ( has("flippers") and function_Cached("CanDestroyTrees")==1 and function_Cached("BonkedTrees")==1 ) then
           return 1
       else
           return 0
       end 
   end
   function SouthField_Tingle_NPC() 
       if ( has("cane") and has("trophy") and function_Cached("AccessEasternHills")==1 ) then
           return 1
       elseif ( has("cane") and has("trophy") and function_Cached("AccessEasternHills")==2 ) then
           return 2
       else
           return 0
       end 
   end
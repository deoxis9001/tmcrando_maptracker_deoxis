
diffmap={[0]=0,[1]=1,[2]=2}
normalmap={[0]=0,[1]=1}
treasuremap={[0]=0,[1]=1,[2]=1,[3]=1,[4]=1}
doormap={[0]=2,[1]=1,[2]=0}

SLOT_CODES = {
    difficulty={
        code="op_difficulty",
        mapping=diffmap
    },
    portal={
        code="op_openportal",
        mapping=normalmap
    },
    logic={
        code="op_advancedlogic",
        mapping=normalmap
	},	
	goal={
		code="op_treasurehunt",
		mapping=treasuremap	
    },
	open_doors={
		code="op_doors",
		mapping=doormap
	},
	diamond_shuffle={
		code="op_diamond",
		mapping=normalmap
	}
}
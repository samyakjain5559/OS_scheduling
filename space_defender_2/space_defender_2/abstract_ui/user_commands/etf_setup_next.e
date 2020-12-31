note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SETUP_NEXT
inherit
	ETF_SETUP_NEXT_INTERFACE
create
	make
feature -- command
	setup_next(state: INTEGER_32)
		require else
			setup_next_precond(state)
    	do
			-- perform some update on the model state
			if model.setup_mode = false then
				if model.in_game then
    				model.change_i2 (model.i2+1)
    			end
			  	model.change_flag ("notsetup")
		    else
				model.change_setup_cursor (model.setup_cursor+state)
			    if model.setup_cursor < 1 and model.setup_mode then
			    	model.change_flag ("notstart")
	                model.change_setup_mode_flag (false)
	                model.change_selected ("not started")
	            elseif model.setup_cursor = 5 and model.setup_mode then
	                model.change_flag ("summary")
	                model.change_selected ("setup summary")
	            elseif  model.setup_cursor >= 6 and model.setup_mode then
	            	model.change_setup_mode_flag (false)
	            	model.change_tolhealth (model.data[1].health+model.data[2].health+model.data[3].health)
	                model.change_tolenergy (model.data[1].energy+model.data[2].energy+model.data[3].energy)
	                model.change_tolregenh (model.data[1].regenh+model.data[2].regenh+model.data[3].regenh)
	                model.change_tolregene (model.data[1].regene+model.data[2].regene+model.data[3].regene)
	                model.change_tolarmour (model.data[1].armour+model.data[2].armour+model.data[3].armour)
	                model.change_tolvision (model.data[1].vision+model.data[2].vision+model.data[3].vision)
	                model.change_tolmove (model.data[1].move+model.data[2].move+model.data[3].move)
	                model.change_tolmovecost (model.data[1].movecost+model.data[2].movecost+model.data[3].movecost)
	                model.change_tolprojdamage (model.data[1].projdamage+model.data[2].projdamage+model.data[3].projdamage)
	                model.change_tolprojcost (model.data[1].projcost+model.data[2].projcost+model.data[3].projcost)
	                model.ingamesetup
	            	model.change_in_game (true)
	            	model.change_selected ("in game")
	            elseif model.setup_cursor = 1 and model.setup_mode  then
	                model.change_flag ("weaponstate")
	                model.change_selected ("weapon setup")
	            elseif model.setup_cursor = 2 and model.setup_mode  then
	                model.change_flag ("armourstate")
	                model.change_selected ("armour setup")
	            elseif model.setup_cursor = 3 and model.setup_mode  then
	                model.change_flag ("enginestate")
	                model.change_selected ("engine setup")
	            elseif model.setup_cursor = 4 and model.setup_mode  then
	                model.change_flag ("powerstate")
	                model.change_selected ("power setup")
			    end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

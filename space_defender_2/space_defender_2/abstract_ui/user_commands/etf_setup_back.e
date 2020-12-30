note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SETUP_BACK
inherit
	ETF_SETUP_BACK_INTERFACE
create
	make
feature -- command
	setup_back(state: INTEGER_32)
		require else
			setup_back_precond(state)
    	do
    		if model.setup_mode = false then
    		    if model.in_game then
    				model.change_i2 (model.i2+1)
    			end
			  	model.change_flag ("notsetup")
		    else
				-- perform some update on the model state
	            model.change_setup_cursor (model.setup_cursor-state)
			    if model.setup_cursor < 1 and model.setup_mode then
			    	model.change_flag ("notstart")
	                model.change_setup_mode_flag (false)
	                model.change_selected ("not started")
	            elseif model.setup_cursor = 5 and model.setup_mode then
	                model.change_flag ("summary")
	                model.change_selected ("setup summary")
	            elseif  model.setup_cursor >= 6 and model.setup_mode then
	            	model.change_setup_mode_flag (false)
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

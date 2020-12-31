note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REDO
inherit
	ETF_REDO_INTERFACE
create
	make
feature -- command
	redo
    	do -- CAN DO command with all command inherit except undo and redo. AND THIS COMMAND inherit from ETF_MODEL vIMP SEE IMAGE 15 oct
			-- perform some update on the model state
			if not model.game_on then
                 model.change_flag ("noplay")
                 model.change_i2 (model.i2 + 1)
    	    else
					 if (model.cursor_position >= model.history.count) or (model.history.count <= 1) then
		                  model.change_flag ("nothing_redo")
		                  model.change_i2 (model.i2 + 1)
		            else
		                  if (model.cursor_position) >= 1 then
		                  	model.increment_cursor
		                  	model.change_i2 (0)
		                  	model.change_i (model.i + 1)
		                  	model.history[model.cursor_position].redo -- to implement last command not the last
		                  end

					end
		    end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_UNDO
inherit
	ETF_UNDO_INTERFACE
create
	make
feature -- command
	undo
    	do    -- CAN DO command with all command inherit except undo and redo. AND THIS COMMAND inherit from ETF_MODEL vIMP SEE IMAGE 15 oct
			-- perform some update on the model state


--			if model.history.index < 1 then

--				model.change_flag ("nothing_undo")
--			else
--				model.history.back
--				model.history.item.undo
-- work partially if do model.history.remove_right
            if not model.game_on then
                 model.change_flag ("noplay")
                 model.change_i2 (model.i2 + 1)
    	    else
	            if (model.cursor_position <= 1) or (model.history.count <= 1) then
	                  model.change_flag ("nothing_undo")
--	                  if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	  model.change_i (model.i-(model.history.count-model.cursor_position))
--	                  else
--	                  	  model.change_i (1)
--	                  end

	                  model.change_i2 (model.i2 + 1)
	            else
	                  if (model.cursor_position) >= 1 then
	                  	model.change_i2 (0)
	                  	model.change_i (model.i - 1)
	                  	model.history[model.cursor_position].undo -- to implement last command not the last
	                    model.decrement_cursor

	                  end

				end
            end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

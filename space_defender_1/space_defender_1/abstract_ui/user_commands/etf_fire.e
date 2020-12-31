note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_FIRE
inherit
	ETF_FIRE_INTERFACE
create
	make
feature -- command
	fire
    	do
			-- perform some update on the model state
		   if not model.game_on then
                 model.change_flag ("noplay")
                 model.change_i2 (model.i2 + 1)
    	   else
				model.add_command (create {FIRE}.make )
				--model.history.item.execute
				--model.fire
				-- publish latest version of model
				model.history[model.cursor_position].execute
		   end
				etf_cmd_container.on_change.notify ([Current])
    	end

end

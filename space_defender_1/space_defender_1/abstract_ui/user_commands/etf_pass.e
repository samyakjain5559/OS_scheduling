note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_PASS
inherit
	ETF_PASS_INTERFACE
create
	make
feature -- command
	pass
    	do
			-- perform some update on the model state
			--model.pass
		   if not model.game_on then
                 model.change_flag ("noplay")
                 model.change_i2 (model.i2 + 1)
    	   else
				model.add_command (create {PASS}.make )
				model.history[model.cursor_position].execute
	       end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

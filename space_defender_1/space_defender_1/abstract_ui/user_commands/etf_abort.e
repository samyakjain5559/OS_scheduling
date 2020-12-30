note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ABORT
inherit
	ETF_ABORT_INTERFACE
create
	make
feature -- command
	abort
    	do
			-- perform some update on the model state
		   if not model.game_on then
                model.change_flag ("noplay")
                model.change_i2 (model.i2 + 1)
    	   else
    	   	    --model.add_command (create {PASS}.make )
				model.abort
		   end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

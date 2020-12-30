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
			if model.in_game = false and model.setup_mode = false then
			  model.change_flag("nogameabort")
			else
			   model.abort
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

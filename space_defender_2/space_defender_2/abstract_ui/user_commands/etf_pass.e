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
			if model.in_game = true then
			   model.pass
			else
			   if model.in_game then
         		  model.change_i2 (model.i2 + 1)
         	   end
			   model.change_flag("nogame")
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

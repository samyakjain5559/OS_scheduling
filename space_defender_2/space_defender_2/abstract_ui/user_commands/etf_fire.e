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
			if model.in_game = false then
			   model.change_flag("nogame")
			elseif model.remainenergyfunc("fire") < model.tolprojcost then
			   if model.in_game then
         		   model.change_i2 (model.i2 + 1)
         	   end
               model.change_flag("lessresourcefire")
		    else
			   model.fire
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

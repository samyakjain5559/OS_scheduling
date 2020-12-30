note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE
inherit
	ETF_MOVE_INTERFACE
create
	make
feature -- command
	move(row: INTEGER_32 ; column: INTEGER_32)
		require else
			move_precond(row, column)
    	do
    		if model.in_game = false then
    		    model.change_flag("nogame")
    		elseif row > model.r or row < 1 or column < 1 or column > model.col then
    			if model.in_game then
         			model.change_i2 (model.i2 + 1)
         		end
    			model.change_flag("moveout")
    		elseif (row = model.shiploc.last.trow) and (column = model.shiploc.last.tcol)  then
    			if model.in_game then
         			model.change_i2 (model.i2 + 1)
         		end
    			model.change_flag("alreadythere")
    		elseif model.num_steps ( model.shiploc.last.trow, model.shiploc.last.tcol,row, column) > model.tolmove then
    			if model.in_game then
         			model.change_i2 (model.i2 + 1)
         		end
                model.change_flag ("moresteps")
            elseif (model.num_steps (model.shiploc.last.trow, model.shiploc.last.tcol,row, column) * model.tolmovecost) > (model.remainenergyfunc("move"))  then
            	if model.in_game then
         			model.change_i2 (model.i2 + 1)
         		end
                model.change_flag ("lessresource")
    	    else
			    model.move(row,column,"")
    		end
			-- perform some update on the model state

			etf_cmd_container.on_change.notify ([Current])
    	end

end

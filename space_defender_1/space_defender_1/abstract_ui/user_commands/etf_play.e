note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_PLAY
inherit
	ETF_PLAY_INTERFACE
create
	make
feature -- command
	play(row: INTEGER_32 ; column: INTEGER_32 ; player_mov: INTEGER_32 ; project_mov: INTEGER_32)
		require else
			play_precond(row, column, player_mov, project_mov)
    	do
    		if model.game_on then
    	        model.change_flag ("gameison")
    	        model.change_i2 (model.i2 + 1)
    	    elseif player_mov > ((row-1)+(column-1)) then
    	    	model.change_flag ("exceedmove")
    	        model.change_i2 (model.i2 + 1)
    	    else
    	         -- perform some update on the model state
			     model.add_command (create {PLAY}.make(row,column,player_mov,project_mov) )
			     --model.history.item.execute
			     --model.play(row,column,player_mov,project_mov)
			     --Current.etf_cmd_name
			     model.history[model.cursor_position].execute
    		end

			etf_cmd_container.on_change.notify ([Current])
    	end

end

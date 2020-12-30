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
	play(row: INTEGER_32 ; column: INTEGER_32 ; g_threshold: INTEGER_32 ; f_threshold: INTEGER_32 ; c_threshold: INTEGER_32 ; i_threshold: INTEGER_32 ; p_threshold: INTEGER_32)
		require else
			play_precond(row, column, g_threshold, f_threshold, c_threshold, i_threshold, p_threshold)
    	do
			-- perform some update on the model state
			    -- first by default is setup mode
               if model.setup_mode = true then
               	    if model.in_game then
         			   model.change_i2 (model.i2 + 1)
         		    end
               	    model.change_flag("insetup")
               elseif model.in_game = true then
               	    if model.in_game then
         			   model.change_i2 (model.i2 + 1)
         		    end
               	    model.change_flag("ingame")
               elseif g_threshold > f_threshold or f_threshold > c_threshold or c_threshold > i_threshold or i_threshold > p_threshold or g_threshold > p_threshold then
               	    if model.in_game then
         			   model.change_i2 (model.i2 + 1)
         		    end
               	    model.change_flag("noorder")
               else
                    model.play_setup(row,column,g_threshold,f_threshold,c_threshold,i_threshold,p_threshold)  -- itailise the array of setupstate
               	    model.change_setup_mode_flag (true) -- setup start only when play is called
			        model.change_selected ("weapon setup")

               end
           etf_cmd_container.on_change.notify ([Current])

    	end

end

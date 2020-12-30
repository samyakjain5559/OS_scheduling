note
	description: "Summary description for {FIRE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIRE
inherit
    COMMANDS
--	    redefine
--	    	make
--	    end
create
    make

feature
	write_f : STRING

feature
    make
      local
		  model_access: ETF_MODEL_ACCESS
      do
        model := model_access.m   -- Calls ETF_Model_acess to initialise etf_model constructor
        write_f := ""
      end

feature
    execute
      do

          model.fire
      end

    undo
      do
      	 --model.history[model.cursor_position].write_flag ("from_fire")

         model.undo_fire
--         model.change_flag (write_f)
--         model.history[model.cursor_position].undo
      end

    redo
      do
      	 model.change_write_flag (false)

      	 model.fire
         --model.last_write.forth
      end

    write_flag(s :STRING)
      do
      	  write_f := s
      end


end

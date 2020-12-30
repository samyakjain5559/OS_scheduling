note
	description: "Summary description for {PASS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PASS

inherit
    COMMANDS
--	    redefine
--	    	make
--	    end
create
    make

feature
    make
      local
		  model_access: ETF_MODEL_ACCESS
      do
        model := model_access.m   -- Calls ETF_Model_acess to initialise etf_model constructor
      end

feature
    execute
      do

         model.pass
      end
    undo
      do
         model.undo_pass
      end

    redo
      do
      	model.change_write_flag (false)

      	model.pass
      	--model.last_write.forth

      end

end

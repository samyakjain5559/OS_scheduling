note
	description: "Summary description for {COMMANDS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class   -- ADD CHILD
	COMMANDS

--feature {NONE}
--	make
--		local
--		  model_access: ETF_MODEL_ACCESS
--		do

--			model := model_access.m   -- Calls ETF_Model_acess to initialise etf_model constructor
--		end

feature -- Attributes
	-- may declare your own model state here
	model : ETF_MODEL

feature -- child
   execute
     deferred
     --do
     --Current.model.move (mrow, mcol: INTEGER_32)
     end
   undo
     deferred

     end
   redo
     deferred
     end

--   write_flag(s:STRING)
--     deferred

--     end
end

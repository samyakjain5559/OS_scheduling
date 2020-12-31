note
	description: "Summary description for {MOVE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE
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
    row : INTEGER
    column : INTEGER
    make(rowm: INTEGER ; columnm: INTEGER)
      local
		  model_access: ETF_MODEL_ACCESS
      do
        model := model_access.m   -- Calls ETF_Model_acess to initialise etf_model constructor
      	row := rowm
      	column := columnm
      	write_f := ""
      end

feature
    execute
      do

         model.move (row, column)

      end

    undo
      do
           model.undo_move
--         model.history[model.cursor_position].write_flag ("from_move")
--         model.change_flag (write_f)
--         model.history[model.cursor_position].undo
      end

    redo
      do

      	  model.change_write_flag (false)

          model.move (row, column)
          --model.last_write.forth

      end

    write_flag(s :STRING)
      do
      	  write_f := s
      end

end

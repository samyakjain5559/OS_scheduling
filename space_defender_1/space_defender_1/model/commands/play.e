note
	description: "Summary description for {PLAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAY
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
    player_mov : INTEGER
    project_mov: INTEGER
	make(rowp: INTEGER ; columnp: INTEGER ; player_movp: INTEGER ; project_movp: INTEGER)
	  local
		  model_access: ETF_MODEL_ACCESS
		do
			model := model_access.m   -- Calls ETF_Model_acess to initialise etf_model constructor
			row := rowp
			column := columnp
			player_mov := player_movp
			project_mov := project_movp
			write_f := ""
		end

feature
  execute
     do

         model.play (row, column, player_mov, project_mov)
     end

  undo
    do
        model.play (row, column, player_mov, project_mov)
    end

  redo
    do
    	model.change_write_flag (false)

    	model.play (row, column, player_mov, project_mov)
        --model.last_write.forth
    end

  write_flag(s :STRING)
      do
      	  write_f := s
      end

end

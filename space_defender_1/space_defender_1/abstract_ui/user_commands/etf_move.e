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
		local
			r,step_row,step_col,steps : INTEGER

    	do
--    	  if model.shiploc.count /= 0  then
--	           step_row := (model.shiploc.last.trow - row)
--		       step_col := (model.shiploc.last.tcol - column)
--		       steps := step_row.abs + step_col.abs
--    	  end

    	   if not model.game_on then
                 model.change_flag ("noplay")
                 model.change_i2 (model.i2 + 1)
--            if (row > model.r) or (column > model.col) then
--	                 model.change_flag ("outbound")
--	                 model.change_i2 (model.i2 + 1)
--	        elseif steps > model.max_player_step then
--	                 model.change_flag ("morestep")
--	                model.change_i2 (model.i2 + 1)
--	        elseif (model.shiploc.last.trow = row) and (model.shiploc.last.tcol = column) then
--	                 model.change_flag ("sameloc")
--	                 model.change_i2 (model.i2 + 1)
--           elseif steps > model.max_player_step then
--	                 model.change_flag ("morestep")
--	                 model.change_i2 (model.i2 + 1)

    	   else
				-- perform some update on the model state
				if row = A then

					   if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 1)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (1 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 1) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(1,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = B then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 2)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (2 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 2) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(2,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = C then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 3)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (3 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 3) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(3,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = D then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 4)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (4 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 4) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(4,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = E then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 5)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (5 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 5) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(5,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = F then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 6)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (6 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 6) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(6,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = G then
		              if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 7)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (7 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 7) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(7,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = H then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 8)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (8 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 8) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(8,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = I then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 9)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (9 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 9) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(9,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
	            elseif row = J then
		               if model.shiploc.count /= 0  then
				           step_row := (model.shiploc.last.trow - 10)
					       step_col := (model.shiploc.last.tcol - column)
					       steps := step_row.abs + step_col.abs
		    	       end
		    	       if (10 > model.r) or (column > model.col) then
			                 model.change_flag ("outbound")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                 model.change_i2 (model.i2 + 1)
			           elseif steps > model.max_player_step then
			                 model.change_flag ("morestep")
--			                 if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                         else
--	                  	        model.change_i (1)
--	                         end
			                model.change_i2 (model.i2 + 1)
					   elseif (model.shiploc.last.trow = 10) and (model.shiploc.last.tcol = column) then
			               model.change_flag ("sameloc")
--			               if (model.i-(model.history.count-model.cursor_position)) >= 1 then
--	                  	        model.change_i (model.i-(model.history.count-model.cursor_position))
--	                       else
--	                  	        model.change_i (1)
--	                       end
			               model.change_i2 (model.i2 + 1)
			           else
						   model.add_command (create {MOVE}.make(10,column) )
						   --model.history.item.execute
			               --model.move(1,column)
			               model.history[model.cursor_position].execute
			           end
				end
			--Current.enum_items
		  end
			etf_cmd_container.on_change.notify ([Current])

    	end

end

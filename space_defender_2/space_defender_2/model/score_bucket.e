note
	description: "Summary description for {FEATUREHELPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEATUREHELPER
feature

    displayexist
          local
          	model_access: ETF_MODEL_ACCESS
          do
             across
               model_access.m.projloc  is mloc
             loop
             	 if mloc.sign ~ "*" then
             	   if model_access.m.array[mloc.prow , mloc.pcol] /~ "?"  then
             	 	 model_access.m.array.put ("*",mloc.prow , mloc.pcol)
             	   end
             	 else
             	   if model_access.m.array[mloc.prow , mloc.pcol] /~ "?"  then
             	 	model_access.m.array.put ("<",mloc.prow , mloc.pcol)
             	   end
             	 end

             end
             across
               model_access.m.enemydata  is edata
             loop
               if model_access.m.array[edata.spawn_row, edata.spawn_col] /~ "?"  then
                 model_access.m.array.put (edata.sign, edata.spawn_row, edata.spawn_col)
               end
             end
             if model_access.m.array[model_access.m.shiploc.last.trow,model_access.m.shiploc.last.tcol] ~ "X" then
             	model_access.m.array.put ("X",model_access.m.shiploc.last.trow,model_access.m.shiploc.last.tcol)
             elseif model_access.m.array[model_access.m.collide_loc.colr,model_access.m.collide_loc.colr] ~ "X" then
                model_access.m.array.put ("X",model_access.m.shiploc.last.trow,model_access.m.shiploc.last.tcol)
             end

          end
end

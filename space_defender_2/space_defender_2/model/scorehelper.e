note
	description: "Summary description for {SCOREHELPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SCOREHELPER
feature
	    scorehelp(focus:SCOREHELPER) :INTEGER
	          local
          	     model_access: ETF_MODEL_ACCESS
          	     ine : INTEGER
          	     score : INTEGER
          	     ll : LINKED_LIST[SCOREHELPER]
	          do
	          	    create ll.make
		            from
		         	ine := 1
		         	until
		         	  ine > model_access.m.enemydata.count
		         	loop
		         	   if model_access.m.enemydata[ine].dead then
                            if model_access.m.enemydata[ine].sign ~ "G" then
	            	    	   Result := score + 2
	            	    	elseif model_access.m.enemydata[ine].sign ~ "F" then
	            	    	   Result := score + 3
	            	    	elseif model_access.m.enemydata[ine].sign ~ "I" then
	            	    		Result := score + 1
	            	        elseif model_access.m.enemydata[ine].sign ~ "C" then
	            	    		Result := score + 3
	            	    		ll.extend(focus)
	            	        elseif model_access.m.enemydata[ine].sign ~ "P" then
	            	    		Result := score + 1
	            	    		ll.extend(focus)
	            	    	end
		         	   end
		         	   ine := ine + 1
		         	end
	         end

end

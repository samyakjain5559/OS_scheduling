note
	description: "Summary description for {TESTSCORE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TESTSCORE
inherit
	ES_TEST
create
	make

feature
	fighterfocus : LINKED_LIST[SCORE_BUCKET]
feature
	make
	  do
	  	create fighterfocus.make
	 	add_boolean_case(agent test1)
	  end

	  test1:BOOLEAN
	    local
	    	enp : ETF_MODEL
	     do
	     	scoreupdate("F")
            scoreupdate("C")
            scoreupdate("F")
            scoreupdate("F")
            scoreupdate("F")
            scoreupdate("P")
            scoreupdate("G")
            scoreupdate("G")
            scoreupdate("G")
            Result := 40 = score
	     end


      score :INTEGER
          do
          	across
          	   fighterfocus	 is foc
          	loop
          		Result := Result + foc.tolpoints
          	end
          end

	  scoreupdate(enemyname :STRING)  -- SCORE
            local
            	tt : SCORE_BUCKET
            	isadded : BOOLEAN
            do
                create tt.make (enemyname)
                across
                  fighterfocus	is foc
                loop
                	if foc.isfocus and foc.remain_capacity /= 0 and not isadded then
                		isadded := true
                		foc.insert(tt)

                	end
                end

                if not isadded then
                	fighterfocus.extend (tt)
                end
            end

end

note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SETUP_SELECT
inherit
	ETF_SETUP_SELECT_INTERFACE
create
	make
feature -- command
	setup_select(value: INTEGER_32)
		require else
			setup_select_precond(value)
    	do
    		if (model.setup_mode = false) or (model.setup_mode = true and model.setup_cursor = 5 ) then
    			if model.in_game then
    				model.change_i2 (model.i2+1)
    			end
			  	model.change_flag ("notsetupselect")
		    else
			-- perform some update on the model state
		            if model.setup_cursor = 1 and model.setup_mode  then
		            	model.change_flag ("weaponstate")
			            model.change_selected ("weapon setup")
		            	if value < 1 or value > 5 then
		            		model.change_flag ("outofselect")
		            	else
			            	if value = 1 then
			            		--model.update_data(10,10,0,1,0,1,1,1,70,5)
			            		model.change_weapon_name("Standard")
			                elseif value = 2 then
			            		--model.update_data(0,60,0,2,1,0,0,2,50,10)
			            		model.data[model.setup_cursor].health := 0
			            		model.data[model.setup_cursor].energy := 60
			            		model.data[model.setup_cursor].regenh := 0
			            		model.data[model.setup_cursor].regene := 2
			            		model.data[model.setup_cursor].armour := 1
			            		model.data[model.setup_cursor].vision := 0
			            		model.data[model.setup_cursor].move := 0
			            		model.data[model.setup_cursor].movecost := 2
			            		model.data[model.setup_cursor].projdamage := 50
			            		model.data[model.setup_cursor].projcost := 10
			            		model.change_weapon_name("Spread")
			                elseif value = 3 then
			            		--model.update_data(0,100,0,5,0,10,3,0,1000,20)
			            		model.data[model.setup_cursor].health := 0
			            		model.data[model.setup_cursor].energy := 100
			            		model.data[model.setup_cursor].regenh := 0
			            		model.data[model.setup_cursor].regene := 5
			            		model.data[model.setup_cursor].armour := 0
			            		model.data[model.setup_cursor].vision := 10
			            		model.data[model.setup_cursor].move := 3
			            		model.data[model.setup_cursor].movecost := 0
			            		model.data[model.setup_cursor].projdamage := 1000
			            		model.data[model.setup_cursor].projcost := 20
			            		model.change_weapon_name("Snipe")
			                elseif value = 4 then
			            		--model.update_data(10,0,10,0,2,2,0,3,100,10)
			            		model.data[model.setup_cursor].health := 10
			            		model.data[model.setup_cursor].energy := 0
			            		model.data[model.setup_cursor].regenh := 10
			            		model.data[model.setup_cursor].regene := 0
			            		model.data[model.setup_cursor].armour := 2
			            		model.data[model.setup_cursor].vision := 2
			            		model.data[model.setup_cursor].move := 0
			            		model.data[model.setup_cursor].movecost := 3
			            		model.data[model.setup_cursor].projdamage := 100
			            		model.data[model.setup_cursor].projcost := 10
			            		model.change_weapon_name("Rocket")
			                elseif value = 5 then
			            		--model.update_data(0,100,0,10,0,0,0,5,150,70)
			            		model.data[model.setup_cursor].health := 0
			            		model.data[model.setup_cursor].energy := 100
			            		model.data[model.setup_cursor].regenh := 0
			            		model.data[model.setup_cursor].regene := 10
			            		model.data[model.setup_cursor].armour := 0
			            		model.data[model.setup_cursor].vision := 0
			            		model.data[model.setup_cursor].move := 0
			            		model.data[model.setup_cursor].movecost := 5
			            		model.data[model.setup_cursor].projdamage := 150
			            		model.data[model.setup_cursor].projcost := 70
			            		model.change_weapon_name("Splitter")
			            	end

			            end
		            elseif model.setup_cursor = 2 and model.setup_mode  then

				        model.change_flag ("armourstate")
				        model.change_selected ("armour setup")

		            	if value < 1 or value > 4 then
		            		model.change_flag ("outofselect")
		            	else
				                if value = 1 then
				            		--model.update_data(50,0,1,0,0,0,1,0,0,0)
				            		model.change_armour_name("None")
				                elseif value = 2 then
				            		--model.update_data(75,0,2,0,3,0,0,1,0,0)
				            		model.data[model.setup_cursor].health := 75
				            		model.data[model.setup_cursor].energy := 0
				            		model.data[model.setup_cursor].regenh := 2
				            		model.data[model.setup_cursor].regene := 0
				            		model.data[model.setup_cursor].armour := 3
				            		model.data[model.setup_cursor].vision := 0
				            		model.data[model.setup_cursor].move := 0
				            		model.data[model.setup_cursor].movecost := 1
				            		model.data[model.setup_cursor].projdamage := 0
				            		model.data[model.setup_cursor].projcost := 0
				            		model.change_armour_name("Light")
				                elseif value = 3 then
				            		--model.update_data(100,0,3,0,5,0,0,3,0,0)
				            		model.data[model.setup_cursor].health := 100
				            		model.data[model.setup_cursor].energy := 0
				            		model.data[model.setup_cursor].regenh := 3
				            		model.data[model.setup_cursor].regene := 0
				            		model.data[model.setup_cursor].armour := 5
				            		model.data[model.setup_cursor].vision := 0
				            		model.data[model.setup_cursor].move := 0
				            		model.data[model.setup_cursor].movecost := 3
				            		model.data[model.setup_cursor].projdamage := 0
				            		model.data[model.setup_cursor].projcost := 0
				            		model.change_armour_name("Medium")
				                elseif value = 4 then
				            		--model.update_data(200,0,4,0,10,0,-1,5,0,0)
				            		model.data[model.setup_cursor].health := 200
				            		model.data[model.setup_cursor].energy := 0
				            		model.data[model.setup_cursor].regenh := 4
				            		model.data[model.setup_cursor].regene := 0
				            		model.data[model.setup_cursor].armour := 10
				            		model.data[model.setup_cursor].vision := 0
				            		model.data[model.setup_cursor].move := -1
				            		model.data[model.setup_cursor].movecost := 5
				            		model.data[model.setup_cursor].projdamage := 0
				            		model.data[model.setup_cursor].projcost := 0
				            		model.change_armour_name("Heavy")
				            	end
				         end
		            elseif model.setup_cursor = 3 and model.setup_mode  then
		            	 model.change_flag ("enginestate")
				         model.change_selected ("engine setup")

		            	 if value < 1 or value > 3 then
		            		model.change_flag ("outofselect")
		            	 else
				                if value = 1 then
				            		--model.update_data(10,60,0,2,1,12,8,2,0,0)
				            		model.change_engine_name("Standard")
				                elseif value = 2 then
				            		--model.update_data(0,30,0,1,0,15,10,1,0,0)
				            		model.data[model.setup_cursor].health := 0
				            		model.data[model.setup_cursor].energy := 30
				            		model.data[model.setup_cursor].regenh := 0
				            		model.data[model.setup_cursor].regene := 1
				            		model.data[model.setup_cursor].armour := 0
				            		model.data[model.setup_cursor].vision := 15
				            		model.data[model.setup_cursor].move := 10
				            		model.data[model.setup_cursor].movecost := 1
				            		model.data[model.setup_cursor].projdamage := 0
				            		model.data[model.setup_cursor].projcost := 0
				            		model.change_engine_name("Light")
				                elseif value = 3 then
				            		--model.update_data(50,100,0,3,3,6,4,5,0,0)
				            		model.data[model.setup_cursor].health := 50
				            		model.data[model.setup_cursor].energy := 100
				            		model.data[model.setup_cursor].regenh := 0
				            		model.data[model.setup_cursor].regene := 3
				            		model.data[model.setup_cursor].armour := 3
				            		model.data[model.setup_cursor].vision := 6
				            		model.data[model.setup_cursor].move := 4
				            		model.data[model.setup_cursor].movecost := 5
				            		model.data[model.setup_cursor].projdamage := 0
				            		model.data[model.setup_cursor].projcost := 0
				            		model.change_engine_name("Armoured")
				            	end

				        end
		            elseif model.setup_cursor = 4 and model.setup_mode  then
		            	model.change_flag ("powerstate")
				        model.change_selected ("power setup")
		            	if value < 1 or value > 5 then
		            		model.change_flag ("outofselect")
		            	else
				            	if value = 1 then
				            		model.change_power_name("Recall (50 energy): Teleport back to spawn.")
				                elseif value = 2 then
				            		model.change_power_name("Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap.")
				                elseif value = 3 then
				            		model.change_power_name("Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap.")
				                elseif value = 4 then
				            		model.change_power_name("Deploy Drones (100 energy): Clear all projectiles.")
				                elseif value = 5 then
				            		model.change_power_name("Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour.")
				            	end

				       end
				    end
		    end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

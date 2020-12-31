note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SPECIAL
inherit
	ETF_SPECIAL_INTERFACE
create
	make
feature -- command
	special
    	do
			-- perform some update on the model state
			if model.in_game = false then
			  model.change_flag("nogame")
			else
				  if model.power_name ~ "Recall (50 energy): Teleport back to spawn." then
				      if model.remainenergyfunc("special") < 50 then
				      	if model.in_game then
         			       model.change_i2 (model.i2 + 1)
         		        end
				        model.change_flag("lessresourcesspec")
				      else
				      	model.special
				      end
				  elseif model.power_name ~ "Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap." then
				      if model.remainenergyfunc("special") < 50 then
				      	if model.in_game then
         			       model.change_i2 (model.i2 + 1)
         		        end
				        model.change_flag("lessresourcesspec")
				      else
				      	model.special
				      end
				  elseif model.power_name ~ "Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap." then
				      if model.remainenergyfunc("special") < 1 then    -- do this
                      if model.in_game then
         			       model.change_i2 (model.i2 + 1)
         		        end
				        model.change_flag("lessresourcesspec")
				      else
				      	model.special
				      end
                  elseif model.power_name ~ "Deploy Drones (100 energy): Clear all projectiles." then
				      if model.remainenergyfunc("special") < 100 then
				      	if model.in_game then
         			       model.change_i2 (model.i2 + 1)
         		        end
				        model.change_flag("lessresourcesspec")
				      else
				      	model.special
				      end
				  elseif model.power_name ~ "Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour." then
				      if model.remainenergyfunc("special") < 100 then
				      	if model.in_game then
         			       model.change_i2 (model.i2 + 1)
         		        end
				        model.change_flag("lessresourcesspec")
				      else
				      	model.special
				      end
				  end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end

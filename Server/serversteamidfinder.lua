--[[ script that will print the steamid of any player
 /steamid numberid  gives the steamid  of the player that has that id
 /mysteamid         gives the players personal steamid
 ]]--
function mysteamid(args)
 local playerthatasked = args.player
 local words = args.text:split(" ")
 if #words == 1 and words[1]== "/mysteamid" then
			if IsValid(playerthatasked) then 		
			local ysrmid= "Your STEAM ID short form is "
			local ysrmid1=" long form: "
			local steamfinder2=playerthatasked:GetSteamId().id
			local steamfinder3=playerthatasked:GetSteamId().string
		playerthatasked:SendChatMessage(ysrmid..tostring(steamfinder3) ..ysrmid1.. steamfinder2 ,Color(100, 149, 237)) 
				end
	end
end
function steamfinderothers(args)
 local playerthatasked = args.player
 local playertofind 
 local words = args.text:split(" ")
if #words == 2 and words[1] == "/steamid" then
		for player in Server:GetPlayers() do
			if player:GetId()== tonumber(words[2]) then playertofind = player  
				end
		end		
		if IsValid(playerthatasked) and IsValid(playertofind) then -- if both players are online
			local steamidfinder1=playertofind:GetSteamId().string
			local steamidfinder2=playertofind:GetSteamId().id
			local steaminfotxt =" 's STEAM ID is "
			local ysrmid1=" long form: "
			playerthatasked:SendChatMessage(tostring(playertofind:GetName())..steaminfotxt..tostring(steamidfinder1)..ysrmid1..steamidfinder2 , Color(100, 149, 237))
		elseif IsValid(playerthatasked) and not IsValid(playertofind) then -- if the target  player is not online
		local playernotfoundmessage= "This player is no longer in the game"
		playerthatasked:SendChatMessage(playernotfoundmessage, Color( 255,100,100))
			return true
end
end
end

Events:Subscribe("PlayerChat",mysteamid)
Events:Subscribe("PlayerChat",steamfinderothers)

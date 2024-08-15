#!mainFile "../main.opy"

rule "[player_status/reset_conditions.opy] Player Status - Reset Conditions as game starts":
    @Condition isGameInProgress() == false
    @Condition isInSetup() == true
    @Condition (Team1Ready == "ready" and Team2Ready == "ready" or getMatchTime() < 0.1) == true
    
    getAllPlayers().stopForcingOutlineFor(getAllPlayers())
    getAllPlayers().AFK = false


rule "[player_status/reset_conditions.opy] Player Status - Reset Outlines when a Player joins (Swaps Teams)":
    @Event playerJoined
    @Condition isInSetup() == true
    
    getAllPlayers().stopForcingOutlineFor(eventPlayer)
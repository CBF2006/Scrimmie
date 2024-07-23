#!mainFile "../main.opy"

# HUD Creation & Destruction
rule "Player Status - Create Inactivity HUD":
    @Condition Player_Status == true
    @Condition isInSetup() == true
    @Condition Display_StatusHUD == true
    
    if getPlayersInSlot(0, Team.1).AFK == true or getPlayersInSlot(1, Team.1).AFK == true or getPlayersInSlot(2, Team.1).AFK == true or getPlayersInSlot(3, Team.1).AFK == true or getPlayersInSlot(4, Team.1).AFK == true:
        if Team1StatusHUD == false:
            hudSubtext(getPlayers(Team.1), LanguageArray[30][localPlayer.PlayerLanguage], HudPosition.LEFT, 0.3, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
            Team1StatusTextID = getLastCreatedText()
            Team1StatusHUD = true
    if getPlayersInSlot(0, Team.2).AFK == true or getPlayersInSlot(1, Team.2).AFK == true or getPlayersInSlot(2, Team.2).AFK == true or getPlayersInSlot(3, Team.2).AFK == true or getPlayersInSlot(4, Team.2).AFK == true:
        if Team2StatusHUD == false:
            hudSubtext(getPlayers(Team.2), LanguageArray[30][localPlayer.PlayerLanguage], HudPosition.LEFT, 0.3, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
            Team2StatusTextID = getLastCreatedText()
            Team2StatusHUD = true


rule "Player Status - Clear Inactivity HUD":
    @Condition Player_Status == true
    @Condition isInSetup() == true
    @Condition (getPlayersInSlot(0, Team.1).ChangeStatusHUD == true or getPlayersInSlot(1, Team.1).ChangeStatusHUD == true or getPlayersInSlot(2, Team.1).ChangeStatusHUD == true or getPlayersInSlot(3, Team.1).ChangeStatusHUD == true or getPlayersInSlot(4, Team.1).ChangeStatusHUD == true or getPlayersInSlot(0, Team.2).ChangeStatusHUD == true or getPlayersInSlot(1, Team.2).ChangeStatusHUD == true or getPlayersInSlot(2, Team.2).ChangeStatusHUD == true or getPlayersInSlot(3, Team.2).ChangeStatusHUD == true or getPlayersInSlot(4, Team.2).ChangeStatusHUD == true) == true
    
    if getPlayersInSlot(0, Team.1).AFK == false and getPlayersInSlot(1, Team.1).AFK == false and getPlayersInSlot(2, Team.1).AFK == false and getPlayersInSlot(3, Team.1).AFK == false and getPlayersInSlot(4, Team.1).AFK == false:
        destroyHudText(Team1StatusTextID)
        Team1StatusHUD = false
    if getPlayersInSlot(0, Team.2).AFK == false and getPlayersInSlot(1, Team.2).AFK == false and getPlayersInSlot(2, Team.2).AFK == false and getPlayersInSlot(3, Team.2).AFK == false and getPlayersInSlot(4, Team.2).AFK == false:
        destroyHudText(Team2StatusTextID)
        Team2StatusHUD = false


rule "Player Status - Remove HUD if a player leaves":
    @Event playerLeft
    
    eventPlayer.ChangeStatusHUD = true
    wait(0.1)
    eventPlayer.ChangeStatusHUD = false


# Variable Tracking
rule "Player Status - Track how long a player has been AFK":
    @Event eachPlayer
    @Condition eventPlayer.AFK == true
    
    eventPlayer.AFK_Timer = 25
    while eventPlayer.AFK == true:
        eventPlayer.AFK_Timer += 1
        wait(1)
    if eventPlayer.AFK == false:
        eventPlayer.AFK_Timer = 25




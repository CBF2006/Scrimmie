#!mainFile "main.opy"

rule "Player Status - Check if a player is inactive (AFK)":
    @Event eachPlayer
    @Condition Player_Status == true
    @Condition isInSetup() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition eventPlayer.isMoving() == false
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == false
    @Condition eventPlayer.isFiringPrimaryFire() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == false
    @Condition eventPlayer.isJumping() == false
    @Condition eventPlayer.isCrouching() == false
    
    wait(25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.AFK = true
    Display_StatusHUD = true
    eventPlayer.startForcingOutlineFor(getPlayers(eventPlayer.getTeam()), true, Color.YELLOW, OutlineVisibility.ALWAYS)
    hudSubheader(getPlayers(Team.1 if eventPlayer.getTeam() == Team.1 else Team.2), "{0} - {1}".format(eventPlayer, "{0}{1}".format(eventPlayer.AFK_Timer, LanguageArray[17][localPlayer.PlayerLanguage])), HudPosition.LEFT, 0.4, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    eventPlayer.Status_TextID = getLastCreatedText()
    hudSubtext(eventPlayer, LanguageArray[32][eventPlayer.PlayerLanguage], HudPosition.TOP, 26, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    eventPlayer.AFK_TextID = getLastCreatedText()
    wait(1)
    Display_StatusHUD = false


rule "Player Status - Clear Text if a player returns (AFK)":
    @Event eachPlayer
    @Condition Player_Status == true
    @Condition isInSetup() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition (eventPlayer.isMoving() or eventPlayer.isHoldingButton(Button.RELOAD) or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire() or eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isHoldingButton(Button.ULTIMATE) or eventPlayer.isJumping() or eventPlayer.isCrouching()) == true
    @Condition eventPlayer.AFK == true
    
    eventPlayer.AFK = false
    eventPlayer.ChangeStatusHUD = true
    eventPlayer.stopForcingOutlineFor(getPlayers(eventPlayer.getTeam()))
    destroyHudText(eventPlayer.Status_TextID)
    destroyHudText(eventPlayer.AFK_TextID)
    wait(0.1)
    eventPlayer.ChangeStatusHUD = false


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


rule "Player Status - Reset Conditions as game starts":
    @Condition isGameInProgress() == false
    @Condition isInSetup() == true
    @Condition (Team1Ready == "ready" and Team2Ready == "ready" or getMatchTime() < 0.1) == true
    
    getAllPlayers().stopForcingOutlineFor(getAllPlayers())
    getAllPlayers().AFK = false


rule "Player Status - Reset Outlines when a Player joins (Swaps Teams)":
    @Event playerJoined
    @Condition isInSetup() == true
    
    getAllPlayers().stopForcingOutlineFor(eventPlayer)


rule "Player Status - Remove HUD if a player leaves":
    @Event playerLeft
    
    eventPlayer.ChangeStatusHUD = true
    wait(0.1)
    eventPlayer.ChangeStatusHUD = false


rule "Player Status - Track how long a player has been AFK":
    @Event eachPlayer
    @Condition eventPlayer.AFK == true
    
    eventPlayer.AFK_Timer = 25
    while eventPlayer.AFK == true:
        eventPlayer.AFK_Timer += 1
        wait(1)
    if eventPlayer.AFK == false:
        eventPlayer.AFK_Timer = 25
#!mainFile "../main.opy"


rule "[player_status/status_check.opy] Player Status - Check if a player is inactive (AFK)":
    @Event eachPlayer
    @Condition Player_Status
    @Condition isInSetup()

    @Condition eventPlayer.getCurrentHero() != null
    @Condition eventPlayer.AFK != true

    @Condition eventPlayer.isMoving() == false
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == false
    @Condition eventPlayer.isFiringPrimaryFire() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == false
    @Condition eventPlayer.isJumping() == false
    @Condition eventPlayer.isCrouching() == false
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == false
    
    # Saving Player Facing Direction
    eventPlayer.FacingPosition = eventPlayer.getFacingDirection()

    while eventPlayer.FacingPosition == eventPlayer.getFacingDirection():
        # Wait 25 seconds
        wait(AFK_Trigger_Time, Wait.ABORT_WHEN_FALSE)
        break

    if eventPlayer.FacingPosition == eventPlayer.getFacingDirection():
        # Player is AFK, Initialize
        eventPlayer.AFK = true
        eventPlayer.communicate(Comms.GOODBYE)
        Display_StatusHUD = true
        eventPlayer.startForcingOutlineFor(getPlayers(eventPlayer.getTeam()), true, Color.YELLOW, OutlineVisibility.ALWAYS)
        hudSubheader(getPlayers(Team.1 if eventPlayer.getTeam() == Team.1 else Team.2), "{0} {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), eventPlayer, "{0}{1}".format(eventPlayer.AFK_Timer, LanguageArray[17][localPlayer.PlayerLanguage])), HudPosition.LEFT, 0.4, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
        eventPlayer.Status_TextID = getLastCreatedText()
        hudSubtext(eventPlayer, LanguageArray[32][eventPlayer.PlayerLanguage], HudPosition.TOP, 26, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
        eventPlayer.AFK_TextID = getLastCreatedText()
        wait(1)
        Display_StatusHUD = false


rule "[player_status/status_check.opy] Player Status - Clear Text if a player returns (AFK)":
    @Event eachPlayer
    @Condition Player_Status
    @Condition isInSetup()

    @Condition eventPlayer.getCurrentHero() != null
    @Condition eventPlayer.AFK == true
    
    @Condition (
        eventPlayer.isMoving() or 
        eventPlayer.isHoldingButton(Button.RELOAD) or 
        eventPlayer.isFiringPrimaryFire() or 
        eventPlayer.isFiringSecondaryFire() or 
        eventPlayer.isUsingAbility1() or 
        eventPlayer.isUsingAbility2() or 
        eventPlayer.isHoldingButton(Button.ULTIMATE) or 
        eventPlayer.isJumping() or eventPlayer.isCrouching() or 
        eventPlayer.isHoldingButton(Button.INTERACT) or 
        eventPlayer.isHoldingButton(Button.MELEE) or 
        eventPlayer.FacingPosition != eventPlayer.getFacingDirection()
    )
    
    eventPlayer.AFK = false
    eventPlayer.ChangeStatusHUD = true
    eventPlayer.stopForcingOutlineFor(getPlayers(eventPlayer.getTeam()))
    destroyHudText(eventPlayer.Status_TextID)
    destroyHudText(eventPlayer.AFK_TextID)
    wait(0.1)
    eventPlayer.ChangeStatusHUD = false


    
    
    
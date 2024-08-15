#!mainFile "../main.opy"

rule "[features/ready_up.opy] Ready Up - Ready Confirmation On":
    @Event eachPlayer
    @Condition Ready_Up_System == 1
    @Condition isGameInProgress() == false
    @Condition eventPlayer.getCurrentHero() == true
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.ReadyCD == 0
    
    eventPlayer.ReadyCD = 1
    chase(eventPlayer.ReadyCD, 0, duration=1, ChaseReeval.DESTINATION_AND_DURATION)
    if eventPlayer.getTeam() == Team.1:
        if Team1Ready == "Not Ready":
            if getPlayersInSlot(0, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(1, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(2, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(3, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(4, eventPlayer.getTeam()).AFK == true:
                if eventPlayer.Has_Readied == false:
                    smallMessage(eventPlayer, "  {0}".format(LanguageArray[31][localPlayer.PlayerLanguage]))
                    hudHeader(eventPlayer, LanguageArray[33][eventPlayer.PlayerLanguage], HudPosition.TOP, 22, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
                    eventPlayer.Confirm_Ready_TextID = getLastCreatedText()
                    eventPlayer.Has_Readied = true
                else:
                    Team1Ready = "Ready"
                    destroyHudText(eventPlayer.Confirm_Ready_TextID)
                    eventPlayer.communicate(Comms.READY)
                    smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
                    eventPlayer.Has_Readied = false
            else:
                Team1Ready = "Ready"
                eventPlayer.communicate(Comms.READY)
                smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team1Ready = "Not Ready"
            smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))
    elif eventPlayer.getTeam() == Team.2:
        if Team2Ready == "Not Ready":
            if getPlayersInSlot(0, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(1, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(2, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(3, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(4, eventPlayer.getTeam()).AFK == true:
                if eventPlayer.Has_Readied == false:
                    smallMessage(eventPlayer, "  {0}".format(LanguageArray[31][localPlayer.PlayerLanguage]))
                    hudHeader(eventPlayer, LanguageArray[33][eventPlayer.PlayerLanguage], HudPosition.TOP, 22, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
                    eventPlayer.Confirm_Ready_TextID = getLastCreatedText()
                    eventPlayer.Has_Readied = true
                else:
                    Team2Ready = "Ready"
                    destroyHudText(eventPlayer.Confirm_Ready_TextID)
                    eventPlayer.communicate(Comms.READY)
                    smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
                    eventPlayer.Has_Readied = false
            else:
                Team2Ready = "Ready"
                eventPlayer.communicate(Comms.READY)
                smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team2Ready = "Not Ready"
            smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))


rule "[features/ready_up.opy] Ready Up - Ready Confirmation Off":
    @Event eachPlayer
    @Condition Ready_Up_System == false
    @Condition isGameInProgress() == false
    @Condition eventPlayer.getCurrentHero() == true
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.ReadyCD == 0
    
    eventPlayer.ReadyCD = 1
    chase(eventPlayer.ReadyCD, 0, duration=1, ChaseReeval.DESTINATION_AND_DURATION)
    if eventPlayer.getTeam() == Team.1:
        if Team1Ready == "Not Ready":
            Team1Ready = "Ready"
            eventPlayer.communicate(Comms.READY)
            smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team1Ready = "Not Ready"
            smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))
    elif eventPlayer.getTeam() == Team.2:
        if Team2Ready == "Not Ready":
            Team2Ready = "Ready"
            eventPlayer.communicate(Comms.READY)
            smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team2Ready = "Not Ready"
            smallMessage(getAllPlayers(), "  {0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))

rule "[features/ready_up.opy] Both Teams Ready: Match starts in 5 sec, Remove HUD, Reset variables":
    @Condition isGameInProgress() == false
    @Condition getMatchTime() > 5
    @Condition Team1Ready == "Ready"
    @Condition Team2Ready == "Ready"
                
    setMatchTime(5)
    wait(1)
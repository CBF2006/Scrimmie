# Remove the "#" below once the duplicate gamemodes are removed, then go into the json file and fix it (Two gamemodes are disabled)
# This does mean every time this is compiled you will have to fix the settings in-game

# settings "settings.opy.json"


# Variables & Subroutines
#!include "variables.opy"


# Adding Spectator Scoreboard
#!include "scoreboard/scoreboard.opy"


rule "Remove Assembling Heroes":
    @Condition isAssemblingHeroes() == true
    
    setMatchTime(0)
    wait(5)
    setMatchTime(50)


rule "Help HUD":
    @Condition isGameInProgress() == false
    @Condition InfoDrawn == false
    
    Ready_Up_System = createWorkshopSetting(bool, "3. Player Status", "Require Confirmation to Ready if a player is AFK", true, 2)
    Player_Status = createWorkshopSetting(bool, "3. Player Status", "Player Status", true, 1)
    Scoreboard_Size = createWorkshopSetting(enum["Large", "Small"], "2. Spectator Scoreboard", "Size", 0, 1)
    AllowDCResume = createWorkshopSetting(bool, "1. General Settings", "Allow Disconnect Resume", true, 2)
    MatchDelayAmount = createWorkshopSetting(int[15:300], "1. General Settings", "Setup Time Interval", 60, 3)
    ScoreboardGrouping = createWorkshopSetting(enum["Separate Teams", "Combine Teams (ScrimTime)"], "2. Spectator Scoreboard", "Grouping", 0, 2)
    ScoreboardLayout = createWorkshopSetting(enum["Scrimmie / OWL", "ScrimTime Standard"], "2. Spectator Scoreboard", "Layout", 0, 3)
    ScoreboardSorting = createWorkshopSetting(enum["By Slot", "By Role"], "2. Spectator Scoreboard", "Sorting", 0, 4)
    DevMode = createWorkshopSetting(bool, "6. Developer Options", "Developer Mode", false, 0)
    Team1Ready = "Not Ready"
    Team2Ready = "Not Ready"
    #Change Hero (Defense Only)
    hudSubheader(getAllPlayers(), "{0} {1}: {2}".format(LanguageArray[1][localPlayer.PlayerLanguage], buttonString(Button.RELOAD), LanguageArray[2][localPlayer.PlayerLanguage]), HudPosition.RIGHT, 26, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Ready Up
    hudSubheader(getAllPlayers(), "{0} {1}: {2}".format(LanguageArray[3][localPlayer.PlayerLanguage], "{0} + {1}".format(buttonString(Button.CROUCH), buttonString(Button.INTERACT)), LanguageArray[4][localPlayer.PlayerLanguage]), HudPosition.RIGHT, 23, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Add Time
    hudSubheader(getAllPlayers(), "{0}: {1}".format("{0} {1}".format(LanguageArray[3][localPlayer.PlayerLanguage], buttonString(Button.ULTIMATE)), "{0} {1} {2}".format(LanguageArray[5][localPlayer.PlayerLanguage], MatchDelayAmount, LanguageArray[6][localPlayer.PlayerLanguage])), HudPosition.RIGHT, 24, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Defender Teleport
    hudSubheader(getAllPlayers(), "{0} {1}: {2}".format(LanguageArray[3][localPlayer.PlayerLanguage], buttonString(Button.MELEE), LanguageArray[8][localPlayer.PlayerLanguage]), HudPosition.RIGHT, 26, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Change Language
    hudSubheader(getAllPlayers(), "{0} {1}: {2}".format(LanguageArray[3][localPlayer.PlayerLanguage], "{0} + {1}".format(buttonString(Button.INTERACT), buttonString(Button.RELOAD)), LanguageArray[11][localPlayer.PlayerLanguage]), HudPosition.RIGHT, 27, Color.LIME_GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Team 1 Ready
    hudHeader(getAllPlayers(), "{0} {1}".format(Team.1, LanguageArray[10][localPlayer.PlayerLanguage] if Team1Ready == "Ready" else LanguageArray[0][localPlayer.PlayerLanguage]), HudPosition.TOP, 20, Color.GREEN if Team1Ready == "Ready" else Color.RED, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    #Team 2 Ready
    hudHeader(getAllPlayers(), "{0} {1}".format(Team.2, LanguageArray[10][localPlayer.PlayerLanguage] if Team2Ready == "Ready" else LanguageArray[0][localPlayer.PlayerLanguage]), HudPosition.TOP, 21, Color.GREEN if Team2Ready == "Ready" else Color.RED, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.ALWAYS)
    #Current Language in Default Language
    hudSubheader(getAllPlayers(), CurrentLanguageArray[DefaultLanguage][localPlayer.PlayerLanguage], HudPosition.TOP, 24, Color.LIME_GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Scrimmie! Banner
    if createWorkshopSetting(bool, "5. Advanced Options", "Scrimmie Banner", true, 1) == true:
        hudSubheader(getAllPlayers(), LanguageArray[7][localPlayer.PlayerLanguage], HudPosition.LEFT, 0, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        hudSubheader(getAllPlayers(), "workshop.codes/scrimmie", HudPosition.LEFT, 0.1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        hudSubheader(getAllPlayers(), "{0}: Y2TXE".format(LanguageArray[12][localPlayer.PlayerLanguage]), HudPosition.LEFT, 0.2, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    if DevMode == true:
        #Developer Mode
        hudSubtext(getAllPlayers(), "DEVELOPER MODE ENABLED", HudPosition.TOP, 25, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #DEBUG - Set Timer to 10s
        hudSubheader(getAllPlayers(), "Press {0}: Set timer to 10 seconds".format(buttonString(Button.INTERACT)), HudPosition.RIGHT, 28, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    InfoDrawn = true


rule "Game in Progress: Remove HUD, Reset variables":
    @Condition InfoDrawn == true
    @Condition isGameInProgress() == true
    
    Team1Ready = "Not Ready"
    Team2Ready = "Not Ready"
    destroyAllHudTexts()
    DrawScoreboard = true
    InfoDrawn = false
    getPlayersInSlot(0, Team.1).AFK = 0
    getPlayersInSlot(1, Team.1).AFK = 0
    getPlayersInSlot(2, Team.1).AFK = 0
    getPlayersInSlot(3, Team.1).AFK = 0
    getPlayersInSlot(4, Team.1).AFK = 0
    getPlayersInSlot(0, Team.2).AFK = 0
    getPlayersInSlot(1, Team.2).AFK = 0
    getPlayersInSlot(2, Team.2).AFK = 0
    getPlayersInSlot(3, Team.2).AFK = 0
    getPlayersInSlot(4, Team.2).AFK = 0
    Flashpoint = 5


rule "Both Teams Ready: Match starts in 5 sec, Remove HUD, Reset variables":
    @Condition isGameInProgress() == false
    @Condition getMatchTime() > 5
    @Condition Team1Ready == "Ready"
    @Condition Team2Ready == "Ready"
    
    setMatchTime(5)
    wait(1)


rule "Ultimate: +Ns match time while in setup":
    @Event eachPlayer
    @Condition isGameInProgress() == false
    @Condition getMatchTime() >= 0.1
    @Condition eventPlayer.getCurrentHero() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.AddTimeCD == 0
    
    MaxSetupTime = createWorkshopSetting(int[60:600], "1. General Settings", "Maximum Setup Time", 120, 2)
    if getMatchTime() + MatchDelayAmount >= MaxSetupTime:
        setMatchTime(MaxSetupTime)
        smallMessage(eventPlayer, "  {0}".format(LanguageArray[25][localPlayer.PlayerLanguage]))
    else:
        eventPlayer.AddTimeCD = 1
        chase(eventPlayer.AddTimeCD, 0, duration=1, ChaseReeval.DESTINATION_AND_DURATION)
        setMatchTime(getMatchTime() + MatchDelayAmount)
        smallMessage(getAllPlayers(), "  {0} {1} {2}".format("{0} {1}".format(eventPlayer, LanguageArray[26][eventPlayer.PlayerLanguage]), MatchDelayAmount, LanguageArray[27][localPlayer.PlayerLanguage]))
        if eventPlayer.getTeam() == Team.1:
            Team1Ready = "Not Ready"
        else:
            Team2Ready = "Not Ready"


rule "Ready Up - Ready Confirmation On":
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


rule "Ready Up - Ready Confirmation Off":
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


rule "Force Map Completion":
    @Condition createWorkshopSetting(bool, "5. Advanced Options", "Force Map Completion", true, 3)
    @Condition isMatchBetweenRounds() == true
    @Condition isTeamOnOffense(Team.2) == true
    @Condition ScoreModified == 0
    
    wait(10)
    ScoreModified = 1
    if getCurrentGamemode() == Gamemode.ESCORT or getCurrentGamemode() == Gamemode.HYBRID:
        setTeamScore(Team.2, 3)
    elif getCurrentGamemode() == Gamemode.ASSAULT:
        setTeamScore(Team.2, 2)


rule "End Control after 3 rounds":
    @Condition getCurrentGamemode() == Gamemode.CONTROL
    @Condition teamScore(Team.1) + teamScore(Team.2) == 3
    
    declareTeamVictory(Team.1 if teamScore(Team.1) > teamScore(Team.2) else Team.2)


rule "End Hybrid/Escort if teams tie":
    @Condition (getCurrentGamemode() == Gamemode.ESCORT or getCurrentGamemode() == Gamemode.HYBRID) == true
    @Condition teamScore(Team.1) == 3
    @Condition teamScore(Team.2) == 3
    
    declareDraw()


rule "End Flashpoint once all points have been played":
    @Condition isGameInProgress() == true
    @Condition getCurrentGamemode() == Gamemode.FLASHPOINT
    #There are 5 Flashpoints, so this condition is met once all Flashpoints have been played
    @Condition teamScore(Team.1) + teamScore(Team.2) == 5
    
    declareTeamVictory(Team.1 if teamScore(Team.1) > teamScore(Team.2) else Team.2)
    #Flashpoint is bugged currently and you cannot manually declare a winner
    smallMessage(getAllPlayers(), "  {0}".format(InfoDrawn[28][localPlayer.PlayerLanguage]))
    wait(4.5)
    returnToLobby()


rule "Defense Map Change Hero":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition isTeamOnDefense(eventPlayer.getTeam()) == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition getMatchTime() >= 1
    
    wait(0.2, Wait.ABORT_WHEN_FALSE)
    smallMessage(eventPlayer, "  {0} {1} {2}".format(LanguageArray[9][localPlayer.PlayerLanguage], buttonString(Button.RELOAD), LanguageArray[24][localPlayer.PlayerLanguage]))
    wait(0.7, Wait.ABORT_WHEN_FALSE)
    eventPlayer.HeroList = getAllHeroes()
    eventPlayer.HeroList.remove(eventPlayer.getCurrentHero())
    eventPlayer.setAllowedHeroes(eventPlayer.HeroList)
    wait(0.1)
    eventPlayer.setAllowedHeroes(getAllHeroes())


# Adding Defender Teleports
#!include "features/teleports.opy"


# Adding Disconnect Resume
#!include "features/dc_resume.opy"


# Adding Language Strings
#!include "lang.opy"


# Multi-Language Support
rule "Multi-Language: Set Default Language":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition getMatchRound() == 1
    
    DefaultLanguage = createWorkshopSetting(enum["English", "Spanish / Español", "Korean / 한국어", "French / Français", "Japanese / 日本語", "Chinese (Simplified) / 简体中文", "Chinese (Traditional) / 繁體中文"], "1. General Settings", "Default Language", 0, 0)
    getAllPlayers().PlayerLanguage = DefaultLanguage


rule "Multi-Language: Choose Language":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    
    eventPlayer.PlayerLanguage = (eventPlayer.PlayerLanguage + 1) % len(LanguageArray[0])
    smallMessage(eventPlayer, "{0}".format(LanguageArray[13][eventPlayer.PlayerLanguage]))


#!include "player_status/status_check.opy"


#!include "player_status/hud.opy"


# Resetting Conditions
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


# Next Flashpoint
rule "Display Next Flashpoint to Spectators":
    @Condition getCurrentGamemode() == Gamemode.FLASHPOINT
    @Condition isGameInProgress() == true
    @Condition Flashpoint != getCurrentObjective()
    
    wait()
    Flashpoint = getCurrentObjective()
    if getCurrentMap() == Map.SURAVASA:
        hudSubtext(null, "{0} {1}".format(LanguageArray[16][DefaultLanguage], Flashpoint_Array[0][DefaultLanguage][Flashpoint]), HudPosition.TOP, 1, Color.LIME_GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    elif getCurrentMap() == Map.NEW_JUNK_CITY:
        hudSubtext(null, "{0} {1}".format(LanguageArray[16][DefaultLanguage], Flashpoint_Array[1][DefaultLanguage][Flashpoint]), HudPosition.TOP, 1, Color.LIME_GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    Flashpoint_TextID = getLastCreatedText()
    wait(15)
    destroyHudText(Flashpoint_TextID)


# Adding LogTime
#!include "features/logtime.opy"

# Adding Debug Options
#!include "debug.opy"



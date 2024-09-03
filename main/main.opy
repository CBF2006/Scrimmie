# Remove the "#" below once the duplicate gamemodes are removed, then go into the json file and fix it (Two gamemodes are disabled)
# This does mean every time this is compiled you will have to fix the settings in-game

# settings "settings.opy.json"


# Variables & Subroutines
#!include "variables.opy"

rule "You are running Scrimmie! v4.0.0 - 7098d25, see https://github.com/CBF2006/Scrimmie for Source Code & License":
    @Event global

rule "[main.opy] Remove Assembling Heroes":
    @Condition isAssemblingHeroes() == true
    @Condition createWorkshopSetting(bool, "2. Setup Phase", "Remove Assemble Heroes Phase", true, 0)
    
    setMatchTime(0)
    wait(5)
    setMatchTime(createWorkshopSetting(int[10:300], "2. Setup Phase", "Default Setup Time", 60, 1))


# Adding Help HUD
#!include "help_hud.opy"


rule "[main.opy] Game in Progress: Remove HUD, Reset variables":
    @Condition InfoDrawn == true
    @Condition isGameInProgress() == true
    
    Team1Ready = "Not Ready"
    Team2Ready = "Not Ready"
    destroyAllHudTexts()
    if createWorkshopSetting(bool, "5. Spectator Scoreboard", "Toggle Spectator Scoreboard", true, 0) == true:
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


rule "[main.opy] Ultimate: +Ns match time while in setup":
    @Event eachPlayer
    @Condition isGameInProgress() == false
    @Condition getMatchTime() >= 0.1
    @Condition eventPlayer.getCurrentHero() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.AddTimeCD == 0
    
    MaxSetupTime = createWorkshopSetting(int[60:600], "2. Setup Phase", "Maximum Setup Time", 120, 3)
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


rule "[main.opy] Defenders Easy Change Hero":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition isTeamOnDefense(eventPlayer.getTeam()) == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition getMatchTime() >= 1
    @Condition createWorkshopSetting(bool, "2. Setup Phase", "Defenders Easy Change Hero", true, 5)
                
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


# Adding Readying System
#!include "features/ready_up.opy"


# Adding Force Map Completion and Autocompletion Rules
#!include "features/map_completion.opy"


# Adding Disconnect Resume
#!include "features/dc_resume.opy"


# Adding Language Strings
#!include "lang.opy"


# Multi-Language Support
rule "[main.opy] Multi-Language: Set Default Language":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition getMatchRound() == 1
    
    DefaultLanguage = createWorkshopSetting(enum["English", "Spanish / Español", "Korean / 한국어", "French / Français", "Japanese / 日本語", "Chinese (Simplified) / 简体中文", "Chinese (Traditional) / 繁體中文"], "1. General Settings", "Default Language", 0, 0)
    getAllPlayers().PlayerLanguage = DefaultLanguage


rule "[main.opy] Multi-Language: Choose Language":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition createWorkshopSetting(bool, "1. General Settings", "Allow Players to Switch Language", true, 1) == true
    
    eventPlayer.PlayerLanguage = (eventPlayer.PlayerLanguage + 1) % len(LanguageArray[0])
    smallMessage(eventPlayer, "  {0}".format(LanguageArray[13][eventPlayer.PlayerLanguage]))


# Adding Spectator Scoreboard
#!include "features/scoreboard.opy"


# Adding Player Status
#!include "player_status/status_check.opy"
#!include "player_status/hud.opy"


# Adding Player Status - Resetting Conditions
#!include "player_status/reset_conditions.opy"


# Next Flashpoint
rule "[main.opy] Display Next Flashpoint to Spectators":
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



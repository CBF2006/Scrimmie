settings {
    "main": {
        "description": "Scrimmie! v3.5 (PRE-RELEASE)\nCreated by CBF\r\n\r\nStandard Version\r\nLast tested on Patch 2.9.1.0.123307\r\r\n\r\nImport Code: Y2TXE\r\nworkshop.codes/scrimmie\r\ndiscord.gg/TNtbWP4aAg",
        "modeName": "Scrimmie!"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "spectatorSlots": 12,
        "pauseGameOnDisconnect": true
    },
    "gamemodes": {
        "control": {
            "scoreToWin": 3
        },
        "escort": {},
        "flashpoint": {
            "scoreToWin": 5
        },
        "hybrid": {},
        "push": {},
        "general": {
            "enableCompetitiveRules": true,
            "gamemodeStartTrigger": "immediately",
            "enableKillCam": false,
            "roleLimit": "1Tank2Offense2Support"
        }
    },
    "workshop": {
        "Control Point Progress Increment": 33.3,
        "Payload Progress Increment": 10
    }
}

#Global variables

globalvar InfoDrawn 0
globalvar AllowDCResume 2
globalvar MatchDelayAmount 3
globalvar Team1Ready 4
globalvar Team2Ready 5
globalvar LanguageArray 6
globalvar CurrentLanguageArray 7
globalvar DefaultLanguage 8
globalvar Scoreboard_Size 9
globalvar MaxSetupTime 10
globalvar ScoreModified 11
globalvar FirstRoundDone 12
globalvar GameMode 13
globalvar ShouldRestore 14
globalvar UltCharges 15
globalvar Heroes 16
globalvar Positions 17
globalvar Cooldowns1 18
globalvar Cooldowns2 19
globalvar DVaRestore 20
globalvar Logs_EnableLogGenerator 25
globalvar Logs_OutputFormat 26
globalvar Logs_TrackKills 27
globalvar Logs_TrackOffensiveAssists 28
globalvar Logs_TrackDefensiveAssists 29
globalvar Logs_TrackHeroSwaps 30
globalvar Logs_TrackUltimates 31
globalvar Logs_TrackAbilities 32
globalvar Logs_TrackDamage 33
globalvar Logs_TrackHealing 34
globalvar Logs_TrackDvaDemechs 35
globalvar Logs_TrackEchoDuplicates 36
globalvar Logs_TrackMercyRez 37
globalvar Logs_TrackMatchStartEnd 38
globalvar Logs_TrackRoundStartEnd 39
globalvar Logs_TrackObjectiveCapture 40
globalvar Logs_PointCaptureProgressStep 41
globalvar Logs_PayloadCaptureProgressStep 42
globalvar Logs_PlayerSummaryFrequency 43
globalvar Match_CurrentMatchTime 44
globalvar Logs_CurrentControlScoringTeam 45
globalvar Logs_CurrentObjectiveIndex 46
globalvar Logs_PointCaptureProgress 47
globalvar Logs_PayloadCaptureProgress 48
globalvar Logs_PlayerSummaryCount 49
globalvar Display_StatusHUD 50
globalvar Team1StatusTextID 51
globalvar Team2StatusTextID 52
globalvar Team1StatusHUD 54
globalvar Team2StatusHUD 55
globalvar Ready_Up_System 56
globalvar Player_Status 57
globalvar Flashpoint 58
globalvar Flashpoint_TextID 59
globalvar Flashpoint_Array 60


#Player variables

playervar PlayerLanguage 0
playervar AddTimeCD 1
playervar ReadyCD 2
playervar HeroList 3
playervar AFK 4
playervar Logs_HeroesPlayedArray 6
playervar Logs_LastHero 7
playervar Logs_LastHeroTime 8
playervar Logs_HeroesPlayedTimeArray 9
playervar Logs_OffensiveAssists 10
playervar Logs_DefensiveAssists 11
playervar Logs_UltimateID 12
playervar Logs_DuplicateID 13
playervar Logs_CurrentHeroIterated 14
playervar Logs_CurrentHeroIterator 15
playervar Status_TextID 26
playervar Has_Readied 27
playervar ChangeStatusHUD 28
playervar AFK_TextID 29
playervar AFK_Timer 30
playervar Confirm_Ready_TextID 31


#Subroutine names

subroutine CreateSpectatorHUD 0
subroutine PlayerDCInfoTeam1 1
subroutine PlayerDCInfoTeam2 2
subroutine PlayerDCDvaTeam1 3
subroutine PlayerDCDvaTeam2 4
subroutine CalcHeroPlayedTime 5


rule "Remove Assembling Heroes":
    @Condition isAssemblingHeroes() == true
    
    setMatchTime(0)
    wait(5)
    setMatchTime(50)


rule "Help HUD":
    @Condition isGameInProgress() == false
    @Condition InfoDrawn == false
    
    Ready_Up_System = createWorkshopSetting(bool, "3. Player Status", "Require Confirmation to Ready if a player is AFK", true, 2)
    Player_Status = createWorkshopSetting(bool, "3. Player Status", "Toggle Player Status", true, 1)
    Scoreboard_Size = createWorkshopSetting(enum["Large", "Small"], "2. Spectator Scoreboard", "Scoreboard Size", 0, 1)
    AllowDCResume = createWorkshopSetting(bool, "1. General Settings", "Allow Disconnect Resume", true, 2)
    MatchDelayAmount = createWorkshopSetting(int[15:300], "1. General Settings", "Setup Time Interval", 60, 3)
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
    #Scrimmie! Banner
    hudSubheader(getAllPlayers(), LanguageArray[7][localPlayer.PlayerLanguage], HudPosition.LEFT, 0, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    #Current Language in Default Language
    hudSubheader(getAllPlayers(), CurrentLanguageArray[DefaultLanguage][localPlayer.PlayerLanguage], HudPosition.TOP, 24, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(getAllPlayers(), "workshop.codes/scrimmie", HudPosition.LEFT, 0.1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: Y2TXE".format(LanguageArray[12][localPlayer.PlayerLanguage]), HudPosition.LEFT, 0.2, Color.SKY_BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    InfoDrawn = true


rule "Game in Progress: Remove HUD, Reset variables":
    @Condition InfoDrawn == true
    @Condition isGameInProgress() == true
    
    Team1Ready = "Not Ready"
    Team2Ready = "Not Ready"
    destroyAllHudTexts()
    CreateSpectatorHUD()
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


def CreateSpectatorHUD():
    @Name "Spectator Scoreboard"
    
    if createWorkshopSetting(bool, "2. Spectator Scoreboard", "Toggle Spectator Scoreboard", true, 0):
        #Small Scoreboard
        if Scoreboard_Size == 1:
            #team 1
            hudSubheader(null, "DD - DT - FB - D - HD - UU", HudPosition.LEFT, 1, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(0, Team.1).getCurrentHero()), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(0, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(0, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(0, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(0, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(0, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(0, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(0, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(0, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(1, Team.1).getCurrentHero()), ceil(getPlayersInSlot(1, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(1, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(1, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(1, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(1, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(1, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(1, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(1, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(1, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(1, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(1, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(2, Team.1).getCurrentHero()), ceil(getPlayersInSlot(2, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(2, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(2, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(2, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(2, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(2, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(2, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(2, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(2, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(2, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(2, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(3, Team.1).getCurrentHero()), ceil(getPlayersInSlot(3, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(3, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(3, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(3, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(3, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(3, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(3, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(3, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(3, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(3, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(3, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(4, Team.1).getCurrentHero()), ceil(getPlayersInSlot(4, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(4, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(4, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(4, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(4, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(4, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(4, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(4, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(4, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(4, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(4, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #team 2
            hudSubheader(null, "DD - DT - FB - D - HD - UU", HudPosition.RIGHT, -6, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(0, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(0, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(0, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(0, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(0, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(0, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(0, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(0, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(0, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(0, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(0, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(1, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(1, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(1, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(1, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(1, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(1, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(1, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(1, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(1, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(1, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(1, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(1, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(2, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(2, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(2, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(2, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(2, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(2, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(2, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(2, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(2, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(2, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(2, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(2, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(3, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(3, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(3, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(3, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(3, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(3, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(3, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(3, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(3, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(3, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(3, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(3, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(4, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(4, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(4, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(4, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(4, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(4, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(4, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(4, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(4, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(4, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(4, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(4, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Large Scoreboard
        elif Scoreboard_Size == 0:
            #team 1
            hudSubtext(null, "DD - DT - FB - D - HD - UU", HudPosition.LEFT, 1, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(0, Team.1).getCurrentHero()), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(0, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(0, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(0, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(0, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(0, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(0, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(0, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(0, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(1, Team.1).getCurrentHero()), ceil(getPlayersInSlot(1, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(1, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(1, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(1, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(1, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(1, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(1, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(1, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(1, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(1, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(1, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(2, Team.1).getCurrentHero()), ceil(getPlayersInSlot(2, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(2, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(2, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(2, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(2, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(2, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(2, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(2, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(2, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(2, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(2, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(3, Team.1).getCurrentHero()), ceil(getPlayersInSlot(3, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(3, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(3, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(3, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(3, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(3, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(3, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(3, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(3, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(3, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(3, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(getPlayersInSlot(4, Team.1).getCurrentHero()), ceil(getPlayersInSlot(4, Team.1).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(4, Team.1).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(4, Team.1).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(4, Team.1).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(4, Team.1).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(4, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(getPlayersInSlot(4, Team.1).getStatistic(Stat.ULTIMATES_USED), abilityIconString(getPlayersInSlot(4, Team.1).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(4, Team.1).getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(getPlayersInSlot(4, Team.1).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(4, Team.1).getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 6, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #team 2
            hudSubtext(null, "DD - DT - FB - D - HD - UU", HudPosition.RIGHT, -6, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(0, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(0, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(0, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(0, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(0, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(0, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(0, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(0, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(0, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(0, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(0, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(1, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(1, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(1, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(1, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(1, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(1, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(1, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(1, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(1, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(1, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(1, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(1, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(2, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(2, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(2, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(2, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(2, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(2, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(2, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(2, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(2, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(2, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(2, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(2, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(3, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(3, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(3, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(3, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(3, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(3, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(3, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(3, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(3, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(3, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(3, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(3, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0}  {1} - {2}".format("{0} {1}".format(abilityIconString(getPlayersInSlot(4, Team.2).getCurrentHero(), Button.ABILITY_1) if getPlayersInSlot(4, Team.2).getAbilityCooldown(Button.ABILITY_1) == 0 else "", abilityIconString(getPlayersInSlot(4, Team.2).getCurrentHero(), Button.ABILITY_2) if getPlayersInSlot(4, Team.2).getAbilityCooldown(Button.ABILITY_2) == 0 else ""), ceil(getPlayersInSlot(4, Team.2).getStatistic(Stat.BARRIER_DAMAGE_DEALT) + getPlayersInSlot(4, Team.2).getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(getPlayersInSlot(4, Team.2).getStatistic(Stat.DAMAGE_TAKEN)), getPlayersInSlot(4, Team.2).getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(getPlayersInSlot(4, Team.2).getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(4, Team.2).getStatistic(Stat.HEALING_DEALT)), "{0}   {1}".format(getPlayersInSlot(4, Team.2).getStatistic(Stat.ULTIMATES_USED), heroIcon(getPlayersInSlot(4, Team.2).getCurrentHero()))))), HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)


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
        smallMessage(eventPlayer, LanguageArray[25][localPlayer.PlayerLanguage])
    else:
        eventPlayer.AddTimeCD = 1
        chase(eventPlayer.AddTimeCD, 0, duration=1, ChaseReeval.DESTINATION_AND_DURATION)
        setMatchTime(getMatchTime() + MatchDelayAmount)
        smallMessage(getAllPlayers(), "{0} {1} {2}".format("{0} {1}".format(eventPlayer, LanguageArray[26][eventPlayer.PlayerLanguage]), MatchDelayAmount, LanguageArray[27][localPlayer.PlayerLanguage]))
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
                    smallMessage(eventPlayer, LanguageArray[31][eventPlayer.PlayerLanguage])
                    hudHeader(eventPlayer, LanguageArray[33][eventPlayer.PlayerLanguage], HudPosition.TOP, 22, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
                    eventPlayer.Confirm_Ready_TextID = getLastCreatedText()
                    eventPlayer.Has_Readied = true
                else:
                    Team1Ready = "Ready"
                    destroyHudText(eventPlayer.Confirm_Ready_TextID)
                    smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
                    eventPlayer.Has_Readied = false
            else:
                Team1Ready = "Ready"
                smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team1Ready = "Not Ready"
            smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))
    elif eventPlayer.getTeam() == Team.2:
        if Team2Ready == "Not Ready":
            if getPlayersInSlot(0, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(1, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(2, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(3, eventPlayer.getTeam()).AFK == true or getPlayersInSlot(4, eventPlayer.getTeam()).AFK == true:
                if eventPlayer.Has_Readied == false:
                    smallMessage(eventPlayer, LanguageArray[31][eventPlayer.PlayerLanguage])
                    hudHeader(eventPlayer, LanguageArray[33][eventPlayer.PlayerLanguage], HudPosition.TOP, 22, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
                    eventPlayer.Confirm_Ready_TextID = getLastCreatedText()
                    eventPlayer.Has_Readied = true
                else:
                    Team2Ready = "Ready"
                    destroyHudText(eventPlayer.Confirm_Ready_TextID)
                    smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
                    eventPlayer.Has_Readied = false
            else:
                Team2Ready = "Ready"
                smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team2Ready = "Not Ready"
            smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))


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
            smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team1Ready = "Not Ready"
            smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))
    elif eventPlayer.getTeam() == Team.2:
        if Team2Ready == "Not Ready":
            Team2Ready = "Ready"
            smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team2Ready = "Not Ready"
            smallMessage(getAllPlayers(), l"{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))


rule "First attack done":
    @Condition isMatchBetweenRounds() == true
    @Condition isTeamOnOffense(Team.2) == true
    @Condition ScoreModified == 0
    
    wait(10)
    FirstRoundDone = true


rule "Set Team Scores":
    @Condition ScoreModified == 0
    @Condition FirstRoundDone == true
    
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
    @Condition GameMode == 1
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
    smallMessage(getAllPlayers(), LanguageArray[28][localPlayer.PlayerLanguage])
    wait(3)
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
    smallMessage(eventPlayer, "{0} {1} {2}".format(LanguageArray[9][localPlayer.PlayerLanguage], buttonString(Button.RELOAD), LanguageArray[24][localPlayer.PlayerLanguage]))
    wait(0.7, Wait.ABORT_WHEN_FALSE)
    eventPlayer.HeroList = getAllHeroes()
    eventPlayer.HeroList.remove(eventPlayer.getCurrentHero())
    eventPlayer.setAllowedHeroes(eventPlayer.HeroList)
    wait(0.1)
    eventPlayer.setAllowedHeroes(getAllHeroes())


rule "Defense Map Teleport":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition isTeamOnDefense(eventPlayer.getTeam()) == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getCurrentHero() == true
    
    if getCurrentMap() == Map.BLIZZ_WORLD:
        eventPlayer.teleport(vect(-8.171, 3.824, 65.861))
    elif getCurrentMap() == Map.EICHENWALDE:
        eventPlayer.teleport(vect(13.226, 12.981, -83.655))
    elif getCurrentMap() == Map.HOLLYWOOD:
        eventPlayer.teleport(vect(-19.248, 8.007, -9.802))
    elif getCurrentMap() == Map.KINGS_ROW:
        eventPlayer.teleport(vect(-37.185, 10.346, -15.058))
    elif getCurrentMap() == Map.NUMBANI:
        eventPlayer.teleport(vect(93.044, 5.53, -22.723))
    elif getCurrentMap() == Map.HANAMURA:
        eventPlayer.teleport(vect(13.079, 1.346, -24.267))
    elif getCurrentMap() == Map.HORIZON_LUNAR_COLONY:
        eventPlayer.teleport(vect(42.356, 15.84, -79.798))
    elif getCurrentMap() == Map.PARIS:
        eventPlayer.teleport(vect(-40.379, 16.5, -14.259))
    elif getCurrentMap() == Map.TEMPLE_OF_ANUBIS:
        eventPlayer.teleport(vect(-23.909, 3.312, 46.94))
    elif getCurrentMap() == Map.VOLSKAYA:
        eventPlayer.teleport(vect(-35.545, -1.433, 73.561))
    elif getCurrentMap() == Map.DORADO:
        eventPlayer.teleport(vect(57.088, 9.241, -16.884))
    elif getCurrentMap() == Map.HAVANA:
        eventPlayer.teleport(vect(-18.059, 9.184, -70.117))
    elif getCurrentMap() == Map.JUNKERTOWN:
        eventPlayer.teleport(vect(-28.382, 14.223, -68.289))
    elif getCurrentMap() == Map.RIALTO:
        eventPlayer.teleport(vect(55.603, 2.452, -44.947))
    elif getCurrentMap() == Map.ROUTE66:
        eventPlayer.teleport(vect(33.662, 10.325, -5.514))
    elif getCurrentMap() == Map.WATCHPOINT_GIBRALTAR:
        eventPlayer.teleport(vect(32.488, 4.692, -71.941))
    elif getCurrentMap() == Map.SHAMBALI_MONASTERY:
        eventPlayer.teleport(vect(5.48, 14, 60.54))
    elif getCurrentMap() == Map.PARAISO:
        eventPlayer.teleport(vect(-34.65, 6, -13.85))
    elif getCurrentMap() == Map.CIRCUIT_ROYAL:
        eventPlayer.teleport(vect(-21.96, 11, -6.56))
    elif getCurrentMap() == Map.MIDTOWN:
        eventPlayer.teleport(vect(10.27, 3.75, 48.46))
    elif getCurrentMap() == Map.BLIZZ_WORLD_WINTER:
        eventPlayer.teleport(vect(-8.171, 3.824, 65.861))
    elif getCurrentMap() == Map.EICHENWALDE_HALLOWEEN:
        eventPlayer.teleport(vect(13.226, 12.981, -83.655))
    elif getCurrentMap() == Map.HOLLYWOOD_HALLOWEEN:
        eventPlayer.teleport(vect(-19.248, 8.007, -9.802))
    elif getCurrentMap() == Map.KINGS_ROW_WINTER:
        eventPlayer.teleport(vect(-37.185, 10.346, -15.058))


rule "DC Value Tracking - Team 1":
    @Event eachPlayer
    @Team 1
    @Condition isGameInProgress() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition AllowDCResume == true
    
    wait(1)
    PlayerDCInfoTeam1()
    if RULE_CONDITION:
        goto RULE_START


def PlayerDCInfoTeam1():
    @Name "DC Value Tracking - Team 1 Subroutine"
    
    if eventPlayer.hasSpawned():
        if ShouldRestore[0 + eventPlayer.getSlot()] >= 0:
            if eventPlayer.isAlive():
                UltCharges[0 + eventPlayer.getSlot()] = eventPlayer.getUltCharge()
                Heroes[0 + eventPlayer.getSlot()] = eventPlayer.getCurrentHero()
                Positions[0 + eventPlayer.getSlot()] = eventPlayer.getPosition()
                Cooldowns1[0 + eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
                Cooldowns2[0 + eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
                DVaRestore[0 + eventPlayer.getSlot()] = (eventPlayer.getUltCharge() if eventPlayer.getMaxHealth() > 200 else DVaRestore[0 + eventPlayer.getSlot()]) if eventPlayer.getCurrentHero() == Hero.DVA else -1
                ShouldRestore[0 + eventPlayer.getSlot()] = eventPlayer.getNormalizedHealth()
            else:
                ShouldRestore[0 + eventPlayer.getSlot()] = 0


rule "DC Value Tracking - Team 2":
    @Event eachPlayer
    @Team 2
    @Condition isGameInProgress() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition AllowDCResume == true
    
    wait(1)
    PlayerDCInfoTeam2()
    if RULE_CONDITION:
        goto RULE_START


def PlayerDCInfoTeam2():
    @Name "DC Value Tracking - Team 2 Subroutine"
    
    if eventPlayer.hasSpawned():
        if ShouldRestore[5 + eventPlayer.getSlot()] >= 0:
            if eventPlayer.isAlive():
                UltCharges[5 + eventPlayer.getSlot()] = eventPlayer.getUltCharge()
                Heroes[5 + eventPlayer.getSlot()] = eventPlayer.getCurrentHero()
                Positions[5 + eventPlayer.getSlot()] = eventPlayer.getPosition()
                Cooldowns1[5 + eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
                Cooldowns2[5 + eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
                DVaRestore[5 + eventPlayer.getSlot()] = eventPlayer.getMaxHealth()
                DVaRestore[5 + eventPlayer.getSlot()] = (eventPlayer.getUltCharge() if eventPlayer.getMaxHealth() > 200 else DVaRestore[5 + eventPlayer.getSlot()]) if eventPlayer.getCurrentHero() == Hero.DVA else -1
                ShouldRestore[5 + eventPlayer.getSlot()] = eventPlayer.getNormalizedHealth()
            else:
                ShouldRestore[5 + eventPlayer.getSlot()] = 0


rule "Player Reconnected - Team 1":
    @Event playerJoined
    @Team 1
    @Condition isGameInProgress() == true
    @Condition AllowDCResume == true
    
    waitUntil(eventPlayer.hasSpawned(), 10)
    wait(0.1)
    if eventPlayer.getCurrentHero() == Heroes[0 + eventPlayer.getSlot()]:
        eventPlayer.setUltCharge(UltCharges[0 + eventPlayer.getSlot()])
        if ShouldRestore[0 + eventPlayer.getSlot()] > 0:
            ShouldRestore[0 + eventPlayer.getSlot()] = 0 - (ShouldRestore[0 + eventPlayer.getSlot()])
            eventPlayer.startForcingPosition(Positions[0 + eventPlayer.getSlot()], false)
            wait(0.1)
            eventPlayer.stopForcingPosition()
            PlayerDCDvaTeam1()
            eventPlayer.setHealth((0 - (ShouldRestore[0 + eventPlayer.getSlot()])) * eventPlayer.getMaxHealth())
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, Cooldowns1[0 + eventPlayer.getSlot()])
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, Cooldowns2[0 + eventPlayer.getSlot()])
            ShouldRestore[0 + eventPlayer.getSlot()] = 0 - (ShouldRestore[0 + eventPlayer.getSlot()])


rule "Player Reconnected - Team 2":
    @Event playerJoined
    @Team 2
    @Condition isGameInProgress() == true
    @Condition AllowDCResume == true
    
    waitUntil(eventPlayer.hasSpawned(), 10)
    wait(0.1)
    if eventPlayer.getCurrentHero() == Heroes[5 + eventPlayer.getSlot()]:
        eventPlayer.setUltCharge(UltCharges[5 + eventPlayer.getSlot()])
        if ShouldRestore[5 + eventPlayer.getSlot()] > 0:
            ShouldRestore[5 + eventPlayer.getSlot()] = 0 - (ShouldRestore[5 + eventPlayer.getSlot()])
            eventPlayer.startForcingPosition(Positions[5 + eventPlayer.getSlot()], false)
            wait(0.1)
            eventPlayer.stopForcingPosition()
            PlayerDCDvaTeam2()
            eventPlayer.setHealth((0 - (ShouldRestore[5 + eventPlayer.getSlot()])) * eventPlayer.getMaxHealth())
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, Cooldowns1[5 + eventPlayer.getSlot()])
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, Cooldowns2[5 + eventPlayer.getSlot()])
            ShouldRestore[5 + eventPlayer.getSlot()] = 0 - (ShouldRestore[5 + eventPlayer.getSlot()])


def PlayerDCDvaTeam1():
    @Name "Player Reconnected - Team 1 DVa"
    
    if eventPlayer.getCurrentHero() == Hero.DVA:
        if DVaRestore[0 + eventPlayer.getSlot()] >= 0:
            eventPlayer.setUltCharge(DVaRestore[0 + eventPlayer.getSlot()])
            wait(0.1)
            damage(eventPlayer, null, 1000)
            wait(1.6)
            eventPlayer.setUltCharge(UltCharges[0 + eventPlayer.getSlot()])


def PlayerDCDvaTeam2():
    @Name "Player Reconnected - Team 2 DVa"
    
    if eventPlayer.getCurrentHero() == Hero.DVA:
        if DVaRestore[5 + eventPlayer.getSlot()] >= 0:
            eventPlayer.setUltCharge(DVaRestore[6 + eventPlayer.getSlot()])
            wait(0.1)
            damage(eventPlayer, null, 1000)
            wait(1.6)
            eventPlayer.setUltCharge(UltCharges[6 + eventPlayer.getSlot()])


rule "Multi-Language: Language Strings":
    #General HUD
    LanguageArray[0] = ["is Not Ready", "no está Listo", "이 준비되지 않았습니다", "n’est pas prête", "は準備中です"]
    LanguageArray[1] = ["Hold", "Mantén", "꾹 누르기", "Maintenez", "押し続け"]
    LanguageArray[2] = ["Change hero (works only on Defense)", "Cambiar héroe (funciona sólo en defensa)", "영웅 변경 (수비에서만 가능)", "Sélection de héros (fonctionne seulement en Défense)", "ヒーローを変更する（防衛時のみ有効)"]
    LanguageArray[3] = ["Press", "Presiona", "누르기", "Appuyez", "押し"]
    LanguageArray[4] = ["Ready / Unready", "Listo / No Listo", "를 눌러 준비/준비해제", "Prête / Pas prête", "準備／準備のない"]
    LanguageArray[5] = ["Add Extra", "Agregar", "을 눌러", "Ajouter", "セットアップに追加"]
    LanguageArray[6] = ["seconds to setup", "segundos extras a la configuración", "초 추가", "seconds supplémentaires á la configuration", "秒"]
    LanguageArray[7] = ["Scrimmie! v3.5", "Scrimmie! v3.5", "스크리미! 3.5판", "Scrimmie! v3.5", "スクリミー！　3.5版"]
    LanguageArray[8] = ["Teleport (works only on Defense, in spawn)", "Teletransporte (funciona solo en Defensa, en el spawn)", "텔레포트 (수비 스폰지점에서만 가능)", "Téléporte (en Défense, dans le d'apparition)", "テレポート（防衛時のみ有効)"]
    LanguageArray[9] = ["Keep holding", "Mantén presionado", "영웅 변경하기 위해", "Continuez à maintenir", "ヒーローを変更するために"]
    LanguageArray[10] = ["is Ready", "está Listo", "이 준비되었습니다", "est prête", "は準備完了です"]
    LanguageArray[11] = ["Change Language", "Cambiar Idioma", "언어 변경", "Changer la langue", "言語の変更"]
    LanguageArray[12] = ["Import Code", "Importar Código", "워크샵 코드", "Importer le code", "ロード"]
    LanguageArray[13] = ["Changed Language to English", "Cambió el idioma a español", "언어를 변경하였습니다: 한국어", "La langue est changée à français", "言語を日本語に変更しました"]
    LanguageArray[14] = ["readied their team", "se despreparó su equipo", "가 준비를 완료했습니다", "a préparé son équipe", "はチームを準備しました"]
    LanguageArray[15] = ["unreadied their team", "se no despreparó a su equipo", "가 준비를 해제했습니다", "n’a pas préparé son équipe", "はチームを準備しませんでした"]
    LanguageArray[16] = ["Next Flashpoint:", "Siguiente Operación:", "다음 플래시포인트:", "Prochain Point Chaud:", "最初のフラッシュポイント："]
    LanguageArray[17] = ["s", "s", "초", "s", "秒"]
    LanguageArray[24] = ["to change hero", "para cambiar de héroe", "계속 꾹 누르기", "enfoncé pour changer de héros", "を押し続ける"]
    LanguageArray[25] = ["Maximum Setup Time reached", "Tiempo máximo de configuración alcanzado", "최대 준비시간 도달", "Temps de configuration maximal atteint", "最大準備時間時到達"]
    LanguageArray[26] = ["added", "agregó", "가", "a ajouté", "は"]
    LanguageArray[27] = ["seconds", "segundos", "초를 추가했습니다", "secondes", "秒を追加しました"]
    LanguageArray[28] = ["All Flashpoints played, returning to lobby", "Todos los Flashpoints jugados, regresando al vestíbulo", "모든 플래시포인트 모드가 끝나 로비로 돌아갑니다", "Tous les points chauds sont complets, renvoyant au hall", "すべてのフラッシュポイントポイントが終了しました、ロビーに戻ります"]
    LanguageArray[29] = ["AFK", "AFK", "잠수", "AFK", "離席中"]
    LanguageArray[30] = ["Inactive Players", "Jugadores inactivos", "잠수상태인 플레이어들", "Joueurs inactifs", "離席中のプレイヤー"]
    LanguageArray[31] = ["One of your teammates is AFK. Confirm ready?", "Uno de tus compañeros está AFK. ¿Confirmas listo?", "당신의 팀원 한명이 잠수 상태입니다. 준비 하시겠습니까?", "Un de tes coéquipiers est AFK. Confirme prêt?", "あなたのチームメイト一人が離席中です。準備糺しますか?"]
    LanguageArray[32] = ["You are inactive, press any button to become active", "Estás inactivo, presiona cualquier botón para activarte.", "당신은 잠수 상태입니다. 아무키를 눌러 잠수 상태를 해제하세요.", "Vous êtes inactif, appuyez sur n'importe quel bouton pour devenir actif.", "あなたは離席中です。在席すできるためにキーを何でも押してください。"]
    LanguageArray[33] = ["Confirm Ready?", "¿Confirmas listo?", "준비 하시겠습니까?", "Confirme prêt?", "準備糺しますか?"]
    #Current Language
    CurrentLanguageArray[0] = ["Current Language: English", "Current Language: Spanish", "Current Language: Korean", "Current Language: French", "Current Language: Japanese"]
    CurrentLanguageArray[1] = ["Idioma actual: inglés", "Idioma actual: español", "Idioma actual: coreano", "Idioma actual: francés", "Idioma actual: japonés"]
    CurrentLanguageArray[2] = ["현재 언어: 영어", "현재 언어: 스페인어", "현재 언어: 한국어", "현재 언어: 프랑스어", "현재 언어: 일본어"]
    CurrentLanguageArray[3] = ["Langue actuelle: anglais", "Langue actuelle: espagnol", "Langue actuelle: coréen", "Langue actuelle: français", "Langue actuelle: japonais"]
    CurrentLanguageArray[4] = ["現在の言語：英語", "現在の言語：スペイン語", "現在の言語：韓国語", "現在の言語：フランス語", "現在の言語：日本語"]
    #Flashpoint Names
    Flashpoint_Array[0] = [["A - Market", "B - Garden", "C - Palace", "D - Temple", "E - Ruins"], ["A - Mercado", "B - Jardín", "C - Palacio", "D - Templo", "E - Ruinas"], ["A - 시장", "B - 정원", "C - 궁전", "D - 사원", "E - 폐허"], ["A - Marché", "B - Jardin", "C - Palais", "D - Temple", "E - Ruines"], ["A：マーケット", "B：ガーデン", "C：パレス", "D：テンプル", "E：ルインズ"]]
    Flashpoint_Array[1] = [["A - Arena", "B - The Ducts", "C - Refinery", "D - Junkyard", "E - Bomb Flats"], ["A - Arena", "B - Los Conductos", "C - Refinería", "D - Depósito de chatarra", "E - Pisos Bomba"], ["A - 경기장", "B - 배관", "C - 제련소", "D - 고 철 치리장", "E - 폭탄 지대"], ["A - Arène", "B - Les conduits", "C - Raffinerie", "D - Décharge", "E - Appartements détonants"], ["A：アリーナ", "B：ダクト", "C：精錬所", "D：ジャンクヤード", "E：ボムクラフト"]]


rule "Multi-Language: Set Default Language":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition getMatchRound() == 1
    
    DefaultLanguage = createWorkshopSetting(enum["English", "Spanish (Español)", "Korean (한국어)", "French (Français)", "Japanese (日本語)"], "1. General Settings", "Default Language", 0, 0)
    getAllPlayers().PlayerLanguage = DefaultLanguage


rule "Multi-Language: Choose Language":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    
    eventPlayer.PlayerLanguage = (eventPlayer.PlayerLanguage + 1) % len(LanguageArray[0])
    smallMessage(eventPlayer, "{0}".format(LanguageArray[13][eventPlayer.PlayerLanguage]))


rule "Logs: Initialization - Workshop Settings":
    Logs_EnableLogGenerator = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Enable Log Generator", false, 0)
    Logs_OutputFormat = createWorkshopSetting(enum["CSV"], "4. LogTime (PC Only)", "Output Format", 0, 1)
    Logs_TrackKills = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Kills and Deaths", true, 2)
    Logs_TrackOffensiveAssists = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Offensive Assists", true, 3)
    Logs_TrackDefensiveAssists = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Defensive Assists", true, 4)
    Logs_TrackHeroSwaps = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Hero Swaps", true, 5)
    Logs_TrackUltimates = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Ultimates", true, 6)
    Logs_TrackAbilities = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Abilities*", false, 7)
    Logs_TrackDamage = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Damage*", false, 8)
    Logs_TrackHealing = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Healing*", false, 9)
    Logs_TrackDvaDemechs = createWorkshopSetting(bool, "4. LogTime (PC Only)", "D.Va Demechs & Remechs", true, 10)
    Logs_TrackEchoDuplicates = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Echo Duplicates", true, 11)
    Logs_TrackMercyRez = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Mercy Resurrects", true, 12)
    Logs_TrackMatchStartEnd = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Match Start & End", true, 13)
    Logs_TrackRoundStartEnd = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Round Start & End", true, 14)
    Logs_TrackObjectiveCapture = createWorkshopSetting(bool, "4. LogTime (PC Only)", "Objective Captures", true, 15)
    Logs_PointCaptureProgressStep = createWorkshopSetting(float[0:100], "4. LogTime (PC Only)", "Control Point Progress Increment", 33.333, 16)
    Logs_PayloadCaptureProgressStep = createWorkshopSetting(float[0:100], "4. LogTime (PC Only)", "Payload Progress Increment", 10, 17)
    Logs_PlayerSummaryFrequency = createWorkshopSetting(enum["Every Round End", "Only Match End", "Off"], "4. LogTime (PC Only)", "Player Stat Summary Frequency", 0, 18)


rule "Logs: Initialisation - Match":
    if not Logs_EnableLogGenerator:
        disableInspector()


rule "Logs: Initialisation - Player":
    @Event eachPlayer
    
    eventPlayer.Logs_HeroesPlayedArray = []


rule "Logs: Match Start":
    @Condition Logs_EnableLogGenerator == true
    @Condition getMatchRound() == 1
    
    if Logs_TrackMatchStartEnd:
        printLog(",match_start,{0},{1}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getCurrentMap(), getCurrentGamemode()), "{0},{1}".format(Team.1, Team.2)))


rule "Logs: Round Start":
    @Condition Logs_EnableLogGenerator == true
    @Condition isInSetup() == true
    
    Logs_CurrentControlScoringTeam = Team.ALL
    Logs_CurrentObjectiveIndex = getCurrentObjective()
    if Logs_TrackRoundStartEnd == true:
        printLog(",round_start,{0},{1},{2}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getMatchRound(), (Team.1 if isTeamOnOffense(Team.1) else Team.2) if getCurrentGamemode() != Gamemode.CONTROL else null), "{0},{1}".format(teamScore(Team.1), teamScore(Team.2)), "{0}".format(getCurrentObjective())))
        waitUntil(isGameInProgress(), 99999)
        printLog(",setup_complete,{0}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getMatchRound(), getMatchTime())))


rule "Logs: Round Complete":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackRoundStartEnd == true
    @Condition isMatchBetweenRounds() == true
    
    printLog(",round_end,{0},{1},{2}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getMatchRound(), (Team.1 if isTeamOnOffense(Team.1) else Team.2) if getCurrentGamemode() != Gamemode.CONTROL else null), "{0},{1}".format(teamScore(Team.1), teamScore(Team.2)), "{0},{1},{2}".format(getCurrentObjective(), "{0},{1}".format(getControlScorePercentage(Team.1), getControlScorePercentage(Team.2)), getMatchTime())))


rule "Logs: Match Complete":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackMatchStartEnd == true
    @Condition isMatchComplete() == true
    
    printLog(",match_end,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0}".format(teamScore(Team.1)), "{0}".format(teamScore(Team.2))))


rule "Logs: Control Point Increment":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PointCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getCapturePercentage() >= Logs_PointCaptureProgress + Logs_PointCaptureProgressStep
    
    printLog(",point_progress,{0},{1}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1},{2}".format(getOppositeTeam(getControlScoringTeam()) if getCurrentGamemode() == Gamemode.CONTROL else Team.1 if isTeamOnOffense(Team.1) else Team.2, getCurrentObjective(), getCapturePercentage())))
    Logs_PointCaptureProgress += Logs_PointCaptureProgressStep


rule "Logs: Payload Increment":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PayloadCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getPayloadProgressPercentage() >= Logs_PayloadCaptureProgress + Logs_PayloadCaptureProgressStep
    
    printLog(",payload_progress,{0},{1}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1},{2}".format(Team.1 if isTeamOnOffense(Team.1) else Team.2, getCurrentObjective(), getPayloadProgressPercentage())))
    Logs_PayloadCaptureProgress += Logs_PayloadCaptureProgressStep


rule "Logs: Reset Control Point Progress":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PointCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getCapturePercentage() == 0
    
    Logs_PointCaptureProgress = 0


rule "Logs: Reset Payload Progress":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PayloadCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getPayloadProgressPercentage() == 0
    
    Logs_PayloadCaptureProgress = 0


rule "Logs: Objective Updated":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackObjectiveCapture == true
    @Condition Logs_CurrentObjectiveIndex != getCurrentObjective()
    
    printLog(",objective_updated,{0},{1}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1}".format(Logs_CurrentObjectiveIndex, getCurrentObjective())))
    wait()
    Logs_CurrentObjectiveIndex = getCurrentObjective()


rule "Logs: Objective Captured (Non-Control)":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackObjectiveCapture == true
    @Condition getCurrentGamemode() != Gamemode.CONTROL
    @Condition isObjectiveComplete(Logs_CurrentObjectiveIndex) == true
    
    printLog(",objective_captured,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1}".format(Team.1 if isTeamOnOffense(Team.1) else Team.2, getCurrentObjective()), "{0},{1},{2}".format(null, null, getMatchTime())))
    Logs_CurrentObjectiveIndex = getCurrentObjective()


rule "Logs: Objective Captured (Control)":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackObjectiveCapture == true
    @Condition isGameInProgress() == true
    @Condition getCurrentGamemode() == Gamemode.CONTROL
    @Condition getControlScoringTeam() != Logs_CurrentControlScoringTeam
    
    printLog(",objective_captured,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1}".format(getControlScoringTeam(), getCurrentObjective()), "{0},{1},{2}".format(getControlScorePercentage(Team.1), getControlScorePercentage(Team.2), getMatchTime())))
    Logs_CurrentControlScoringTeam = getControlScoringTeam()


rule "Logs: Kills":
    @Event playerDied
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackKills == true
    @Condition isGameInProgress() == true
    
    printLog(",kill,{0},{1}".format(Match_CurrentMatchTime, "{0},{1},{2}".format("{0},{1},{2}".format(attacker.getTeam(), attacker, attacker.getCurrentHero()), "{0},{1},{2}".format(victim.getTeam(), victim, victim.getCurrentHero()), "{0},{1},{2}".format("{0},{1}".format(eventAbility, eventDamage), eventWasCriticalHit, eventWasEnvironment))))


rule "Logs: Hero Spawn/Swap":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition (Logs_TrackHeroSwaps or Logs_PlayerSummaryCount != 2) == true
    @Condition eventPlayer.getCurrentHero() != eventPlayer.Logs_LastHero
    @Condition isMatchComplete() == false
    
    if Logs_TrackHeroSwaps and eventPlayer.getCurrentHero() in getAllHeroes():
        if eventPlayer.Logs_LastHero in getAllHeroes():
            printLog(",hero_swap,{0},{1},{2}".format(Match_CurrentMatchTime, "{0},{1}".format(eventPlayer.getTeam(), eventPlayer), "{0},{1},{2}".format(eventPlayer.getCurrentHero(), eventPlayer.Logs_LastHero, Match_CurrentMatchTime - eventPlayer.Logs_LastHeroTime)))
        else:
            printLog(",hero_spawn,{0},{1},{2}".format(Match_CurrentMatchTime, "{0},{1}".format(eventPlayer.getTeam(), eventPlayer), "{0},{1},{2}".format(eventPlayer.getCurrentHero(), eventPlayer.Logs_LastHero, Match_CurrentMatchTime - eventPlayer.Logs_LastHeroTime)))
    if not eventPlayer.getCurrentHero() in eventPlayer.Logs_HeroesPlayedArray and eventPlayer.getCurrentHero() in getAllHeroes():
        eventPlayer.Logs_HeroesPlayedArray.append(eventPlayer.getCurrentHero())
    if eventPlayer.getCurrentHero() in getAllHeroes() and eventPlayer.Logs_LastHero in getAllHeroes():
        CalcHeroPlayedTime()
    eventPlayer.Logs_LastHero = eventPlayer.getCurrentHero()
    eventPlayer.Logs_LastHeroTime = Match_CurrentMatchTime


def CalcHeroPlayedTime():
    @Name "Logs: Calculate Hero Played Time (Subroutine)"
    
    eventPlayer.Logs_HeroesPlayedTimeArray[eventPlayer.Logs_HeroesPlayedArray.index(eventPlayer.Logs_LastHero)] += Match_CurrentMatchTime - eventPlayer.Logs_LastHeroTime


rule "Logs: Damage":
    @Event playerDealtDamage
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackDamage == true
    @Condition isGameInProgress() == true
    
    printLog(",damage,{0},{1}".format(Match_CurrentMatchTime, "{0},{1},{2}".format("{0},{1},{2}".format(attacker.getTeam(), attacker, attacker.getCurrentHero()), "{0},{1},{2}".format(victim.getTeam(), victim, victim.getCurrentHero()), "{0},{1},{2}".format("{0},{1}".format(eventAbility, eventDamage), eventWasCriticalHit, eventWasEnvironment))))


rule "Logs: Healing":
    @Event playerReceivedHealing
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackHealing == true
    @Condition isGameInProgress() == true
    
    printLog(",healing,{0},{1}".format(Match_CurrentMatchTime, "{0},{1},{2}".format("{0},{1},{2}".format(healer.getTeam(), healer, healer.getCurrentHero()), "{0},{1},{2}".format(healee.getTeam(), healee, healee.getCurrentHero()), "{0},{1},{2}".format(eventAbility, eventHealing, eventWasHealthPack))))


rule "Logs: Offensive Assists":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackOffensiveAssists == true
    @Condition eventPlayer.Logs_OffensiveAssists < eventPlayer.getStatistic(Stat.OFFENSIVE_ASSISTS)
    @Condition isGameInProgress() == true
    
    printLog(",offensive_assist,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))
    eventPlayer.Logs_OffensiveAssists += 1
    if RULE_CONDITION:
        goto RULE_START


rule "Logs: Defensive Assists":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackDefensiveAssists == true
    @Condition eventPlayer.Logs_DefensiveAssists < eventPlayer.getStatistic(Stat.DEFENSIVE_ASSISTS)
    @Condition isGameInProgress() == true
    
    printLog(",defensive_assist,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))
    eventPlayer.Logs_DefensiveAssists += 1
    if RULE_CONDITION:
        goto RULE_START


rule "Logs: Ability 1 Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackAbilities == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition isGameInProgress() == true
    
    printLog(",ability_1_used,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))


rule "Logs: Ability 2 Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackAbilities == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition isGameInProgress() == true
    
    printLog(",ability_2_used,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))


rule "Logs: Ultimate Charged":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackUltimates == true
    @Condition eventPlayer.getUltCharge() == 100
    @Condition isGameInProgress() == true
    
    eventPlayer.Logs_UltimateID += 1
    if eventPlayer.getCurrentHero() == Hero.DVA and eventPlayer.isInAlternateForm() and Logs_TrackDvaDemechs:
        printLog(",remech_charged,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))
    else:
        printLog(",ultimate_charged,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))


rule "Logs: Ultimate Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackUltimates == true
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getCurrentHero() != Hero.DVA
    @Condition isGameInProgress() == true
    
    printLog(",ultimate_start,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))
    waitUntil(not eventPlayer.isUsingUltimate(), 99999)
    printLog(",ultimate_end,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))


rule "Logs: D.Va Remech/Self-Destruct Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getCurrentHero() == Hero.DVA
    @Condition isGameInProgress() == true
    
    wait(1.74)
    if Logs_TrackDvaDemechs and not eventPlayer.isInAlternateForm():
        printLog(",dva_remech,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.Logs_UltimateID)))
    elif Logs_TrackUltimates:
        printLog(",ultimate_start,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))
        waitUntil(not eventPlayer.isUsingUltimate(), 99999)
        printLog(",ultimate_end,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))


rule "Logs: Echo Duplicate":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackEchoDuplicates == true
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isDuplicatingAHero() == true
    
    eventPlayer.Logs_DuplicateID = eventPlayer.Logs_UltimateID
    printLog(",echo_duplicate_start,{0},{1},{2}".format(Match_CurrentMatchTime, "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_DuplicateID)))
    waitUntil(not eventPlayer.isDuplicatingAHero(), 99999)
    printLog(",echo_duplicate_end,{0},{1},{2}".format(Match_CurrentMatchTime, "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), eventPlayer.Logs_DuplicateID))


rule "Logs: Mercy Resurrect":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackMercyRez == true
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isDead() == true
    
    waitUntil(eventPlayer.isAlive(), 99999)
    wait(0.24)
    if not eventPlayer.isInSpawnRoom() and isGameInProgress():
        printLog(",mercy_rez,{0},{1}".format(Match_CurrentMatchTime, "{0},{1}".format("{0},{1},{2}".format(eventPlayer.getTeam(), getPlayersOnHero(Hero.MERCY, eventPlayer.getTeam()), Hero.MERCY), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()))))


rule "Logs: Player Stat Summary":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition (Logs_PlayerSummaryFrequency == 0 or Logs_PlayerSummaryFrequency == 1 and isMatchComplete()) == true
    @Condition isMatchBetweenRounds() == true
    
    CalcHeroPlayedTime()
    eventPlayer.Logs_LastHero = eventPlayer.getCurrentHero()
    eventPlayer.Logs_LastHeroTime = Match_CurrentMatchTime
    for eventPlayer.Logs_CurrentHeroIterator in range(len(eventPlayer.Logs_HeroesPlayedArray)):
        eventPlayer.Logs_CurrentHeroIterated = eventPlayer.Logs_HeroesPlayedArray[eventPlayer.Logs_CurrentHeroIterator]
        printLog(",player_stat,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.Logs_CurrentHeroIterated), "{0},{1}".format("{0},{1},{2}".format("{0},{1},{2}".format("{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ELIMINATIONS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.FINAL_BLOWS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DEATHS)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DAMAGE_DEALT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.BARRIER_DAMAGE_DEALT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.HERO_DAMAGE_DEALT)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.HEALING_DEALT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.HEALING_RECEIVED), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SELF_HEALING))), "{0},{1},{2}".format("{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DAMAGE_TAKEN), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DAMAGE_BLOCKED)), "{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DEFENSIVE_ASSISTS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.OFFENSIVE_ASSISTS)), "{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ULTIMATES_EARNED), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ULTIMATES_USED))), "{0},{1}".format("{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.MULTIKILL_BEST), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.MULTIKILLS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SOLO_KILLS)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.OBJECTIVE_KILLS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ENVIRONMENTAL_KILLS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ENVIRONMENTAL_DEATHS)))), "{0},{1}".format("{0},{1},{2}".format("{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.CRITICAL_HITS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.CRITICAL_HIT_ACCURACY)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_ACCURACY), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_CRITICAL_HIT_ACCURACY), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_CRITICAL_HIT_KILLS)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SHOTS_FIRED), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SHOTS_HIT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SHOTS_MISSED))), "{0},{1}".format("{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_SHOTS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_HITS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.WEAPON_ACCURACY)), eventPlayer.Logs_HeroesPlayedTimeArray[eventPlayer.Logs_CurrentHeroIterator])))))
    Logs_PlayerSummaryCount += 1


rule "Logs: Player Stat Summary (Flashpoint Between Captures)":
    @Event eachPlayer
    @Condition isMatchComplete() != true
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PlayerSummaryFrequency == 0
    @Condition getCurrentGamemode() == Gamemode.FLASHPOINT
    @Condition Logs_CurrentObjectiveIndex != getCurrentObjective()
    @Condition teamScore(Team.1) + teamScore(Team.2) >= 5 == false
    
    CalcHeroPlayedTime()
    eventPlayer.Logs_LastHero = eventPlayer.getCurrentHero()
    eventPlayer.Logs_LastHeroTime = Match_CurrentMatchTime
    for eventPlayer.Logs_CurrentHeroIterator in range(len(eventPlayer.Logs_HeroesPlayedArray)):
        eventPlayer.Logs_CurrentHeroIterated = eventPlayer.Logs_HeroesPlayedArray[eventPlayer.Logs_CurrentHeroIterator]
        printLog(",player_stat,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.Logs_CurrentHeroIterated), "{0},{1}".format("{0},{1},{2}".format("{0},{1},{2}".format("{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ELIMINATIONS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.FINAL_BLOWS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DEATHS)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DAMAGE_DEALT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.BARRIER_DAMAGE_DEALT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.HERO_DAMAGE_DEALT)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.HEALING_DEALT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.HEALING_RECEIVED), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SELF_HEALING))), "{0},{1},{2}".format("{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DAMAGE_TAKEN), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DAMAGE_BLOCKED)), "{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.DEFENSIVE_ASSISTS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.OFFENSIVE_ASSISTS)), "{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ULTIMATES_EARNED), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ULTIMATES_USED))), "{0},{1}".format("{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.MULTIKILL_BEST), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.MULTIKILLS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SOLO_KILLS)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.OBJECTIVE_KILLS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ENVIRONMENTAL_KILLS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.ENVIRONMENTAL_DEATHS)))), "{0},{1}".format("{0},{1},{2}".format("{0},{1}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.CRITICAL_HITS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.CRITICAL_HIT_ACCURACY)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_ACCURACY), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_CRITICAL_HIT_ACCURACY), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_CRITICAL_HIT_KILLS)), "{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SHOTS_FIRED), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SHOTS_HIT), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SHOTS_MISSED))), "{0},{1}".format("{0},{1},{2}".format(eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_SHOTS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.SCOPED_HITS), eventPlayer.getHeroStatistic(eventPlayer.Logs_CurrentHeroIterated, HeroStat.WEAPON_ACCURACY)), eventPlayer.Logs_HeroesPlayedTimeArray[eventPlayer.Logs_CurrentHeroIterator])))))
    Logs_PlayerSummaryCount += 1


rule "Player Status - Check if a player is inactive (AFK)":
    @Event eachPlayer
    @Condition Player_Status == true
    @Condition isInSetup() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition (eventPlayer.isMoving() == false and eventPlayer.isHoldingButton(Button.RELOAD) == false and eventPlayer.isFiringPrimaryFire() == false and eventPlayer.isFiringSecondaryFire() == false and eventPlayer.isUsingAbility1() == false and eventPlayer.isUsingAbility2() == false and eventPlayer.isHoldingButton(Button.ULTIMATE) == false and eventPlayer.isJumping() == false and eventPlayer.isCrouching() == false) == true
    
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
    @Condition (eventPlayer.isMoving() == true or eventPlayer.isHoldingButton(Button.RELOAD) == true or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire() or eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isHoldingButton(Button.ULTIMATE) or eventPlayer.isJumping() or eventPlayer.isCrouching()) == true
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
        eventPlayer.AFK_Timer = eventPlayer.AFK_Timer + 1
        wait(1)
    if eventPlayer.AFK == false:
        eventPlayer.AFK_Timer = 25


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



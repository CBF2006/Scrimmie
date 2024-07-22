settings {
    "main": {
        "description": "Scrimmie! v3.6.3\r\nCreated by CBF\r\n\r\nStandard Version\r\nLast tested on Patch 2.11.0.0 - 126377\r\n\r\nImport Code: Y2TXE\r\nworkshop.codes/scrimmie\r\ndiscord.gg/TNtbWP4aAg",
        "modeName": "Scrimmie!"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "spectatorSlots": 12,
        "pauseGameOnDisconnect": true
    },
    "gamemodes": {
        "control": {
            "enabled": false,
            "scoreToWin": 3
        },
        "escort": {},
        "flashpoint": {
            "enabled": false,
            "scoreToWin": 5
        },
        "hybrid": {},
        "push": {},
        "general": {
            "enableCompetitiveRules": true,
            "gamemodeStartTrigger": "immediately",
            "enableKillCam": false,
            "roleLimit": "1Tank2Offense2Support",
            "tankPassiveHealthBonus": "alwaysEnabled"
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
    hudSubheader(getAllPlayers(), LanguageArray[7][localPlayer.PlayerLanguage], HudPosition.LEFT, 0, Color.SKY_BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    #Current Language in Default Language
    hudSubheader(getAllPlayers(), CurrentLanguageArray[DefaultLanguage][localPlayer.PlayerLanguage], HudPosition.TOP, 24, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubheader(getAllPlayers(), "workshop.codes/scrimmie", HudPosition.LEFT, 0.1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: Y2TXE".format(LanguageArray[12][localPlayer.PlayerLanguage]), HudPosition.LEFT, 0.2, Color.TURQUOISE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
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
                    smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
                    eventPlayer.Has_Readied = false
            else:
                Team1Ready = "Ready"
                smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team1Ready = "Not Ready"
            smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))
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
                    smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
                    eventPlayer.Has_Readied = false
            else:
                Team2Ready = "Ready"
                smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team2Ready = "Not Ready"
            smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))


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
            smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team1Ready = "Not Ready"
            smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))
    elif eventPlayer.getTeam() == Team.2:
        if Team2Ready == "Not Ready":
            Team2Ready = "Ready"
            smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[14][localPlayer.PlayerLanguage]))
        else:
            Team2Ready = "Not Ready"
            smallMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, LanguageArray[15][localPlayer.PlayerLanguage]))


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
    smallMessage(getAllPlayers(), LanguageArray[28][localPlayer.PlayerLanguage])
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
    smallMessage(eventPlayer, "{0} {1} {2}".format(LanguageArray[9][localPlayer.PlayerLanguage], buttonString(Button.RELOAD), LanguageArray[24][localPlayer.PlayerLanguage]))
    wait(0.7, Wait.ABORT_WHEN_FALSE)
    eventPlayer.HeroList = getAllHeroes()
    eventPlayer.HeroList.remove(eventPlayer.getCurrentHero())
    eventPlayer.setAllowedHeroes(eventPlayer.HeroList)
    wait(0.1)
    eventPlayer.setAllowedHeroes(getAllHeroes())


/*Defender Teleports*/
#!include "teleports.opy"


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
        if ShouldRestore[eventPlayer.getSlot()] >= 0:
            if eventPlayer.isAlive():
                UltCharges[eventPlayer.getSlot()] = eventPlayer.getUltCharge()
                Heroes[eventPlayer.getSlot()] = eventPlayer.getCurrentHero()
                Positions[eventPlayer.getSlot()] = eventPlayer.getPosition()
                Cooldowns1[eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
                Cooldowns2[eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
                DVaRestore[eventPlayer.getSlot()] = (eventPlayer.getUltCharge() if eventPlayer.getMaxHealth() > 200 else DVaRestore[eventPlayer.getSlot()]) if eventPlayer.getCurrentHero() == Hero.DVA else -1
                ShouldRestore[eventPlayer.getSlot()] = eventPlayer.getNormalizedHealth()
            else:
                ShouldRestore[eventPlayer.getSlot()] = 0


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
    if eventPlayer.getCurrentHero() == Heroes[eventPlayer.getSlot()]:
        eventPlayer.setUltCharge(UltCharges[eventPlayer.getSlot()])
        if ShouldRestore[eventPlayer.getSlot()] > 0:
            ShouldRestore[eventPlayer.getSlot()] = 0 - ShouldRestore[eventPlayer.getSlot()]
            eventPlayer.startForcingPosition(Positions[eventPlayer.getSlot()], false)
            wait(0.1)
            eventPlayer.stopForcingPosition()
            PlayerDCDvaTeam1()
            eventPlayer.setHealth((0 - ShouldRestore[eventPlayer.getSlot()]) * eventPlayer.getMaxHealth())
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, Cooldowns1[eventPlayer.getSlot()])
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, Cooldowns2[eventPlayer.getSlot()])
            ShouldRestore[eventPlayer.getSlot()] = 0 - ShouldRestore[eventPlayer.getSlot()]


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
        if DVaRestore[eventPlayer.getSlot()] >= 0:
            eventPlayer.setUltCharge(DVaRestore[eventPlayer.getSlot()])
            wait(0.1)
            damage(eventPlayer, null, 1000)
            wait(1.6)
            eventPlayer.setUltCharge(UltCharges[eventPlayer.getSlot()])


def PlayerDCDvaTeam2():
    @Name "Player Reconnected - Team 2 DVa"
    
    if eventPlayer.getCurrentHero() == Hero.DVA:
        if DVaRestore[5 + eventPlayer.getSlot()] >= 0:
            eventPlayer.setUltCharge(DVaRestore[6 + eventPlayer.getSlot()])
            wait(0.1)
            damage(eventPlayer, null, 1000)
            wait(1.6)
            eventPlayer.setUltCharge(UltCharges[6 + eventPlayer.getSlot()])


/*Language Strings*/
#!include "lang.opy"


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


/*Adding Player Status*/
#!include "PlayerStatus.opy"


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


/*Adding LogTime*/
#!include "logtime.opy"


/*
rule "DEBUG - Add 1 to Team 1's Score":
    @Event eachPlayer
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    
    setTeamScore(Team.1, teamScore(Team.1) + 1)
*/

/*
rule "DEBUG - Set Timer to 10 seconds":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    setMatchTime(10)
*/


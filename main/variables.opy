#!mainFile "main.opy"

# Global Variables
# Scrimmie
globalvar InfoDrawn 0
globalvar DevMode 1
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
globalvar ScoreboardSorting 12
globalvar DrawScoreboard 13
globalvar ShouldRestore 14
globalvar UltCharges 15
globalvar Heroes 16
globalvar Positions 17
globalvar Cooldowns1 18
globalvar Cooldowns2 19
globalvar DVaRestore 20
globalvar ScoreboardLayout 21
globalvar ScoreboardGrouping 22
globalvar Scoreboard_HideScoreboardID 23
globalvar Display_StatusHUD 24
globalvar Team1StatusTextID 25
globalvar Team2StatusTextID 26
globalvar Team1StatusHUD 27
globalvar Team2StatusHUD 28
globalvar Ready_Up_System 29
globalvar Player_Status 30
globalvar Flashpoint 31
globalvar Flashpoint_TextID 32
globalvar Flashpoint_Array 33

# LogTime
globalvar Match_CurrentMatchTime 34
globalvar Logs_EnableLogGenerator 35
globalvar Logs_OutputFormat 36
globalvar Logs_CurrentObjectiveIndex 37
globalvar Logs_CurrentControlScoringTeam 38
globalvar Logs_TrackKills 39
globalvar Logs_TrackHeroSwaps 40
globalvar Logs_TrackObjectiveCapture 41
globalvar Logs_PointCaptureProgressStep 42
globalvar Logs_PayloadCaptureProgressStep 43
globalvar Logs_PointCaptureProgress 44
globalvar Logs_PayloadCaptureProgress 45
globalvar Logs_TrackAbilities 46
globalvar Logs_TrackUltimates 47
globalvar Logs_TrackOffensiveAssists 48
globalvar Logs_TrackDefensiveAssists 49
globalvar Logs_TrackDamage 50
globalvar Logs_TrackHealing 51
globalvar Logs_TrackDvaDemechs 52
globalvar Logs_TrackEchoDuplicates 53
globalvar Logs_TrackMercyRez 54
globalvar Logs_TrackRoundStartEnd 55
globalvar Logs_TrackMatchStartEnd 56
globalvar Logs_PlayerSummaryFrequency 57
globalvar Logs_PlayerSummaryCount 58

# More Global Variables
globalvar Teleport_Coordinate 59
globalvar AFK_Trigger_Time 60


# Player Variables
# Scrimmie
playervar PlayerLanguage 0
playervar AddTimeCD 1
playervar ReadyCD 2
playervar HeroList 3
playervar AFK 4
playervar Status_TextID 5
playervar Has_Readied 6
playervar ChangeStatusHUD 7
playervar AFK_TextID 8
playervar AFK_Timer 9
playervar Confirm_Ready_TextID 10

# LogTime
playervar Logs_LastHero 11
playervar Logs_LastHeroTime 12
playervar Logs_HeroesPlayedTimeArray 13
playervar Logs_HeroesPlayedArray 14
playervar Logs_OffensiveAssists 15
playervar Logs_DefensiveAssists 16
playervar Logs_CurrentHeroIterator 17
playervar Logs_CurrentHeroIterated 18
playervar Logs_UltimateID 19
playervar Logs_DuplicateID 20

# Additional Player Variables
playervar FacingPosition 21

# Subroutines
# Scrimmie
subroutine PlayerDCInfoTeam1 1
subroutine PlayerDCInfoTeam2 2
subroutine PlayerDCDvaTeam1 3
subroutine PlayerDCDvaTeam2 4

# LogTime
subroutine CalcHeroPlayedTime 5


# Set variables initial state
rule "[variables.opy] Set Global Variables":
    # Workshop Settings
    AllowDCResume = createWorkshopSetting(bool, "1. General Settings", "Allow Disconnect Resume", true, 2)
    MatchDelayAmount = createWorkshopSetting(int[15:300], "2. Setup Phase", "Setup Time Added", 60, 2)
    Scoreboard_Size = createWorkshopSetting(enum["Large", "Small"], "5. Spectator Scoreboard", "Size", 0, 1)
    ScoreboardGrouping = createWorkshopSetting(enum["Separate Teams", "Combine Teams"], "5. Spectator Scoreboard", "Grouping", 0, 2)
    ScoreboardLayout = createWorkshopSetting(enum["Scrimmie / OWL", "ScrimTime Standard"], "5. Spectator Scoreboard", "Layout", 0, 3)
    ScoreboardSorting = createWorkshopSetting(enum["By Slot", "By Role"], "5. Spectator Scoreboard", "Sorting", 0, 4)
    Ready_Up_System = createWorkshopSetting(bool, "6. Player Status", "Toggle Ready Confirmation", true, 1)
    Player_Status = createWorkshopSetting(bool, "6. Player Status", "Toggle Player Status", true, 0)
    DevMode = createWorkshopSetting(bool, "8. Developer Options", "Developer Mode", false, 0)
    # Set Teams to "Not Ready"
    Team1Ready = "Not Ready"
    Team2Ready = "Not Ready"
    AFK_Trigger_Time = createWorkshopSetting(int[10:120], "6. Player Status", "Time Away to be Marked Inactive", 25, 2)
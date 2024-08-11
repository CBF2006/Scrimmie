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
globalvar Display_StatusHUD 23
globalvar Team1StatusTextID 24
globalvar Team2StatusTextID 25
globalvar Team1StatusHUD 26
globalvar Team2StatusHUD 27
globalvar Ready_Up_System 28
globalvar Player_Status 29
globalvar Flashpoint 30
globalvar Flashpoint_TextID 31
globalvar Flashpoint_Array 32

# LogTime
globalvar Match_CurrentMatchTime 33
globalvar Logs_EnableLogGenerator 34
globalvar Logs_OutputFormat 35
globalvar Logs_CurrentObjectiveIndex 36
globalvar Logs_CurrentControlScoringTeam 37
globalvar Logs_TrackKills 38
globalvar Logs_TrackHeroSwaps 39
globalvar Logs_TrackObjectiveCapture 40
globalvar Logs_PointCaptureProgressStep 41
globalvar Logs_PayloadCaptureProgressStep 42
globalvar Logs_PointCaptureProgress 43
globalvar Logs_PayloadCaptureProgress 44
globalvar Logs_TrackAbilities 45
globalvar Logs_TrackUltimates 46
globalvar Logs_TrackOffensiveAssists 47
globalvar Logs_TrackDefensiveAssists 48
globalvar Logs_TrackDamage 49
globalvar Logs_TrackHealing 50
globalvar Logs_TrackDvaDemechs 51
globalvar Logs_TrackEchoDuplicates 52
globalvar Logs_TrackMercyRez 53
globalvar Logs_TrackRoundStartEnd 54
globalvar Logs_TrackMatchStartEnd 55
globalvar Logs_PlayerSummaryFrequency 56
globalvar Logs_PlayerSummaryCount 57


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


# Subroutines
# Scrimmie
subroutine PlayerDCInfoTeam1 1
subroutine PlayerDCInfoTeam2 2
subroutine PlayerDCDvaTeam1 3
subroutine PlayerDCDvaTeam2 4

# LogTime
subroutine CalcHeroPlayedTime 5
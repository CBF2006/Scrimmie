#!mainFile "main.opy"

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

subroutine PlayerDCInfoTeam1 1
subroutine PlayerDCInfoTeam2 2
subroutine PlayerDCDvaTeam1 3
subroutine PlayerDCDvaTeam2 4
subroutine CalcHeroPlayedTime 5
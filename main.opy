#Global variables

globalvar OW1_DOOMFIST_UPPERCUT_CD 1
globalvar OW1_DOOMFIST_PUNCH_COOLDOWN 2
globalvar OW1_DOOMFIST_SLAM_CD 3
globalvar OW1_DOOMFIST_SLAM_DAMAGE_MAX 4
globalvar OW1_DOOMFIST_SLAM_PITCH_ANGLE 5
globalvar OW1_DOOMFIST_SEISMIC_SLAM_RADIUS 6
globalvar OW1_ORISA_BARRIER_ORB_SIZE 7
globalvar OW1_ORISA_BARRIER_ORB_COUNT 8
globalvar OW1_ORISA_BARRIER_LOS_FREQ 9
globalvar i 10
globalvar hero_roster_gvar 12
globalvar heroes_enabled 13
globalvar role_lock_gvar 14
globalvar ANTI_CRASH_ACTIVATE_PERCENT 16
globalvar ANTI_CRASH_HOLD_TIME 17
globalvar ANTI_CRASH_DEACTIVATE_PERCENT 18
globalvar rgb_list 20
globalvar health_pool 22
globalvar PHI 23
globalvar los_i 24
globalvar los_j 25
globalvar DEBUG_MODE 26
globalvar InfoDrawn 27
globalvar AllowDCResume 28
globalvar MatchDelayAmount 29
globalvar Team1Ready 30
globalvar Team2Ready 31
globalvar LanguageArray 32
globalvar CurrentLanguageArray 33
globalvar DefaultLanguage 34
globalvar Scoreboard_Size 35
globalvar MaxSetupTime 36
globalvar ScoreModified 37
globalvar FirstRoundDone 38
globalvar GameMode 39
globalvar ShouldRestore 40
globalvar UltCharges 41
globalvar Heroes 42
globalvar Positions 43
globalvar Cooldowns1 44
globalvar Cooldowns2 45
globalvar DVaRestore 46
globalvar Display_StatusHUD 72
globalvar Team1StatusTextID 73
globalvar Team2StatusTextID 74
globalvar Team1StatusHUD 75
globalvar Team2StatusHUD 76
globalvar Ready_Up_System 77
globalvar Player_Status 78
globalvar Flashpoint 79
globalvar Flashpoint_TextID 80
globalvar Flashpoint_Array 81


#Player variables

playervar stat_helper_pvar 0
playervar custom_hp_pvar 1
playervar reset_pvar 2
playervar hero_switch_pvar 3
playervar role_lock_pvar 4
playervar AFK_Timer 5
playervar hit_detection_pvar 8
playervar lsi_i 9
playervar ult_charge_pvar 13
playervar self_heal_pvar 14
playervar hack_timer 15
playervar ult_point_while_ult_active 16
playervar start_time_ult 17
playervar current_configuration 18
playervar repair_pvar 19
playervar self_repair_time_left 20
playervar machine_gun_ammo 21
playervar machine_gun_ready 22
playervar machine_gun_reload_timer 23
playervar machine_gun_ammo_id 24
playervar ralley_hot_id 25
playervar is_using_uppercut 26
playervar is_ultimate_locked 27
playervar is_hit_by_uppercut 28
playervar is_uppercut_locked 29
playervar uppercut_shields 30
playervar hp_before_uppercut 31
playervar slam_to_use 32
playervar proto_indicator_slam_position 33
playervar indicator_slam_position 34
playervar slam_damage 35
playervar slam_damage_text_entity 36
playervar ow1_slam_victims 37
playervar slam_velocity_correction 38
playervar stop_slam 39
playervar slam_indicator_beam_id 40
playervar slam_indicator_ring_id 41
playervar punched_victims 42
playervar wall_impacted_victims 43
playervar punch_charge_time 44
playervar remech_damage_taken 45
playervar hero_id_duplicated 46
playervar freeze_progress 47
playervar freeze_slow_linger_time 48
playervar freeze_move_penalty 49
playervar is_using_guardian_angel 50
playervar is_slingshotting 51
playervar slingshot_velocity 52
playervar is_using_supercharger 54
playervar is_supercharged 55
playervar orisa_supercharger_id 56
playervar orisa_supercharger_origin 57
playervar orisa_supercharger_beam_id 58
playervar orisa_supercharger_sound_id 59
playervar is_using_halt 60
playervar is_snared 61
playervar halt_victims 62
playervar halt_position 63
playervar halt_ending_position 64
playervar halt_orb_id 65
playervar halt_snare_line_id 66
playervar position 67
playervar barrier_seed_id 68
playervar barrier_seed_v0 69
playervar barrier_seed_p0 70
playervar barrier_seed_t 71
playervar barrier_seed_velocity 72
playervar barrier_seed_position 73
playervar seed_hit_surface_normal 74
playervar barrier_origin 75
playervar barrier_orientation 76
playervar barrier_sample_y 77
playervar barrier_sample_radius 78
playervar barrier_sample_coordinate 79
playervar barrier_entity_positions 80
playervar barrier_entity_colors 81
playervar barrier_entity_ids 82
playervar barrier_active 83
playervar barrier_uptime 84
playervar barrier_hp 85
playervar barrier_hp_hud_id 86
playervar orisa_barrier_hit_positions 87
playervar barrier_damage_block_id 88
playervar barrier_all_enemies 89
playervar enemies_behind_barrier 90
playervar orisa_ammo 91
playervar orisa_ammo_hud 92
playervar is_orisa_reloading 93
playervar time_hook_was_active 94
playervar breather_pvar 95
playervar emp_pvar 96
playervar is_using_stealth 97
playervar stealth_hud_id 98
playervar translocator_pvar 99
playervar transloc_position 100
playervar trasnloc_velocity 101
playervar transloc_p0 102
playervar transloc_v0 103
playervar transloc_time 104
playervar translocator_id 105
playervar call_throwTranslocator 106
playervar scoped_shot_distance 107
playervar scoped_damage_base 108
playervar ow2_scoped_damage_falloff_scalar 109
playervar ow1_scoped_damage_falloff_scalar 110
playervar expected_scoped_damage 111
playervar ow2_adaptive_shield_n 112
playervar ow1_adaptive_shield_n 113
playervar self_bubble_cooldown 114
playervar self_bubble_cd_text 115
playervar ally_bubble_cooldown 116
playervar ally_bubble_cd_text 117
playervar PlayerLanguage 118
playervar AddTimeCD 119
playervar ReadyCD 120
playervar HeroList 121
playervar AFK 122
playervar Status_TextID 123
playervar Has_Readied 124
playervar ChangeStatusHUD 125
playervar AFK_TextID 126
playervar Confirm_Ready_TextID 127


#Subroutine names

subroutine clearCustomHp 0
subroutine applyCustomHp 1
subroutine enableAllAbilities 2
subroutine disableAllAbilities 3
subroutine resetStats 4
subroutine resetStatuses 5
subroutine resetFrenemies 6
subroutine respawnSameState 7
subroutine findLineSphereIntersection 8
subroutine resetUltCharge 9
subroutine removeTankPassive 10
subroutine resetSelfHealing 11
subroutine removeSelfHealing 12
subroutine evalSelfHealingPercent 13
subroutine startTank 14
subroutine endTank 15
subroutine enterSelfRepair 16
subroutine exitSelfRepair 17
subroutine showSelfRepairResource 18
subroutine hideSelfRepairResource 19
subroutine showSelfRepairRing 20
subroutine hideSelfRepairRing 21
subroutine startMachineGunReload 22
subroutine showMachineGunAmmo 23
subroutine hideMachineGunAmmo 24
subroutine executeUppercut 25
subroutine initSlam 26
subroutine executeSlam 27
subroutine startSlamAnimation 28
subroutine initiateGroundSlam 29
subroutine initiateIndicatorSlam 30
subroutine showSlamDamageGui 31
subroutine hideSlamDamageGui 32
subroutine createSlamIndicatorGui 33
subroutine destroySlamIndicatorGui 34
subroutine initRocketPunch 35
subroutine clearFreezeEffect 36
subroutine startSupercharger 37
subroutine endSupercharger 38
subroutine shootHalt 39
subroutine explodeHalt 40
subroutine showSnareLine 41
subroutine hideSnareLine 42
subroutine throwBarrier 43
subroutine deployBarrier 44
subroutine destroyBarrier 45
subroutine fibonacciSphere 46
subroutine createBarrierHud 47
subroutine destroyBarrierHud 48
subroutine updateBarrierVisual 49
subroutine resetFusionDriver 50
subroutine reloadFusionDriver 51
subroutine showOrisaAmmoHud 52
subroutine hideOrisaAmmoHud 53
subroutine enterStealth 54
subroutine exitStealth 55
subroutine showStealthHud 56
subroutine hideStealthHud 57
subroutine throwTranslocator 58
subroutine destroyTranslocator 59
subroutine showTranslocator 60
subroutine hideTranslocator 61
subroutine initSelfBubble 62
subroutine showSelfBubbleCD 63
subroutine hideSelfBubbleCD 64
subroutine initAllyBubble 65
subroutine showAllyBubbleCD 66
subroutine hideAllyBubbleCD 67
subroutine CreateSpectatorHUD 68
subroutine PlayerDCInfoTeam1 69
subroutine PlayerDCInfoTeam2 70
subroutine PlayerDCDvaTeam1 71
subroutine PlayerDCDvaTeam2 72


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
    hudSubheader(getAllPlayers(), "{0}".format(LanguageArray[7][localPlayer.PlayerLanguage]), HudPosition.LEFT, 0, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    #Current Language in Default Language
    hudSubheader(getAllPlayers(), CurrentLanguageArray[DefaultLanguage][localPlayer.PlayerLanguage], HudPosition.TOP, 24, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    #Scrimmie! Banner
    hudSubheader(getAllPlayers(), "OW1 Version", HudPosition.LEFT, 0.05, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "workshop.codes/scrimmie6v6", HudPosition.LEFT, 0.1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: 503ST".format(LanguageArray[12][localPlayer.PlayerLanguage]), HudPosition.LEFT, 0.2, Color.TURQUOISE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
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


# Adding Defender Teleports
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


# Adding Multi-Language Support
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


# Adding Player Status
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

# Adding LogTime
/* #!include "logtime.opy" */


# Debug Features

# Manually disable in-game!!!!

rule "DEBUG - Add 1 to Team 1's Score":
    @Event eachPlayer
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    
    setTeamScore(Team.1, teamScore(Team.1) + 1)



rule "DEBUG - Set Timer to 10 seconds":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    setMatchTime(10)

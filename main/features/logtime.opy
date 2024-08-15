#!mainFile "../main.opy"

rule "[features/logtime.opy] Settings: Log Options":
    Logs_EnableLogGenerator = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Enable Log Generator", false, 0)
    Logs_OutputFormat = createWorkshopSetting(enum["CSV"], "7. LogTime (PC Only)", "Output Format", 0, 1)
    Logs_TrackKills = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Kills and Deaths", true, 2)
    Logs_TrackOffensiveAssists = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Offensive Assists", true, 3)
    Logs_TrackDefensiveAssists = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Defensive Assists", true, 4)
    Logs_TrackHeroSwaps = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Hero Swaps", true, 5)
    Logs_TrackUltimates = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Ultimates", true, 6)
    Logs_TrackAbilities = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Abilities*", false, 7)
    Logs_TrackDamage = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Damage*", false, 8)
    Logs_TrackHealing = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Healing*", false, 9)
    Logs_TrackDvaDemechs = createWorkshopSetting(bool, "7. LogTime (PC Only)", "D.Va Demechs & Remechs", true, 10)
    Logs_TrackEchoDuplicates = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Echo Duplicates", true, 11)
    Logs_TrackMercyRez = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Mercy Resurrects", true, 12)
    Logs_TrackMatchStartEnd = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Match Start & End", true, 13)
    Logs_TrackRoundStartEnd = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Round Start & End", true, 14)
    Logs_TrackObjectiveCapture = createWorkshopSetting(bool, "7. LogTime (PC Only)", "Objective Captures", true, 15)
    Logs_PointCaptureProgressStep = createWorkshopSetting(float[0:100], "7. LogTime (PC Only)", "Control Point Progress Increment", 33.333, 16)
    Logs_PayloadCaptureProgressStep = createWorkshopSetting(float[0:100], "7. LogTime (PC Only)", "Payload Progress Increment", 10, 17)
    Logs_PlayerSummaryFrequency = createWorkshopSetting(enum["Every Round End", "Only Match End", "Off"], "7. LogTime (PC Only)", "Player Stat Summary Frequency", 0, 18)


rule "[features/logtime.opy] Initialisation: Player":
    @Event eachPlayer
    
    eventPlayer.Logs_HeroesPlayedArray = []


rule "[features/logtime.opy] Logs: Update Match Time":
    Match_CurrentMatchTime = 0
    while true:
        waitUntil(isGameInProgress(), 99999)
        chase(Match_CurrentMatchTime, 99999, rate=1, ChaseReeval.NONE)
        waitUntil(not isGameInProgress(), 99999)
        stopChasingVariable(Match_CurrentMatchTime)


rule "[features/logtime.opy] Logs: Match Start":
    @Condition Logs_EnableLogGenerator == true
    @Condition getMatchRound() == 1
    
    if Logs_TrackMatchStartEnd:
        printLog(",match_start,{0},{1}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getCurrentMap(), getCurrentGamemode()), "{0},{1}".format(Team.1, Team.2)))


rule "[features/logtime.opy] Logs: Round Start":
    @Condition Logs_EnableLogGenerator == true
    @Condition isInSetup() == true
    
    Logs_CurrentControlScoringTeam = Team.ALL
    Logs_CurrentObjectiveIndex = getCurrentObjective()
    if Logs_TrackRoundStartEnd == true:
        printLog(",round_start,{0},{1},{2}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getMatchRound(), (Team.1 if isTeamOnOffense(Team.1) else Team.2) if getCurrentGamemode() != Gamemode.CONTROL else null), "{0},{1}".format(teamScore(Team.1), teamScore(Team.2)), "{0}".format(getCurrentObjective())))
        waitUntil(isGameInProgress(), 99999)
        printLog(",setup_complete,{0}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getMatchRound(), getMatchTime())))


rule "[features/logtime.opy] Logs: Round Complete":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackRoundStartEnd == true
    @Condition isMatchBetweenRounds() == true
    
    printLog(",round_end,{0},{1},{2}".format("{0},{1},{2}".format(Match_CurrentMatchTime, getMatchRound(), (Team.1 if isTeamOnOffense(Team.1) else Team.2) if getCurrentGamemode() != Gamemode.CONTROL else null), "{0},{1}".format(teamScore(Team.1), teamScore(Team.2)), "{0},{1},{2}".format(getCurrentObjective(), "{0},{1}".format(getControlScorePercentage(Team.1), getControlScorePercentage(Team.2)), getMatchTime())))


rule "[features/logtime.opy] Logs: Match Complete":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackMatchStartEnd == true
    @Condition isMatchComplete() == true
    
    printLog(",match_end,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0}".format(teamScore(Team.1)), "{0}".format(teamScore(Team.2))))


rule "[features/logtime.opy] Logs: Control Point Increment":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PointCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getCapturePercentage() >= Logs_PointCaptureProgress + Logs_PointCaptureProgressStep
    
    printLog(",point_progress,{0},{1}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1},{2}".format(getOppositeTeam(getControlScoringTeam()) if getCurrentGamemode() == Gamemode.CONTROL else Team.1 if isTeamOnOffense(Team.1) else Team.2, getCurrentObjective(), getCapturePercentage())))
    Logs_PointCaptureProgress += Logs_PointCaptureProgressStep


rule "[features/logtime.opy] Logs: Payload Increment":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PayloadCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getPayloadProgressPercentage() >= Logs_PayloadCaptureProgress + Logs_PayloadCaptureProgressStep
    
    printLog(",payload_progress,{0},{1}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1},{2}".format(Team.1 if isTeamOnOffense(Team.1) else Team.2, getCurrentObjective(), getPayloadProgressPercentage())))
    Logs_PayloadCaptureProgress += Logs_PayloadCaptureProgressStep


rule "[features/logtime.opy] Logs: Reset Control Point Progress":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PointCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getCapturePercentage() == 0
    
    Logs_PointCaptureProgress = 0


rule "[features/logtime.opy] Logs: Reset Payload Progress":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_PayloadCaptureProgressStep > 0
    @Condition isGameInProgress() == true
    @Condition getPayloadProgressPercentage() == 0
    
    Logs_PayloadCaptureProgress = 0


rule "[features/logtime.opy] Logs: Objective Updated":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackObjectiveCapture == true
    @Condition Logs_CurrentObjectiveIndex != getCurrentObjective()
    
    printLog(",objective_updated,{0},{1}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1}".format(Logs_CurrentObjectiveIndex, getCurrentObjective())))
    wait()
    Logs_CurrentObjectiveIndex = getCurrentObjective()


rule "[features/logtime.opy] Logs: Objective Captured (Non-Control)":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackObjectiveCapture == true
    @Condition getCurrentGamemode() != Gamemode.CONTROL
    @Condition getCurrentGamemode() != Gamemode.FLASHPOINT
    @Condition getCurrentGamemode() != Gamemode.PUSH
    @Condition isObjectiveComplete(Logs_CurrentObjectiveIndex) == true
    
    printLog(",objective_captured,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1}".format(Team.1 if isTeamOnOffense(Team.1) else Team.2, getCurrentObjective()), "{0},{1},{2}".format(null, null, getMatchTime())))


rule "[features/logtime.opy] Logs: Objective Captured (Control and Flashpoint)":
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackObjectiveCapture == true
    @Condition isGameInProgress() == true
    @Condition (getCurrentGamemode() == Gamemode.CONTROL or getCurrentGamemode() == Gamemode.FLASHPOINT) == true
    @Condition getControlScoringTeam() != Logs_CurrentControlScoringTeam
    
    printLog(",objective_captured,{0},{1},{2}".format("{0},{1}".format(Match_CurrentMatchTime, getMatchRound()), "{0},{1}".format(getControlScoringTeam(), getCurrentObjective()), "{0},{1},{2}".format(getControlScorePercentage(Team.1), getControlScorePercentage(Team.2), getMatchTime())))
    Logs_CurrentControlScoringTeam = getControlScoringTeam()


rule "[features/logtime.opy] Logs: Kills":
    @Event playerDied
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackKills == true
    @Condition isGameInProgress() == true
    
    printLog(",kill,{0},{1}".format(Match_CurrentMatchTime, "{0},{1},{2}".format("{0},{1},{2}".format(attacker.getTeam(), attacker, attacker.getCurrentHero()), "{0},{1},{2}".format(victim.getTeam(), victim, victim.getCurrentHero()), "{0},{1},{2}".format("{0},{1}".format(eventAbility, eventDamage), eventWasCriticalHit, eventWasEnvironment))))


rule "[features/logtime.opy] Logs: Hero Spawn/Swap":
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
    @Name "[features/logtime.opy] Logs: Calculate Hero Played Time (Subroutine)"
    
    eventPlayer.Logs_HeroesPlayedTimeArray[eventPlayer.Logs_HeroesPlayedArray.index(eventPlayer.Logs_LastHero)] += Match_CurrentMatchTime - eventPlayer.Logs_LastHeroTime


rule "[features/logtime.opy] Logs: Damage":
    @Event playerDealtDamage
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackDamage == true
    @Condition isGameInProgress() == true
    
    printLog(",damage,{0},{1}".format(Match_CurrentMatchTime, "{0},{1},{2}".format("{0},{1},{2}".format(attacker.getTeam(), attacker, attacker.getCurrentHero()), "{0},{1},{2}".format(victim.getTeam(), victim, victim.getCurrentHero()), "{0},{1},{2}".format("{0},{1}".format(eventAbility, eventDamage), eventWasCriticalHit, eventWasEnvironment))))


rule "[features/logtime.opy] Logs: Healing":
    @Event playerReceivedHealing
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackHealing == true
    @Condition isGameInProgress() == true
    
    printLog(",healing,{0},{1}".format(Match_CurrentMatchTime, "{0},{1},{2}".format("{0},{1},{2}".format(healer.getTeam(), healer, healer.getCurrentHero()), "{0},{1},{2}".format(healee.getTeam(), healee, healee.getCurrentHero()), "{0},{1},{2}".format(eventAbility, eventHealing, eventWasHealthPack))))


rule "[features/logtime.opy] Logs: Offensive Assists":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackOffensiveAssists == true
    @Condition eventPlayer.Logs_OffensiveAssists < eventPlayer.getStatistic(Stat.OFFENSIVE_ASSISTS)
    @Condition isGameInProgress() == true
    
    printLog(",offensive_assist,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))
    eventPlayer.Logs_OffensiveAssists += 1
    if RULE_CONDITION:
        goto RULE_START


rule "[features/logtime.opy] Logs: Defensive Assists":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackDefensiveAssists == true
    @Condition eventPlayer.Logs_DefensiveAssists < eventPlayer.getStatistic(Stat.DEFENSIVE_ASSISTS)
    @Condition isGameInProgress() == true
    
    printLog(",defensive_assist,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))
    eventPlayer.Logs_DefensiveAssists += 1
    if RULE_CONDITION:
        goto RULE_START


rule "[features/logtime.opy] Logs: Ability 1 Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackAbilities == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition isGameInProgress() == true
    
    printLog(",ability_1_used,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))


rule "[features/logtime.opy] Logs: Ability 2 Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackAbilities == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition isGameInProgress() == true
    
    printLog(",ability_2_used,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0}".format(eventPlayer.getHeroOfDuplication())))


rule "[features/logtime.opy] Logs: Ultimate Charged":
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


rule "[features/logtime.opy] Logs: Ultimate Used":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackUltimates == true
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getCurrentHero() != Hero.DVA
    @Condition isGameInProgress() == true
    
    printLog(",ultimate_start,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))
    waitUntil(not eventPlayer.isUsingUltimate(), 99999)
    printLog(",ultimate_end,{0},{1},{2}".format("{0}".format(Match_CurrentMatchTime), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_UltimateID)))


rule "[features/logtime.opy] Logs: D.Va Remech/Self-Destruct Used":
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


rule "[features/logtime.opy] Logs: Echo Duplicate":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackEchoDuplicates == true
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isDuplicatingAHero() == true
    
    eventPlayer.Logs_DuplicateID = eventPlayer.Logs_UltimateID
    printLog(",echo_duplicate_start,{0},{1},{2}".format(Match_CurrentMatchTime, "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), "{0},{1}".format(eventPlayer.getHeroOfDuplication(), eventPlayer.Logs_DuplicateID)))
    waitUntil(not eventPlayer.isDuplicatingAHero(), 99999)
    printLog(",echo_duplicate_end,{0},{1},{2}".format(Match_CurrentMatchTime, "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()), eventPlayer.Logs_DuplicateID))


rule "[features/logtime.opy] Logs: Mercy Resurrect":
    @Event eachPlayer
    @Condition Logs_EnableLogGenerator == true
    @Condition Logs_TrackMercyRez == true
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isDead() == true
    
    waitUntil(eventPlayer.isAlive(), 99999)
    wait(0.24)
    if not eventPlayer.isInSpawnRoom() and isGameInProgress():
        printLog(",mercy_rez,{0},{1}".format(Match_CurrentMatchTime, "{0},{1}".format("{0},{1},{2}".format(eventPlayer.getTeam(), getPlayersOnHero(Hero.MERCY, eventPlayer.getTeam()), Hero.MERCY), "{0},{1},{2}".format(eventPlayer.getTeam(), eventPlayer, eventPlayer.getCurrentHero()))))


rule "[features/logtime.opy] Logs: Player Stat Summary":
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
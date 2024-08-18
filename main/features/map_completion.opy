#!mainFile "../main.opy"

rule "[features/map_completion.opy] Force Map Completion":
    @Condition createWorkshopSetting(bool, "4. Map Completion", "Force Map Completion", true, 0)
    @Condition isMatchBetweenRounds() == true
    @Condition isTeamOnOffense(Team.2) == true
    @Condition ScoreModified == 0
    
    wait(10)
    ScoreModified = 1
    if getCurrentGamemode() == Gamemode.ESCORT or getCurrentGamemode() == Gamemode.HYBRID:
        setTeamScore(Team.2, 3)
    elif getCurrentGamemode() == Gamemode.ASSAULT:
        setTeamScore(Team.2, 2)


rule "[features/map_completion.opy] End Control after 3 rounds":
    @Condition getCurrentGamemode() == Gamemode.CONTROL
    @Condition teamScore(Team.1) + teamScore(Team.2) == 3
    @Condition createWorkshopSetting(enum["After 3 Rounds", "Don't End Map"], "4. Map Completion", "End Control", 0, 1) == 1
    
    declareTeamVictory(Team.1 if teamScore(Team.1) > teamScore(Team.2) else Team.2)


rule "[features/map_completion.opy] End Hybrid/Escort if teams tie":
    @Condition (getCurrentGamemode() == Gamemode.ESCORT or getCurrentGamemode() == Gamemode.HYBRID) == true
    @Condition teamScore(Team.1) == 3
    @Condition teamScore(Team.2) == 3
    @Condition createWorkshopSetting(enum["After 2 Rounds", "Don't End Map"], "4. Map Completion", "End Hybrid/Escort", 0, 2) == 1

    declareDraw()


rule "[features/map_completion.opy] End Flashpoint once all points have been played":
    @Condition isGameInProgress() == true
    @Condition getCurrentGamemode() == Gamemode.FLASHPOINT
    @Condition createWorkshopSetting(bool, "4. Map Completion", "Automatically End Flashpoint", true, 3) == true
    #There are 5 Flashpoints, so this condition is met once all Flashpoints have been played
    @Condition teamScore(Team.1) + teamScore(Team.2) == createWorkshopSetting(int[1:10], "4. Map Completion", "Total Score to End Flashpoint", 5, 4)
    
    declareTeamVictory(Team.1 if teamScore(Team.1) > teamScore(Team.2) else Team.2)
    #Flashpoint is bugged currently and you cannot manually declare a winner
    smallMessage(getAllPlayers(), "  {0}".format(InfoDrawn[28][localPlayer.PlayerLanguage]))
    wait(4.5)
    returnToLobby()
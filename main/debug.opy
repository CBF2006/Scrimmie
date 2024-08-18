#!mainFile "main.opy"

rule "[debug.opy] DEBUG: Performance Stats":
    @Condition DrawScoreboard == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "Display Performance Stats", false, 1)
    
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load", getServerLoad()), HudPosition.RIGHT, 19, Color.LIME_GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load Average", getAverageServerLoad()), HudPosition.RIGHT, 20, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load Peak", getPeakServerLoad()), HudPosition.RIGHT, 21, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

rule "[debug.opy] DEBUG: Add 1 to Team 1's Score":
    @Event eachPlayer
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "DEBUG - Add Score by Pressing Ctrl + Left Click", false, 2)
    @Condition isGameInProgress() == true
    @Condition hostPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition hostPlayer.isHoldingButton(Button.ABILITY_1) == true
    
    setTeamScore(Team.1, teamScore(Team.1) + 1)


rule "[debug.opy] DEBUG: Set Timer to 10 seconds":
    @Event eachPlayer
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "DEBUG - Set Timer to 5s by Pressing Ctrl + Right Click", false, 3)
    @Condition hostPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition hostPlayer.isHoldingButton(Button.ABILITY_2) == true
    
    setMatchTime(10)


rule "[debug.opy] DEBUG: Autostart the Game":
    @Event global
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "DEBUG - Auto start after 10s", false, 4) == true

    smallMessage(getAllPlayers(), "Game will start in 15 seconds")
    wait(10)
    setMatchTime(5)

rule "[debug.opy] DEBUG: Ready Up Both Teams":
    @Event global
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "DEBUG - Ready Up Both Teams by Pressing Ctrl + Melee", false, 5) == true
    @Condition hostPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition hostPlayer.isHoldingButton(Button.MELEE) == true

    if Team1Ready == "Not Ready" or Team2Ready == "Not Ready":
        Team1Ready = "Ready"
        Team2Ready = "Ready"
    else:
        Team1Ready = "Not Ready"
        Team2Ready = "Not Ready"

rule "[debug.opy] DEBUG: Show Coordinates":
    @Event global
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "DEBUG - Show Coordinates", false, 6) == true
    @Condition isInSetup() == true

    wait(5)
    hudSubheader(getAllPlayers(), "X, Y, Z {0}".format(localPlayer.getPosition()), HudPosition.TOP, 26, Color.YELLOW, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.NEVER)

rule "[debug.opy] DEBUG: Show GitHub Build":
    @Event global
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "9. Developer Options", "DEBUG - Display Exact Build Version", false, 7) == true
    @Condition isInSetup() == true

    wait(5)
    hudSubheader(getAllPlayers(), "Build {0}".format("4.0.0.ca2da64"), HudPosition.LEFT, 0.05, Color.GRAY, HudReeval.NONE, SpecVisibility.ALWAYS)
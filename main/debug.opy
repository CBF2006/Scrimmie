#!mainFile "main.opy"

rule "DEBUG - Performance Stats":
    @Condition DrawScoreboard == true
    @Condition createWorkshopSetting(bool, "5. Advanced Options", "Display Performance Stats", false, 0)
    
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load Average", getAverageServerLoad()), HudPosition.RIGHT, 20, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load Peak", getPeakServerLoad()), HudPosition.RIGHT, 21, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

rule "DEBUG - Add 1 to Team 1's Score":
    @Event eachPlayer
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "6. Developer Options", "DEBUG - Add Score by Pressing Ultimate", false, 3)
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    
    setTeamScore(Team.1, teamScore(Team.1) + 1)


rule "DEBUG - Set Timer to 10 seconds":
    @Event eachPlayer
    @Condition DevMode == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition createWorkshopSetting(bool, "6. Developer Options", "DEBUG - Set Timer to 10s by Pressing Interact", false, 4)
    
    setMatchTime(10)


rule "DEBUG - Autostart the Game":
    @Event global
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "6. Developer Options", "DEBUG - Auto start after 10s", false, 5) == true

    smallMessage(getAllPlayers(), "Game will start in 15 seconds")
    wait(10)
    setMatchTime(5)

/* rule "DEBUG - Reveal Host Spectator Keybinds":
    @Event global
    @Condition DevMode == true
    @Condition createWorkshopSetting(bool, "6. Developer Options", "DEBUG - Show Host Spectator Keybinds", false, 6) == true

    hudSubheader(null, "{0}: {1}".format("Ability 1", buttonString(Button.ABILITY_1)), HudPosition.RIGHT, -30, Color.PURPLE, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(null, "{0}: {1}".format("Ability 2", buttonString(Button.ABILITY_2)), HudPosition.RIGHT, -30, Color.PURPLE, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(null, "{0}: {1}".format("Ultimate", buttonString(Button.ULTIMATE)), HudPosition.RIGHT, -30, Color.PURPLE, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
*/
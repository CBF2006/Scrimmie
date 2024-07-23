#!mainFile "main.opy"

rule "DEBUG - Add 1 to Team 1's Score":
    @Event eachPlayer
    @Condition DevMode == true
    @Condition isGameInProgress() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    
    setTeamScore(Team.1, teamScore(Team.1) + 1)


rule "DEBUG - Set Timer to 10 seconds":
    @Event eachPlayer
    @Condition DevMode == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    setMatchTime(10)


rule "DEBUG - Performance Stats":
    @Condition DevMode == true
    @Condition DrawScoreboard == true
    
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load Average", getAverageServerLoad()), HudPosition.RIGHT, 0.2, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "{0}: {1}%".format("Server Load Peak", getPeakServerLoad()), HudPosition.RIGHT, 0.1, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
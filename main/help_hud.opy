#!mainFile "main.opy"

rule "[help_hud.opy] Help HUD":
    @Condition isGameInProgress() == false
    @Condition InfoDrawn == false
    
    if createWorkshopSetting(bool, "3. Help HUD", "Show Controls", true, 1) == true:
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
    if createWorkshopSetting(bool, "3. Help HUD", "Show Current Language", true, 2) == true:
        #Current Language in Default Language
        hudSubheader(getAllPlayers(), CurrentLanguageArray[DefaultLanguage][localPlayer.PlayerLanguage], HudPosition.TOP, 24, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    
    #Scrimmie! Banner
    if createWorkshopSetting(bool, "3. Help HUD", "Show Scrimmie Banner", true, 0) == true:
        hudSubheader(getAllPlayers(), LanguageArray[7][localPlayer.PlayerLanguage], HudPosition.LEFT, 0, rgb(191, 101, 221), HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        hudSubheader(getAllPlayers(), "workshop.codes/scrimmie", HudPosition.LEFT, 0.1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        hudSubheader(getAllPlayers(), "{0}: Y2TXE".format(LanguageArray[12][localPlayer.PlayerLanguage]), HudPosition.LEFT, 0.2, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    if DevMode == true:
        #Developer Mode
        hudSubtext(getAllPlayers(), "{0} DEVELOPER MODE ENABLED {1}".format(iconString(Icon.WARNING), iconString(Icon.WARNING)), HudPosition.TOP, 25, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #DEBUG - Set Timer to 10s
        hudSubheader(getAllPlayers(), "Press {0}: Set timer to 10 seconds".format(buttonString(Button.INTERACT)), HudPosition.RIGHT, 28, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    InfoDrawn = true
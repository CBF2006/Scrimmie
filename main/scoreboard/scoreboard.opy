#!mainFile "../main.opy"

rule "Dynamic Scoreboard  - Legend":
    @Condition DrawScoreboard == true
    
    #Separate Teams
    if ScoreboardLayout == 0:
        #Large Scoreboard
        if Scoreboard_Size == 0:
            #Team 1
            hudSubtext(null, "DD - DT - FB - D - HD - UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Team 2
            hudSubtext(null, "DD - DT - FB - D - HD - UU", HudPosition.RIGHT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Small Scoreboard
        elif Scoreboard_Size == 1:
            #Team 1
            hudSubheader(null, "DD - DT - FB - D - HD - UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Team 2
            hudSubheader(null, "DD - DT - FB - D - HD - UU", HudPosition.RIGHT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #Group Teams
    elif ScoreboardLayout == 1:
        #Large Scoreboard
        if Scoreboard_Size == 0:
            #Team 1
            hudSubtext(null, "DD - DT - FB - D - HD - UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Small Scoreboard
        elif Scoreboard_Size == 1:
            #Team 1
            hudSubheader(null, "DD - DT - FB - D - HD - UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)


rule "Dynamic Scoreboard - Combine Teams":
    @Event eachPlayer
    @Condition DrawScoreboard == true
    @Condition ScoreboardLayout == 0
    
    if Scoreboard_Size == 0:
        if eventPlayer.getTeam() == Team.1:
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, eventPlayer.getSlot() + 2, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        elif eventPlayer.getTeam() == Team.2:
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.RIGHT, eventPlayer.getSlot() + 2, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    elif Scoreboard_Size == 1:
        if eventPlayer.getTeam() == Team.1:
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        elif eventPlayer.getTeam() == Team.2:
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.RIGHT, 2 + eventPlayer.getSlot(), Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)


rule "Dynamic Scoreboard - Combine Teams (By Slot for Now)":
    @Event eachPlayer
    @Condition DrawScoreboard == true
    @Condition ScoreboardLayout == 1
    
    #"By Team"
    if ScoreboardGrouping == 0:
        if Scoreboard_Size == 0:
            if eventPlayer.getTeam() == Team.1:
                hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, eventPlayer.getSlot() + 2, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            elif eventPlayer.getTeam() == Team.2:
                hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, eventPlayer.getSlot() + 7, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        elif Scoreboard_Size == 1:
            if eventPlayer.getTeam() == Team.1:
                hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            elif eventPlayer.getTeam() == Team.2:
                hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 7 + eventPlayer.getSlot(), Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
#!mainFile "../main.opy"

rule "Dynamic Scoreboard  - Create Legend":
    @Condition DrawScoreboard == true
    @Condition ScoreboardLayout == 0
    
    #Separate Teams
    if ScoreboardGrouping == 0:
        #Large Scoreboard
        if Scoreboard_Size == 0:
            #Team 1
            hudSubtext(null, "DD • DT • FB • D • HD • UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Team 2
            hudSubtext(null, "DD • DT • FB • D • HD • UU", HudPosition.RIGHT, -13, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Small Scoreboard
        elif Scoreboard_Size == 1:
            #Team 1
            hudSubheader(null, "DD • DT • FB • D • HD • UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Team 2
            hudSubheader(null, "DD • DT • FB • D • HD • UU", HudPosition.RIGHT, -13, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    #Combine Teams
    elif ScoreboardGrouping == 1:
        #Large Scoreboard
        if Scoreboard_Size == 0:
            #Team 1
            hudSubtext(null, "DD • DT • FB • D • HD • UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            #Small Scoreboard
        elif Scoreboard_Size == 1:
            #Team 1
            hudSubheader(null, "DD • DT • FB • D • HD • UU", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)


rule "Dynamic Scoreboard - Separate Teams":
    @Event eachPlayer
    @Condition DrawScoreboard == true
    @Condition ScoreboardLayout == 0
    @Condition ScoreboardGrouping == 0
    
    if Scoreboard_Size == 0:
        if eventPlayer.getTeam() == Team.1:
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, eventPlayer.getSlot() + 2, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        elif eventPlayer.getTeam() == Team.2:
            hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.RIGHT, eventPlayer.getSlot() - 12, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    elif Scoreboard_Size == 1:
        if eventPlayer.getTeam() == Team.1:
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        elif eventPlayer.getTeam() == Team.2:
            hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.RIGHT, eventPlayer.getSlot() - 12, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)


rule "Dynamic Scoreboard - Combine Teams (By Slot for Now)":
    @Event eachPlayer
    @Condition DrawScoreboard == true
    @Condition ScoreboardLayout == 0
    @Condition ScoreboardGrouping == 1
    
    #"By Team"
    if ScoreboardGrouping == 1:
        if Scoreboard_Size == 0:
            if eventPlayer.getTeam() == Team.1:
                hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, eventPlayer.getSlot() + 2, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            elif eventPlayer.getTeam() == Team.2:
                hudSubtext(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(getPlayersInSlot(0, Team.1).getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, eventPlayer.getSlot() + 13, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        elif Scoreboard_Size == 1:
            if eventPlayer.getTeam() == Team.1:
                hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
            elif eventPlayer.getTeam() == Team.2:
                hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 13 + eventPlayer.getSlot(), Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
        #hudSubheader(null, "{0}  {1} - {2}".format(heroIcon(eventPlayer.getCurrentHero()), ceil(eventPlayer.getStatistic(Stat.BARRIER_DAMAGE_DEALT) + eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT)), "{0} - {1} - {2}".format(ceil(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), eventPlayer.getStatistic(Stat.FINAL_BLOWS), "{0} - {1} - {2}".format(eventPlayer.getStatistic(Stat.DEATHS), ceil(eventPlayer.getStatistic(Stat.HEALING_DEALT)), "{0}  {1} {2}".format(eventPlayer.getStatistic(Stat.ULTIMATES_USED), abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_2) if eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0 else "", abilityIconString(eventPlayer.getCurrentHero(), Button.ABILITY_1) if eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0 else "")))), HudPosition.LEFT, 2 + eventPlayer.getSlot(), Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

# ScrimTime A

rule "Scoreboard A (Standard): Create Legend":
    @Condition isGameInProgress() == true
    @Condition DrawScoreboard == true
    @Condition ScoreboardLayout == 1
    
    wait()
    if ScoreboardGrouping == 0:
        if Scoreboard_Size == 0:
            # Left Side
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), "K • D • DD • DT • ACC • UU"), HudPosition.LEFT, 1, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.REINHARDT, Button.SECONDARY_FIRE), "K • D • DD • DT • DB • UU"), HudPosition.LEFT, 2, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_1), "K • D • DD • DT • HD • UU"), HudPosition.LEFT, 3, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            # Right Side
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), "K • D • DD • DT • ACC • UU"), HudPosition.RIGHT, 1, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.REINHARDT, Button.SECONDARY_FIRE), "K • D • DD • DT • DB • UU"), HudPosition.LEFT, 2, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_1), "K • D • DD • DT • HD • UU"), HudPosition.RIGHT, 3, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
        elif Scoreboard_Size == 1:
            # Left Side
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), "K • D • DD • DT • ACC • UU"), HudPosition.LEFT, 1, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.REINHARDT, Button.SECONDARY_FIRE), "K • D • DD • DT • DB • UU"), HudPosition.LEFT, 2, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_1), "K • D • DD • DT • HD • UU"), HudPosition.LEFT, 3, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            # Right Side
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), "K • D • DD • DT • ACC • UU"), HudPosition.RIGHT, 1, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.REINHARDT, Button.SECONDARY_FIRE), "K • D • DD • DT • DB • UU"), HudPosition.RIGHT, 2, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_1), "K • D • DD • DT • HD • UU"), HudPosition.RIGHT, 3, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)

    elif ScoreboardGrouping == 1:
        if Scoreboard_Size == 0:
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), "K • D • DD • DT • ACC • UU"), HudPosition.LEFT, 1, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.REINHARDT, Button.SECONDARY_FIRE), "K • D • DD • DT • DB • UU"), HudPosition.LEFT, 2, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubtext(null, "{0} {1}".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_1), "K • D • DD • DT • HD • UU"), HudPosition.LEFT, 3, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
        elif Scoreboard_Size == 1:
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.GENJI, Button.ULTIMATE), "K • D • DD • DT • ACC • UU"), HudPosition.LEFT, 1, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.REINHARDT, Button.SECONDARY_FIRE), "K • D • DD • DT • DB • UU"), HudPosition.LEFT, 2, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)
            hudSubheader(null, "{0} {1}".format(abilityIconString(Hero.BAPTISTE, Button.ABILITY_1), "K • D • DD • DT • HD • UU"), HudPosition.LEFT, 3, Color.WHITE, HudReeval.NONE, SpecVisibility.ALWAYS)


rule "Scoreboard A (Standard): Create Player Entries (Large)":
    @Event eachPlayer
    @Condition isGameInProgress() == true
    @Condition DrawScoreboard == true
    @Condition Scoreboard_Size == 0
    @Condition ScoreboardLayout == 1
    
    wait()
    if ScoreboardGrouping == 0:
        if eventPlayer.getTeam() == Team.1:
            hudSubtext(null, "{0} {1} • {2}".format(heroIcon(eventPlayer.getCurrentHero()), "{0} • {1} • {2}".format(eventPlayer.getStatistic(Stat.FINAL_BLOWS), eventPlayer.getStatistic(Stat.DEATHS), round(eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT))), "{0} • {1} • {2}".format(round(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), round(eventPlayer.getStatistic(Stat.DAMAGE_BLOCKED)) if eventPlayer.getCurrentHero() in getTankHeroes() else round(eventPlayer.getStatistic(Stat.HEALING_DEALT)) if eventPlayer.getCurrentHero() in getSupportHeroes() else "{0}%".format(round(eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY) * 100)), eventPlayer.getStatistic(Stat.ULTIMATES_USED))), HudPosition.LEFT, (1 if eventPlayer.getCurrentHero() in getDamageHeroes() else 2 if eventPlayer.getCurrentHero() in getTankHeroes() else 3) + (0.1 if eventPlayer.getTeam() == Team.1 else 0.2), Color.TEAM_1 if eventPlayer.getTeam() == Team.1 else Color.TEAM_2, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
        elif eventPlayer.getTeam() == Team.2:
            hudSubtext(null, "{0} {1} • {2}".format(heroIcon(eventPlayer.getCurrentHero()), "{0} • {1} • {2}".format(eventPlayer.getStatistic(Stat.FINAL_BLOWS), eventPlayer.getStatistic(Stat.DEATHS), round(eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT))), "{0} • {1} • {2}".format(round(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), round(eventPlayer.getStatistic(Stat.DAMAGE_BLOCKED)) if eventPlayer.getCurrentHero() in getTankHeroes() else round(eventPlayer.getStatistic(Stat.HEALING_DEALT)) if eventPlayer.getCurrentHero() in getSupportHeroes() else "{0}%".format(round(eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY) * 100)), eventPlayer.getStatistic(Stat.ULTIMATES_USED))), HudPosition.RIGHT, (1 if eventPlayer.getCurrentHero() in getDamageHeroes() else 2 if eventPlayer.getCurrentHero() in getTankHeroes() else 3) + (0.1 if eventPlayer.getTeam() == Team.1 else 0.2), Color.TEAM_1 if eventPlayer.getTeam() == Team.1 else Color.TEAM_2, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
    else:
        hudSubtext(null, "{0} {1} • {2}".format(heroIcon(eventPlayer.getCurrentHero()), "{0} • {1} • {2}".format(eventPlayer.getStatistic(Stat.FINAL_BLOWS), eventPlayer.getStatistic(Stat.DEATHS), round(eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT))), "{0} • {1} • {2}".format(round(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), round(eventPlayer.getStatistic(Stat.DAMAGE_BLOCKED)) if eventPlayer.getCurrentHero() in getTankHeroes() else round(eventPlayer.getStatistic(Stat.HEALING_DEALT)) if eventPlayer.getCurrentHero() in getSupportHeroes() else "{0}%".format(round(eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY) * 100)), eventPlayer.getStatistic(Stat.ULTIMATES_USED))), HudPosition.LEFT, (1 if eventPlayer.getCurrentHero() in getDamageHeroes() else 2 if eventPlayer.getCurrentHero() in getTankHeroes() else 3) + (0.1 if eventPlayer.getTeam() == Team.1 else 0.2), Color.TEAM_1 if eventPlayer.getTeam() == Team.1 else Color.TEAM_2, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
    

rule "Scoreboard A (Standard): Create Player Entries (Small)":
    @Event eachPlayer
    @Condition isGameInProgress() == true
    @Condition DrawScoreboard == true
    @Condition Scoreboard_Size == 1
    @Condition ScoreboardLayout == 1
    
    wait()
    if ScoreboardGrouping == 0:
        if eventPlayer.getTeam() == Team.1:
            hudSubheader(null, "{0} {1} • {2}".format(heroIcon(eventPlayer.getCurrentHero()), "{0} • {1} • {2}".format(eventPlayer.getStatistic(Stat.FINAL_BLOWS), eventPlayer.getStatistic(Stat.DEATHS), round(eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT))), "{0} • {1} • {2}".format(round(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), round(eventPlayer.getStatistic(Stat.DAMAGE_BLOCKED)) if eventPlayer.getCurrentHero() in getTankHeroes() else round(eventPlayer.getStatistic(Stat.HEALING_DEALT)) if eventPlayer.getCurrentHero() in getSupportHeroes() else "{0}%".format(round(eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY) * 100)), eventPlayer.getStatistic(Stat.ULTIMATES_USED))), HudPosition.LEFT, (1 if eventPlayer.getCurrentHero() in getDamageHeroes() else 2 if eventPlayer.getCurrentHero() in getTankHeroes() else 3) + (0.1 if eventPlayer.getTeam() == Team.1 else 0.2), Color.TEAM_1 if eventPlayer.getTeam() == Team.1 else Color.TEAM_2, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
        elif eventPlayer.getTeam() == Team.2:
            hudSubheader(null, "{0} {1} • {2}".format(heroIcon(eventPlayer.getCurrentHero()), "{0} • {1} • {2}".format(eventPlayer.getStatistic(Stat.FINAL_BLOWS), eventPlayer.getStatistic(Stat.DEATHS), round(eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT))), "{0} • {1} • {2}".format(round(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), round(eventPlayer.getStatistic(Stat.DAMAGE_BLOCKED)) if eventPlayer.getCurrentHero() in getTankHeroes() else round(eventPlayer.getStatistic(Stat.HEALING_DEALT)) if eventPlayer.getCurrentHero() in getSupportHeroes() else "{0}%".format(round(eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY) * 100)), eventPlayer.getStatistic(Stat.ULTIMATES_USED))), HudPosition.RIGHT, (1 if eventPlayer.getCurrentHero() in getDamageHeroes() else 2 if eventPlayer.getCurrentHero() in getTankHeroes() else 3) + (0.1 if eventPlayer.getTeam() == Team.1 else 0.2), Color.TEAM_1 if eventPlayer.getTeam() == Team.1 else Color.TEAM_2, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
    else:
        hudSubheader(null, "{0} {1} • {2}".format(heroIcon(eventPlayer.getCurrentHero()), "{0} • {1} • {2}".format(eventPlayer.getStatistic(Stat.FINAL_BLOWS), eventPlayer.getStatistic(Stat.DEATHS), round(eventPlayer.getStatistic(Stat.HERO_DAMAGE_DEALT))), "{0} • {1} • {2}".format(round(eventPlayer.getStatistic(Stat.DAMAGE_TAKEN)), round(eventPlayer.getStatistic(Stat.DAMAGE_BLOCKED)) if eventPlayer.getCurrentHero() in getTankHeroes() else round(eventPlayer.getStatistic(Stat.HEALING_DEALT)) if eventPlayer.getCurrentHero() in getSupportHeroes() else "{0}%".format(round(eventPlayer.getHeroStatistic(eventPlayer.getCurrentHero(), HeroStat.WEAPON_ACCURACY) * 100)), eventPlayer.getStatistic(Stat.ULTIMATES_USED))), HudPosition.LEFT, (1 if eventPlayer.getCurrentHero() in getDamageHeroes() else 2 if eventPlayer.getCurrentHero() in getTankHeroes() else 3) + (0.1 if eventPlayer.getTeam() == Team.1 else 0.2), Color.TEAM_1 if eventPlayer.getTeam() == Team.1 else Color.TEAM_2, HudReeval.SORT_ORDER_AND_STRING, SpecVisibility.ALWAYS)
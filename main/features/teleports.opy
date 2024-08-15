#!mainFile "../main.opy"

rule "Defense Map Teleport":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition isTeamOnDefense(eventPlayer.getTeam()) == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition createWorkshopSetting(bool, "2. Setup Phase", "Allow Defenders to Teleport to Objective", true, 3)
    
    switch getCurrentMap():
        case Map.BLIZZ_WORLD:
            eventPlayer.teleport(vect(-8.171, 3.824, 65.861))
            break
        case Map.EICHENWALDE:
            eventPlayer.teleport(vect(13.226, 12.981, -83.655))
            break
        case Map.HOLLYWOOD:
            eventPlayer.teleport(vect(-19.248, 8.007, -9.802))
            break
        case Map.KINGS_ROW:
            eventPlayer.teleport(vect(-37.185, 10.346, -15.058))
            break
        case Map.NUMBANI:
            eventPlayer.teleport(vect(93.044, 5.53, -22.723))
            break
        case Map.HANAMURA:
            eventPlayer.teleport(vect(13.079, 1.346, -24.267))
            break
        case Map.HORIZON_LUNAR_COLONY:
            eventPlayer.teleport(vect(42.356, 15.84, -79.798))
            break
        case Map.PARIS:
            eventPlayer.teleport(vect(-40.379, 16.5, -14.259))
            break
        case Map.TEMPLE_OF_ANUBIS:
            eventPlayer.teleport(vect(-23.909, 3.312, 46.94))
            break
        case Map.VOLSKAYA:
            eventPlayer.teleport(vect(-35.545, -1.433, 73.561))
            break
        case Map.DORADO:
            eventPlayer.teleport(vect(57.088, 9.241, -16.884))
            break
        case Map.HAVANA:
            eventPlayer.teleport(vect(-18.059, 9.184, -70.117))
            break
        case Map.JUNKERTOWN:
            eventPlayer.teleport(vect(-28.382, 14.223, -68.289))
            break
        case Map.RIALTO:
            eventPlayer.teleport(vect(55.603, 2.452, -44.947))
            break
        case Map.ROUTE66:
            eventPlayer.teleport(vect(33.662, 10.325, -5.514))
            break
        case Map.WATCHPOINT_GIBRALTAR:
            eventPlayer.teleport(vect(32.488, 4.692, -71.941))
            break
        case Map.SHAMBALI_MONASTERY:
            eventPlayer.teleport(vect(5.48, 14, 60.54))
            break
        case Map.PARAISO:
            eventPlayer.teleport(vect(-34.65, 6, -13.85))
            break
        case Map.CIRCUIT_ROYAL:
            eventPlayer.teleport(vect(-21.96, 11, -6.56))
            break
        case Map.MIDTOWN:
            eventPlayer.teleport(vect(10.27, 3.75, 48.46))
            break
        case Map.BLIZZ_WORLD_WINTER:
            eventPlayer.teleport(vect(-8.171, 3.824, 65.861))
            break
        case Map.EICHENWALDE_HALLOWEEN:
            eventPlayer.teleport(vect(13.226, 12.981, -83.655))
            break
        case Map.HOLLYWOOD_HALLOWEEN:
            eventPlayer.teleport(vect(-19.248, 8.007, -9.802))
            break
        case Map.KINGS_ROW_WINTER:
            eventPlayer.teleport(vect(-37.185, 10.346, -15.058))
            break
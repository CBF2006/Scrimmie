#!mainFile "../main.opy"

rule "[features/teleports.opy] Defense Map Teleport":
    @Event eachPlayer
    @Condition isInSetup() == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition isTeamOnDefense(eventPlayer.getTeam()) == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getCurrentHero() == true
    @Condition createWorkshopSetting(bool, "2. Setup Phase", "Allow Defenders to Teleport to Objective", true, 4)
    
    Teleport_Coordinate = {
        0: getObjectivePosition(getCurrentObjective()),
        Map.BLIZZ_WORLD: vect(-8.171, 3.824, 65.861),
        Map.EICHENWALDE: vect(13.226, 12.981, -83.655),
        Map.HOLLYWOOD: vect(-19.248, 8.007, -9.802),
        Map.KINGS_ROW: vect(-37.185, 10.346, -15.058),
        Map.NUMBANI: vect(93.044, 5.53, -22.723),
        Map.HANAMURA: vect(13.079, 1.346, -24.267),
        Map.HORIZON_LUNAR_COLONY: vect(42.356, 15.84, -79.798),
        Map.PARIS: vect(-40.379, 16.5, -14.259),
        Map.TEMPLE_OF_ANUBIS: vect(-23.909, 3.312, 46.94),
        Map.VOLSKAYA: vect(-35.545, -1.433, 73.561),
        Map.DORADO: vect(57.088, 9.241, -16.884),
        Map.HAVANA: vect(-18.059, 9.184, -70.117),
        Map.JUNKERTOWN: vect(-28.382, 14.223, -68.289),
        Map.RIALTO: vect(55.603, 2.452, -44.947),
        Map.ROUTE66: vect(33.662, 10.325, -5.514),
        Map.WATCHPOINT_GIBRALTAR: vect(32.488, 4.692, -71.941),
        Map.SHAMBALI_MONASTERY: vect(5.48, 14, 60.54),
        Map.PARAISO: vect(-34.65, 6, -13.85),
        Map.CIRCUIT_ROYAL: vect(-21.96, 11, -6.56),
        Map.MIDTOWN: vect(10.27, 3.75, 48.46),
        Map.BLIZZ_WORLD_WINTER: vect(-8.171, 3.824, 65.861),
        Map.EICHENWALDE_HALLOWEEN: vect(13.226, 12.981, -83.655),
        Map.HOLLYWOOD_HALLOWEEN: vect(-19.248, 8.007, -9.802),
        Map.KINGS_ROW_WINTER: vect(-37.185, 10.346, -15.058)
    }[getCurrentMap()]

    eventPlayer.teleport(nearestWalkablePosition(Teleport_Coordinate))
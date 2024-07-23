#!mainFile "../main.opy"

rule "DC Value Tracking - Team 1":
    @Event eachPlayer
    @Team 1
    @Condition isGameInProgress() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition AllowDCResume == true
    
    wait(1)
    PlayerDCInfoTeam1()
    if RULE_CONDITION:
        goto RULE_START


def PlayerDCInfoTeam1():
    @Name "DC Value Tracking - Team 1 Subroutine"
    
    if eventPlayer.hasSpawned():
        if ShouldRestore[eventPlayer.getSlot()] >= 0:
            if eventPlayer.isAlive():
                UltCharges[eventPlayer.getSlot()] = eventPlayer.getUltCharge()
                Heroes[eventPlayer.getSlot()] = eventPlayer.getCurrentHero()
                Positions[eventPlayer.getSlot()] = eventPlayer.getPosition()
                Cooldowns1[eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
                Cooldowns2[eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
                DVaRestore[eventPlayer.getSlot()] = (eventPlayer.getUltCharge() if eventPlayer.getMaxHealth() > 200 else DVaRestore[eventPlayer.getSlot()]) if eventPlayer.getCurrentHero() == Hero.DVA else -1
                ShouldRestore[eventPlayer.getSlot()] = eventPlayer.getNormalizedHealth()
            else:
                ShouldRestore[eventPlayer.getSlot()] = 0


rule "DC Value Tracking - Team 2":
    @Event eachPlayer
    @Team 2
    @Condition isGameInProgress() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition AllowDCResume == true
    
    wait(1)
    PlayerDCInfoTeam2()
    if RULE_CONDITION:
        goto RULE_START


def PlayerDCInfoTeam2():
    @Name "DC Value Tracking - Team 2 Subroutine"
    
    if eventPlayer.hasSpawned():
        if ShouldRestore[5 + eventPlayer.getSlot()] >= 0:
            if eventPlayer.isAlive():
                UltCharges[5 + eventPlayer.getSlot()] = eventPlayer.getUltCharge()
                Heroes[5 + eventPlayer.getSlot()] = eventPlayer.getCurrentHero()
                Positions[5 + eventPlayer.getSlot()] = eventPlayer.getPosition()
                Cooldowns1[5 + eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
                Cooldowns2[5 + eventPlayer.getSlot()] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
                DVaRestore[5 + eventPlayer.getSlot()] = eventPlayer.getMaxHealth()
                DVaRestore[5 + eventPlayer.getSlot()] = (eventPlayer.getUltCharge() if eventPlayer.getMaxHealth() > 200 else DVaRestore[5 + eventPlayer.getSlot()]) if eventPlayer.getCurrentHero() == Hero.DVA else -1
                ShouldRestore[5 + eventPlayer.getSlot()] = eventPlayer.getNormalizedHealth()
            else:
                ShouldRestore[5 + eventPlayer.getSlot()] = 0


rule "Player Reconnected - Team 1":
    @Event playerJoined
    @Team 1
    @Condition isGameInProgress() == true
    @Condition AllowDCResume == true
    
    waitUntil(eventPlayer.hasSpawned(), 10)
    wait(0.1)
    if eventPlayer.getCurrentHero() == Heroes[eventPlayer.getSlot()]:
        eventPlayer.setUltCharge(UltCharges[eventPlayer.getSlot()])
        if ShouldRestore[eventPlayer.getSlot()] > 0:
            ShouldRestore[eventPlayer.getSlot()] = 0 - ShouldRestore[eventPlayer.getSlot()]
            eventPlayer.startForcingPosition(Positions[eventPlayer.getSlot()], false)
            wait(0.1)
            eventPlayer.stopForcingPosition()
            PlayerDCDvaTeam1()
            eventPlayer.setHealth((0 - ShouldRestore[eventPlayer.getSlot()]) * eventPlayer.getMaxHealth())
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, Cooldowns1[eventPlayer.getSlot()])
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, Cooldowns2[eventPlayer.getSlot()])
            ShouldRestore[eventPlayer.getSlot()] = 0 - ShouldRestore[eventPlayer.getSlot()]


rule "Player Reconnected - Team 2":
    @Event playerJoined
    @Team 2
    @Condition isGameInProgress() == true
    @Condition AllowDCResume == true
    
    waitUntil(eventPlayer.hasSpawned(), 10)
    wait(0.1)
    if eventPlayer.getCurrentHero() == Heroes[getNumberOfSlots(Team.1) + eventPlayer.getSlot()]:
        eventPlayer.setUltCharge(UltCharges[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])
        if ShouldRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()] > 0:
            ShouldRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()] = 0 - (ShouldRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])
            eventPlayer.startForcingPosition(Positions[getNumberOfSlots(Team.1) + eventPlayer.getSlot()], false)
            wait(0.1)
            eventPlayer.stopForcingPosition()
            PlayerDCDvaTeam2()
            eventPlayer.setHealth((0 - (ShouldRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])) * eventPlayer.getMaxHealth())
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, Cooldowns1[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, Cooldowns2[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])
            ShouldRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()] = 0 - (ShouldRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])


def PlayerDCDvaTeam1():
    @Name "Player Reconnected - Team 1 DVa"
    
    if eventPlayer.getCurrentHero() == Hero.DVA:
        if DVaRestore[eventPlayer.getSlot()] >= 0:
            eventPlayer.setUltCharge(DVaRestore[eventPlayer.getSlot()])
            wait(0.1)
            damage(eventPlayer, null, 1000)
            wait(1.6)
            eventPlayer.setUltCharge(UltCharges[eventPlayer.getSlot()])


def PlayerDCDvaTeam2():
    @Name "Player Reconnected - Team 2 DVa"
    
    if eventPlayer.getCurrentHero() == Hero.DVA:
        if DVaRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()] >= 0:
            eventPlayer.setUltCharge(DVaRestore[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])
            wait(0.1)
            damage(eventPlayer, null, 1000)
            wait(1.6)
            eventPlayer.setUltCharge(UltCharges[getNumberOfSlots(Team.1) + eventPlayer.getSlot()])
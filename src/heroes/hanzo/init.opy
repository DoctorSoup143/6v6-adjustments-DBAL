#!mainFile "../../dev_main.opy"


def initHanzo():
    @Name "[hanzo/init.opy]: initHanzo()"
    
    setCustomHp(ADJ_HANZO_HEALTH, 0, 0)
    setUltCost(ADJ_HANZO_ULT_COST)
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_HANZO_STORM_DAMAGE/OW2_HANZO_STORM_DAMAGE)

    eventPlayer.hero_initialized = true


rule "[hanzo/init.opy]: Correct Hanzo melee damage":
    @Event playerDealtDamage
    @Hero hanzo
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[hanzo/init.opy]: Correct Storm Bow, Sonic Arrow damage":
    @Event playerDealtDamage
    @Hero hanzo
    @Condition eventAbility in [Button.PRIMARY_FIRE, Button.ABILITY_1]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_HANZO_ARROW_DAMAGE / OW2_HANZO_ARROW_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)

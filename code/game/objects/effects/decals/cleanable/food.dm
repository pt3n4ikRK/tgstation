
/obj/effect/decal/cleanable/food
	icon = 'icons/effects/tomatodecal.dmi'
	gender = NEUTER
	beauty = -100

/obj/effect/decal/cleanable/food/tomato_smudge
	name = "Томатна пляма"
	desc = "Червона."
	icon_state = "tomato_floor1"
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")

/obj/effect/decal/cleanable/food/plant_smudge
	name = "Рослинні залишки"
	desc = "Хлорофіл? Радше нуднофіл!"
	icon_state = "smashed_plant"

/obj/effect/decal/cleanable/food/egg_smudge
	name = "Розбите яйце"
	desc = "Схоже, це курча не вилупиться."
	icon_state = "smashed_egg1"
	random_icon_states = list("smashed_egg1", "smashed_egg2", "smashed_egg3")

/obj/effect/decal/cleanable/food/pie_smudge //honk
	name = "Розчавлений пиріг"
	desc = "Пиріжний крем з кремового пирога."
	icon_state = "smashed_pie"

/obj/effect/decal/cleanable/food/salt
	name = "Купа солі"
	desc = "Чимала купа столової солі. Скоро хтось посвариться."
	icon_state = "salt_pile"
	var/safepasses = 3 //how many times can this salt pile be passed before dissipating

/obj/effect/decal/cleanable/food/salt/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(is_species(mover, /datum/species/snail))
		return FALSE

/obj/effect/decal/cleanable/food/salt/Bumped(atom/movable/AM)
	. = ..()
	if(is_species(AM, /datum/species/snail))
		to_chat(AM, span_danger("Your path is obstructed by [span_phobia("salt")]."))

/obj/effect/decal/cleanable/food/salt/on_entered(datum/source, atom/movable/AM)
	. = ..()
	if(!isliving(AM))
		return
	if(iscarbon(AM))
		var/mob/living/carbon/C = AM
		if(C.move_intent == MOVE_INTENT_WALK)
			return
	safepasses--
	if(safepasses <= 0 && !QDELETED(src))
		qdel(src)

/obj/effect/decal/cleanable/food/flour
	name = "Борошно"
	desc = "Досі можна використовувати. Правило чотирьох секунд!"
	icon_state = "flour"

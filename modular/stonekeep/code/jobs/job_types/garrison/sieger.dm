/datum/job/stonekeep/sieger
	title = "Custodian Engineer"
	flag = SK_SIEGER
	department_flag = GARRISON
	total_positions = 1
	spawn_positions = 1
	faction = FACTION_STATION
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Changeling",
		"Skylancer",
		"Ogrun",
		"Undine",
		"Elf",
		"Half-Elf",
		"Dwarf"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "You are a foreign unit of Custodian's retinue whom takes mathematics to terms absolute \
	to repel away the threat of the greater powers on the snap of a rope. \
	You've been hired by Rockhill to ensure that their walls will stand as the \
	walls of others crumble, and by the divines above, you know how far walls can go both ways."
	give_bank_account = 30
	min_pq = 0
	selection_color = "#920909"
	outfit = /datum/outfit/job/stonekeep/garrison/sieger
	display_order = SIEGER_ORDER

	cmode_music = 'sound/music/cmode/nobility/CombatKnight.ogg' //going to change for another one.

/datum/outfit/job/stonekeep/garrison/sieger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/skullcap //More of a 'Engineer hat'-themed thing. NECESSARY. The siege machine has a 'falling debris' system
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/axe/adze
	neck = /obj/item/storage/belt/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/leather/abyssal
	cloak = /obj/item/clothing/cloak/apron/brown
	shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt1 // Recognition sake.
	pants = /obj/item/clothing/pants/trou/tobi/random
	armor = /obj/item/clothing/armor/leather/splint/battlecoat // Recognition sake.

	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/flint = 1, /obj/item/natural/bundle/stoneblock/four = 1) //WIP. add siege machine crafter here.

	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE) //You are Garrison, you are a Sapper type of unit. Wielding axes should be a norm. Can be decreased to 2 later.
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) //You're more combat-oriented than most 'working' roles, plus, your work is exhausting.
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, pick(0,0,1), TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE) //You are not the best at warfare.
		H.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2,2), TRUE)
		H.adjust_skillrank(/datum/skill/craft/carpentry, pick(1,1,2), TRUE) // You require some carpentry.
		H.adjust_skillrank(/datum/skill/craft/carpentry, pick(1,1,2), TRUE) // Part of your duty.
		H.adjust_skillrank(/datum/skill/craft/engineering, 4, TRUE) // Require to create bombs, catapults, etc. Your true MAIN thing.
		H.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE) // For craftable beartraps
		H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE) // You know math, so you should be >WELL< literate.
		H.adjust_skillrank(/datum/skill/misc/sewing, pick(1,1,2), TRUE) //Rope making. Unless that's crafting, if so, decrease to 1 or zero.
		H.adjust_skillrank(/datum/skill/craft/smelting, 2, TRUE) //For making iron bars. You will need them. Hopefully this isn't a gamechanger, if it is, remove.
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2) // More endurance for the lack of 'malum fire' perk. If it isn't fair, tell me. (+0.5p)
		H.change_stat("constitution", 2) // More constitution because it makes /sense/ for someone that have to break down walls. Tell me if it isn't fair. (+0.5p)
		H.change_stat("speed", -1)
		// END and COST is valued as 0.5 points ; (+0.5p) + (+0.5p) = 1 additional point for the replacement of malum fire smiths usually have. Sieger is no smith.

#define TOOL_ADZE		"woodcarving"

/obj/item/weapon/axe/adze
	name = "custodian adze"
	desc = "A mixture between a demolition adze and a lip adze for wall breaking and fine carving alike. Destroyer and creator, brings fear to the very concept of space limitation."
	icon_state = "adze"
	icon = 'modular/stonekeep/kaizoku/icons/mapset/tradesector32.dmi'
	parrysound = "parrywood"
	force = DAMAGE_AXE
	force_wielded = DAMAGE_AXE_WIELD
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	max_blade_int = 500
	max_integrity = INTEGRITY_STRONGEST
	melting_material = /datum/material/steel
	melt_amount = 75
	resistance_flags = FIRE_PROOF
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	wdefense = AVERAGE_PARRY
	minstr = 6
	sellprice = 35
	axe_cut = 15 // Better than iron
	tool_behaviour = TOOL_ADZE

/obj/item/weapon/axe/adze/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
	return ..()

/datum/intent/axe/cut
	name = "cut"
	icon_state = "incut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	animname = "cut"
	penfactor = AP_AXE_CUT
	swingdelay = 0
	misscost = 5
	item_damage_type = "slash"

/obj/item/weapon/axe/adze/attack_turf(turf/T, mob/living/user)
	if(istype(T, /turf/closed/wall))
		var/turf/closed/wall/W = T
		var/bonus_damage = 50
		if(!user.incapacitated() && user.CanReach(T, src))
			user.do_attack_animation(W, used_item = src)

			W.take_damage(bonus_damage, BRUTE, "blunt", 0)

			visible_message("<span class='danger'>[W]'s surface cracks loudly from the impact!</span>")

			playsound(W, pick(
				'sound/combat/parry/shield/towershield (1).ogg',
				'sound/combat/parry/shield/towershield (2).ogg',
				'sound/combat/parry/shield/towershield (3).ogg'), 50, TRUE)
			if(prob(33))
				var/datum/effect_system/spark_spread/S = new()
				var/turf/front = get_step(user, user.dir)
				S.set_up(1, 1, front)
				S.start()

			return TRUE
	return ..()
/*
/obj/item/roguemachine/siegebuilder
	name = "siege workspace"
	desc = "A portable assembly used by siege engineers to quickly deploy and build siege weapons."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "mbox0"
	density = TRUE
	anchored = TRUE
	w_class = WEIGHT_CLASS_GIGANTIC
	blade_dulling = DULLING_BASH

/obj/item/roguemachine/siegebuilder/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/axe/adze))
		to_chat(user, span_notice("You begin breaking down the siege workspace..."))
		if(!do_after(user, 30))
			to_chat(user, span_warning("You stop dismantling midway."))
			return
		to_chat(user, span_notice("You break down the siege workspace for usable parts."))
		new /obj/item/grown/log/tree(get_turf(src))
		new /obj/item/ingot/iron(get_turf(src))
		qdel(src)
	else
		..()

/obj/item/roguemachine/siegebuilder/attack_hand(mob/user)
	if(!Adjacent(user))
		to_chat(user, span_warning("You're too far to use the siege workshop."))
		return

	var/list/options = list(
		// Assemblies
		"Catapult Assembly (1 Big Log)" = list(type = /obj/structure/siege/catapult/base, req = /obj/item/grown/log/tree, time = 30),
		"Hwacha Assembly (1 Big Log)" = list(type = /obj/structure/siege/hwancha/base, req = /obj/item/grown/log/tree, time = 40),

		// Ingredients
		"Make Launcher Arm (1 Big Log > 1 Rope)" = list(type = /obj/item/siege_part/launcher_arm, req = /obj/item/grown/log/tree, time = 25),
		"Make Wheel (1 Plank)" = list(type = /obj/item/siege_part/wheel, req = /obj/item/natural/bundle/plank, time = 15),
		"Make Tension (1 Rope > 1 Rope)" = list(type = /obj/item/siege_part/rope_tension, req = /obj/item/rope, time = 10),
		"Make Launch Pad (1 Plank)" = list(type = /obj/item/siege_part/launchpad, req = /obj/item/natural/bundle/plank, time = 10),
		"Make Iron Straps x3 (1 Iron)" = list(type = /obj/item/siege_part/iron_strap, req = /obj/item/ingot/iron, time = 25, amount = 3)
	)

	var/choice = input(user, "Choose what to build:") as null|anything in options
	if(!choice) return

	var/list/picked = options[choice]
	var/req_type = picked["req"]
	var/obj_type = picked["type"]
	var/build_time = picked["time"]
	var/amount = picked["amount"] || 1

	var/obj/item/I = user.get_active_held_item()
	if(!I || !istype(I, req_type))
		to_chat(user, span_warning("You need to hold a [initial(req_type)] in your active hand."))
		return

	to_chat(user, span_notice("You begin constructing the [choice]..."))
	if(!do_after(user, build_time))
		to_chat(user, span_warning("You failed to complete the construction."))
		return

	qdel(I)

	var/turf/T = get_turf(user)
	for(var/i in 1 to amount)
		var/obj/created = new obj_type(T)
		to_chat(user, span_notice("You successfully construct [created.name]!"))

/obj/structure/siege/catapult/base
	name = "Catapult Assembly Platform"
	desc = "A wooden frame used by siege engineers to assemble siege weapons. Insert parts in order."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "mbox0"
	anchored = TRUE
	density = TRUE
	var/step = 0
	var/finished = FALSE

/obj/structure/siege/catapult/base/attackby(obj/item/I, mob/user)
	if(finished)
		to_chat(user, "The catapult is already assembled.")
		return

	switch(step)
		if(0 to 1)
			if(istype(I, /obj/item/natural/bundle/plank))
				step++
				qdel(I)
				icon_state = "catapult_[step]"
				update_desc()
			else
				to_chat(user, "You require a large, uncut wooden log.")
		if(2)
			if(I.tool_behaviour == TOOL_ADZE)
				step++
				icon_state = "catapult_[step]"
				update_desc()
			else
				to_chat(user, "You must hammer the beams into place.")
		if(3)
			if(istype(I, /obj/item/ingot/iron))
				step++
				qdel(I)
				icon_state = "catapult_[step]"
				update_desc()
			else
				to_chat(user, "You need iron bars for reinforcement.")
		if(4)
			if(istype(I, /obj/item/siege_part/launcher_finished))
				step++
				qdel(I)
				icon_state = "catapult_[step]"
				update_desc()
			else
				to_chat(user, "You need a launcher arm.")
		if(5)
			if(I.tool_behaviour == TOOL_ADZE)
				finished = TRUE
				icon_state = "catapult_done"
				to_chat(user, "<span class='notice'>The catapult is complete!</span>")
				// Optionally spawn a usable catapult here
				update_desc()

/obj/structure/siege/catapult/base/proc/update_desc()
	switch(step)
		if(0 to 1) desc = "You need a large log. Current step: [step]."
		if(2) desc = "Use a adze to reinforce the beams."
		if(3) desc = "Insert iron bars."
		if(4) desc = "Attach the launcher arm."
		if(5) desc = "Hammer the launcher into place."
		else if(finished) desc = "The catapult is fully assembled and ready."

/obj/structure/siege/hwancha/base
	name = "Hwacha Assembly Platform"
	desc = "A sturdy frame used by siege engineers to assemble a hwacha, the terrifying arrow launcher."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "mbox0"
	anchored = TRUE
	density = TRUE
	var/step = 0
	var/finished = FALSE

/obj/structure/siege/hwancha/base/attackby(obj/item/I, mob/user)
	if(finished)
		to_chat(user, "The hwacha is already assembled.")
		return

	switch(step)
		if(0 to 1)
			if(istype(I, /obj/item/natural/bundle/plank))
				step++
				qdel(I)
				icon_state = "hwancha_[step]"
				update_desc()
			else
				to_chat(user, "You need a wood beam.")
		if(2)
			if(istype(I, /obj/item/siege_part/iron_strap))
				step++
				qdel(I)
				icon_state = "hwancha_[step]"
				update_desc()
			else
				to_chat(user, "You need iron straps for the wheel assembly.")
		if(3)
			if(I.tool_behaviour == TOOL_ADZE)
				step++
				icon_state = "hwancha_[step]"
				update_desc()
			else
				to_chat(user, "You must hammer the frame into shape.")
		if(4)
			if(istype(I, /obj/item/siege_part/launchpad))
				step++
				qdel(I)
				icon_state = "hwancha_[step]"
				update_desc()
			else
				to_chat(user, "You must place the hwacha launch pad.")
		if(5)
			if(I.tool_behaviour == TOOL_ADZE)
				finished = TRUE
				icon_state = "hwancha_done"
				to_chat(user, "<span class='notice'>The hwacha is complete!</span>")
				update_desc()

/obj/structure/siege/hwancha/base/proc/update_desc()
	switch(step)
		if(0 to 1) desc = "You need a wood beam. Current step: [step]."
		if(2) desc = "Insert an iron axle for wheel structure."
		if(3) desc = "Hammer the wood frame into final shape."
		if(4) desc = "Attach the hwacha launch pad."
		if(5) desc = "Secure the launch pad with a adze."
		else if(finished) desc = "The hwacha is fully assembled and ready to fire."

/obj/item/siege_part
	name = "You should not see this"
	desc = "You should not see this"
	icon = 'modular/stonekeep/kaizoku/icons/mapset/tradesector32.dmi'
	icon_state = "artisankit"

/obj/item/siege_part/launcher_arm
	name = "Unfinished launcher arm"
	desc = "The component of a catapult used to launch large projectiles. It requires rope tensions before becoming usable."
	icon_state = "artisankit"

/obj/item/siege_part/launcher_finished
	name = "launcher arm"
	desc = "The component of a catapult used to launch large projectiles with a tension rope below it."
	icon_state = "artisankit"

/obj/item/siege_part/wheel
	name = "Unfinished wheel"
	desc = "Essential for the mobility of many siege weapons that can be pulled or pushed. However, it needs sticks to be used as spokes."
	icon_state = "artisankit"

/obj/item/siege_part/wheel_finished
	name = "wooden wheel"
	desc = "Essential for the mobility of many siege weapons that can be pulled or pushed, with spokes connecting the wheel's rim to its central hub."
	icon_state = "artisankit"

/obj/item/siege_part/rope_tension
	name = "Unfinished rope tension"
	desc = "Part of a component for arbalests or catapults that requires tension. This need one more rope to be used as an auxiliary to reach that state."
	icon_state = "artisankit"

/obj/item/siege_part/rope_tension_finished
	name = "rope tension"
	desc = "Part of a component for arbalests or catapults that requires tension. These two ropes are meant to give tension to each other."
	icon_state = "artisankit"

// /obj/item/rope

/obj/item/siege_part/launchpad
	name = "launchpad"
	desc = "A solid square meant to withstand the force of repeated launches of blackpowder."
	icon_state = "artisankit"

/obj/item/siege_part/iron_strap
	name = "iron strap"
	desc = "Metal straps used to secure wooden assets firmly."
	icon_state = "artisankit"
*/

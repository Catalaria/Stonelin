/*
/datum/job/stonekeep/gladiator //They are, essentially, an almost barbarian version of the Dungeoneer.
	title = "Custodian Gladiator"
	tutorial = 	"Heartfelt is a nation of arts, and it bridges everything, even the justice system. \
	The lords wants justice without causing outcries as the victims calls for blood, and so, the gladiator follows, \
	serving the crown's law with bloodsport punishment as the last god a man will ever meet. \
	a judge and spectacle at once, Entertain the public, execute the unredeemable and safekeep the caged. You are the star of this show."
	flag = DUNGEONEER
	department_flag = GARRISON
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_SKDUNGEONEER
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	min_pq = 10

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Humen",
	"Changeling",
	"Skylancer",
	"Ogrun",
	"Elf",
	"Half-Elf",
	"Dark Elf",
	"Tiefling",
	"Dwarf"
	)
	//Every single race can be a Gladiator. If you can fight GOOD, you can join, you little social pariah.

	outfit = /datum/outfit/job/sk/garrison/gladiator
	give_bank_account = 50

	cmode_music = 'sound/music/cmode/nobility/CombatDungeoneer.ogg'

/datum/outfit/job/stonekeep/gladiator
	job_bitflag = BITFLAG_GARRISON

/datum/outfit/job/stonekeep/gladiator/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/storage/belt/pouch/coins/poor	// Small storage. N.
	shoes = /obj/item/clothing/shoes/simpleshoes
	wrists = /obj/item/clothing/wrists/bracers/leather
	cloak = /obj/item/clothing/cloak/stabard/dungeon
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/whip/antique
	beltl = /obj/item/storage/keyring/dungeoneer
	backr = /obj/item/storage/backpack/satchel	// lack of satchel requires dealing with the merchant to correct, which requires entering town; not ideal. N.

	//Retiarius; Polearm and a net. Only wrist-hand protection.
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	//Murmillo. Only wrist-hand protection, head protection.
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	//Scindere. Start without one arm, but that arm is BLADED. Careful about the unlimb perk. More armored than others.
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE) //maybe?
	//flagellarius. Don't actually exist, but here it will. It's the common flailer we know and love.
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)


	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) // Allow reading notes passed to the literate noble prisoner, or writing reports. N. See peasants\prisoner.dm.
	H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_INT, -2)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_PER, -1)
	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
	H.verbs |= /mob/living/carbon/human/proc/torture_victim

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)


/datum/advclass/sk/garrison/gladiator/murmillo
	name = "Fishman Murmillo"
	tutorial = "Agile and strong, yet with the worst sight of them all, the Murmillo have a large shield and a shortsword most well know on Heartfelt."
	outfit = /datum/outfit/job/sk/garrison/gladiator/murmillo
	category_tags = list(CTAG_SKGARRISON)
	allowed_races = list(
	"Humen",
	"Changeling",
	"Skylancer",
	"Ogrun",
	"Elf",
	"Half-Elf",
	"Dark Elf",
	"Tiefling",
	"Dwarf"
	)

/datum/outfit/job/sk/garrison/gladiator/murmillo/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/gorget/lazerrain
	head = /obj/item/clothing/head/helmet/heavy/gladiator/murmillo
	backr = /obj/item/weapon/shield/tower
	//leather waistline
	//shortsword
	//big wrist
	backpack_contents = list(/obj/item/storage/keyring/garrison)

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)

	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_SPD, -1)

//increase more stats on some other classes

// At first, this was supposed to be a Augmented limb. But since that'd break the modularization, I had to go autismo.
// That's why it is the only weapon that is related to unarmed skill. That's what it was supposed to be.

/obj/item/clothing/wrists/bracers/stonekeep/scissorblade
	name = "arbellas limb"
	desc = "The powerful limb of an arbellas attached to a semicircular blade usually used by cobblers, but the watchers always require a show, so a beating it is."
	icon_state = "arbellas"
	item_state = "arbellas"
	icon = 'modular/stonekeep/kaizoku/icons/clothingicon/wrists.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/icons/clothing/wrists.dmi'
	sleeved = 'modular/stonekeep/kaizoku/icons/clothing/wrists.dmi'
	body_parts_covered = ARMS|HANDS
	slot_flags = ITEM_SLOT_WRISTS
	force = 15
	throwforce = 10
	resistance_flags = FLAMMABLE
	fiber_salvage = FALSE
	anvilrepair = /datum/skill/craft/engineering
	smeltresult = /obj/item/ingot/steel

	var/obj/item/weapon/clobber/blade_presence
	var/switchhand = "right" // "right" or "left"

/obj/item/clothing/wrists/bracers/stonekeep/scissorblade/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/wrists/bracers/stonekeep/scissorblade/attack_right(mob/user)
	if(blade_presence)
		if(blade_presence.loc == user)
			blade_presence.forceMove(src)
			to_chat(user, "<span class='notice'>With a push of the thumb, the blade retracts inwards.</span>")
			blade_presence = null
		else
			to_chat(user, "<span class='warning'>You've lost your blade, and now, your limb is useless until repaired.</span>")
			qdel(blade_presence)
			blade_presence = null
		return

	var/obj/item/weapon/clobber/blade = new /obj/item/weapon/clobber(get_turf(user))
	blade.wrist_ref = src

	var/obj/item/target_hand = (switchhand == "right") ? user.get_active_held_item() : user.get_inactive_held_item()
	if(!target_hand)
		if(switchhand == "right")
			user.put_in_r_hand(blade)
		else
			user.put_in_l_hand(blade)
		to_chat(user, "<span class='combat'>You release the clobber's blade.</span>")
		blade_presence = blade
	else
		to_chat(user, "<span class='warning'>The [switchhand] hand is busy with something else.</span>")
		qdel(blade)

/obj/item/clothing/wrists/bracers/stonekeep/scissorblade/MiddleClick(mob/living/carbon/human/user)
	switchhand = (switchhand == "right") ? "left" : "right"
	to_chat(user, "<span class='notice'>You clamp the limb to your [switchhand] arm.</span>")

/obj/item/clothing/wrists/bracers/stonekeep/scissorblade/dropped(mob/living/user)
	. = ..()
	if(blade_presence && istype(blade_presence.loc, /mob))
		var/mob/living/M = blade_presence.loc
		if(blade_presence in M.contents)
			M.dropItemToGround(blade_presence)
	qdel(blade_presence)
	blade_presence = null

/obj/item/weapon/clobber
	name = "clobber tool"
	desc = "A retractable clobber tool. This one will surely punch deep holes into your victims."
	icon = 'modular/stonekeep/kaizoku/icons/weapons/32.dmi'
	icon_state = "kaiken"
	item_state = "kaiken"
	force = 20
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = CONDUCT_1
	associated_skill = /datum/skill/combat/knives
	hitsound = 'sound/combat/hits/bladed/genchop (2).ogg'
	var/obj/item/clothing/wrists/bracers/stonekeep/scissorblade/wrist_ref

/obj/item/weapon/clobber/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/weapon/clobber/dropped(mob/living/user)
	. = ..()
	if(wrist_ref && (!istype(wrist_ref.loc, /mob) || wrist_ref.loc != user))
		qdel(src)

/obj/item/clothing/head/helmet/heavy/gladiator
	name = "GLADIATOR HELMET TEMPLATE."
	desc = "You got the feeling this should not exist."
	icon_state = "murmillo"
	unequip_delay_self = 2 SECONDS
	smeltresult = /obj/item/ingot/iron //actually bronze, but whatever
	sellprice = VALUE_IRON_HELMET
	armor = ARMOR_BRIGANDINE
	body_parts_covered = FULL_HEAD
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG // no moving parts, essentially Iron.
	icon = 'modular/stonekeep/kaizoku/icons/clothingicon/head.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/icons/clothing/head64.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/helmet/heavy/gladiator/scindere
	name = "cleaver helmet"
	desc = "A narrow and vertical helmet with an exaggerated central ridge dividing the faceplate like a cauterized wound. 'The Cleaver'."
	icon_state = "scindere"

/obj/item/clothing/head/helmet/heavy/gladiator/murmillo
	name = "fishman helmet"
	desc = "A heavy bronze helm with a ridged fin and flanged visor that narrows the wearer's view. The user must only advance forward. 'The Fishman'."
	icon_state = "murmillo"

/obj/item/clothing/head/helmet/heavy/gladiator/flagellarius
	name = "torturer helmet"
	desc = "A low-domed war helm with a broad brim and a fixed, grinning mask. The underside makes the sounds of pain similar to laughter. 'The Torturer'."
	icon_state = "flagellarius"
*/

/datum/advclass/mercenary/sk/exiled
	name = "Exiled Warrior"
	tutorial = "A barbarian - you're a brute, and you're a long way from home. You took more of a liking to the blade than your elders wanted - in truth, they did not have to even deliberate to banish you. You will drown in ale, and your enemies in blood."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Rakshari",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/stonekeep/merc/exiled
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 0

	cmode_music = 'modular/stonekeep/sound/cmode/combat_steppe.ogg'

/datum/outfit/job/stonekeep/merc/exiled/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)	// Minimal armor, expected to have big sword.
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE) // Cut those trees #Morbiussweep
		H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE) // Valor pleases you, Crom.

	beltr = /obj/item/weapon/sword/iron
	neck = /obj/item/clothing/neck/coif
	pants = /obj/item/clothing/pants/loincloth
	gloves = /obj/item/clothing/gloves/leather
	belt = /obj/item/storage/belt/leather/mercenary
	beltl = /obj/item/weapon/mace/cudgel
	head = /obj/item/clothing/head/helmet/leather
	armor = /obj/item/clothing/armor/leather/hide
	shoes = /obj/item/clothing/shoes/boots/leather
	wrists = /obj/item/clothing/wrists/bracers/leather
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor)

	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -1) // fat fuck
	H.change_stat("intelligence", 1) // Conan! What is best in life?
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	if(H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()

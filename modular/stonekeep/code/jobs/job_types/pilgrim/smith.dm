/datum/advclass/pilgrim/stonekeep/smith
	name = "Wandering Smith"
	tutorial = "Hardy worksmen that are at home in the forge, dedicating their lives \
	to ceaselessly toil in dedication to Malum."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Ogrun"
	)
	outfit = /datum/outfit/job/sk/pilgrim/smith
	category_tags = list(CTAG_PILGRIM)
	apprentice_name = "Blacksmith Apprentice"
	cmode_music = 'modular/stonekeep/sound/cmode/combat_guard.ogg'

/datum/outfit/job/sk/pilgrim/smith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/hammer/iron
	beltl = /obj/item/weapon/tongs

	neck = /obj/item/storage/belt/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/leather
	cloak = /obj/item/clothing/cloak/apron/brown
	pants = /obj/item/clothing/pants/trou

	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/flint = 1, /obj/item/ore/coal=2, /obj/item/ore/iron=1, /obj/item/natural/bundle/stoneblock/four = 1)

	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/boots/leather
		shirt = /obj/item/clothing/shirt/shortshirt
	else
		armor = /obj/item/clothing/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/shortboots

	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, pick(0,0,1), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2,2), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/masonry, pick(1,1,2), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/carpentry, pick(1,1,2), TRUE) // For the bin
		H.mind?.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE) // For craftable beartraps
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		if(prob(50))
			H.mind?.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		if(H.age == AGE_OLD) //Oldness points are a bit different here, you get a pool of 1-3 points that are assigned randomly to the smithing stats since you're not a specialist
			var/oldnesspoints = rand(1,3)
			for(var/i=1, i<oldnesspoints, i++)
				var/datum/skill/craft/skillpicked = pick(/datum/skill/craft/weaponsmithing, /datum/skill/craft/armorsmithing, /datum/skill/craft/blacksmithing)
				H.mind?.adjust_skillrank(skillpicked, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", -1)
		ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)


	if(H.dna.species.id == "dwarf")
		H.cmode_music = 'modular/Stonekeep/sound/cmode/combat_dwarf.ogg'

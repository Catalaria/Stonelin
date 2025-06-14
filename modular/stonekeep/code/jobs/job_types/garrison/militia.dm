//Differently of Vanderlin, the Militiaman has no such a thing as weaponsmithing/armorsmithing or smithing hammer. It'd be improper for Stonekeep in any way.

/datum/job/squire // Replacement for 'Squires', most suitable because squires usually is implied, in irl terms, to be minors. This still functions as a beginner role.
	title = "Militiaman"
	flag = SK_SQUIRE
	department_flag = GARRISON
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_STATION
	total_positions = 3 //You can have more militiaman than Squires
	spawn_positions = 3

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)

	tutorial = "Fate has placed a weapon upon your hands as your name has been scribbled upon a conscription roll after the conflict, \
	another citizen turned warrior under the lord's banner. Still in training, you've been handed left over equipment and income \
	stability many dreams about. You do not have much expectations compared to the foreign guards, and must be trained by them."
	outfit = /datum/outfit/job/stonekeep/squire
	display_order = SQUIRE_ORDER
	give_bank_account = TRUE
	min_pq = -15
	can_have_apprentices = FALSE
	cmode_music = 'modular/stonekeep/sound/cmode/combat_quarte.ogg'
	advclass_cat_rolls = list(CTAG_SKMILITIA = 20)

/datum/outfit/job/stonekeep/squire
	shirt = /obj/item/clothing/shirt/undershirt/guard
	pants = /obj/item/clothing/pants/chainlegs/iron
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/manorguard
	head = /obj/item/clothing/head/helmet/kettle //Felt like squire-to-militia was deserving of better head protection.

/datum/job/squire/after_spawn(mob/living/carbon/spawned, client/player_client)
	. = ..()

/datum/advclass/sk/squire/lancer
	name = "Pikeman Militia"
	tutorial = "A childhood of keeping wolves at bay and working with hay with nothing but a pitchfork taught you patience and reach, so they provided you what felt best for your callous hands."
	outfit = /datum/outfit/job/stonekeep/squire/lancer

	category_tags = list(CTAG_SKMILITIA)

/datum/outfit/job/stonekeep/squire/lancer/pre_equip(mob/living/carbon/human/H)
	r_hand = /obj/item/weapon/polearm/spear
	armor = /obj/item/clothing/armor/chainmail
	gloves = /obj/item/clothing/gloves/leather
	wrists = /obj/item/clothing/wrists/bracers/leather
	backr = /obj/item/storage/backpack/satchel
	cloak = /obj/item/clothing/cloak/stabard/guard
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/clothing/neck/chaincoif = 1)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_SPD, 1)
	if(H.gender == MALE && H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/squire()
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/advclass/sk/squire/footman
	name = "Footman Militia"
	tutorial = "Before your conscription, you were entrusted with sickles as you shouldered sacks of grain. Now, you are entrusted with swords and shoulder the burden of protecting the crown and its people."
	outfit = /datum/outfit/job/stonekeep/squire/footman

	category_tags = list(CTAG_SKMILITIA)

/datum/outfit/job/stonekeep/squire/footman/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/armor/chainmail
	gloves = /obj/item/clothing/gloves/leather
	wrists = /obj/item/clothing/wrists/bracers/leather
	backr = /obj/item/storage/backpack/satchel
	beltr = /obj/item/weapon/sword
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/clothing/neck/chaincoif = 1)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_PER, 1)
		H.change_stat(STATKEY_CON, 1)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_SPD, 1)
	if(H.gender == MALE && H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/squire()
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/advclass/sk/squire/skirmisher
	name = "Bowman Militia"
	tutorial = "The creations of Dendor raised you as your trusty bow fed you, and as you shoot straighter than most, what was once means of survival becomes your means of service."
	outfit = /datum/outfit/job/stonekeep/squire/skirmisher

	category_tags = list(CTAG_SKMILITIA)

/datum/outfit/job/stonekeep/squire/skirmisher/pre_equip(mob/living/carbon/human/H)
	beltr = /obj/item/ammo_holder/quiver/arrows
	armor = /obj/item/clothing/armor/chainmail
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	gloves = /obj/item/clothing/gloves/leather
	wrists = /obj/item/clothing/wrists/bracers/leather
	backr = /obj/item/storage/backpack/satchel
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel = 1, /obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/clothing/neck/chaincoif = 1)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat(STATKEY_PER, 1)
		H.change_stat(STATKEY_CON, 1)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_SPD, 2)
	if(H.gender == MALE && H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/squire()
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

/*
/datum/job/squire
	title = "Squire"
	flag = SK_SQUIRE
	department_flag = GARRISON
//	department_flag = APPRENTICES
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2

	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf"
	)
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)

	tutorial = "You've always had greater aspirations than the simple life of a peasant. You and your friends practiced the basics, swordfighting with sticks and loosing arrows into hay bale targets. The Captain took notice of your potential, and recruited you as a personal ward. Learn from the garrison and train hard... maybe one dae you will be honored with knighthood."

	outfit = /datum/outfit/job/stonekeep/squire
	display_order = SQUIRE_ORDER
	give_bank_account = TRUE
	min_pq = -15
	selection_color = "#304529"
	can_have_apprentices = FALSE
	cmode_music = 'modular/stonekeep/sound/cmode/combat_quarte.ogg'

/datum/outfit/job/stonekeep/squire/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/coif/cloth
	armor = /obj/item/clothing/armor/gambeson
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/shirt/undershirt/guard
	pants = /obj/item/clothing/pants/tights/guard
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/guard
	beltr = /obj/item/storage/belt/pouch/coins/poor

	if(H.gender == MALE && H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/squire()

	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("speed", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)


*/

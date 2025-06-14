/* Notes-
The idea is Kaizoku warriors are the garrison, a force sent from a foreign lord to support his ally.
Honor-focused, theyre supposed to swear loyalty to the monarch publically on the start of the week to reinforce this.
Archers, spearmen, scouts, theyre meant to be on par with adventurer fighters and the like, but less than rare knights and
the like.
*/
/datum/job/stonekeep/garrison
	title = "Custodian Retainer"
	flag = SK_GUARD
	department_flag = GARRISON
	total_positions = 4
	spawn_positions = 4
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
	tutorial = "You are a custodian foreign guard from Grimoria's islander powers. Unlike lesser mercenaries, your \
	honorbound background has chosen you to ensure Rockhill's stability against invasions and rebellions to anchor a potential alliance. \
	The rewards may bring you nobility from your homeland, but diplomatic incidents will be the end of your lineage as you know it."
	display_order = GARRISON_ORDER
	outfit = /datum/outfit/job/stonekeep/garrison //Default outfit for the Custodian Foreign Guard
	advclass_cat_rolls = list(CTAG_SKGARRISON = 20)	//Handles class selection.
	give_bank_account = 20
	min_pq = -10
	cmode_music = 'modular/stonekeep/kaizoku/sound/combat/combat_stormwarrior.ogg'

/datum/outfit/job/stonekeep/garrison // Reminder message
	var/oath = "<br><br><font color='#855b14'><span class='bold'>Remember to renew your oath of loyalty to the Monarch in person at the start of the week, and train the next generation of warriors.</span></font><br><br>"

/datum/outfit/job/stonekeep/garrison/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, oath)

/datum/outfit/job/stonekeep/garrison/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(istype(H.cloak, /obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard) || istype(H.cloak, /obj/item/clothing/cloak/raincloak/guardsman))
		var/obj/item/clothing/S = H.cloak
		var/index = findtext(H.real_name, " ")
		if(index)
			index = copytext(H.real_name, 1, index)
		if(!index)
			index = H.real_name
		S.name = "retinue's cloak ([index])"

//Universal stuff for all guards, regardless of their class selection.
/datum/outfit/job/stonekeep/garrison
	pants = /obj/item/clothing/pants/trou/tobi/random
	shoes = /obj/item/clothing/shoes/boots/jikatabi/shinobi
	belt = /obj/item/storage/belt/kaizoku/leather/pursebelt
	//it chooses
	//cloak = /obj/item/clothing/cloak/raincloak/guardsman
	//cloak = /obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard

/datum/outfit/job/stonekeep/garrison/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.dna.species.id == "human")
		H.skin_tone = SKIN_COLOR_TROPICALDRY
		H.grant_language(/datum/language/abyssal)
	if(findtext(H.real_name, " Clanless"))
		to_chat(H, "<span class='userdanger'>If I am bound to the king, I must be one with my bloodline.</span>")
		clanfication(H)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/* ! ! ! Class Selection Section Below ! ! !
Design philosphy:
- Footman, specializes in using axes/maces and shields. - Medium armor
- Pikeman, specializes in polearms with some bonus stats. - Medium armor
- Archer, specializes in bow/crossbow and daggers. - Dodge expert, no armor training, some crafting stats (low)
- Fencer, specializes in swords and daggers. - Dodge expert, no armor training
*/

/datum/advclass/sk/garrison/footman
	name = "Man-at-arms Retinue"
	tutorial = "You are a frontline warrior, the staple in any art of warfare in which the shield holds the borders of the realm. Raised under foreign banners, fighting in formation comes effortlessly under the discipline of steel, holding a sword or a mace to put down any evildoer."
	outfit = /datum/outfit/job/stonekeep/garrison/footman
	category_tags = list(CTAG_SKGARRISON)
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

/datum/outfit/job/stonekeep/garrison/footman/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, "<span class='warning'>My clan was bound to sworn to the king's cause under the Heavenly Emperor's will. As an Ashigaru retainer, their lineage is held in high regard, and I shall serve their bloodline as I would my daimyo.")
	armor = /obj/item/clothing/armor/cuirass/nanbando
	shirt = /obj/item/clothing/armor/chainmail/tatami
	neck = /obj/item/clothing/neck/gorget/lazerrain
	head = /obj/item/clothing/head/helmet/zijinguan
	cloak = /obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard
	backr = /obj/item/weapon/shield/wood/rattan
	beltr = /obj/item/weapon/sword/scimitar/messer/dao
	beltl = /obj/item/weapon/mace/ararebo
	backpack_contents = list(/obj/item/storage/keyring/garrison)

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_CON, 1)

/datum/advclass/sk/garrison/spearman
	name = "Phalangite Retinue"
	tutorial = "The bastion of leverage that puts a quick stop to any cavalry charge. Nothing passes the polearm that you wield as you anchor the line. You may not be the first to strike, yet it is your blow that breaks any mortal, and your strength shows it."
	outfit = /datum/outfit/job/stonekeep/garrison/spearman

	category_tags = list(CTAG_SKGARRISON)

/datum/outfit/job/stonekeep/garrison/spearman/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, "<span class='warning'>My clan was bound to sworn to the king's cause under the Heavenly Emperor's will. As an Ashigaru retainer, their lineage is held in high regard, and I shall serve their bloodline as I would my daimyo.")

	armor = /obj/item/clothing/armor/chainmail/hauberk/kusari // Steel equalizer.
	shirt = /obj/item/clothing/armor/gambeson/ruankai
	neck = /obj/item/clothing/neck/gorget/lazerrain
	cloak = /obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard
	head = /obj/item/clothing/head/helmet/kettle/fs_kettle
	beltr = /obj/item/weapon/sword/scimitar/messer/dao
	backpack_contents = list(/obj/item/storage/keyring/garrison)

	var/obj/item/weapon/polearm/halberd/bardiche/naginata/P = new() //Standardize a Bardiche as the spawn item to differ from the Militia polearm.
	H.put_in_hands(P, forced = TRUE)

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 2)
	H.change_stat(STATKEY_SPD, -1) // Stronk and gets training in hard hitting polearms, but slower

	/*
	var/weapontype = pickweight(list("Spear" = 6, "Bardiche" = 4)) // Rolls for either a spear or a bardiche
	switch(weapontype)
		if("Spear")
			var/obj/item/weapon/polearm/spear/yari/P = new()
			H.put_in_hands(P, forced = TRUE)
		if("Bardiche")
			var/obj/item/weapon/polearm/halberd/bardiche/naginata/P = new()
			H.put_in_hands(P, forced = TRUE)
	*/

/datum/advclass/sk/garrison/marksman
	name = "Falconer Retinue"
	tutorial = "Your steady hands know the string just as much as your vision reachers farther than any other man, your precision has been shaped by the endless wind. You have a loyal companion for scouting, combat and communication as long it is alive." //Falcon not finished yet.
	outfit = /datum/outfit/job/stonekeep/garrison/marksman

	category_tags = list(CTAG_SKGARRISON)
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

/datum/outfit/job/stonekeep/garrison/marksman/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, "<span class='warning'>My clan was bound to sworn to the king's cause under the Heavenly Emperor's will. As an Ashigaru retainer, their lineage is held in high regard, and I shall serve their bloodline as I would my daimyo.")
	armor = /obj/item/clothing/armor/leather/splint/battlecoat
	shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt1
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
	head = /obj/item/clothing/head/helmet/kettle/fs_kettle
	cloak = /obj/item/clothing/cloak/raincloak/guardsman
	neck = /obj/item/clothing/neck/chaincoif/karuta_zukin/military
	wrists = /obj/item/clothing/wrists/bracers/leather/khudagach
	gloves = /obj/item/clothing/gloves/angle/falcon //Because it makes sense. This is a falconeer's gloves.
	beltr = /obj/item/ammo_holder/quiver/arrows
	beltl = /obj/item/weapon/knife/steel/tanto
	backpack_contents = list(/obj/item/storage/keyring/garrison)

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.change_stat(STATKEY_PER, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_SPD, 1)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

/datum/advclass/sk/garrison/privateer
	name = "Privateer Retinue"
	tutorial = "You are a swift swordsman who tasted blood across ship decks rather than on the field, courtier and unorthodox. Your slim edge finds weakness in armor as you learnt the ways of ebb-and-flow so you never swing wide, you slide and stab."
	outfit = /datum/outfit/job/stonekeep/garrison/privateer

	category_tags = list(CTAG_SKGARRISON)
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

/datum/outfit/job/stonekeep/garrison/privateer/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, "<span class='warning'>My clan was bound to sworn to the king's cause under the Heavenly Emperor's will. As an Ashigaru retainer, their lineage is held in high regard, and I shall serve their bloodline as I would my daimyo.")
	armor = /obj/item/clothing/armor/leather/splint/battlecoat
	shirt = /obj/item/clothing/armor/chainmail/iron/tatami
	beltr = /obj/item/ammo_holder/cscabbard/scscabbard/loaded
	cloak = /obj/item/clothing/cloak/raincloak/guardsman
	head = /obj/item/clothing/head/helmet/leather/paddedt
	neck = /obj/item/clothing/neck/chaincoif/karuta_zukin/military
	beltl = /obj/item/weapon/knife/steel/tanto
	backpack_contents = list(/obj/item/storage/keyring/garrison)

	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_SPD, 2)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

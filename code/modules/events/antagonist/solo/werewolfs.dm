/datum/round_event_control/antagonist/solo/werewolf
	name = "Verevolfs"
	tags = list(
		TAG_COMBAT,
		TAG_HAUNTED,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_WEREWOLF
	shared_occurence_type = SHARED_HIGH_THREAT

	denominator = 80

	base_antags = 1
	maximum_antags = 2

	weight = 12

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/werewolf
	antag_datum = /datum/antagonist/werewolf

	restricted_roles = list(
		"Monarch",
		"Consort",
		"Dungeoneer",
		"Inquisitor",
		"Men-at-arms",
		"Merchant",
		"Priest",
		"Acolyte",
		"Adepts",
		"Templar",
		"Bandit",
		"Prince",
		"Princess",
		"Hand",
		"Steward",
		"Feldsher",
		"Town Elder",
		"Captain",
		"Archivist",
		"Merchant",
		"Royal Knight",
		"Garrison Guard",
		"Jailor",
		"Court Magician",
		"Forest Warden",
		"Inquisitor",
		"Adepts",
		"Forest Guard",
		"Squire",
		"Veteran",
		"Apothecary",
		"Sheriff",	// STONEKEEP EDIT
		"Court Wizard",	// STONEKEEP EDIT
		"Village Elder" // STONEKEEP EDIT
	)

/datum/round_event/antagonist/solo/werewolf

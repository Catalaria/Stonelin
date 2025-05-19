/*!
This subsystem mostly exists to populate and manage the skill singletons.
*/

SUBSYSTEM_DEF(skills)
	name = "Skills"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_SKILLS
	lazy_load = FALSE
	///Dictionary of skill.type || skill ref
	var/list/all_skills = list()
	///Static assoc list of levels (ints) - strings
	var/list/level_names = list(span_info("Weak"), span_info("Average"), span_biginfo("Skilled"), span_biginfo("Expert"), "<B>Master</B>", span_greentext("Legendary"))//This list is already in the right order, due to indexing
	var/list/inspiration_skills = list(
		/datum/skill/combat/wrestling, /datum/skill/combat/unarmed,
		/datum/skill/misc/swimming, /datum/skill/misc/climbing, /datum/skill/misc/athletics,
		/datum/skill/misc/reading, /datum/skill/labor/farming, /datum/skill/misc/sewing,
		/datum/skill/craft/masonry, /datum/skill/craft/crafting)

/datum/controller/subsystem/skills/Initialize(timeofday)
	InitializeSkills()
	return ..()

///Ran on initialize, populates the skills dictionary
/datum/controller/subsystem/skills/proc/InitializeSkills(timeofday)
	for(var/type in subtypesof(/datum/skill))
		var/datum/skill/ref = new type
		if(is_abstract(type))
			continue
		all_skills[type] = ref

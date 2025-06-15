//MODULARIZED VERSION of code\modules\food_and_drinks\food.dm FOR STONEKEEP; Because of Changelings debuff.

/// ////////////////////////////////////////////////////////////////////////////////
/// Food.
////////////////////////////////////////////////////////////////////////////////
/// Note: When adding food items with dummy parents, make sure to add
/// the parent to the exclusion list in code/__HELPERS/unsorted.dm's
/// get_random_food proc.
////////////////////////////////////////////////////////////////////////////////
#define STOP_SERVING_BREAKFAST (15 MINUTES)

/obj/item/reagent_containers/food
	possible_transfer_amounts = list()
	volume = 50	//Sets the default container amount for all food items.
	reagent_flags = INJECTABLE
	resistance_flags = FLAMMABLE
	grid_width = 32
	grid_height = 32
	var/do_random_pixel_offset = TRUE
	var/foodtype = NONE
	var/last_check_time
	var/in_container = FALSE //currently just stops "was bitten X times!" messages on canned food

	/// How palatable is this food for a given social class?
	var/faretype = FARE_NEUTRAL
	/// If false, this will inflict mood debuffs on nobles who eat it without being near a table.
	var/portable = TRUE

/obj/item/reagent_containers/food/Initialize(mapload)
	. = ..()
	if(!mapload && do_random_pixel_offset)
		pixel_x = rand(-4, 4)
		pixel_y = rand(-4, 4)

var/list/preyfood = list(
	"<span class='warning'>Ergh. Food of prey! Disgusting!</span>",
	"<span class='warning'>What is this? Cabbit garnish?</span>",
	"<span class='warning'>Grain mush? I'd rather chew bark.</span>",
	"<span class='warning'>Food of PREY? Have I fallen so far?</span>",
	"<span class='warning'>Ugh... It tastes like toxin and fiber.</span>",
	"<span class='warning'>If it can't run, I don't want it on my mouth.</span>",
	"<span class='warning'>This ain't food. it's compost. Why I am eating this?</span>",
	"<span class='warning'>I don't eat what food eats.</span>",
	"<span class='warning'>This is what they serve in punishment halls, isn't it?</span>",
	"<span class='warning'>I'm not grazing—I'm suffering.</span>",
	"<span class='warning'>You know how much parasites exists on vegetables?</span>",
	"<span class='warning'>I don't chew leaves, mere filthy elven underwear.</span>",
	"<span class='warning'>If I wanted to taste defeat, I'd order a salad like this.</span>",
	"<span class='warning'>Where's the flavor? The struggle? The dignity?</span>",
	"<span class='warning'>I feel my instincts dying just looking at this.</span>",
	"<span class='warning'>You think I am some sort of activist?</span>",
	"<span class='warning'>All vegetarian changelings died of hunger. I'd rather not be like them.</span>",
)

/obj/item/reagent_containers/food/proc/checkLiked(fraction, mob/M)
	if(last_check_time + 50 < world.time)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M

			if(HAS_TRAIT(H, TRAIT_CHANGELING_METABOLISM))
				if(foodtype & MEAT) //If: Meat, short-circuits the rest.
					to_chat(H, "<span class='notice'>The flavor of prey... exquisite.</span>")
					H.adjust_disgust(-5 + -2.5 * fraction)
				else if(foodtype & (GRAIN | VEGETABLES)) //If plant, bad.
					to_chat(H, "<span class='warning'>What is this plant-ridden filth?</span>")
					H.adjust_disgust(25 + 30 * fraction)
				else //Anything else means free game.
					to_chat(H, "<span class='notice'>Edible... but not satisfying.</span>")
				last_check_time = world.time
				return

			// Default species checks
			if(foodtype & H.dna.species.toxic_food)
				to_chat(H,"<span class='warning'>That was vile!</span>")
				H.adjust_disgust(25 + 30 * fraction)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "toxic_food", /datum/mood_event/disgusting_food)
			else if(foodtype & H.dna.species.disliked_food)
				to_chat(H,"<span class='notice'>That didn't taste very good...</span>")
				H.adjust_disgust(11 + 15 * fraction)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "gross_food", /datum/mood_event/gross_food)
			else if(foodtype & H.dna.species.liked_food)
				to_chat(H,"<span class='notice'>I love this taste!</span>")
				H.adjust_disgust(-5 + -2.5 * fraction)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "fav_food", /datum/mood_event/favorite_food)

			if((foodtype & BREAKFAST) && world.time - SSticker.round_start_time < STOP_SERVING_BREAKFAST)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "breakfast", /datum/mood_event/breakfast)

			last_check_time = world.time

#undef STOP_SERVING_BREAKFAST

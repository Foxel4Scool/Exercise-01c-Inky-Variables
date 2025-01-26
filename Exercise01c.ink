/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR tool = ""
VAR sticks = 0 

-> beginning

== beginning ==
{grab_tool: You've got your tool now, ready?| You find yourself at a cave intrance. Do you wish to explore?}
* [Explore] -> cave_enter
* [Don't Explore] -> cave_ignore0

== cave_enter ==
{search_beginning: You return to the beginning and do what?|As you enter the cave rubble falls blocking you in what do you do?}
* {tool == "Pocket Knife"} [Use your knife] -> use_tool
* {tool == "Phone"} [Use your phone] -> use_tool
* {tool == "Flashlight"} [Use your light] -> use_tool
* [Try to find supplies] -> search_beginning
+ [Wait for help] -> wolf_attack

== use_tool ==
{tool == "Pocket Knife": ... What exactly is this going to help with here?..|}
{tool == "Phone": Smart idea use the life 360 app to ping your parents! What now though?|}
{tool == "Flashlight": Oh right your light! You quickly fumble before finding it. Turning it on you realise how useless it is barely reflect little glints in what seem to be the eyes of creatures before it dies..|}
* [Try to find supplies] -> search_beginning
+ [Wait for help] -> wolf_attack

== cave_ignore0 ==
What.. Why?
* [Cause you need your tools duh] -> grab_tool
* [Not Interested] -> cave_ignore1

== grab_tool ==
What tool do you grab?
*[Your trusty old pocket knife]
    ~ tool = "Pocket Knife"
    -> beginning
*[Your phone]
    ~ tool = "Phone"
    -> beginning
*[An old flashlight]
    ~ tool = "Flashlight"
    -> beginning
    
== cave_ignore1 ==
Oh well.. You leave and remain bored, but safe -> END

== search_beginning ==
{continue_search: You wonder through the cave system for a bit finding a spot where light shines down through the ceiling|Its feels like its been hours and you begin to lose hope..}
* [Keep on going] -> continue_search
+ {continue_search} [Try and climb out] -> climb
+ [Quit and head back] -> cave_enter

==climb==
You make it half way and feel the struggle creep upon yourself then see a rope just out of your grasp
+ [Reach for it] -> fall
+ [Work through the struggle] -> escape

== fall ==
You barely manage to grab it before falling to your end as the rope gives to your weight.-> END
== escape ==
You push through the pain knowing the rope was to tattered to help and make it out with just a few scatches due to the sharp and difficult climb.-> END

=== continue_search ===
You keep going until.. -> search_beginning

== wolf_attack ==
{search: Hurry! What now the wolves are closing in!|You decide your best bet was to wait for help but little did you know there were wolves in the cave.}
+ [Fight Back] -> fight_back
+ {search} [Throw it at the wolves] -> friend_route
* [Check your surroundings] -> search
+ [Run] -> run

=== search ===
~ sticks = sticks+1
{sticks == 1: You find a stick! You now have {sticks} stick| You find a stick! You now have {sticks} sticks} -> wolf_attack

== fight_back ==
{sticks > 0 or tool == "Pocket Knife": You manage to fend off the wolves surviving long enough for a group to save you|Wow for real what did you expect their wolves..}
-> END
== friend_route ==
Wow.. who would've expected such a stupid outcome.. they chased it those over glorified dogs. You were found playing fetch just a while later perfectly fine in the end. -> END
== run ==
Wow for real what did you expect their wolves.. 
-> END
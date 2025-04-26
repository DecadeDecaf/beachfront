init();

g.newgrounds = true;
g.all_upgrades = false;

if (g.newgrounds) {
	ng_connect("60143:YvidQxZa", "FFsJXAaZPXXW+PIiXb0Xcw==");
	ng_initialize_medals_and_scoreboard();
	ng_request_login();
}

g.alien = -1;
g.sanddollars = 0;

g.tree_upgrade = false;
g.tree_upgrade_two = false;
g.treasure_upgrade = false;
g.gapple = false;
g.icecream = false;
g.tide = false;
g.rizz = false;
g.corpse = false;
#!/usr/bin/perl
# This Program, RPG1, Is Protected Under The Terms And
#      Conditions of Version Two (2) of
#    The GNU GENERAL PUBLIC LICENSE (GPL)
#      By The Entity Known As MikeeUSA

#NOTE: For help on the code or game play enter #linux at cat2.ath.cx on IRC
use Term::ANSIColor;
print color 'reset';

#If you want a ~random splash screen color set to 1 if you just want default red set to 0 
$randcolorsplash = 1;

#BUFFERS:: 1 = Enable Buffer :: 0 = Disable Buffer :: NOTE: If you are a believer in minimal ram usage set these to 0
$allowinfotrack = 1;   ##buffer   -- Logs $info and $info2
$allowstarttrack = 1;  ##cbuffer  -- Logs $start (the 'command prompt' in the game)
$allowreadtrack = 1;   ##rbuffer  -- Logs $read

#PLATFORM:: if you are using unix or a unix like OS set $unix to 1, otherwise set $unix to 0
$unix = 1;
$shellargs = 1;        ##Accept shell arguments (-h, --help etc):: 1 = True :: 0 = False
$wav123 = 1;           ##Allow SoundFX :: 1 = YES :: 0 = No
$voi123 = 1;           ##Allow Voice Synth (via festival) :: 1 = YES :: 0 = No
$ogg123 = 0;           ##Pointer for weather music is on or off, keep set at 0.
$testFX = 1;           ##Test to see if (sound)FX programs are installed :: 1 = YES :: 0 = No

#VOICEFX::
$voiceFXutil = 'festival';
$voiceFXbuff = '';

#SOUNDFX:: 
$soundFXdir = './';                   #Directory to find SoundFX files
$soundFXutil = 'play';                #Sound Utility
$soundFXfile = '';                    #Automatically set
$soundFXrate = '';                    #Automatically set
$soundFXvolu = '';                    #Automatically set
$soundFX_explosion = 'explosion.wav'; #Explosion sound file
$soundFX_explosionSR = '21000';       #Explosion sample rate
$soundFX_explosionVO = '4';           #Explosion volume multiplier
$soundFX_boom = 'boom.wav';           #Boom sound file (Shotgun)
$soundFX_boomSR = '24000';            #Boom sample rate
$soundFX_boomVO = '7';                #Boom volume multiplier
$soundFX_pop0 = 'fire.wav';           #Pop sound file (9mm)
$soundFX_pop0SR = '48000';            #Pop sample rate
$soundFX_pop0VO = '8';                #Pop volume multiplier
$soundFX_pop1 = 'boom.wav';           #Pop sound file (.45)
$soundFX_pop1SR = '38000';            #Pop sample rate
$soundFX_pop1VO = '5';                #Pop volume multiplier
$soundFX_pop2 = 'ricochet.wav';       #Pop sound file (.9mm suppressed)
$soundFX_pop2SR = '35000';            #Pop sample rate
$soundFX_pop2VO = '1';                #Pop volume multiplier
$soundFX_missile = 'missile.wav';     #Missle sound file
$soundFX_missileSR = '8000';          #Missle sample rate
$soundFX_missileVO = '2';             #Missle volume multiplier
$soundFX_nuke = 'explosion.wav';      #Nuke sound file
$soundFX_nukeSR = '4000';             #Nuke sample rate
$soundFX_nukeVO = '9';                #Nuke volume multiplier
$soundFX_click = 'flag_grab.wav';     #Click sound file
$soundFX_clickSR = '28000';           #Click sample rate
$soundFX_clickVO = '5';               #Click volume multiplier
$soundFX_laser = 'laser.wav';         #Laser sound file
$soundFX_laserSR = '28000';           #Laser sample rate
$soundFX_laserVO = '6';               #Laser volume multiplier


#Color Theme:: 0 = blue || 1 = white || 2 = green || 3 = red || 4 = yellow || 5 = cyan || 6 = magenta || 7 = black 
$themecolor1 = 0;      ##0 DEFAULT
$themecolor2 = 1;      ##1 DEFAULT

$screen2def1 = 'blue'; ##blue DEFAULT
$screen2def2 = 'cyan'; ##cyan DEFAULT

$colorhealthbardef = 'red';   ##red DEFAULT
$colormanabardef = 'magenta'; ##magenta DEFAULT
$colorfhealthbardef = 'bold red';   ##bold red DEFAULT
$colorfmanabardef = 'bold magenta'; ##bold magenta DEFAULT

$colorbeingice1def = 'blue';  ##blue DEFAULT
$colorbeingice2def = 'cyan';  ##cyan DEFAULT

$colorbeing1def = 'bold yellow';    ##bold yellow DEFAULT
$colorbeing2def = 'cyan';           ##cyan DEFAULT

$colorbeingnull1def = 'bold white'; ##bold white DEFAULT
$colorbeingnull2def = 'cyan';       ##cyan DEFAULT

$colorpromptdef = 'bold yellow';    ##bold yellow DEFAULT
$colorinfodef = 'yellow';           ##yellow DEFAULT

$colorcompass1def = 'bold yellow';  ##bold yellow DEFAULT
$colorcompass2def = 'yellow';       ##yellow DEFAULT

$colorcompassudef = 'bold green';   ##bold green DEFAULT
$colorcompassddef = 'green';        ##green DEFAULT

$themenbrdef = 0;
#---------------------------------------------------------#
#        PERL Knowledge needed beyond this point          #
#---------------------------------------------------------#

BEGIN {
	print"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	print'<><><><><><><><><><><><><><><><><><><><><><><><><><>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>    RRRRRRR     PPPPPPP     GGGGG    11111      <>'; print"\n";
	print'<>    RRRRRRRR    PPPPPPPP   GGGGGGG      11      <>'; print"\n";
	print'<>    RR    RR    PP    PP   GG           11      <>'; print"\n";
	print'<>    RR    RR    PP   PP    GG           11      <>'; print"\n";
	print'<>    RRRRRRR     PPPPPP     GG   GG      11      <>'; print"\n";
	print'<>    RR   RRR    PP         GG   GG      11      <>'; print"\n";
	print'<>    RR    RRR   PP         GGGGGGG      11      <>'; print"\n";
	print'<>    RR     RRR  PP          GGGGG    11111111   <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                  [LOADING]                     <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<>                                                <>'; print"\n";
	print'<><><><><><><><><><><><><><><><><><><><><><><><><><>'; print"\n";
}

sub themes {
	if ($startinfomenu eq 'theme 0' or $startinfomenu eq 'THEME 0') {
		$themenbr = 0;
		$templateC1 = $themecolor1;
		$templateC2 = $themecolor2;
		$screen2color1 = $screen2def1;
		$screen2color2 = $screen2def2;
		$colorhealthbar = $colorhealthbardef;
		$colormanabar = $colormanabardef;
		$colorfhealthbar = $colorfhealthbardef;
		$colorfmanabar = $colorfmanabardef;
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = $colorbeingice2def;
		$colorbeing1 = $colorbeing1def;
		$colorbeing2 = $colorbeing2def;
		$colorbeingnull1 = $colorbeingnull1def;
		$colorbeingnull2 = $colorbeingnull2def;
		$colorprompt = $colorpromptdef;
		$colorinfo = $colorinfodef;
		$colorcompass1 = $colorcompass1def;
		$colorcompass2 = $colorcompass2def;
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();
	} elsif ($startinfomenu eq 'theme 1' or $startinfomenu eq 'THEME 1') {
		$themenbr = 1;
		$templateC1 = 2;
		$templateC2 = 1;
		$screen2color1 = 'green';
		$screen2color2 = 'white';
		$colorhealthbar = 'yellow';
		$colormanabar = 'yellow';
		$colorfhealthbar = 'bold yellow';
		$colorfmanabar = 'bold yellow';
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = 'yellow';
		$colorbeing1 = 'bold yellow';
		$colorbeing2 = 'yellow';
		$colorbeingnull1 = 'bold white';
		$colorbeingnull2 = 'yellow';
		$colorprompt = $colorpromptdef;
		$colorinfo = $colorinfodef;
		$colorcompass1 = $colorcompass1def;
		$colorcompass2 = $colorcompass2def;
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();
	} elsif ($startinfomenu eq 'theme 2' or $startinfomenu eq 'THEME 2') {
		$themenbr = 2;
		$templateC1 = 2;
		$templateC2 = 3;
		$screen2color1 = 'green';
		$screen2color2 = 'red';
		$colorhealthbar = 'green';       ##red DEFAULT
		$colormanabar = 'green';         ##magenta DEFAULT
		$colorfhealthbar = 'bold green';
		$colorfmanabar = 'bold green';
		$colorbeingice1 = 'blue';        ##blue DEFAULT
		$colorbeingice2 = 'red';         ##cyan DEFAULT
		$colorbeing1 = 'bold yellow';    ##bold yellow DEFAULT
		$colorbeing2 = 'red';            ##cyan DEFAULT
		$colorbeingnull1 = 'bold white'; ##bold white DEFAULT
		$colorbeingnull2 = 'red';        ##cyan DEFAULT
		$colorprompt = $colorpromptdef;
		$colorinfo = $colorinfodef;
		$colorcompass1 = $colorcompass1def;
		$colorcompass2 = $colorcompass2def;
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();	
	} elsif ($startinfomenu eq 'theme 3' or $startinfomenu eq 'THEME 3') {					
		$themenbr = 3;
		$templateC1 = 0;
		$templateC2 = 3;
		$screen2color1 = 'red';
		$screen2color2 = 'blue';
		$colorhealthbar = 'red';
		$colormanabar = 'blue';
		$colorfhealthbar = 'blue';
		$colorfmanabar = 'red';
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = $colorbeingice2def;
		$colorbeing1 = $colorbeing1def;
		$colorbeing2 = $colorbeing2def;
		$colorbeingnull1 = $colorbeingnull1def;
		$colorbeingnull2 = $colorbeingnull2def;
		$colorprompt = $colorpromptdef;
		$colorinfo = $colorinfodef;
		$colorcompass1 = $colorcompass1def;
		$colorcompass2 = $colorcompass2def;
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();	
	} elsif ($startinfomenu eq 'theme 4' or $startinfomenu eq 'THEME 4') {					
		$themenbr = 4;
		$templateC1 = 0;
		$templateC2 = 5;
		$screen2color1 = 'cyan';
		$screen2color2 = 'blue';
		$colorhealthbar = 'white';
		$colormanabar = 'white';
		$colorfhealthbar = 'bold black';
		$colorfmanabar = 'bold white';
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = 'white';
		$colorbeing1 = $colorbeing1def;
		$colorbeing2 = 'white';
		$colorbeingnull1 = $colorbeingnull1def;
		$colorbeingnull2 = 'white';
		$colorprompt = 'bold blue';
		$colorinfo = 'cyan';
		$colorcompass1 = 'bold blue';
		$colorcompass2 = 'blue';
		$colorcompassu = 'bold white';
		$colorcompassd = 'white';
		infomenu();		
	} elsif ($startinfomenu eq 'theme 5' or $startinfomenu eq 'THEME 5') {					
		$themenbr = 5;
		$templateC1 = 3;
		$templateC2 = 1;
		$screen2color1 = 'white';
		$screen2color2 = 'red';
		$colorhealthbar = 'black';
		$colormanabar = 'black';
		$colorfhealthbar = 'bold black';
		$colorfmanabar = 'bold black';
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = 'black';
		$colorbeing1 = 'red';
		$colorbeing2 = 'black';
		$colorbeingnull1 = 'bold black';
		$colorbeingnull2 = 'black';
		$colorprompt = 'red';
		$colorinfo = 'red';
		$colorcompass1 = 'bold red';
		$colorcompass2 = 'red';
		$colorcompassu = 'bold white';
		$colorcompassd = 'bold black';
		infomenu();
	} elsif ($startinfomenu eq 'theme 6' or $startinfomenu eq 'THEME 6') {					
		$themenbr = 6;
		$templateC1 = 2;
		$templateC2 = 7;
		$screen2color1 = 'black';
		$screen2color2 = 'green';
		$colorhealthbar = 'black';
		$colormanabar = 'black';
		$colorfhealthbar = 'bold green';
		$colorfmanabar = 'green';
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = 'black';
		$colorbeing1 = 'bold green';
		$colorbeing2 = 'black';
		$colorbeingnull1 = 'green';
		$colorbeingnull2 = 'black';
		$colorprompt = 'bold green';
		$colorinfo = 'green';
		$colorcompass1 = 'green';
		$colorcompass2 = 'bold black';
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();
	} elsif ($startinfomenu eq 'theme 7' or $startinfomenu eq 'THEME 7') {					
		$themenbr = 7;
		$templateC1 = 7;
		$templateC2 = 1;
		$screen2color1 = 'black';
		$screen2color2 = 'white';
		$colorhealthbar = $colorhealthbardef;
		$colormanabar = $colormanabardef;
		$colorfhealthbar = $colorfhealthbardef;
		$colorfmanabar = $colorfmanabardef;
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = $colorbeingice2def;
		$colorbeing1 = $colorbeing1def;
		$colorbeing2 = $colorbeing2def;
		$colorbeingnull1 = $colorbeingnull1def;
		$colorbeingnull2 = $colorbeingnull2def;
		$colorprompt = 'bold black';
		$colorinfo = 'white';
		$colorcompass1 = $colorcompass1def;
		$colorcompass2 = $colorcompass2def;
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();
	} elsif ($startinfomenu eq 'theme 8' or $startinfomenu eq 'THEME 8') {					
		$themenbr = 8;
		$templateC1 = 3;
		$templateC2 = 6;
		$screen2color1 = 'magenta';
		$screen2color2 = 'red';
		$colorhealthbar = 'cyan';
		$colormanabar = 'cyan';
		$colorfhealthbar = 'blue';
		$colorfmanabar = 'blue';
		$colorbeingice1 = $colorbeingice1def;
		$colorbeingice2 = $colorbeingice2def;
		$colorbeing1 = $colorbeing1def;
		$colorbeing2 = $colorbeing2def;
		$colorbeingnull1 = $colorbeingnull1def;
		$colorbeingnull2 = $colorbeingnull2def;
		$colorprompt = 'bold magenta';
		$colorinfo = 'bold yellow';
		$colorcompass1 = $colorcompass1def;
		$colorcompass2 = $colorcompass2def;
		$colorcompassu = $colorcompassudef;
		$colorcompassd = $colorcompassddef;
		infomenu();
	} else {
		#N/A
	}
}

#Weapons
#class table
#
#	Type					Number
#	----------------------------------------------
#	unarmed 				0
#	sword					1
#       axe					2
#	pole arm				3
#	dagger/knife  				4
#	staff					5
#	bow					6
#	magic staff				7
#	fire arm 9mm				8
#	blunt force (mace,hammer,morningstar)  	9
#	fire arm .45 cal			10
#	fire arm .50 cal			11
#	fire arm (shotgun) 12 ga		12
#	fire arm (shotgun) 20 ga		13
#	fire arm ("cannon") 22mm		14
#	claws/teeth/sheer weight		15
#	laser					16
#	explosive (RPG) X14       		17

#Armor
#class table
#
#	Type					Number
#	----------------------------------------------
#	none					0
#	light cloth ("regular clothes")		1
#	heavy cloth (heavy cloak etc)		2
#	animal skin (buffalo hide etc)		3
#	leather	(hats etc)			4
#	studded leather				5
#	ring mail				6
#	scale mail				7
#	plate mail				8
#	solid sheet metal (helmets etc)		9
#	kevlar ("bullet proof vests etc")	10


#Phases
#type table
#	Type					Number
#	----------------------------------------------
#	Living					0
#	ICE 1 turn				1
#	ICE 2 turn				2
#	etc					etc


#Body Parts
#table
#	Type					Number
#	----------------------------------------------
#	None					0
#	Flesh    				1


#notes on attack: force(attack dammage given to being (read: enemy)) and beinghealth(your enemy's health)
#the scale for force and beinghealth is 0 - 1000000 (course it can be anything you want really...)
#Strong humans are at 8000-10000 normal humans are at 4000-6000

#version
$version = '0.1.1';

#start clock at 0
$clock = 0;

#shellarguments
if ($shellargs == 1) {
	if ($ARGV[0] eq '-h' or $ARGV[0] eq '--help') {
		print"This Program, RPG1, Is Protected Under The Terms And\n";
		print"         Conditions of Version Two (2) of \n";
		print"       The GNU GENERAL PUBLIC LICENSE (GPL) \n";
		print"        By The Entity Known As MikeeUSA \n\n";
		print"RPG1 version $version\n\n";
		print"Usage: rpg1 [options]\n";
		print"       Where [options] are any of:\n";
		print"-h, --help                  Display this help screen\n";
		print"-b, --disablebuffers        Disable all buffers\n";
		print"+b, --enablebuffers         Enable all buffers\n";
		print"    --showtemplates         Display Game Templates\n";
		exit; #I like die better
	} elsif ($ARGV[0] eq '+b' or $ARGV[0] eq '--enablebuffers') {
		$allowinfotrack = 1;
		$allowstarttrack = 1;
		$allowreadtrack = 1;	
		print"\n\nAll Buffers Enabled\n";
	} elsif ($ARGV[0] eq '-b' or $ARGV[0] eq '--disablebuffers') { 
		$allowinfotrack = 0;
		$allowstarttrack = 0;
		$allowreadtrack = 0;
		print"\n\nAll Buffers Disabled\n";
	} elsif ($ARGV[0] eq '--showtemplates') {
	 	showtemplates();
		exit();	
	} else {
	}
} else {
	#ain't no thang
}

sub svars {
#startingroom
$room2startin = int(rand(15));
if ($room2startin == 1) { $room = 'zug1'; }  #zug1 JAIL
else { $room = 'ua1'; }                      #ua1  REG
$info = "nothing mutch";
$info2 = "nada";

#attrubites
$health = 100;
$weapon = "temp_crookddagger";
$mana = 50;
$starvedie = 0;
$die = 0;
$turn = 0;

#experience
$magicexp = 1;
$physexp = 0;
$intellect = 1;
$explevel = 1;
$wickedness = 0;
$psphysexp = $physexp;
$pmagicexp = $magicexp;
$pintellect = $intellect;

#Visual Effects
$veffect = 0;
$visualpsyc = 0;
$visualblind = 0;

#Bonus given by eqipment spells etc
$healthbonus = 1;

#armor we have
$nonearmor = 1;
$leathervestarmor = 0;
$redtshirtarmor = 0;
$ringmailvestarmor = 0;
$whiterobearmor = 0;

#weapons we have
$noweaponnone = 1;
if ($room2startin == 1) { $crookddagger = 0; }
else { $crookddagger = 1; }
$cappedstaff = 0;
$longsword = 0;
$mace = 0;
$redcrowbar = 0;
$sapg = 0;
$sap45cal = 0;
if ($room2startin == 1) { $skive = 1; }
else { $skive = 0; }
$sg12p = 0;
$bflyknife = 0;
$smg9mm = 0;
$smg45cal = 0;
$fireaxe = 0;
$englishaxe = 0;
$straightaxe = 0;
$doubleaxe = 0;
$broadtipspear = 0;
$rpgX14launcher = 0;

#spells we have
$spellburn = 0;
$spellshock = 0;
$spelllife = 0;
$spellrage = 0;
$spellsoultransfer = 0;
$spelltoice = 0;
$spellteleport = 0;
$spellsustenance = 0;

#manavar
$spellburnmana = 40;
$spellragemana = 60;
$spellshockmana = 45;
$spelllifemana = 90;
$spellsoultransfermana = 5;
$spellsoultransferpoint = 3;
$spelltoicemana = 5;
$spelltoicepoint = 10;
$spelltoicelife = 50;
$spellteleportmana = 10;
$spellteleportmana2 = 45;
$spellteleportdrain = 50;
$spellsustenancemana = 85;

#projectile damage
$prj9mm = 8000;
$prj45cal = 9500;
$prj12ga = 21000;
$prjRPGX14 = 122000;

#directions
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

#bookswehave
$ancientredbook = 1;
$spellbookburn = 0;
$spellbookshock = 0;
$spellbooklife = 0;
$spellbookrage = 0;
$spellbooksoultransfer = 0;
$spellbooktoice = 0;
$spellbookteleport = 0;
$spellbooksustenance = 0;
$bookpr0n = 0;
$bookjournal = 0;

#tools
$bombamount = 0;
$bullet9mmamount = 0;
$bullet45calamount = 0;
$slug12gaamount = 0;
$explosiveRPGX14amount = 0;
$nukeamount = 0; #10 MT at least
$sachel = 1;
$spflashlight = 0;
$gp = 20; #20
$blackbppen = 0;
$bbpink = 0;
$passcardredkewsszum6 = 0;
$glassbottleempty = 0;

#misc
$rpgx14capacity = 0;
$sg12pcapacity = 0;
$pistol45calcapacity = 0;
$semiautopistolcapacity = 0;
$smg45calcapacity = 0;
$smg9mmcapacity = 0;
$bodyhealthrate = 0.25;
$psudobeingattack = 0;
$beingattackbodydam = 0;
$messageda1a = 0;
$messageda2a = 0;
$messageda1l = 0;
$messageda2l = 0;
$bodycolor = 'bold white';
$bloodcolor = 'red';
$bonecolor = 'bold black';
$braincolor = 'bold red';
$movetog = 0;
$food = 200; 
$fooddpl = 1;
$foodmax = 500;
$armorclass = 0;
$armortype = "NA";
$armorginger = "none";
$armordefend = 0;
$armordur = 0;
$armormagik = 0; #magic bonus
$class = 0;
$type = "NA";
$gingertype = "none";
$power = 0;
$magic = 0;
$weapprotect = 0;
$fright = 0; #1-10
$armsneeded = 0;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;
$journalread = ' ';
$templateC1 = $themecolor1;
$templateC2 = $themecolor2;
$screen2color1 = $screen2def1;
$screen2color2 = $screen2def2;
$colorhealthbar = $colorhealthbardef;
$colormanabar = $colormanabardef;
$colorfhealthbar = $colorfhealthbardef;
$colorfmanabar = $colorfmanabardef;
$colorbeingice1 = $colorbeingice1def;
$colorbeingice2 = $colorbeingice2def;
$colorbeing1 = $colorbeing1def;
$colorbeing2 = $colorbeing2def;
$colorbeingnull1 = $colorbeingnull1def;
$colorbeingnull2 = $colorbeingnull2def;
$colorprompt = $colorpromptdef;
$colorinfo = $colorinfodef;
$colorcompass1 = $colorcompass1def;
$colorcompass2 = $colorcompass2def;
$colorcompassu = $colorcompassudef;
$colorcompassd = $colorcompassddef;        
$themenbr = $themenbrdef;
$lroomauthor = '';
$roomauthor = 'N/A                         ';
$termdir = '~';
$spellsknown = ' ';
if ($randcolorsplash == 1) {
	$splasscolorrand = int(rand(16));
	if ($splasscolorrand == 1) {
	$splashscrncolor = "red";
	} elsif ($splasscolorrand == 2) {
	$splashscrncolor = "bold red";
	} elsif ($splasscolorrand == 3) {
	$splashscrncolor = "green";
	} elsif ($splasscolorrand == 4) {
	$splashscrncolor = "bold green";
	} elsif ($splasscolorrand == 5) {
	$splashscrncolor = "blue";
	} elsif ($splasscolorrand == 6) {
	$splashscrncolor = "bold blue";
	} elsif ($splasscolorrand == 7) {
	$splashscrncolor = "yellow";
	} elsif ($splasscolorrand == 8) {
	$splashscrncolor = "bold yellow";
	} elsif ($splasscolorrand == 9) {
	$splashscrncolor = "white";
	} elsif ($splasscolorrand == 10) {
	$splashscrncolor = "bold white";
	} elsif ($splasscolorrand == 11) {
	$splashscrncolor = "bold black";
	} elsif ($splasscolorrand == 12) {
	$splashscrncolor = "magenta";
	} elsif ($splasscolorrand == 13) {
	$splashscrncolor = "bold magenta";
	} elsif ($splasscolorrand == 14) {
	$splashscrncolor = "cyan";
	} elsif ($splasscolorrand == 15) {
	$splashscrncolor = "bold cyan";
	} else {
	$splashscrncolor = "red";
	}
} else {
$splashscrncolor = "red";
}
$read = " ";
$explosivecharge = 2500;
$attackdamage = 0;
$spellburndam = 210;
$statmurders = 0;
$statkills = 0;
$counter9mm = 0;
$counter45cal = 0;
$counter12ga = 0;
$counterRPGX14 = 0;
$bufferinfo = '';
$bufferstart = '';
$bufferread = '';
$bufinfo = "                                                ";
$bufinfo2 = "                                                ";

#Bodyparts
$bodypart_head = 1;
$bodypart_kneck = 1;
$bodypart_armR = 1;
$bodypart_armL = 1;
$bodypart_chest = 1;
$bodypart_torso = 1;
$bodypart_legR = 1;
$bodypart_legL = 1;
$bodycolor_head = 'bold white';
$bodycolor_kneck = 'bold white';
$bodycolor_armR = 'bold white';
$bodycolor_armL = 'bold white';
$bodycolor_chest = 'bold white';
$bodycolor_torso = 'bold white';
$bodycolor_legR = 'bold white';
$bodycolor_legL = 'bold white';
$bodyhealth_head = 100;
$bodyhealth_kneck = 100;
$bodyhealth_armR = 100;
$bodyhealth_armL = 100;
$bodyhealth_chest = 100;
$bodyhealth_torso = 100;
$bodyhealth_legR = 100;
$bodyhealth_legL = 100;
$bodyhealthMAX_head = 100;
$bodyhealthMAX_kneck = 100;
$bodyhealthMAX_armR = 100;
$bodyhealthMAX_armL = 100;
$bodyhealthMAX_chest = 100;
$bodyhealthMAX_torso = 100;
$bodyhealthMAX_legR = 100;
$bodyhealthMAX_legL = 100;

#Sickness/poison/etc
$poisoned = 0; #if over 0 = turns to be poisoned, if less eq perm = permanent
$poisondam = 5;
$sick = 0; #if over 0 = turns to be sick, if eq perm = permanent
$sickdam = 3;
$starve = 0; #if over 0 = turns to be sick, starve increases each turn under its influence untill 4/5/whatever-the-death-nbr-is
             #or untill you eat something

#triggers
$beinginroom = 0;
$beinghealth = 0;
$beingattack = 0;
$beingdefend = 0; #armor points ($force = $force - $beingdefend; if it applies depending on armor class);
$beingarmor = 0; #armor class
$beingluck = 0;
$beinglife = 0;
$beingphase = 0;
$beingweapon = 0;
$beingname = " ";
$beinghandle = " ";
##someones in the room if $beinginroom = 1 #
$nobeingevade = 0;
$fired9mm = 0;
$fired12ga = 0;
$firedRPGX14 = 0;
$fired45cal = 0;
$attackedaxe = 0;
$attackedsword = 0;
$attackedblunt = 0;
$smgfired = 0;
$brstfired = 0;
$smg45calfired = 0;
$brst45calfired = 0;
$bombdetonate = 0;
$bombbeing = 0;
$immobile = 0;
$drainedla2 = 0;
$la2findgrate = 0;
$sa0grateblown = 0;
$uzx4term = 0;
$uzx4termsmoke = 0;
$burnredbook = 0;
$uzy4lockeropen = 0;
$lockersmarts = 0;
$termnboom = 0;
$termnboom2 = 0;
$termnboom3 = 0;
$uzz4blowupglass = 0;
$uzz4shatterglass = 0;
$keyuzs4keyfuze = 0;
$keyuzw4keyfuze = 0;
$keyuzw4bombed = 0;
$keyuzs4bombed = 0;
$uzz5bomedup = 0;
$uzx7readbook = 0;
$uzw4passwordputer = 0;
$decssreadlessterm = 0;
$uzw4listterm = 0;
$uzv4bombedoutg = 0;
$sbm2blocked = 0;
$sbm2blocked = 1;
$smb2cantgo = 0;
$spjackpot = 0;
$jackpot = 0;
$jackpot2 = 0;
$jackpot3 = 0;
$jackpot4 = 0;
$jackpot5 = 0;
$jackpot6 = 0;
$jackpot7 = 0;
$jackpot8 = 0;
$jackpot9 = 0;
$evadeinfo = 0;
$bombsam1trig = 0;
$spellburntrig = 0;
$spellshocktrig = 0;
$spellshocktime = 0;
$spellragetrig = 0;
$spellragetime = 0;
$spelltoicetrig = 0;
$spelltoicefail = 0;
$spelltransfersoultrig0 = 0;
$spelltransfersoultrig1 = 0;
$spellteleporttrig = 0;
$spellteleporttrig2 = 0;
$spellteleportready = 0;
$knowspellburntrig = 0;
$knowspellshocktrig = 0;
$knowspelllifetrig = 0;
$knowspellragetrig = 0;
$knowspellsustenancetrig = 0;
$knowspellsoultransfertrig = 0;
$knowspelltoicetrig = 0;
$knowspellteleporttrig = 0;
$sa0readintel = 0;
$gac4readintel = 0;
$droid1attacktrig = 0;
$droid1attacktrig2 = 0;
$droid2attacktrig = 0;
$droid2attacktrig2 = 0;
$zug1ltrig = 0;
$caa4bombw = 0;
$zug1winb = 0;
$zug1winbtrig = 0;
$cac3levelin = 0;
$nukedetonate = 0;
$la2movetrig = 0;
$smg9mmsetnbr = 1;
$smg45calsetnbr = 1;
$gpop = 0;
$noammoclick = 0;
$randrommsnake1 = 1;
$randrommsnake2 = 1;
$trigtripebread = 0;
$playpaytrig = 0;
$sageteachtrig = 0;
$sageharmtrig1 = 0;
$attacktrig = 1;
$gpopcolor = 0;
$keysewagecrdb = 0;
$keysewagecrdbp = 0;
$keysewagecrds = 0;
$switchswr = 0;
$switchswrb = 0;
$mainframeb = 0;
$mainframebroke = 0;
$mainframe2b = 0;
$mainframe3b = 0;
$notereadlessterm = 0;
$notereadlessterm2 = 0;
$padduzu3b = 0;
$uzw4passwdset = 0;
$uzw4psauxt = 0;
$reactorC0 = 'blue';
$reactorcoolant = 90;
$reactortempO = 0;
$reactordegrd = 0;
$reactorredline = 0;
$uzt3bomb = 0;
$pincerbeing2_u2zv0 = 0;
$bombed_u2zv1 = 0;
$keyuzw4var = "keyuzw4";
$beingname = ' ';

#foods
$f_apple = 1;
$fa_apple = 40;

$f_carrot = 3;
$fa_carrot = 30;

$f_bread = 0;
$fa_bread = 120;

$f_cake = 0;
$fa_cake = 160;

$f_tripebread = 0;
$fa_tripebread = 90;

$f_elixirhealth100 = 0;
$fa_elixirhealth100 = 10;

$f_elixirpoison10 = 0;
$fa_elixirpoison10 = '-20';

$f_lsd = 0;
$fa_lsd = 3;

#debugmode (debuglock = 1 to disable debugmode)
$debugmode = 0;
$debuglock = 0;
$manacheat = 0;
$weaponcheat = 0;
$bombcheat = 0;
$spellcheat = 0;
$armorcheat = 0;
$magecheat = 0;
$barbarycheat = 0;
$foodcheat = 0;

#names
$name_mikeeusa = 'MikeeUSA                    ';

colors();
findslot();
randomstuffstart();
}

svars();
titlescreenrpg1();
startingrpg();


sub startingrpg {
	testFX();
	infinitenewlines();
	room_registry();
	set_armordur();
	maintask();
}

##SUBS#########################################################################


sub maintask {
#NOTE: The recursive loop forged by assume_we_are_done(); might not be the most optimal of paths...
deadyet();
weaponability();
reactor();
reactormeltdownsound();
setbufnumber();
beingattr();
resetfight();
topinfobar();
poisonsick();
sbluebar();
colors();
findroom();
manacheck();
healthcheck();
levelcheck();
beingattacking();
reactormeltdown();
infotrack();
bodyhealthcheck();
roominfo();
infotrack();
sbluebar();
beinginfo();
infotrack();
sbluebar();
manacheck2();
healthcheck2();
healthbar();
damagebeing();
cleanup();
bodycolors();
startbar();
stdinstart();
$lroomauthor = $roomauthor;
$roomauthor = 'N/A                         ';
starttrack();
enlightenment();
food();
clockup();
assume_we_are_done();
}
###RANGED#WEAPONS######################################
sub reload {
	if ($ranged == 1) {
		#reload 'n pop a lil mo
		if ($gingertype eq '12GA pump action shotgun') {
			$sg12pcapacity = $ammocapacity;
		} elsif ($gingertype eq '.45 automatic pistol') {
			$pistol45calcapacity = $ammocapacity;
		} elsif ($gingertype eq 'semiautomatic pistol') {
			$semiautopistolcapacity = $ammocapacity;
		} elsif ($gingertype eq 'RPG-X14') {
			$rpgx14capacity = $ammocapacity;
		} elsif ($gingertype eq '.45 SMG Carbine') {
			$smg45calcapacity = $ammocapacity;
		} elsif ($gingertype eq 'SMG 9MM') {
			$smg9mmcapacity = $ammocapacity;
		} else {
			#fo shizzle wha'cha fool talkin?
		}
	} else {
		#fuck dat shit today niggah!
	}	
}
###RANGED#WEAPONS######################################

###TEST#FX############################################
sub testFX {
	if ($testFX == 1) {
	print color 'reset';
	print color 'black';
		if ($voi123 == 1) {
			if (system("$voiceFXutil -v")) {
				$voi123 = 0;
			} else {
				$voi123 = 1;
			}
		}
		
		if ($wav123 == 1) {
			if (system("$soundFXutil -v")) {
				$wav123 = 0;
			} else {
				$wav123 = 1;
			}
		}
	print color 'reset';	
	}
}
###TEST#END###########################################

###VOICE###############################################
sub voiceFX_play {
	#You
	if ($voi123 == 1) {
		$voiceFXbuff=~ s/-/ /g;
		$voiceFXbuff =~ s/\W//g;
		system("echo \\(SayText \\\"$voiceFXbuff\\\"\\) | $voiceFXutil &");
		$voiceFXbuff = '';
	} else {
		#N/A
	}
}

sub voiceFX_play_manA {
	#Thugg
	if ($voi123 == 1) {
		$voiceFXbuff=~ s/-/ /g;
		$voiceFXbuff =~ s/\W//g;
		system("echo \\(SayText \\\"$voiceFXbuff\\\"\\) | $voiceFXutil &");
		$voiceFXbuff = '';
	} else {
		#N/A
	}
}

sub voiceFX_play_manB {
	#Sage
	if ($voi123 == 1) {
		$voiceFXbuff=~ s/-/ /g;
		$voiceFXbuff =~ s/\W//g;
		system("echo \\(SayText \\\"$voiceFXbuff\\\"\\) | $voiceFXutil &");
		$voiceFXbuff = '';
	} else {
		#N/A
	}
}
###VOICE#END###########################################

###SOUND###############################################
sub soundFX_play {
	if ($wav123 == 1) {
		system("$soundFXutil --silent $soundFXdir$soundFXfile -r $soundFXrate -v $soundFXvolu &");
	} else {
		#N/A
	}
}

sub soundFX_play_explosion {
	$soundFXfile = $soundFX_explosion;
	$soundFXrate = $soundFX_explosionSR;
	$soundFXvolu = $soundFX_explosionVO;
	soundFX_play();
}

sub soundFX_play_boom {
	$soundFXfile = $soundFX_boom;
	$soundFXrate = $soundFX_boomSR;
	$soundFXvolu = $soundFX_boomVO;
	soundFX_play();
}

sub soundFX_play_pop0 {
	$soundFXfile = $soundFX_pop0;
	$soundFXrate = $soundFX_pop0SR;
	$soundFXvolu = $soundFX_pop0VO;
	soundFX_play();
}

sub soundFX_play_pop1 {
	$soundFXfile = $soundFX_pop1;
	$soundFXrate = $soundFX_pop1SR;
	$soundFXvolu = $soundFX_pop1VO;
	soundFX_play();
}

sub soundFX_play_pop2 {
	$soundFXfile = $soundFX_pop2;
	$soundFXrate = $soundFX_pop2SR;
	$soundFXvolu = $soundFX_pop2VO;
	soundFX_play();
}

sub soundFX_play_missile {
	$soundFXfile = $soundFX_missile;
	$soundFXrate = $soundFX_missileSR;
	$soundFXvolu = $soundFX_missileVO;
	soundFX_play();
}

sub soundFX_play_nuke {
	$soundFXfile = $soundFX_nuke;
	$soundFXrate = $soundFX_nukeSR;
	$soundFXvolu = $soundFX_nukeVO;
	soundFX_play();
}

sub soundFX_play_click {
	$soundFXfile = $soundFX_click;
	$soundFXrate = $soundFX_clickSR;
	$soundFXvolu = $soundFX_clickVO;
	soundFX_play();
}

sub soundFX_play_laser {
	$soundFXfile = $soundFX_laser;
	$soundFXrate = $soundFX_laserSR;
	$soundFXvolu = $soundFX_laserVO;
	soundFX_play();
}
###SOUND#END###########################################


###COLORS##############################################
sub colors {
	if ($reactorredline >= 110) {
		colors_reverse();
	} elsif ($health <= 3) {
		colors_3health();
	} elsif ($health <= 5) {
		colors_5health();
	} elsif ($health <= 10) {
		colors_10health();
	} elsif ($health <= 15) {
		colors_15health();
	} elsif ($health <= 20) {
		colors_20health();
	} elsif ($health <= 25) {
		colors_25health();
	} elsif ($health <= 30) {
		colors_30health();						
	} elsif ($spellragetrig == 1) {
		colors_rage();
	} else {
		colors_standard();
	}
}

sub colors_standard {
	$white = 'white';
	$black = 'black';
	$yellow = 'yellow';
	$green = 'green';
	$red = 'red';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'magenta';
}

sub colors_frost {
	$white = 'white';
	$black = 'black';
	$yellow = 'blue';
	$green = 'cyan';
	$red = 'white';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'blue';
}

sub colors_rage {
	$white = 'red';
	$black = 'black';
	$yellow = 'white';
	$green = 'white';
	$red = 'red';
	$blue = 'red';
	$cyan = 'white';
	$magenta = 'red';
}

sub colors_flash {
	$white = 'white';
	$black = 'white';
	$yellow = 'white';
	$green = 'white';
	$red = 'white';
	$blue = 'white';
	$cyan = 'white';
	$magenta = 'white';
}

sub colors_reverse {
	$white = 'black';
	$black = 'white';
	$yellow = 'cyan';
	$green = 'magenta';
	$red = 'blue';
	$blue = 'red';
	$cyan = 'yellow';
	$magenta = 'green';
}

sub colors_crazy {
	$white = 'cyan';
	$black = 'magenta';
	$yellow = 'yellow';
	$green = 'yellow';
	$red = 'magenta';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'magenta';
}

sub colors_30health {
	$white = 'white';
	$black = 'black';
	$yellow = 'yellow';
	$green = 'green';
	$red = 'black';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'magenta';
}

sub colors_25health {
	$white = 'white';
	$black = 'black';
	$yellow = 'yellow';
	$green = 'black';
	$red = 'black';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'magenta';
}

sub colors_20health {
	$white = 'white';
	$black = 'black';
	$yellow = 'yellow';
	$green = 'black';
	$red = 'black';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'black';
}

sub colors_15health {
	$white = 'black';
	$black = 'black';
	$yellow = 'yellow';
	$green = 'black';
	$red = 'black';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'black';
}

sub colors_10health {
	$white = 'black';
	$black = 'black';
	$yellow = 'black';
	$green = 'black';
	$red = 'black';
	$blue = 'blue';
	$cyan = 'cyan';
	$magenta = 'black';
}

sub colors_5health {
	$white = 'black';
	$black = 'black';
	$yellow = 'black';
	$green = 'black';
	$red = 'black';
	$blue = 'black';
	$cyan = 'cyan';
	$magenta = 'black';
}

sub colors_3health {
	$white = 'black';
	$black = 'black';
	$yellow = 'black';
	$green = 'black';
	$red = 'black';
	$blue = 'black';
	$cyan = 'black';
	$magenta = 'black';
}
###COLORS#END##########################################

###BODY#PARTS##########################################
sub printbody0 {
	#head
	if ($bodypart_head == 1) {
		print color "$bodycolor_head";
		print'      ____ ';
		print color 'reset';		
	} else {
		print color "$bloodcolor";
		print'      , .  ';
		print color 'reset';
	}
}

sub printbody1 {
	#head
	if ($bodypart_head == 1) {
		print color "$bodycolor_head";
		print'     /----\\';
		print color 'reset';		
	} else {
		print color "$braincolor";
		print'       .  ~';
		print color 'reset';
	}
	
}

sub printbody2 {
	#head
	if ($bodypart_head == 1) {
		print color "$bodycolor_head";
		print'     |----|';
		print color 'reset';		
	} else {
		print color "$braincolor";
		print'     ,   ';
		print color 'reset';
		print color "$bloodcolor";
		print'.';
		print color 'reset';
		print color "$bonecolor";
		print';';
		print color 'reset'
	}
}

sub printbody3 {
	#head
	if ($bodypart_head == 1) {
		print color "$bodycolor_head";
		print'     \\____/';
		print color 'reset';		
	} else {
		print color "$bloodcolor";
		print'      \\~@_ ';
		print color 'reset';
	}
}

sub printbody4 {

	#rightarm
	if ($bodypart_armR == 1) {
		print color "$bodycolor_armR";
		print'    __';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'    ,_';
		print color 'reset';
	}
	
	#kneck
	if ($bodypart_kneck == 1) {
		print color "$bodycolor_kneck";
		print'|__|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'.__.';
		print color 'reset';
	}

	#leftarm
	if ($bodypart_armL == 1) {
		print color "$bodycolor_armL";
		print'__';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'_.';
		print color 'reset';
	}

}

sub printbody5 {
	#rightarm
	if ($bodypart_armR == 1) {
		print color "$bodycolor_armR";
		print'   /-|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'   /_|';
		print color 'reset';
	}
	
	#chest
	if ($bodypart_chest == 1) {
		print color "$bodycolor_chest";
		print'----';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'*  .';
		print color 'reset';
	}
	
	#leftarm
	if ($bodypart_armL == 1) {
		print color "$bodycolor_armL";
		print'|-\\';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'|}';
		print color 'reset';
		print color "$bonecolor";
		print'- ';
		print color 'reset';
	}
}

sub printbody6 {
	#rightarm
	if ($bodypart_armR == 1) {
		print color "$bodycolor_armR";
		print'  /-/';
		print color 'reset';	
	} else {
		#Placeholder
		print color "$bloodcolor";
		print'    .';
		print color 'reset';
	}
	
	#chest
	if ($bodypart_chest == 1) {
		print color "$bodycolor_chest";
		print'|----|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print' ~    ';
		print color 'reset';
	}
	
	#leftarm
	if ($bodypart_armL == 1) {
		print color "$bodycolor_armL";
		print'\\-\\';
		print color 'reset';	
	} else {
		#PlaceHolder
		print color "$bloodcolor";
		print'   ';
		print color 'reset';
	}
}

sub printbody7 {
	#rightarm
	if ($bodypart_armR == 1) {
		print color "$bodycolor_armR";
		print' /-/ ';
		print color 'reset';	
	} else {
		#Placeholder
		print color "$bloodcolor";
		print'     ';
		print color 'reset';
	}
	
	#chest
	if ($bodypart_chest == 1) {
		print color "$bodycolor_chest";
		print'|----|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'  ,   ';
		print color 'reset';
	}
	
	#leftarm
	if ($bodypart_armL == 1) {
		print color "$bodycolor_armL";
		print' \\-\\';
		print color 'reset';	
	} else {
		#PlaceHolder
		print color "$bloodcolor";
		print'    ';
		print color 'reset';
	}
}

sub printbody8 {
	#rightarm
	if ($bodypart_armR == 1) {
		print color "$bodycolor_armR";
		print'(__) ';
		print color 'reset';	
	} else {
		#Placeholder
		print color "$bloodcolor";
		print'     ';
		print color 'reset';
	}
	
	#chest
	if ($bodypart_chest == 1) {
		print color "$bodycolor_chest";
		print'|____|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print' : ~_ ';
		print color 'reset';
	}
	
	#leftarm
	if ($bodypart_armL == 1) {
		print color "$bodycolor_armL";
		print' (__)';
		print color 'reset';	
	} else {
		#PlaceHolder
		print color "$bloodcolor";
		print'     ';
		print color 'reset';
	}
}

sub printbody9 {
	#torso
	if ($bodypart_torso == 1) {
		print color "$bodycolor_torso";
		print'     |----|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'      ^ ~  ';
		print color 'reset';
	}
}

sub printbody10 {
	#rightleg
	if ($bodypart_legR == 1) {
		print color "$bodycolor_legR";
		print'     |';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'     {';
		print color 'reset';
	}
	
	#chest
	if ($bodypart_torso == 1) {
		print color "$bodycolor_torso";
		print'\\__/';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print' .  ';
		print color 'reset';
	}
	
	#leftleg
	if ($bodypart_legL == 1) {
		print color "$bodycolor_legL";
		print'|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'>';
		print color 'reset';
	}
}

sub printbody11 {
	#rightleg
	if ($bodypart_legR == 1) {
		print color "$bodycolor_legR";
		print'     |-|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'      \\|';
		print color 'reset';
	}
	
	#leftleg
	if ($bodypart_legL == 1) {
		print color "$bodycolor_legL";
		print'|-|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'   ';
		print color 'reset';
	}
}
	
sub printbody12 {
	#rightleg
	if ($bodypart_legR == 1) {
		print color "$bodycolor_legR";
		print'     |-|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'     .';
		print color 'reset';
		print color "$bonecolor";
		print '| ';
		print color 'reset';
	}
	
	#leftleg
	if ($bodypart_legL == 1) {
		print color "$bodycolor_legL";
		print'|-|';
		print color 'reset';	
	} else {
		print color "$bodycolor";
		print'   ';
		print color 'reset';
	}	
}

sub printbody13 {
	#rightleg
	if ($bodypart_legR == 1) {
		print color "$bodycolor_legR";
		print'     |-|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'        ';
		print color 'reset';
	}
	
	#leftleg
	if ($bodypart_legL == 1) {
		print color "$bodycolor_legL";
		print'|-|';
		print color 'reset';	
	} else {
		print color "$bodycolor";
		print'   ';
		print color 'reset';
	}	
}

sub printbody14 {
	#rightleg
	if ($bodypart_legR == 1) {
		print color "$bodycolor_legR";
		print'    /__|';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'     ~@ ';
		print color 'reset';
	}
	
	#leftleg
	if ($bodypart_legL == 1) {
		print color "$bodycolor_legL";
		print'|__\\';
		print color 'reset';	
	} else {
		print color "$bloodcolor";
		print'. * ';
		print color 'reset';
	}	
}

sub printbody_all {
	printbody0(); print"\n";
	printbody1(); print"\n";
	printbody2(); print"\n";
	printbody3(); print"\n";
	printbody4(); print"\n";
	printbody5(); print"\n";
	printbody6(); print"\n";
	printbody7(); print"\n";
	printbody8(); print"\n";
	printbody9(); print"\n";
	printbody10(); print"\n";
	printbody11(); print"\n";
	printbody12(); print"\n";
	printbody13(); print"\n";
	printbody14(); print"\n";
}

sub weaponability {
	if (($bodypart_armR == 0) && ($bodypart_armL == 0) && ($armsneeded >= 1)) {
		deweaponize();
		$messageda1a = 1;
	} elsif ((($bodypart_armR == 0) or ($bodypart_armL == 0)) && ($armsneeded >= 2)) {
		deweaponize();
		$messageda2a = 1;
	} else {
		#N/A
	}
	
	if (($bodypart_legR == 0) && ($bodypart_legL == 0) && ($legsneeded >= 1)) {
		deweaponize();
		$messageda1l = 1;
	} elsif ((($bodypart_legR == 0) or ($bodypart_legL == 0)) && ($legsneeded >= 2)) {
		deweaponize();
		$messageda2l = 1;
	} else {
		#N/A
	}	
}

sub bodycolors {
	if ($bodyhealth_head >= 80) {
		$bodycolor_head = 'bold white';
	} elsif ($bodyhealth_head >= 60) {
		$bodycolor_head = 'white';
	} elsif ($bodyhealth_head >= 40) {
		$bodycolor_head = 'bold yellow';
	} elsif ($bodyhealth_head >= 20) {
		$bodycolor_head = 'yellow';			
	} else {
		$bodycolor_head = 'bold red';
	}
	
	if ($bodyhealth_kneck >= 80) {
		$bodycolor_kneck = 'bold white';
	} elsif ($bodyhealth_kneck >= 60) {
		$bodycolor_kneck = 'white';
	} elsif ($bodyhealth_kneck >= 40) {
		$bodycolor_kneck = 'bold yellow';
	} elsif ($bodyhealth_kneck >= 20) {
		$bodycolor_kneck = 'yellow';			
	} else {
		$bodycolor_kneck = 'bold red';
	}
	
	if ($bodyhealth_torso >= 80) {
		$bodycolor_torso = 'bold white';
	} elsif ($bodyhealth_torso >= 60) {
		$bodycolor_torso = 'white';
	} elsif ($bodyhealth_torso >= 40) {
		$bodycolor_torso = 'bold yellow';
	} elsif ($bodyhealth_torso >= 20) {
		$bodycolor_torso = 'yellow';			
	} else {
		$bodycolor_torso = 'bold red';
	}
	
	if ($bodyhealth_armR >= 80) {
		$bodycolor_armR = 'bold white';
	} elsif ($bodyhealth_armR >= 60) {
		$bodycolor_armR = 'white';
	} elsif ($bodyhealth_armR >= 40) {
		$bodycolor_armR = 'bold yellow';
	} elsif ($bodyhealth_armR >= 20) {
		$bodycolor_armR = 'yellow';			
	} else {
		$bodycolor_armR = 'bold red';
	}
	
	if ($bodyhealth_armL >= 80) {
		$bodycolor_armL = 'bold white';
	} elsif ($bodyhealth_armL >= 60) {
		$bodycolor_armL = 'white';
	} elsif ($bodyhealth_armL >= 40) {
		$bodycolor_armL = 'bold yellow';
	} elsif ($bodyhealth_armL >= 20) {
		$bodycolor_armL = 'yellow';			
	} else {
		$bodycolor_armL = 'bold red';
	}
	
	if ($bodyhealth_legR >= 80) {
		$bodycolor_legR = 'bold white';
	} elsif ($bodyhealth_legR >= 60) {
		$bodycolor_legR = 'white';
	} elsif ($bodyhealth_legR >= 40) {
		$bodycolor_legR = 'bold yellow';
	} elsif ($bodyhealth_legR >= 20) {
		$bodycolor_legR = 'yellow';			
	} else {
		$bodycolor_legR = 'bold red';
	}
	
	if ($bodyhealth_legL >= 80) {
		$bodycolor_legL = 'bold white';
	} elsif ($bodyhealth_legL >= 60) {
		$bodycolor_legL = 'white';
	} elsif ($bodyhealth_legL >= 40) {
		$bodycolor_legL = 'bold yellow';
	} elsif ($bodyhealth_legL >= 20) {
		$bodycolor_legL = 'yellow';			
	} else {
		$bodycolor_legL = 'bold red';
	}			
}

sub bodyhealthcheck {

	if ($bodypart_head == 0) {
		$bodyhealth_head = 0;
	} elsif ($bodyhealth_head >= $bodyhealthMAX_head) {
		$bodyhealth_head = $bodyhealthMAX_head;
	} elsif ($bodyhealth_head <= 0) {
		$bodypart_head = 0;
		$bodyhealth_head = 0;
		$info = '            Your Head Is Severed!               ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_head = $bodyhealth_head + $bodyhealthrate;
	}
	
	if ($bodypart_kneck == 0) {
		$bodyhealth_kneck = 0;
	} elsif ($bodyhealth_kneck >= $bodyhealthMAX_kneck) {
		$bodyhealth_kneck = $bodyhealthMAX_kneck;
	} elsif ($bodyhealth_kneck <= 0) {
		$bodypart_kneck = 0;
		$bodyhealth_kneck = 0;
		$info = '           Your Kneck Is Severed!               ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_kneck = $bodyhealth_kneck + $bodyhealthrate;
	}
	
	if ($bodypart_chest == 0) {
		$bodyhealth_chest = 0;
	} elsif ($bodyhealth_chest >= $bodyhealthMAX_chest) {
		$bodyhealth_chest = $bodyhealthMAX_chest;
	} elsif ($bodyhealth_chest <= 0) {
		$bodypart_chest = 0;
		$bodyhealth_chest = 0;
		$info = '           Your Chest Is Destroyed!             ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_chest = $bodyhealth_chest + $bodyhealthrate;
	}
	
	if ($bodypart_torso == 0) {
		$bodyhealth_torso = 0;
	} elsif ($bodyhealth_torso >= $bodyhealthMAX_torso) {
		$bodyhealth_torso = $bodyhealthMAX_torso;
	} elsif ($bodyhealth_torso <= 0) {
		$bodypart_torso = 0;
		$bodyhealth_torso = 0;
		$info = '           Your Torso Is Destroyed!             ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_torso = $bodyhealth_torso + $bodyhealthrate;
	}

	if ($bodypart_armR == 0) {
		$bodyhealth_armR = 0;
	} elsif ($bodyhealth_armR >= $bodyhealthMAX_armR) {
		$bodyhealth_armR = $bodyhealthMAX_armR;
	} elsif ($bodyhealth_armR <= 0) {
		$bodypart_armR = 0;
		$bodyhealth_armR = 0;
		$info = '          Your Right Arm Is Severed!            ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_armR = $bodyhealth_armR + $bodyhealthrate;
	}

	if ($bodypart_armL == 0) {
		$bodyhealth_armL = 0;
	} elsif ($bodyhealth_armL >= $bodyhealthMAX_armL) {
		$bodyhealth_armL = $bodyhealthMAX_armL;
	} elsif ($bodyhealth_armL <= 0) {
		$bodypart_armL = 0;
		$bodyhealth_armL = 0;
		$info = '            Your Left Arm Is Severed!           ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_armL = $bodyhealth_armL + $bodyhealthrate;
	}
	
	if ($bodypart_legR == 0) {
		$bodyhealth_legR = 0;
	} elsif ($bodyhealth_legR >= $bodyhealthMAX_legR) {
		$bodyhealth_legR = $bodyhealthMAX_legR;
	} elsif ($bodyhealth_legR <= 0) {
		$bodypart_legR = 0;
		$bodyhealth_legR = 0;
		$info = '          Your Right Leg Is Severed!            ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_legR = $bodyhealth_legR + $bodyhealthrate;
	}

	if ($bodypart_legL == 0) {
		$bodyhealth_legL = 0;
	} elsif ($bodyhealth_legL >= $bodyhealthMAX_legL) {
		$bodyhealth_legL = $bodyhealthMAX_legL;
	} elsif ($bodyhealth_legL <= 0) {
		$bodypart_legL = 0;
		$bodyhealth_legL = 0;
		$info = '            Your Left Leg Is Severed!           ';
		###########################################################
		infotrack();
	} else {
		$bodyhealth_legL = $bodyhealth_legL + $bodyhealthrate;
	}
			
}
###BODY#PARTS#END######################################

###THEME#ROUTIENES#####################################
sub themeinfo {

	if ($themenbr == 6) {
		$info =~ s/ the / teh /g;
		$info =~ s/l/1/g;
		$info =~ s/e/3/g;
		$info =~ s/a/4/g;
		$info =~ s/s/5/g;
		$info =~ s/g/6/g;
		$info =~ s/t/7/g;
		$info =~ s/b/8/g;
		$info =~ s/o/0/g;
		$info =~ s/L/1/g;
		$info =~ s/E/3/g;
		$info =~ s/A/4/g;
		$info =~ s/S/5/g;
		$info =~ s/G/6/g;
		$info =~ s/T/7/g;
		$info =~ s/B/8/g;
		$info =~ s/O/0/g;

		$info2 =~ s/ the / teh /g;
		$info2 =~ s/l/1/g;
		$info2 =~ s/e/3/g;
		$info2 =~ s/a/4/g;
		$info2 =~ s/s/5/g;
		$info2 =~ s/g/6/g;
		$info2 =~ s/t/7/g;
		$info2 =~ s/b/8/g;
		$info2 =~ s/o/0/g;
		$info2 =~ s/L/1/g;
		$info2 =~ s/E/3/g;
		$info2 =~ s/A/4/g;
		$info2 =~ s/S/5/g;
		$info2 =~ s/G/6/g;
		$info2 =~ s/T/7/g;
		$info2 =~ s/B/8/g;
		$info2 =~ s/O/0/g;
	} elsif ($themenbr == 4) {
		$info =~ s/ you / eow /g;
		$info =~ s/ You / Eow /g;
		$info =~ s/ your / thin /g;
		$info =~ s/ Your / Thin /g;
		$info =~ s/ are / art /g;
		$info =~ s/ Are / Art /g;
		$info =~ s/staff/stave/g;
		$info =~ s/Staff/Stave/g;
		$info =~ s/u/v/g;
		$info =~ s/w/p/g;
		$info =~ s/O/0/g;
		$info =~ s/U/V/g;
		$info =~ s/W/P/g;
		$info =~ s/1/I/g;
		$info =~ s/0/o/g;
		
		$info2 =~ s/ you / eow /g;
		$info2 =~ s/ You / Eow /g;
		$info2 =~ s/ your / thin /g;
		$info2 =~ s/ Your / Thin /g;
		$info2 =~ s/ are / art /g;
		$info2 =~ s/ Are / Art /g;
		$info2 =~ s/staff/stave/g;
		$info2 =~ s/Staff/Stave/g;
		$info2 =~ s/u/v/g;
		$info2 =~ s/w/p/g;
		$info2 =~ s/O/0/g;
		$info2 =~ s/U/V/g;
		$info2 =~ s/W/P/g;
		$info2 =~ s/1/I/g;
		$info2 =~ s/0/o/g;
	} elsif ($themenbr == 5) {
		$info =~ s/o/x/g;
		$info2 =~ s/o/x/g;
	} elsif ($themenbr == 7) {
		$info = reverse $info;
		$info2 = reverse $info2;
	} elsif ($themenbr == 8) {
		$info =~ s/e/w/g;
		$info =~ s/E/W/g;
		$info =~ s/u/v/g;
		$info =~ s/U/V/g;
		$info =~ s/magic/magik/g;
		$info =~ s/Magic/Magik/g;
		$info2 =~ s/e/w/g;
		$info2 =~ s/E/W/g;
		$info2 =~ s/u/v/g;
		$info2 =~ s/U/V/g;
		$info2 =~ s/magic/magik/g;
		$info2 =~ s/Magic/Magik/g;		
	} else {
		#nothing
	}
	
}

sub themebeinginfo {
	if ($visualblind != 0) {
		$pbeinghandle= 'something                               ';		
	} elsif ($visualpsyc != 0) {
		$vpsycrand  = int(rand(2));
		
		if ($vpsycrand == 1) {
			$pbeinghandle = reverse $beinghandle;
		} else {
			$pbeinghandle = $beinghandle;
		}
	} else {
		$pbeinghandle = $beinghandle;
	}
			
	if ($themenbr == 6) {		
		$pbeinghandle =~ s/ the / teh /g;
		$pbeinghandle =~ s/l/1/g;
		$pbeinghandle =~ s/e/3/g;
		$pbeinghandle =~ s/a/4/g;
		$pbeinghandle =~ s/s/5/g;
		$pbeinghandle =~ s/g/6/g;
		$pbeinghandle =~ s/t/7/g;
		$pbeinghandle =~ s/b/8/g;
		$pbeinghandle =~ s/o/0/g;
		$pbeinghandle =~ s/L/1/g;
		$pbeinghandle =~ s/E/3/g;
		$pbeinghandle =~ s/A/4/g;
		$pbeinghandle =~ s/S/5/g;
		$pbeinghandle =~ s/G/6/g;
		$pbeinghandle =~ s/T/7/g;
		$pbeinghandle =~ s/B/8/g;
		$pbeinghandle =~ s/O/0/g;
	} elsif ($themenbr == 4) {
		$pbeinghandle =~ s/ you / eow /g;
		$pbeinghandle =~ s/ You / Eow /g;
		$pbeinghandle =~ s/ your / thin /g;
		$pbeinghandle =~ s/ Your / Thin /g;
		$pbeinghandle =~ s/ are / art /g;
		$pbeinghandle =~ s/ Are / Art /g;
		$pbeinghandle =~ s/ staff / stave /g;
		$pbeinghandle =~ s/ Staff / Stave /g;
		$pbeinghandle =~ s/u/v/g;
		$pbeinghandle =~ s/w/p/g;
		$pbeinghandle =~ s/O/0/g;
		$pbeinghandle =~ s/U/V/g;
		$pbeinghandle =~ s/W/P/g;
		$pbeinghandle =~ s/1/I/g;
		$pbeinghandle =~ s/0/o/g;
	} elsif ($themenbr == 5) {
		$pbeinghandle =~ s/o/x/g;
	} elsif ($themenbr == 7) {
		$pbeinghandle = reverse $beinghandle;
	} elsif ($themenbr == 8) {
		$pbeinghandle =~ s/e/w/g;
		$pbeinghandle =~ s/E/W/g;
		$pbeinghandle =~ s/u/v/g;
		$pbeinghandle =~ s/U/V/g;
	} else {
		#nothing
	}
	
}
###THEME#ROUTIENES#END#################################


###BUFFERS!!!!!!!!#####################################
sub setbufnumber {
	if ($clock <= 9) {
		$bufnbr = "< $clock>";
	} elsif ($clock <= 99) {
		$bufnbr = "<$clock>";
	} elsif ($clock <= 999) {
		$bufnbr = "$clock>";
	} else {
		$bufnbr = "$clock";
	}
}


#Add $info and $info2 to a buffer####
sub infotrack {
	themeinfo();
	if ($allowinfotrack == 1) {
		if ($info eq $bufinfo or $info eq "                                                ") {
			#donothing
		} else {
			$bufferinfo = "$bufferinfo\n"."$bufnbr"."$info";
		}

		if ($info2 eq $bufinfo2 or $info2 eq "                                                ") {
			#donothing
		} else {
			$bufferinfo = "$bufferinfo\n"."$bufnbr"."$info2";
		}
		$bufinfo = $info;
		$bufinfo2 = $info2;
	} else {
	}
}
#Add $start to a buffer####
sub starttrack {
	if ($allowstarttrack == 1) {
		if ($start eq "") {
			#donothing
		} else {
			$bufferstart = "$bufferstart\n"."<$clock> "."$start";
		}
	} else {
	}		
}
sub readtrack {
	if ($allowreadtrack == 1) {
		if ($read eq $bufread or $read eq " ") {
			#donothing
		} else {
			$bufferread = "$bufferread\n"."<$clock> "."$read";
		}
		$bufread = $read;
	} else {
	}
}
sub printbufferinfo {
infinitenewlines();
sbluebar();
if ($allowinfotrack == 1) {
print color "$colorinfo";
print"$bufferinfo\n\n";
print color 'reset';
} else {
print"\n";
print color 'red';
print'            This buffer has been disabled.    '; print"\n";
print' Edit '; print color 'reset'; print'$allowinfotrack'; print color 'red';
print' in the beginning of this file'; print"\n";
print'                  to change this'; print"\n\n";
print color 'reset';
}
sbluebar2();			
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
	infinitenewlines();
}
sub printbufferstart {
infinitenewlines();
sbluebar();
if ($allowstarttrack == 1) {
print color "$colorprompt";
print"$bufferstart\n\n";
print color 'reset';
} else {
print"\n";
print color 'red';
print'            This buffer has been disabled.    '; print"\n";
print' Edit '; print color 'reset'; print'$allowstarttrack'; print color 'red';
print' in the beginning of this file'; print"\n";
print'                  to change this'; print"\n\n";
print color 'reset';
}
sbluebar2();			
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
	infinitenewlines();
}
sub printbufferread {
infinitenewlines();
sbluebar();
if ($allowreadtrack == 1) {
print"$bufferread\n\n";
} else {
print"\n";
print color 'red';
print'            This buffer has been disabled.    '; print"\n";
print' Edit '; print color 'reset'; print'$allowreadtrack'; print color 'red';
print' in the beginning of this file'; print"\n";
print'                  to change this'; print"\n\n";
print color 'reset';
}
sbluebar2();			
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
	infinitenewlines();
}
###BUFFERS!!!!!!!!#####################################

####FOOD################
sub food {
	if ($food > $foodmax)  {
		$food = $foodmax
	} elsif ($food <= 0) {
		$starve = $starve + 1;
	} else {
		$starve = 0;
		if ($fooddpl > 0) {
			$foodtemp = 1 / $fooddpl;
			$food =  $food - $foodtemp;
		} else {
			$food = $food - 1
		}
	}
}
####FOOD################

####SPELLS##############
####SPELLS##############
sub castspellteleport {
	if ($spellteleport == 1) {
	if ($magicexp >= 2) {
		if ($health >= 0) {
			if ($spellteleportready == 0) {
				if ($mana >= $spellteleportmana) {
					$mana = $mana - $spellteleportmana;
					$troom = $room;
					$spellteleportready = 1;
					$spellteleporttrig = 1;
				} else {
				}
			} else {
				if ($mana >= $spellteleportmana2) {
					$mana = $mana - $spellteleportmana2;
					$food = $food - $spellteleportdrain;
					$room = $troom;
					$spellteleportready = 0;
					$spellteleporttrig2 = 1;
					$immobile = 2;
				} else {
				}
			}
		} else {
		}
	} else {
	}	
	} else {
	}
}

sub castspellburn {
	if ($spellburn == 1){
	if ($magicexp >= 2) {
		if ($health >= 0) {
			if ($beinginroom == 1) {
				if ($mana >= $spellburnmana) {
				$mana = $mana - $spellburnmana;
				$beinghealth = $beinghealth - $spellburndam;
				$spellburntrig = 1;
				$beingphase = 0;
				$magicexp = $magicexp + 0.04;
				$wickedness = $wickedness + 0.25;
				} else {
				}
			} else {
			}
		} else {
		}
	} else {
	}
	} else {
	}				
}

sub castspelltoice {
	if ($spelltoice == 1){
	if ($magicexp >= 1) {
		if ($health >= 0) {
			if ($beinginroom == 1) {
				if ($mana >= $spelltoicemana) {
				$mana = $mana - $spelltoicemana;
				infinitenewlines();
				icebar1();
				print color 'bold blue';
				print"How much force shall you expend to freeze this\n";
				print"being? Each point of force will cost $spelltoicepoint mana and\n";
				print"will stall the thaw a length of time and do some\n";
				print"frost damage.\n\n";
				print"Your mana reserve is $mana percent full\n";				
				icebar2();
				
				print color 'bold blue'; print"Force To Frost: "; 
				print color 'bold cyan'; 
			
				$spelltoicedam = <STDIN>;
				chomp($spelltoicedam); 				
				print color 'reset';
				$spelltoicevarb = $spelltoicedam * $spelltoicepoint;
				if ($spelltoicevarb > $mana) {
				$spelltoicefail = 1;
				} else {
				$beingphase = $beingphase + $spelltoicedam;
				$mana = $mana - $spelltoicevarb;
				}
				
				$spelltoicetrig = 1;
				$magicexp = $magicexp + 0.05;
				} else {
				}
			} else {
			}
		} else {
		}
	} else {
	}
	} else {
	}				
}

sub castspellshock {
	if ($spellshock == 1){
	if ($magicexp >= 1) {
		if ($health >= 0) {
			if ($mana >= $spellshockmana) {
			$mana = $mana - $spellshockmana;
			$spellshocktime = 2;
			$spellshocktrig = 1;
			$nobeingevade = 2;
			$magicexp = $magicexp + 0.025;
			} else {
			}
		} else {
		}
	} else {
	}
	} else {
	}				
}

sub castspelllife {
	if ($spelllife == 1){
	if ($magicexp >= 1) {
		if ($health <= 0) {
			if ($mana >= $spelllifemana) {
				$mana = $mana - $spelllifemana;
				$health = 20;
				$pmagicexp = $pmagicexp + 0.1;
			} else {
			}
		} else {
		}
	} else {
	}
	} else {
	}		
}

sub castspellrage {
	if ($spellrage == 1){
	if ($magicexp >= 1) {
		if ($health > 0) {
			if ($mana >= $spellragemana) {
				$mana = $mana - $spellragemana;
				$spellragetime = 2;
				$spellragetrig = 1;
				$pmagicexp = $pmagicexp + 0.015;
			} else {
			}
		} else {
		}
	} else {
	}
	} else {
	}		
}

sub castspellsustenance {
	if ($spellsustenance == 1){
	if ($magicexp >= 1) {
		if ($health > 0) {
			if ($mana >= $spellsustenancemana) {
				$mana = $mana - $spellsustenancemana;
				$food = $food + 50;
				$pmagicexp = $pmagicexp + 0.025;
			} else {
			}
		} else {
		}
	} else {
	}
	} else {
	}		
}
 
sub castspellsoultransfer {
	if ($spellsoultransfer == 1) {
	if ($magicexp >= 1) {
		if ($beinginroom == 1) {

		if ($mana >= $spellsoultransfermana) {
			$mana = $mana - $spellsoultransfermana;	
			infinitenewlines();
				if ($beinghealth <= 0) {
				$healthbeingrate = 0;
				} else {
				$healthbeingrate = $beinghealth / $beinglife;
				#inflate x100 for a percentage
				$healthbeingrate = $healthbeingrate * 100;
				}			
			darkbar1();
			print color 'bold black';
			print"The being you seek to destroy claims hold to\n";
			print"health of $healthbeingrate percent...\n\n";
			print"Your mana reserve is at $mana and your current\n";
			print"vitality rests at $health percent\n\n";
			print"It is expected that each point of life transfered\n";
			print"will deplete your mana by $spellsoultransferpoint points\n";
			print color 'reset';
			darkbar2();
			if ($beinghealth > 0) {
				if ($mana > 0) {
					if ($spellsoultransferpoint > 0) {
					$manaallowtransfer = $mana / $spellsoultransferpoint;
					$possiblelifetake = $healthbeingrate + 1;
					} else {
					$manaallowtransfer = $mana;
					$possiblelifetake = $healthbeingrate + 1;
					}
				} else {
					$possiblelifetake = 0;
				}
			} else {
			$possiblelifetake = 0;
			}
			print color 'white'; print"Life To Take: "; 
			print color 'reset'; print color 'red'; 
			
				$spellsoultransferdam = <STDIN>;
				chomp($spellsoultransferdam);
				
			print color 'reset';	
			
				if ($spellsoultransferdam <= $possiblelifetake) {
					if ($spellsoultransferdam <= $manaallowtransfer) {
						
						if ($spellsoultransferpoint > 0) {
						$soultransfermanacost = $spellsoultransferdam * $spellsoultransferpoint;
						} else {
						$soultransfermanacost = $spellsoultransferdam;
						}
							
						if ($mana < $soultransfermanacost) {
						$spelltransfersoultrig0 = 1;
						} else {
						$mana = $mana - $soultransfermanacost; 
						$healthbeingrate = $healthbeingrate - $spellsoultransferdam;
							if ($healthbeingrate > 0) {
							#deflate back to 1 or less so we can multiply by it to get the beings real health
							$healthbeingrate = $healthbeingrate / 100;
							} else {
							$healthbeingrate = 0;
							}
						$beinghealth = $healthbeingrate * $beinglife;
						$health = $health + $spellsoultransferdam;
						$spelltransfersoultrig1 = 1;
						$wickedness = $wickedness + 1;
						$pmagicexp = $pmagicexp + 0.1;
						}
						
					} else {
					$spelltransfersoultrig0 = 1;
					}					
				} else {
				$spelltransfersoultrig0 = 1;
				}
		} else {
		}
		
		} else {
		}							
	} else {
	}
	} else {
	}		
}

####SPELLS##############
####SPELLS##############

##GUN#STUFF#############
sub smg9mmsetcheck {
	if ($smg9mmsetnbr == 1) {
		$smg9mmsetwrd = "semiauto";
		$smg9mmpower = $prj9mm;
	} elsif ($smg9mmsetnbr == 2) {
		$smg9mmsetwrd = "Burst (3RND)";
		$smg9mmpower = $prj9mm * 3;
	} elsif ($smg9mmsetnbr == 3) {
		$smg9mmsetwrd = "fullauto";
		$smg9mmpower = $prj9mm * 30;
	} else {
	}
}

sub smg45calsetcheck {
	if ($smg45calsetnbr == 1) {
		$smg45calsetwrd = "semiauto";
		$smg45calpower = $prj45cal;
	} elsif ($smg45calsetnbr == 2) {
		$smg45calsetwrd = "Burst (3RND)";
		$smg45calpower = $prj45cal * 3;
	} elsif ($smg45calsetnbr == 3) {
		$smg45calsetwrd = "fullauto";
		$smg45calpower = $prj45cal * 32;
	} else {
	}
}

sub gpop {
	if ($gpop >= 1) {
		# ~1000 RPM
		sleep(0.06);
		if ($gpopcolor == 1) {
		
			print color 'white';
			print"*";
			print color 'yellow';
			print"POP";
			print color 'reset'; print color 'white';
			print"*\n";
			soundFX_play_pop2();
			$counter9mm = $counter9mm + 1;
			$gpopcolor = 0;			
		} else {
			print color 'bold black';
			print"*";
			print color 'bold yellow';
			print"POP";
			print color 'reset'; print color 'bold black';
			print"*\n";
			soundFX_play_pop2();
			$counter9mm = $counter9mm + 1;
			$gpopcolor = 1;
		}
		print color 'reset';
		$gpop = $gpop - 1;
		gpop();
	} else {
	}
}

sub gpop45 {
	if ($gpop >= 1) {
		# ~650 RPM
		sleep(0.09);
		if ($gpopcolor == 1) {
		
			print color 'white';
			print"*";
			print color 'red';
			print"POP";
			print color 'reset'; print color 'white';
			print"*\n";
			soundFX_play_pop1();
			$counter45cal = $counter45cal + 1;
			$gpopcolor = 0;			
		} else {
			print color 'bold black';
			print"*";
			print color 'bold yellow';
			print"POP";
			print color 'reset'; print color 'bold black';
			print"*\n";
			soundFX_play_pop1();
			$counter45cal = $counter45cal + 1;
			$gpopcolor = 1;
		}
		print color 'reset';
		$gpop = $gpop - 1;
		gpop45();
	} else {
	}
}
##GUN#STUFF#END##########

##turn counter###########
sub clockup {
	$clock = $clock + 1;
}
##turn counter###########


##Level Check#############################################
sub levelcheck {
	
	if ($pintellect >= 11) {
		$intellect = 11;	
	} elsif ($pintellect >= 10) {
		$intellect = 10;	
	} elsif ($pintellect >= 9) {
		$intellect = 9;	
	} elsif ($pintellect >= 8) {
		$intellect = 8;
	} elsif ($pintellect >= 7) {
		$intellect = 7;
	} elsif ($pintellect >= 6) {
		$intellect = 6;	
	} elsif ($pintellect >= 5) {
		$intellect = 5;
	} elsif ($pintellect >= 4) {
		$intellect = 4;
	} elsif ($pintellect >= 3) {
		$intellect = 3;
	} elsif ($pintellect >= 2) {
		$intellect = 2;
	} elsif ($pintellect >= 1) {
		$intellect = 1;	
	} elsif ($pintellect >= 0) {
		$intellect = 0;	
	} else {
		$intellect = 0;
	}
	
	if ($psphysexp >= 4096) {
		$physexp = 12;
		$bodyhealthrate = 0.85;
	} elsif ($psphysexp >= 2048) {
		$physexp = 11;
		$bodyhealthrate = 0.8;
	} elsif ($psphysexp >= 1024) {
		$physexp = 10;
		$bodyhealthrate = 0.75;
	} elsif ($psphysexp >= 512) {
		$physexp = 9;
		$bodyhealthrate = 0.7;		
	} elsif ($psphysexp >= 256) {
		$physexp = 8;
		$bodyhealthrate = 0.65;
	} elsif ($psphysexp >= 128) {
		$physexp = 7;
		$bodyhealthrate = 0.6;	
	} elsif ($psphysexp >= 64) {
		$physexp = 6;
		$bodyhealthrate = 0.55;	
	} elsif ($psphysexp >= 32) {
		$physexp = 5;
		$bodyhealthrate = 0.5;	
	} elsif ($psphysexp >= 16) {
		$physexp = 4;
		$bodyhealthrate = 0.45;
	} elsif ($psphysexp >= 8) {
		$physexp = 3;
		$bodyhealthrate = 0.4;
	} elsif ($psphysexp >= 4) {
		$physexp = 2;
		$bodyhealthrate = 0.35;
	} elsif ($psphysexp >= 1) {
		$physexp = 1;
		$bodyhealthrate = 0.3;
	} elsif ($psphysexp >= 0) {
		$physexp = 0;
		$bodyhealthrate = 0.25;
	} else {
		$physexp = 0;
		$bodyhealthrate = 0.25;
	}	
	
	$pXCmagicexp = $pmagicexp + $armormagik;
	
	if ($pXCmagicexp >= 32) {
		$magicexp = 12;
	} elsif ($pXCmagicexp >= 25) {
		$magicexp = 11;
	} elsif ($pXCmagicexp >= 20.5) {
		$magicexp = 10;
	} elsif ($pXCmagicexp >= 17) {
		$magicexp = 9;
	} elsif ($pXCmagicexp >= 14) {
		$magicexp = 8;
	} elsif ($pXCmagicexp >= 11.5) {
		$magicexp = 7;
	} elsif ($pXCmagicexp >= 9) {
		$magicexp = 6;
	} elsif ($pXCmagicexp >= 7) {
		$magicexp = 5;
	} elsif ($pXCmagicexp >= 5) {
		$magicexp = 4;
	} elsif ($pXCmagicexp >= 3.5) {
		$magicexp = 3;
	} elsif ($pXCmagicexp >= 2) {
		$magicexp = 2;	
	} elsif ($pXCmagicexp >= 1) {
		$magicexp = 1;
	} elsif ($pXCmagicexp >= 0) {
		$magicexp = 0;		
	} else {
		$magicexp = 0;
	}

	if ($magicexp <= 0) {
		$spellragemana = 999999;
		$spellshockmana = 999999;
		$spelllifemana = 999999;
		$spellsoultransfermana = 999999;
		$spellsoultransferpoint = 999999;
		$spellburnmana = 999999;
		$spelltoicemana = 999999;
		$spelltoicepoint = 999999;
		$spelltoicelife = 0;
		$spellburndam =	0;
		$spellteleportmana = 999999;
		$spellteleportmana2 = 999999;
		$spellteleportdrain = 999999;
		$spellsustenancemana = 999999;
	} elsif ($magicexp == 1) {
		#vars depending on magic exp
		$spellragemana = 60;
		$spellshockmana = 45;
		$spelllifemana = 90;
		$spellsoultransfermana = 10;
		$spellsoultransferpoint = 3;
		$spellburnmana = 999999;
		$spelltoicemana = 5;
		$spelltoicepoint = 10;
		$spelltoicelife = 10;
		$spellburndam =	0;
		$spellteleportmana = 999999;
		$spellteleportmana2 = 999999;
		$spellteleportdrain = 50;
		$spellsustenancemana = 85;		
	} elsif ($magicexp == 2) {
		$spellragemana = 45;
		$spellshockmana = 35;
		$spelllifemana = 85;
		$spellsoultransfermana = 8;
		$spellsoultransferpoint = 2.5;
		$spellburnmana = 40;
		$spelltoicemana = 5;
		$spelltoicepoint = 8;
		$spelltoicelife = 20;		
		$spellburndam = 210;
		$spellteleportmana = 10;
		$spellteleportmana2 = 45;
		$spellteleportdrain = 50;
		$spellsustenancemana = 80;
	} elsif ($magicexp == 3) {
		$spellragemana = 30;
		$spellshockmana = 20;
		$spelllifemana = 80;
		$spellsoultransfermana = 5;
		$spellsoultransferpoint = 2.2;
		$spellburnmana = 30;
		$spelltoicemana = 4;
		$spelltoicepoint = 8;
		$spelltoicelife = 35;		
		$spellburndam = 450;
		$spellteleportmana = 10;
		$spellteleportmana2 = 45;
		$spellteleportdrain = 50;
		$spellsustenancemana = 75;
	} elsif ($magicexp == 4) {
		$spellragemana = 25;
		$spellshockmana = 18;
		$spelllifemana = 75;
		$spellsoultransfermana = 4;
		$spellsoultransferpoint = 2;
		$spellburnmana = 20;
		$spelltoicemana = 4;
		$spelltoicepoint = 6;
		$spelltoicelife = 50;		
		$spellburndam = 705;
		$spellteleportmana = 8;
		$spellteleportmana2 = 45;
		$spellteleportdrain = 50;
		$spellsustenancemana = 70;
	} elsif ($magicexp == 5) {
		$spellragemana = 20;
		$spellshockmana = 16;
		$spelllifemana = 70;
		$spellsoultransfermana = 4;
		$spellsoultransferpoint = 1.8;
		$spellburnmana = 16;
		$spelltoicemana = 3;
		$spelltoicepoint = 5;
		$spelltoicelife = 100;		
		$spellburndam = 1030;
		$spellteleportmana = 8;
		$spellteleportmana2 = 42;
		$spellteleportdrain = 50;
		$spellsustenancemana = 65;
	} elsif ($magicexp == 6) {
		$spellragemana = 15;
		$spellshockmana = 14;
		$spelllifemana = 60;
		$spellsoultransfermana = 4;
		$spellsoultransferpoint = 1.8;
		$spellburnmana = 14;
		$spelltoicemana = 3;
		$spelltoicepoint = 5;
		$spelltoicelife = 125;		
		$spellburndam = 1420;
		$spellteleportmana = 8;
		$spellteleportmana2 = 42;
		$spellteleportdrain = 50;
		$spellsustenancemana = 60;
	} elsif ($magicexp == 7) {
		$spellragemana = 10;
		$spellshockmana = 12;
		$spelllifemana = 55;
		$spellsoultransfermana = 4;
		$spellsoultransferpoint = 1.6;
		$spellburnmana = 12;
		$spelltoicemana = 3;
		$spelltoicepoint = 5;
		$spelltoicelife = 150;		
		$spellburndam = 1705;
		$spellteleportmana = 8;
		$spellteleportmana2 = 42;
		$spellteleportdrain = 50;
		$spellsustenancemana = 55;													
	} else {
		$spellragemana = 60;
		$spellshockmana = 45;
		$spelllifemana = 90;
		$spellsoultransfermana = 5;
		$spellsoultransferpoint = 3;
		$spellburnmana = 999999;
		$spelltoicemana = 5;
		$spelltoicepoint = 10;
		$spelltoicelife = 10;		
		$spellburndam =	0;
		$spellteleportmana = 999999;
		$spellteleportmana2 = 999999;
		$spellteleportdrain = 50;
		$spellsustenancemana = 85;				
	}
}
##Level Check#############################################

##Ghettomap
sub ghmap {
infinitenewlines();
sbluebar();
#this code is mangled, phj33r my l33t skillx0rz!
print color 'bold yellow'; print"Possible Directions:\n"; print color 'reset';

print'                    ';
if ($n == 1) { print color 'bold white'; print"     N     \n"; print color 'reset'; } else { print"\n"; }

print'                    ';
if ($nw == 1) { print" NW  "; } else { print"     "; } 
print color 'bold yellow'; print'A'; print color 'reset'; 
if ($ne == 1) { print"  NE \n"; } else { print"      \n"; }

print'                    ';
if ($up == 1) { print color 'bold green'; print"    U"; print color 'reset'; } else { print"     "; }
print color 'bold yellow'; print'|'; print color 'reset'; 
if ($up == 1) { print color 'bold green'; print"P    \n"; print color 'reset'; } else { print"\n"; }

print'                    ';
if ($w == 1) { print color 'bold white'; print"W"; print color 'reset'; } else { print" "; }
print color 'bold yellow'; print'<---'; print color 'reset';
print color 'bold blue'; print'+'; print color 'reset';
print color 'bold yellow'; print'--->'; print color 'reset';
if ($e == 1) { print color 'bold white'; print"E\n"; print color 'reset'; } else { print" \n"; }

print'                    ';
if ($down == 1) { print color 'green'; print"   DO"; print color 'reset'; } else { print"     "; }
print color 'bold yellow'; print'|'; print color 'reset'; 
if ($down == 1) { print color 'green'; print"WN   \n"; print color 'reset'; } else { print"\n"; }

print'                    ';
if ($sw == 1) { print" SW  "; } else { print"     "; }
print color 'bold yellow'; print'V'; print color 'reset'; 
if ($se == 1) { print"  SE \n"; } else { print"      \n"; }

print'                    ';
if ($s == 1) { print color 'bold white'; print"     S     \n"; print color 'reset'; } else { print"\n"; }

print"\n";

sbluebar2();			
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
	infinitenewlines();
}
##Ghettomap



##Cleanup######################################################################
sub cleanup {
$attacktrig = 0;
$playpaytrig = 0;
$bombbeing = 0;
$spellburntrig = 0;
$spellshocktrig = 0;
$spellragetrig = 0;
$possiblelifetake = 0;
$spelltransfersoultrig1 = 0;
$spelltransfersoultrig0 = 0;
$spelltoicetrig = 0;
$spelltoicefail = 0;
$spellteleporttrig = 0;
$spellteleporttrig2 = 0;
$knowspellburntrig = 0;
$knowspellsustenancetrig = 0;
$knowspellshocktrig = 0;
$knowspelllifetrig = 0;
$knowspellragetrig = 0;
$knowspellsoultransfertrig = 0;
$knowspelltoicetrig = 0;
$knowspellteleporttrig = 0;
$fired9mm = 0;
$fired45cal = 0;
$fired12ga = 0;
$firedRPGX14 = 0;
$smgfired = 0;
$brstfired = 0;
$smg45calfired = 0;
$brst45calfired = 0;
$noammoclick = 0;
$attackedaxe = 0;
$attackedsword = 0;
$attackedblunt = 0;
$keysewagecrdb = 0;
$messageda1a = 0;
$messageda2a = 0;
$messageda1l = 0;
$messageda2l = 0;

	if ((($bodypart_legR == 0) && ($bodypart_legL == 0)) or ($bodypart_torso == 0)) {		
		if (($bodypart_armR == 0) && ($bodypart_armL == 0)) {
			if ($movetog == 0) {
				$movetog = 7;
			} elsif ($movetog == 1) {
				$movetog = 0;
			} elsif ($movetog == 2) {
				$movetog = 1;
			} elsif ($movetog == 3) {
				$movetog = 2;
			} elsif ($movetog == 4) {
				$movetog = 3;
			} elsif ($movetog == 5) {
				$movetog = 4;
			} elsif ($movetog == 6) {
				$movetog = 5;
			} elsif ($movetog == 7) {
				$movetog = 6;		
			} else {
				$movetog = 0;
			}		
		} elsif (($bodypart_armR == 0) or ($bodypart_armL == 0)) {
			if ($movetog == 0) {
				$movetog = 5;
			} elsif ($movetog == 1) {
				$movetog = 0;
			} elsif ($movetog == 2) {
				$movetog = 1;
			} elsif ($movetog == 3) {
				$movetog = 2;
			} elsif ($movetog == 4) {
				$movetog = 3;
			} elsif ($movetog == 5) {
				$movetog = 4;			
			} else {
				$movetog = 0;
			}
		} else {
			if ($movetog == 0) {
				$movetog = 3;
			} elsif ($movetog == 1) {
				$movetog = 0;
			} elsif ($movetog == 2) {
				$movetog = 1;
			} elsif ($movetog == 3) {
				$movetog = 2;	
			} else {
				$movetog = 0;
			}
		}		
	} elsif (($bodypart_legR == 0) or ($bodypart_legL == 0)) {
		if ($movetog == 0) {
			$movetog = 1;
		} else {
			$movetog = 0;
		}
	} else {
		$movetog = 0;
	}

	if ($visualpsyc == '-1') {
		$visualpsyc = -1;
	} elsif ($visualpsyc > 0) {
		$visualpsyc = $visualpsyc - 1;
	} else {
	}
	
	if ($visualblind == '-1') {
		$visualblind = -1;
	} elsif ($visualblind > 0) {
		$visualblind = $visualblind - 1;
	} else {
	}
	
	if ($keysewagecrds > 0) {
		$keysewagecrds = $keysewagecrds - 1;
	} else {
	}
	
	if ($nobeingevade > 0) {
		$nobeingevade = $nobeingevade - 1;
	} else {
	}
	
	if ($immobile > 0) {
		$immobile = $immobile - 1;
	} else {
	}
	
	if ($spellshocktime > 0) {
		$spellshocktime = $spellshocktime - 1;
	} else {
	}
	
	if ($spellragetime > 0) {
		$spellragetime = $spellragetime - 1;
	} else {
	}	
}
##Cleanup######################################################################

##Assume We Are Done###########################################################
sub assume_we_are_done {
	$turn = $turn + 1;
	print color 'reset';
		#Infinite newlines...
	infinitenewlines();
		#get ready...
	maintask();
		#LOOP!!!
}
##Assume We Are Done###########################################################

sub poisonsick {
	if ($poisoned eq "perm") {
		$health = $health - $poisondam;
	} elsif ($poisoned > 0) {
		$health = $health - $poisondam;
		$poisoned = $poisoned - 1;
	} else {
		$poisoned = 0
	}
	
	if ($sick eq "perm") {
		$health = $health - $sickdam;
	} elsif ($sick > 0) {
		$health = $health - $sickdam;
		$sick = $sick - 1;
	} else {
		$sick = 0
	}	
}


sub deweaponize {
$class = 0;
$type = 'NA';
$gingertype = 'none';
$power = 0;
$magic = 0;
$weapprotect = 0;
$armsneeded = 0;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;
}

sub foodpick {
	infinitenewlines();
	inventorybar1();
	print color 'bold yellow'; print"Your Food Store:\n\n"; print color 'reset';

	if ($f_apple == 1) { print"1) 1 apple\n"; 
	} elsif ($f_apple > 1) { print"1) $f_apple apples\n";
	} else {
	}

	if ($f_carrot == 1) { print"2) 1 carrot\n"; 
	} elsif ($f_carrot > 1) { print"2) $f_carrot carrots\n";
	} else {
	}

	if ($f_bread == 1) { print"3) 1 loaf of bread\n"; 
	} elsif ($f_bread > 1) { print"3) $f_bread loaves of bread\n";
	} else {
	}

	if ($f_cake == 1) { print"4) 1 cake\n"; 
	} elsif ($f_cake > 1) { print"4) $f_cake cakes\n";
	} else {
	}

	if ($f_tripebread == 1) { print"5) 1 tripe loaf of bread\n"; 
	} elsif ($f_tripebread > 1) { print"5) $f_tripebread tripe loaves of bread\n";
	} else {
	}

	if ($f_lsd == 1) { print"6) 1 LSD cube\n"; 
	} elsif ($f_lsd > 1) { print"6) $f_lsd LSD cubes\n";
	} else {
	}
	
	if ($f_elixirhealth100 == 1) { print"7) 1 $colorelixirH100 elixir\n"; 
	} elsif ($f_elixirhealth100 > 1) { print"7) $f_elixirhealth100 $colorelixirH100 elixirs\n";
	} else {
	}
	
	if ($f_elixirpoison10 == 1) { print"8) 1 $colorelixirP10 elixir\n"; 
	} elsif ($f_elixirpoison10 > 1) { print"8) $f_elixirpoison10 $colorelixirP10 elixirs\n";
	} else {
	}
	
	print"\n";
	inventorybar2();
	print'What Article of Food Do You Wish To Devour (chose #): ';
	$foodchoose = <STDIN>;
	chomp($foodchoose);
	infinitenewlines();

	if ($foodchoose == 1) {	
		if ($f_apple >= 1) {
			$f_apple = $f_apple - 1;
			$food = $food + $fa_apple;
		} else {
		}
	} elsif ($foodchoose == 2) {		
		if ($f_carrot >= 1) {
			$f_carrot = $f_carrot - 1;
			$food = $food + $fa_carrot;
		} else {
		}
	} elsif ($foodchoose == 3) {
		if ($f_bread >= 1) {
			$f_bread = $f_bread - 1;
			$food = $food + $fa_bread;
		} else {
		}
	} elsif ($foodchoose == 4) {	
		if ($f_cake >= 1) {
			$f_cake = $f_cake - 1;
			$food = $food + $fa_cake;
		} else {
		}
	} elsif ($foodchoose == 5) {			
		if ($f_tripebread >= 1) {
			$f_tripebread = $f_tripebread - 1;
			$food = $food + $fa_tripebread;
			$poisoned = $poisoned + 5;
			$trigtripebread = 1;
		} else {
		}
	} elsif ($foodchoose == 6) {	
		if ($f_lsd >= 1) {
			$f_lsd = $f_lsd - 1;
			$food = $food + $fa_lsd;
			if ($visualpsyc == '-1') {
				$visualpsyc = -1;
			} else {
				$visualpsyc = $visualpsyc + 53;
			}
		} else {
		}
	} elsif ($foodchoose == 7) {	
		if ($f_elixirhealth100 >= 1) {
			$f_elixirhealth100 = $f_elixirhealth100 - 1;
			$food = $food + $fa_elixirhealth100;
			$glassbottleempty = $glassbottleempty + 1;
			$health = 100;
		} else {
		}
	} elsif ($foodchoose == 8) {	
		if ($f_elixirpoison10 >= 1) {
			$f_elixirpoison10 = $f_elixirpoison10 - 1;
			$food = $food + $fa_elixirpoison10;
			$glassbottleempty = $glassbottleempty + 1;
			$poisoned = $poisoned + 10;
			$visualblind = $visualblind + 7;
		} else {
		}						
	} else {
	}

}	

sub readownbook {
	infinitenewlines();
	cyanbar1();
	print color 'bold yellow'; print"Your Library:\n"; print color 'reset';
	
	print" 1) "; if ($ancientredbook == 1) { print"Ancient Red Book"; } else { }; print"\n";
	print" 2) "; if ($spellbookshock == 1) { print"Tome of Shock"; } else { }; print"\n";	
	print" 3) "; if ($spellbooklife == 1) { print"Spellbook of Life"; } else { }; print"\n";
	print" 4) "; if ($spellbookrage == 1) { print"Written Rag of Rage"; } else { }; print"\n";
	print" 5) "; if ($spellbooksoultransfer == 1) { print"Directions on Soultransfer, Volume 1"; } else { }; print"\n";
	print" 6) "; if ($spellbookburn == 1) { print"Book of Fire"; } else { }; print"\n";
	print" 7) "; if ($bookpr0n == 1) { print"Tome of the Best [Undecipherable]"; } else { }; print"\n";
	print" 8) "; if ($spellbooktoice == 1) { print"Book of Frost"; } else { }; print"\n";
	print" 9) "; if ($spellbookteleport == 1) { print"Ancient Treatise of Teleportation"; } else { }; print"\n";
	print"10) "; if ($bookjournal == 1) { print"Journal"; } else { }; print"\n";
	print"11) "; if ($spellbooksustenance == 1) { print"Writ of Sustenance"; } else { }; print"\n";	
	cyanbar2();
	print'What Do You Wish To Read (chose number): ';
	
	$readownbookchoose = <STDIN>;
	chomp($readownbookchoose);
	if ($readownbookchoose == 1) {
		if ($ancientredbook == 1) {
			$pintellect = $pintellect + 0.01;
		} else {
		}
	} elsif ($readownbookchoose == 2) {
		if ($spellbookshock == 1) {
			if ($spellshock == 0) {
				if ($intellect >= 2) {
					$spellshock = 1;
					$knowspellshocktrig = 1;
					$pintellect = $pintellect + 0.25;
					$spellsknown = "$spellsknown".' -shock- '; 
				} else {
				}
			} else {
			}
		} else {
		}
	} elsif ($readownbookchoose == 8) {
		if ($spellbooktoice == 1) {
			if ($spelltoice == 0) {
				if ($intellect >= 3) {
					$spelltoice = 1;
					$knowspelltoicetrig = 1;
					$pintellect = $pintellect + 0.25;
					$spellsknown = "$spellsknown".' -toice- '; 
				} else {
				}
			} else {
			}
		} else {
		}
	} elsif ($readownbookchoose == 9) {
		if ($spellbookteleport == 1) {
			if ($spellteleport == 0) {
				if ($intellect >= 5) {
					$spellteleport = 1;
					$knowspellteleporttrig = 1;
					$pintellect = $pintellect + 0.6;
					$spellsknown = "$spellsknown".' -teleport- ';
				} else {
				}
			} else {
			}
		} else {
		}
	} elsif ($readownbookchoose == 10) {
		if ($bookjournal == 1) {
			infinitenewlines();
			cyanbar1();
			print color 'bold yellow'; print"Journal:";
			print color 'reset';
			print"$journalread\n";
			cyanbar2();
			if ($blackbppen == 1 & $bbpink > 0) {
				print'Enter That Which You Wish To Add: ';
				
				$journaladd = <STDIN>;
				chomp($journaladd);
				
				if ($journaladd	eq "") {			
				} else {
				$bbpink	= $bbpink - 1;	
				$journalread = "$journalread\n"."$journaladd";
				}
				
			} else {
				$placeholder = <STDIN>;
				chomp($placeholder);
			}
						
			if ($bbpink < 0) {
				$bbpink = 0;
			} else {
			}			
		} else {
		}						
	} elsif ($readownbookchoose == 3) {
		if ($spellbooklife == 1) {
			if ($spelllife == 0) {
				if ($intellect >= 2) {
					$spelllife = 1;
					$knowspelllifetrig = 1;
					$pintellect = $pintellect + 0.3;
					$spellsknown = "$spellsknown".' -life- ';
				} else {
				}
			} else {
			}
		} else {
		}
	} elsif ($readownbookchoose == 4) {
		if ($spellbookrage == 1) {
			if ($spellrage == 0) {
				if ($intellect >= 1) {
					$spellrage = 1;
					$knowspellragetrig = 1;
					$pintellect = $pintellect + 0.15;
					$spellsknown = "$spellsknown".' -rage- ';
				} else {
				}
			} else {
			}
		} else {
		}	
	} elsif ($readownbookchoose == 5) {
		if ($spellbooksoultransfer == 1) {
			if ($spellsoultransfer == 0) {
				if ($intellect >= 3) {
					$spellsoultransfer = 1;
					$knowspellsoultransfertrig = 1;
					$pintellect = $pintellect + 0.5;
					$spellsknown = "$spellsknown".' -soultransfer- ';
				} else {
				}
			} else {
			}
		} else {
		}		
	} elsif ($readownbookchoose == 6) {
		if ($spellbookburn == 1) {
			if ($spellburn == 0) {
				if ($intellect >= 2) {
					$spellburn = 1;
					$knowspellburntrig = 1;
					$pintellect = $pintellect + 0.2;
					$spellsknown = "$spellsknown".' -burn- ';
				} else {
				}
			} else {
			}
		} else {
		}
	} elsif ($readownbookchoose == 11) {
		if ($spellbooksustenance == 1) {
			if ($spellsustenance == 0) {
				if ($intellect >= 1) {
					$spellsustenance = 1;
					$knowspellsustenancetrig = 1;
					$pintellect = $pintellect + 0.2;
					$spellsknown = "$spellsknown".' -sustenance- ';
				} else {
				}
			} else {
			}
		} else {
		}		
	} elsif ($readownbookchoose == 7) {
		if ($bookpr0n == 1) { 
			if ($intellect > 0) {
				bpbcf();		
				$pintellect = $pintellect + 0.005;
			} else {
			}
		} else {
		}					
	} else {
	}	
}

##Enlightenment################################################################
sub enlightenment {
	if ($beinginroom == 1) {	
		$enlightenmentluck = int(rand(6));
		if ($enlightenmentluck == 3) {
			if ($beinghealth <= 0) {
			$healthbeingrate = 0;
			} else {
			$healthbeingrate = $beinghealth / $beinglife;
			$healthbeingrate = $healthbeingrate * 100;
			}
			infinitenewlines();
			cyanbar1();
			print"\n";
			print"You have been enlightened with knowledge....\n";
			print"The being has a strenth of attack equal to $beingattack \n";
			print"and is wearing class $beingdefend armor. It has\n";
			print"$beingluck degrees of luck and is at\n";
			print"$healthbeingrate percent of normal health\n\n"; 
			cyanbar2();
			print"press enter...";
			$placeholder = <STDIN>;
			chomp($placeholder);
			
		}
	} else {
		$enlightenmentluck = int(rand(50));	
	}		
}
##Enlightenment################################################################


##(re)ASSIGN DAMAGE AND ATTRIBUTES TO BEING########################################
sub beingattr {		
	if ($beinghealth <= 0) {
		$beinginroom = 0;
	} else {
	}
	
	if ($beingname eq "rat1") {
		ratbeing1_pull();
		#here we assign all the being vars to ratbeing1 vars so if, lets say, 
		#rat1 was damaged by your weapon it would be assigned the dammage
	} elsif ($beingname eq 'rat2') {
		ratbeing2_pull();
	} elsif ($beingname eq 'cat1') {
		catbeing1_pull();				
	} elsif ($beingname eq 'spider1') {
		spiderbeing1_pull();
	} elsif ($beingname eq 'pincer1') {
		pincerbeing1_pull();
	} elsif ($beingname eq 'pincer2') {
		pincerbeing2_pull();	
	} elsif ($beingname eq 'droid1') {
		droidbeing1_pull();
	} elsif ($beingname eq 'droid2') {
		droidbeing2_pull();	
	} elsif ($beingname eq 'thugg1') {
		thuggbeing1_pull();
	} elsif ($beingname eq 'sage1') {
		sagebeing1_pull();	
	} elsif ($beingname eq 'snake1') {
		snakebeing1_pull();
	} elsif ($beingname eq 'snake2') {
		snakebeing2_pull();
	} elsif ($beingname eq 'alligator1') {
		alligatorbeing1_pull();													
	} else {
	}
}
##(re)ASSIGN DAMAGE AND ATTRIBUTES TO BEING########################################

#inpho for room
sub roominfo {
	if ($messageda1a == 1) {
		$info = '      This weapon requires an arm to weild      ';	
	} elsif ($messageda2a == 1) {
		$info = '     This weapon requires two arms to weild     ';
	} elsif ($messageda1l == 1) {
		$info = '      This weapon requires a leg to weild       ';	
	} elsif ($messageda2l == 1) {
		$info = '     This weapon requires two legs to weild     ';	
	} else {
		#N/A
	}
	infotrack();

	if ($evadeinfo == 1) {
		$info2 = "      ...The being evaded your attack...        ";
	} elsif ($noammoclick == 1) {
		$info2 = "                    *CLICK*                     ";		
	} elsif ($spellragetrig == 1) {
		$info2 = "...You feel a great torrent well up inside you..";
	} elsif ($spellburntrig == 1) {
		$info2 = "    ...You incinerate part of the being...      ";
	} elsif ($spellteleporttrig == 1) {
		$info2 = "...You study the spacial fabric of this area... ";
	} elsif ($spellteleporttrig2 == 1) {
		$info = "..You expend great energy on thought and enter a";
		$info2 = "deep trance.Your mind and body are transferred..";					
	} elsif ($spelltransfersoultrig1 == 1) {
		$info = ".You sence a great aura of 3vil surrounding you.";
		$info2 = "           ...You laugh wickedly...             ";
	} elsif ($spelltransfersoultrig0 == 1) {
		$info2 = "  ...Your inexperience with magic is evident... ";
	} elsif ($spelltoicefail == 1) {
		$info2 = "  ...Your inexperience with magic is evident... ";
	} elsif ($spelltoicetrig == 1) {
		$info2 = "            ...You cast toice...                ";
	} elsif ($trigtripebread == 1) {
		$info2 = "          That bread was rancid!!!              ";
		$trigtripebread	= 0;	
	} elsif ($droid1attacktrig == 1) {
		if ($beinginroom == 1) {
		$info = " You attack the droid and trigger it's defences ";
		} else {
		}
		$droid1attacktrig = 0;
		$droid1attacktrig2 = 1;
	} elsif ($droid2attacktrig == 1) {
		if ($beinginroom == 1) {
		$info = " You attack the droid and trigger it's defences ";
		} else {
		}
		$droid2attacktrig = 0;
		$droid2attacktrig2 = 1;			
	} elsif ($knowspellburntrig == 1) {
		$info = "         You learn the spell of burn            ";		
	} elsif ($knowspellshocktrig == 1) {
		$info = "         You learn the spell of shock           ";
	} elsif ($knowspelllifetrig == 1) {
		$info = "         You learn the spell of life            ";
	} elsif ($knowspellragetrig == 1) {
		$info = "         You learn the spell of rage            ";
	} elsif ($knowspellsoultransfertrig == 1) {
		$info = "      You learn the spell of soultransfer       ";
	} elsif ($knowspelltoicetrig == 1) {
		$info = "         You learn the spell of toice           ";
	} elsif ($knowspellteleporttrig == 1) {
		$info = "         You learn the spell teleport           ";
	} elsif ($knowspellsustenancetrig == 1) {
		$info = "      You learn the spell of sustenance         ";														
	} else {
	}
	
	if ($food <= 0) {
		$info = "              You are starving                  ";
	} elsif ($food == 50) {
		$info = "            You feel a bit hungry               ";
	} elsif ($food == 30) {
		$info = "           You feel the urge to eat             ";
	} elsif ($food == 20) {
		$info = "             You are very hungry                ";
	} elsif ($food == 10) {
		$info = "           You are extremly hungry              ";				
	} else {
	}
	
t5(); 
	if ($visualpsyc != 0) {
		$vpsycrand  = int(rand(9));
		if ($vpsycrand == 1) {
			print color 'blue';
		} elsif ($vpsycrand == 2) {
			print color 'magenta';
		} elsif ($vpsycrand == 3) {
			print color 'cyan';
		} elsif ($vpsycrand == 4) {
			print color 'red';
		} elsif ($vpsycrand == 5) {
			print color 'bold yellow';
		} elsif ($vpsycrand == 6) {
			print color 'bold red';
		} elsif ($vpsycrand == 7) {
			print color 'bold blue';
		} elsif ($vpsycrand == 8) {
			print color 'bold cyan';
		} else {
			print color 'bold magenta';
		}
		
		$vpsycrand  = int(rand(2));
		if ($vpsycrand == 1) {
			$info = reverse $info;
		} else {
			#do nothing
		}
	} else {
		print color "$colorinfo"; 
	}
print"$info"; print color 'reset'; t6(); print"\n";

t6();  
	if ($visualpsyc != 0) {
		$vpsycrand  = int(rand(9));
		if ($vpsycrand == 1) {
			print color 'blue';
		} elsif ($vpsycrand == 2) {
			print color 'magenta';
		} elsif ($vpsycrand == 3) {
			print color 'cyan';
		} elsif ($vpsycrand == 4) {
			print color 'red';
		} elsif ($vpsycrand == 5) {
			print color 'bold yellow';
		} elsif ($vpsycrand == 6) {
			print color 'bold red';
		} elsif ($vpsycrand == 7) {
			print color 'bold blue';
		} elsif ($vpsycrand == 8) {
			print color 'bold cyan';
		} else {
			print color 'bold magenta';
		}
		
		$vpsycrand  = int(rand(2));
		if ($vpsycrand == 1) {
			$info2 = reverse $info2;
		} else {
			#do nothing
		}
	} else {
		print color "$colorinfo"; 
	}
print"$info2"; print color 'reset'; t5(); print"\n";
$evadeinfo = 0;
}

sub beinginfo {
t6();	
	themebeinginfo();
	if ($beinginroom == 1) {
		if ($beingphase >= 1) {
		
		print colored(" BEING: $pbeinghandle","$colorbeingice1 on_$colorbeingice2");		
		} else {
		print colored(" BEING: $pbeinghandle","$colorbeing1 on_$colorbeing2");
		}
	} else { 
		print colored(" BEING:                                         ","$colorbeingnull1 on_$colorbeingnull2");
	}
t5(); print"\n";
}

#Top Iface with compass etc
sub topinfobar{
print color "$colorcompass1"; print'      N      '; print color 'reset'; print'            A = Attack'; print"\n";
print color "$colorcompass2"; print'    NW'; print color 'reset'; print color "$colorcompass1"; print'|'; print color 'reset'; 
	print color "$colorcompass2"; print'NE     '; print color 'reset'; 
print color "$colorcompassu"; print'UP'; print color 'reset'; print'         X = Choose Weapon'; print"\n";
print color "$colorcompass1"; print'  W---+---E  '; print color 'reset'; print'            Z = Choose Armor'; print"\n";
print color "$colorcompass2"; print'    SW'; print color 'reset'; print color "$colorcompass1"; print'|'; print color 'reset'; 
	print color "$colorcompass2"; print'SE    ';print color 'reset'; 
print color "$colorcompassd"; print'DOWN'; print color 'reset'; print'        H = Help   '; t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6();print"\n";
print color "$colorcompass1"; print'      S         '; print color 'reset'; print'         ? = Status '; t6();

if ($sick eq "perm" & $poisoned eq "perm" & $starve > 0) {
print colored ("PSN+SCK+STRV",'bold black on_black');
} elsif ($sick eq "perm" & $poisoned > 0 & $starve > 0) {
print colored ("PSN+SCK+STRV",'bold black on_black');
} elsif ($sick > 0 & $poisoned eq "perm" & $starve > 0) {
print colored ("PSN+SCK+STRV",'bold black on_black');
} elsif ($sick > 0 & $poisoned > 0 & $starve > 0) {
print colored ("PSN+SCK+STRV",'bold black on_black');
} elsif ($starve > 0 & $poisoned eq "perm") {
print colored ("POISON++STRV",'bold black on_black');
} elsif ($starve > 0 & $poisoned > 0) {
print colored ("POISON++STRV",'bold black on_black');
} elsif ($sick eq "perm" & $starve > 0) {
print colored ("STARVE++SICK",'bold black on_black');
} elsif ($sick > 0 & $starve > 0) {
print colored ("STARVE++SICK",'bold black on_black');
} elsif ($sick eq "perm" & $poisoned eq "perm") {
print colored ("POISON++SICK",'bold black on_black');
} elsif ($sick eq "perm" & $poisoned > 0) {
print colored ("POISON++SICK",'bold black on_black');
} elsif ($sick > 0 & $poisoned eq "perm") {
print colored ("POISON++SICK",'bold black on_black');
} elsif ($sick > 0 & $poisoned > 0) {
print colored ("POISON++SICK",'bold black on_black');
} elsif ($sick eq "perm") {
print colored ("    SICK    ",'bold black on_black');
} elsif ($poisoned eq "perm") {
print colored ("  POISONED  ",'bold black on_black');
} elsif ($sick > 0) {
print colored ("    SICK    ",'bold black on_black');
} elsif ($poisoned > 0) {
print colored ("  POISONED  ",'bold black on_black');
} elsif ($starve > 0) {
print colored ("  STARVING  ",'bold black on_black');
} else {
print colored ("            ",'bold black on_black');
}

t5();

print"\n";
print color 'reset';
}


#Are we dead?
sub deadyet {
	if  ($health <= 0) {
		$die = 1;
		deathdestructiondecay();
	} elsif ($starve >= 4) {
		$starvedie = 1;
		$die = 1;
		deathdestructiondecay();
	} elsif ($bodypart_head == 0) {
		$die = 1;
		deathdestructiondecay();
	} elsif ($bodypart_chest == 0) {
		$die = 1;
		deathdestructiondecay();
	} elsif ($bodypart_kneck == 0) {
		$die = 1;
		deathdestructiondecay();		
	} else { 
	}
}

#Help and status inpho
sub helpstatusinpho {
infinitenewlines();
inventorybar1();
print color 'bold yellow';
print"                     Commands                       \n"; print color 'reset';
print color 'bold white'; print' N '; print color 'reset'; print"or "; print color 'bold white'; print"n"; print color 'reset'; print"   go north          "; print color 'bold white'; print"NE"; print color 'reset'; print" or"; print color 'bold white'; print" ne   "; print color 'reset'; print"go northeast\n";
print color 'bold white'; print' S '; print color 'reset'; print"or "; print color 'bold white'; print"s"; print color 'reset'; print"   go south          "; print color 'bold white'; print"SE"; print color 'reset'; print" or"; print color 'bold white'; print" se   "; print color 'reset'; print"go southeast\n";
print color 'bold white'; print' E '; print color 'reset'; print"or "; print color 'bold white'; print"e"; print color 'reset'; print"   go east           "; print color 'bold white'; print"NW"; print color 'reset'; print" or"; print color 'bold white'; print" nw   "; print color 'reset'; print"go northwest\n";
print color 'bold white'; print' W '; print color 'reset'; print"or "; print color 'bold white'; print"w"; print color 'reset'; print"   go west           "; print color 'bold white'; print"SW"; print color 'reset'; print" or"; print color 'bold white'; print" sw   "; print color 'reset'; print"go southwest\n";
print color 'bold white'; print' UP '; print color 'reset'; print"or "; print color 'bold white'; print"up "; print color 'reset'; print"    go up a ladder etc in middle of room\n";
print color 'bold white'; print' DOWN '; print color 'reset'; print"or "; print color 'bold white'; print"down"; print color 'reset'; print" go down a ladder etc in middle of room\n";
print color 'bold white'; print' MAP '; print color 'reset'; print"or "; print color 'bold white'; print"map"; print color 'reset'; print"   displays possible directions to travel\n";
print color 'bold white'; print' I'; print color 'reset'; print" or"; print color 'bold white'; print" i"; print color 'reset'; print"   list your inventory\n";
print color 'bold white'; print' Z'; print color 'reset'; print" or"; print color 'bold white'; print" z"; print color 'reset'; print"   choose armor to wear\n";
print color 'bold white'; print' X'; print color 'reset'; print" or"; print color 'bold white'; print" x"; print color 'reset'; print"   chose weapon to weild\n";
print color 'bold white'; print' A'; print color 'reset'; print" or"; print color 'bold white'; print" a"; print color 'reset'; print"   attack something\n";
print color 'bold white'; print' L'; print color 'reset'; print" or"; print color 'bold white'; print" l"; print color 'reset'; print"   browse your library of fine literature\n";
print color 'bold white'; print' R'; print color 'reset'; print" or"; print color 'bold white'; print" r "; print color 'reset'; print"  display an inscription in a room or book\n";
print color 'bold white'; print' B'; print color 'reset'; print" or"; print color 'bold white'; print" b "; print color 'reset'; print"  detonates a bomb in the current room\n";
print color 'bold white'; print' H'; print color 'reset'; print" or"; print color 'bold white'; print" h "; print color 'reset'; print"  displays this screen\n";
print color 'bold white'; print' P'; print color 'reset'; print" or"; print color 'bold white'; print" p "; print color 'reset'; print"  play game you are standing at and/or pay\n";
print color 'bold white'; print' M'; print color 'reset'; print" or"; print color 'bold white'; print" m "; print color 'reset'; print"  list known spells\n";
print color 'bold white'; print' F'; print color 'reset'; print" or"; print color 'bold white'; print" f "; print color 'reset'; print"  browse your food store\n";
print color 'bold white'; print' C'; print color 'reset'; print" or"; print color 'bold white'; print" c "; print color 'reset'; print"  change magazine, ready arrow, load bolt\n";
print color 'bold white'; print' +'; print color 'reset'; print" or"; print color 'bold white'; print' - '; print color 'reset'; print"  add/subtract (control for some terminals)\n";
print color 'bold white'; print' ?        '; print color 'reset'; print"status of player\n";
print color 'bold white'; print" cast spellname"; print color 'bold reset'; print"                 cast a certain spell\n";
print color 'bold white'; print" save exploits"; print color 'bold reset'; print"   save a log of your RPG1 session\n";
print color 'bold white'; print" infomenu"; print color 'bold reset'; print"   display infomenu\n";
print color 'bold white'; print" music "; print color 'bold reset'; print"     toggle music\n";
print color 'bold white'; print" exit"; print color 'bold reset'; print"       exit the game\n";
inventorybar2();
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
	
infinitenewlines();
inventorybar1();
print color 'bold yellow';
print"                 Commands Continued                 \n"; print color 'reset';
print color 'bold white'; print' buffer'; print color 'reset'; print"   view info buffer\n";
print color 'bold white'; print' cbuffer'; print color 'reset'; print"  view command buffer\n";
print color 'bold white'; print' rbuffer'; print color 'reset'; print"  view read buffer\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
print"\n";
inventorybar2();
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);	
}

sub statusonlyinfo {
infinitenewlines();

if ($die == 1) {
	bloodbar1();
} else {
	inventorybar1();
}

print color 'bold yellow'; 
print"                       Status                       \n"; print color 'reset';

print' Armor Worn: ';

print"$armorginger\n";

print' Greatest Possible Protection By Armor: ';

print"$armordefend\n";

print' Durability of Armor: ';

print"$armordur\n\n";
	
print' Weapon Weilded: ';

print"$gingertype";
if ($gingertype eq 'SMG 9MM') {
	if ($smg9mmsetnbr == 1) {
		print' (Semiautomatic)';
	} elsif ($smg9mmsetnbr == 2) {
		print' (Three Round Burst)';		
	} elsif ($smg9mmsetnbr == 3) {
		print' (Fully Automatic)';
	} else {

	}
} elsif ($gingertype eq '.45 SMG Carbine') {
	if ($smg45calsetnbr == 1) {
		print' (Semiautomatic)';
	} elsif ($smg45calsetnbr == 2) {
		print' (Three Round Burst)';		
	} elsif ($smg45calsetnbr == 3) {
		print' (Fully Automatic)';
	} else {

	} 
} else {
}
print"\n";


print' Greatest Possible Force: ';

print"$force\n";

print' Greatest Possible Protection By Weapon: ';

print"$wprotect\n\n";

print' Magic Exp: ';
print color 'green';
print"$magicexp";
print color 'reset';
print' | Intellect: ';
print color 'cyan';
print"$intellect";
print color 'reset';
print' | Physical Exp: ';
print color 'bold yellow';
print"$physexp\n";
print color 'reset';
print" Music is ";

	if ($ogg123 == 1) {
	print"enabled\n";
	} else {
	print"disabled\n";
	}

print'    '; printbody0(); print"\n";
print'    '; printbody1();

	print'      Health: ';
	if ($health <= 0) {
	print color 'red'; print" 0\n"; print color 'reset';
	} elsif ($health >= 100) {
	print color 'red'; print" 100\n"; print color 'reset';
	} else {
	print color 'red'; print" $health\n"; print color 'reset';
	}

print'    '; printbody2();

	print'      Mana: ';
	if ($mana <= 0) {
	print color 'magenta'; print" 0\n"; print color 'reset';
	} elsif ($mana >= 100) {
	print color 'magenta'; print" 100\n"; print color 'reset';
	} else {
	print color 'magenta'; print" $mana\n"; print color 'reset';
	}
	
print'    '; printbody3();

	print'      Food: ';
	if ($food <= 0) {
	print color 'bold green'; print" 0\n"; print color 'reset';
	} elsif ($food >= $foodmax) {
	print color 'bold green'; print" $foodmax\n"; print color 'reset';
	} else {
	print color 'bold green'; print" $food\n"; print color 'reset';
	}	

print'    '; printbody4(); print"\n";
print'    '; printbody5();

	if ($sick eq "perm") {
	print"      You are sick\n";
	} elsif ($sick > 0) {
	print"      You are sick\n";
	} else {
	print"\n";
	}
	
print'    '; printbody6();

	if ($poisoned eq "perm") {
	print"     You are poisoned\n";
	} elsif ($poisoned > 0) {
	print"     You are poisoned\n";
	} else {
	print"\n";
	}

print'    '; printbody7();

	if ($visualpsyc != 0) {
	print"    You are hallucinating\n";
	} else {
	print"\n";
	}

print'    '; printbody8();

	if ($visualblind != 0) {
	print"   You are blind\n";
	} else {
	print"\n";
	}

print'    '; printbody9(); print"\n";
print'    '; printbody10(); print"\n";
print'    '; printbody11(); print"\n";
print'    '; printbody12(); print"\n";
print'    '; printbody13(); print"\n";
print'    '; printbody14(); print"\n\n";
	
if ($debugmode == 1) {
print"Room is $room\n";
} else {
}

if ($die == 1) {
	bloodbar2();
} else {
	inventorybar2();
}			
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
}



##DAMAGEBEING##########################
sub damagebeing {

	if ($health <= 0) {
		$wprotect = 0;
	} elsif ($health <= 5) {
		$wprotect = $weapprotect * 0.1;		
	} elsif ($health <= 10) {
		$wprotect = $weapprotect * 0.2;		
	} elsif ($health <= 15) {
		$wprotect = $weapprotect * 0.3;			
	} elsif ($health <= 20) {
		$wprotect = $weapprotect * 0.4;		
	} elsif ($health <= 25) {
		$wprotect = $weapprotect * 0.5;
	} elsif ($health <= 40) {
		$wprotect = $weapprotect * 0.7;		
	} elsif ($health <= 50) {
		$wprotect = $weapprotect * 1.0;
	} elsif ($health <= 60) {
		$wprotect = $weapprotect * 1.2;			
	} elsif ($health <= 75) {
		$wprotect = $weapprotect * 1.5;
	} elsif ($health <= 80) {
		$wprotect = $weapprotect * 1.6;
	} elsif ($health <= 85) {
		$wprotect = $weapprotect * 1.8;				
	} elsif ($health <= 90) {
		$wprotect = $weapprotect * 2.0;							
	} else {
		$wprotect = $weapprotect * 2.0;
	}

	if ($physexp <= 0) {
		$fcphysexp = 0.1;
	} else {
		$fcphysexp = $physexp;
	}
	
	if ($health <= 0) {
		$force = 0;
	} elsif ($class == 8) {
		$force = $power;
	} elsif ($class == 10) {
		$force = $power;
	} elsif ($class == 11) {
		$force = $power;
	} elsif ($class == 12) {
		$force = $power;		
	} elsif ($class == 13) {
		$force = $power;		
	} elsif ($class == 14) {
		$force = $power;
	} elsif ($class == 17) {
		$force = $power;									
	} elsif ($health <= 1) {
		$force = (($power * 0.1) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 3) {
		$force = (($power * 0.2) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 5) {
		$force = (($power * 0.4) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 10) {
		$force = (($power * 0.6) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 15) {
		$force = (($power * 0.8) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 20) {
		$force = (($power * 1.0) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 25) {
		$force = (($power * 1.2) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 30) {
		$force = (($power * 1.4) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 35) {
		$force = (($power * 1.8) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 40) {
		$force = (($power * 2.0) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 45) {
		$force = (($power * 2.2) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 50) {
		$force = (($power * 2.6) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 55) {
		$force = (($power * 2.8) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 60) {
		$force = (($power * 3.2) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 65) {
		$force = (($power * 3.6) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 70) {
		$force = (($power * 3.8) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 75) {
		$force = (($power * 4.0) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 80) {
		$force = (($power * 4.2) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 85) {
		$force = (($power * 4.4) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 90) {
		$force = (($power * 4.6) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 95) {
		$force = (($power * 5.0) * (1 + ($fcphysexp / 10)));
	} elsif ($health <= 100) {
		$force = (($power * 5.4) * (1 + ($fcphysexp / 10)));																																						
	} else {
		$force = (($power * 5.4) * (1 + ($fcphysexp / 10)));
	}
	
}
##DAMAGEBEING##########################



##RESETFIGHT###########################
#get rid of person for a moment, JIC
sub resetfight {
$beinginroom = 0;
$beinghealth = 0;
$beingattack = 0;
$beingdefend = 0;
$beingarmor = 0;
$beingluck = 0;
$beingname = " ";
$beinghandle = " ";
$beinglife = 0;
$beingphase = 0;
$beingweapon = 0;
}
##RESETFIGHT###########################

#(these are simple for now and will be improved)
##ATTACKBEING############################
#assault something
sub attackbeing {
	if ($beingname eq "droid1") {
		if ($droid1attacktrig2 == 1) {
		} else {
		$beingattack = 40;
		$droid1attacktrig = 1;
		}
	} elsif ($beingname eq "droid2") {
		if ($droid2attacktrig2 == 1) {
		} else {
		$beingattack = 40;
		$droid2attacktrig = 1;
		}	
	} else {
	}
	
	if ($beinghealth > 0) {
		if ($spellragetime > 0) {
			if ($class == 8) {
			#dosent affect guns!
			} elsif ($class == 10) {
			#dosent affect guns!
			} elsif ($class == 11) {
			#dosent affect guns!
			} elsif ($class == 12) {
			#dosent affect guns!
			} elsif ($class == 13) {
			#dosent affect guns!
			} elsif ($class == 14) {
			#dosent affect cannons!
			} elsif ($class == 16) {
			#dosent affect lasers!
			} elsif ($class == 17) {
			#dosent affect explosives!						
			} else {
			$force = $force * 3;
			}
		} else {
		}
		
		if ($class == 8) {
			if ($bullet9mmamount >= 1) {
				if ($gingertype eq 'SMG 9MM') {
					if ($smg9mmcapacity <= 0) {
						infinitenewlines();
						print"*CLICK*\n\n\n\n\n\n";
						soundFX_play_click();
						$smg9mmcapacity = 0;
						sleep(1);
						print"\n";
					} elsif ($smg9mmsetnbr == 1) {
							$fired9mm = 1;
							infinitenewlines();
							print color 'bold black';
							print"*";
							print color 'bold yellow';
							print"POP";
							print color 'reset'; print color 'bold black';
							print"*\n\n\n\n\n\n";
							$counter9mm = $counter9mm + 1;
							print color 'reset';
							soundFX_play_pop2();
							sleep(1);
							print"\n";
							$smg9mmcapacity = $smg9mmcapacity - 1;
							$bullet9mmamount = $bullet9mmamount - 1;
							attackingluck();		
					} elsif ($smg9mmsetnbr == 2) {
						if ($bullet9mmamount >= 3) {
							$fired9mm = 1;
							$brstfired = 1;
							infinitenewlines();
							
							if ($smg9mmcapacity <= 3) {
								$gpop = $smg9mmcapacity;
								$force = $smg9mmcapacity * $prj9mm;
								$smg9mmcapacity = 0;
								$bullet9mmamount = $bullet9mmamount - $smg9mmcapacity;
							} else {
								$gpop = 3;
								$bullet9mmamount = $bullet9mmamount - 3;
								$smg9mmcapacity = $smg9mmcapacity - 3;
							}
							
							gpop();
							print"\n\n\n\n\n\n";
							sleep(1);
							print"\n";
							$gpop = 0;
							
							attackingluck();
						} else {
							$fired9mm = 1;
							if (($bullet9mmamount >= 2) && ($smg9mmcapacity >= 2)) {
								$brstfired = 1;
							} else {
							}
							
							infinitenewlines();
							
							if ($smg9mmcapacity >= $bullet9mmamount) {
								$gpop = $bullet9mmamount;
								$force = $bullet9mmamount * $prj9mm;
								$bullet9mmamount = $bullet9mmamount - $bullet9mmamount;
							} else {
								$gpop = $smg9mmcapacity;
								$force = $smg9mmcapacity * $prj9mm;
								$bullet9mmamount = $bullet9mmamount - $smg9mmcapacity;
							}
							
							$smg9mmcapacity = 0;
							gpop();
							print"*CLICK*\n\n\n\n\n\n";
							soundFX_play_click();
							sleep(1);
							print"\n";
							$gpop = 0;
							
							attackingluck();
						}
					} elsif ($smg9mmsetnbr == 3) {
						if ($bullet9mmamount >= 30) {
							$fired9mm = 1;
							$smgfired = 1;
							infinitenewlines();
							
							if ($smg9mmcapacity <= 30) {
								$gpop = $smg9mmcapacity;
								$force = $smg9mmcapacity * $prj9mm;
								$smg9mmcapacity = 0;
								$bullet9mmamount = $bullet9mmamount - $smg9mmcapacity;
							} else {
								$gpop = 30;
								$bullet9mmamount = $bullet9mmamount - 30;
								$smg9mmcapacity = $smg9mmcapacity - 30;
							}
							
							gpop();
							print"*CLICK*\n\n\n\n\n\n";
							soundFX_play_click();
							sleep(1);
							print"\n";
							$gpop = 0;
							
							$bullet9mmamount = $bullet9mmamount - 30;
							attackingluck();
						} else {
							$fired9mm = 1;
							$smgfired = 1;
							$force = $bullet9mmamount * $prj9mm;
							infinitenewlines();
							
							if ($smg9mmcapacity >= $bullet9mmamount) {
								$gpop = $bullet9mmamount;
								$force = $bullet9mmamount * $prj9mm;
								$bullet9mmamount = $bullet9mmamount - $bullet9mmamount;
							} else {
								$gpop = $smg9mmcapacity;
								$force = $smg9mmcapacity * $prj9mm;
								$bullet9mmamount = $bullet9mmamount - $smg9mmcapacity;
							}
							$smg9mmcapacity = 0;
							
							gpop();
							print"*CLICK*\n\n\n\n\n\n";
							soundFX_play_click();
							sleep(1);
							print"\n";
							$gpop = 0;
							
							$bullet9mmamount = $bullet9mmamount - $bullet9mmamount;
							attackingluck();
						}		
					} else {
						#do nothing		
					}
				} elsif ($gingertype eq 'semiautomatic pistol') {
					if ($semiautopistolcapacity <= 0) {
						infinitenewlines();
						print"*CLICK*\n\n\n\n\n\n";
						soundFX_play_click();
						$semiautopistolcapacity = 0;
						sleep(1);
						print"\n";
					} else {
						$fired9mm = 1;
						infinitenewlines();
				
						print color 'bold black';
						print"*";
						print color 'bold yellow';
						print"POP";
						print color 'reset'; print color 'bold black';
						print"*\n\n\n\n\n\n";
						$counter9mm = $counter9mm + 1;
						print color 'reset';
						soundFX_play_pop0();
						sleep(1);
						print"\n";				
				
						$bullet9mmamount = $bullet9mmamount - 1;
						$semiautopistolcapacity = $semiautopistolcapacity - 1;
						attackingluck();
					}		
				} else {	
				$fired9mm = 1;
				infinitenewlines();
				
				print color 'bold black';
				print"*";
				print color 'bold yellow';
				print"POP";
				print color 'reset'; print color 'bold black';
				print"*\n\n\n\n\n\n";
				$counter9mm = $counter9mm + 1;
				print color 'reset';
				soundFX_play_pop0();
				sleep(1);
				print"\n";				
				
				$bullet9mmamount = $bullet9mmamount - 1;
				attackingluck();
				}
			} else {
				$noammoclick = 1;
				infinitenewlines();
				print"*CLICK*\n\n\n\n\n\n";
				soundFX_play_click();
				sleep(1);
				print"\n";
				#forgot to load the gun eh?
			}
		} elsif ($class == 10) {
			if ($bullet45calamount >= 1) {
				if ($gingertype eq '.45 SMG Carbine') {
					if ($smg45calcapacity <= 0) {
						infinitenewlines();
						print"*CLICK*\n\n\n\n\n\n";
						soundFX_play_click();
						$smg45calcapacity = 0;
						sleep(1);
						print"\n";
					} elsif ($smg45calsetnbr == 1) {
							$fired45cal = 1;
							infinitenewlines();
							print color 'bold black';
							print"*";
							print color 'bold yellow';
							print"POP";
							print color 'reset'; print color 'bold black';
							print"*\n\n\n\n\n\n";
							$counter45cal = $counter45cal + 1;
							print color 'reset';
							soundFX_play_pop1();
							sleep(1);
							print"\n";
							$smg45calcapacity = $smg45calcapacity - 1;
							$bullet45calamount = $bullet45calamount - 1;
							attackingluck();		
					} elsif ($smg45calsetnbr == 2) {
						if ($bullet45calamount >= 3) {
							$fired45cal = 1;
							$brst45calfired = 1;
							infinitenewlines();
							
							if ($smg45calcapacity <= 3) {
								$gpop = $smg45calcapacity;
								$force = $smg45calcapacity * $prj45cal;
								$bullet45calamount = $bullet45calamount - $smg45calcapacity;
								$smg45calcapacity = 0;
							} else {
								$gpop = 3;
								$bullet45calamount = $bullet45calamount - 3;
								$smg45calcapacity = $smg45calcapacity - 3;
							}
							
							gpop45();
							print"\n\n\n\n\n\n";
							sleep(1);
							print"\n";
							$gpop = 0;
							
							attackingluck();
						} else {
							$fired45cal = 1;
							if (($bullet45calamount >= 2) && ($smg45calcapacity >= 2)) {
								$brst45calfired = 1;
							} else {
							}
							infinitenewlines();
							
							if ($smg45calcapacity >= $bullet45calamount) {
								$gpop = $bullet45calamount;
								$force = $bullet45calamount * $prj45cal;
								$bullet45calamount = $bullet45calamount - $bullet45calamount;
							} else {
								$gpop = $smg45calcapacity;
								$force = $smg45calcapacity * $prj9mm;
								$bullet45calamount = $bullet45calamount - $smg45calcapacity;
							}
							
							$smg45calcapacity = 0;
							gpop45();
							print"*CLICK*\n\n\n\n\n\n";
							soundFX_play_click();
							sleep(1);
							print"\n";
							$gpop = 0;
							
							attackingluck();
						}
					} elsif ($smg45calsetnbr == 3) {
						if ($bullet45calamount >= 32) {
							$fired45cal = 1;
							$smg45calfired = 1;
							infinitenewlines();
							
							if ($smg45calcapacity <= 32) {
								$gpop = $smg45calcapacity;
								$force = $smg45calcapacity * $prj45cal;
								$bullet45calamount = $bullet45calamount - $smg45calcapacity;
								$smg45calcapacity = 0;
							} else {
								$gpop = 32;
								$bullet45calamount = $bullet45calamount - 32;
								$smg45calcapacity = $smg45calcapacity - 32;
							}
							
							gpop45();
							print"*CLICK*\n\n\n\n\n\n";
							soundFX_play_click();
							sleep(1);
							print"\n";
							$gpop = 0;
							
							attackingluck();
						} else {
							$fired45cal = 1;
							$smg45calfired = 1;
							$force = $bullet45calamount * $prj45cal;
							infinitenewlines();
							
							if ($smg45calcapacity >= $bullet45calamount) {
								$gpop = $bullet45calamount;
								$force = $bullet45calamount * $prj45cal;
								$bullet45calamount = $bullet45calamount - $bullet45calamount;
							} else {
								$gpop = $smg45calcapacity;
								$force = $smg45calcapacity * $prj9mm;
								$bullet45calamount = $bullet45calamount - $smg45calcapacity;
							}
							
							$smg45calcapacity = 0;
							
							gpop45();
							print"*CLICK*\n\n\n\n\n\n";
							soundFX_play_click();
							sleep(1);
							print"\n";
							$gpop = 0;
							
							attackingluck();
						}		
					} else {
						#do nothing		
					}
				} elsif ($gingertype eq '.45 automatic pistol') {
					if ($pistol45calcapacity <= 0) {
						infinitenewlines();
						print"*CLICK*\n\n\n\n\n\n";
						soundFX_play_click();
						$pistol45calcapacity = 0;
						sleep(1);
						print"\n";
					} else {
						$fired45cal = 1;
						infinitenewlines();
				
						print color 'bold black';
						print"*";
						print color 'bold yellow';
						print"POP";
						print color 'reset'; print color 'bold black';
						print"*\n\n\n\n\n\n";
						$counter45cal = $counter45cal + 1;
						print color 'reset';
						soundFX_play_pop1();
						sleep(1);
						print"\n";				
						
						$pistol45calcapacity = $pistol45calcapacity - 1;
						$bullet45calamount = $bullet45calamount - 1;
						attackingluck();
					}				
				} else {
				
				$fired45cal = 1;
				infinitenewlines();
				
				print color 'bold black';
				print"*";
				print color 'bold yellow';
				print"POP";
				print color 'reset'; print color 'bold black';
				print"*\n\n\n\n\n\n";
				$counter45cal = $counter45cal + 1;
				print color 'reset';
				soundFX_play_pop1();
				sleep(1);
				print"\n";				
				
				$bullet45calamount = $bullet45calamount - 1;
				attackingluck();
				}
			} else {
				$noammoclick = 1;
				infinitenewlines();
				print"*CLICK*\n\n\n\n\n\n";
				soundFX_play_click();
				sleep(1);
				print"\n";
				#forgot to load the gun eh?
			}
		} elsif ($class == 12) {
			if ($sg12pcapacity <= 0) {
				infinitenewlines();
				print"*CLICK*\n\n\n\n\n\n";
				soundFX_play_click();
				$sg12pcapacity = 0;
				sleep(1);
				print"\n";
			} elsif ($slug12gaamount >= 1) {
				$fired12ga = 1;
				infinitenewlines();
				print color 'bold white';
				print"*";
				print color 'bold yellow';
				print"BOOM";
				print color 'reset'; print color 'bold white';
				print"*\n\n\n\n\n\n";
				$counter12ga = $counter12ga + 1; 
				print color 'reset';
				soundFX_play_boom();
				sleep(1);
				print"\n";
							
				$sg12pcapacity = $sg12pcapacity - 1;
				$slug12gaamount = $slug12gaamount - 1;
				attackingluck();
			} else {
				$noammoclick = 1;
				infinitenewlines();
				print"*CLICK*\n\n\n\n\n\n";
				soundFX_play_click();
				sleep(1);
				print"\n";
				#forgot to load the gun eh?	
			}
		} elsif ($class == 17) {
			if ($rpgx14capacity <= 0) {
				infinitenewlines();
				print"*CLICK*\n\n\n\n\n\n";
				soundFX_play_click();
				$rpgx14capacity = 0;
				sleep(1);
				print"\n";
			} elsif ($explosiveRPGX14amount >= 1) {
				$firedRPGX14 = 1;
				rpgfireprint();
				$counterRPGX14 = $counterRPGX14 + 1; 
				print color 'reset';
				print"\n";
				$rpgx14capacity	= $rpgx14capacity - 1;
				$explosiveRPGX14amount = $explosiveRPGX14amount - 1;
				attackingluck();
			} else {
				$noammoclick = 1;
				infinitenewlines();
				print"*CLICK*\n\n\n\n\n\n";
				soundFX_play_click();
				sleep(1);
				print"\n";
				#forgot to load the rocket launcher eh?
			}			
		} elsif ($class == 2) {	
			$attackedaxe = 1;
			attackingluck();
		} elsif ($class == 1) {	
			$attackedsword = 1;
			attackingluck();
		} elsif ($class == 9) {	
			$attackedblunt = 1;
			attackingluck();								
		} else {
			attackingluck();
		}
	} else {
	}
}

sub beingattacked {
	if ($beingarmor == 1) {
		if ($class == 4) {
			$attackdamage = $force - $beingdefend;
		} else {
			$attackdamage = $force;
		}
	} elsif ($beingarmor == 2) {
		if ($class == 4) {
			$attackdamage = $force - $beingdefend;
		} elsif ($class == 1) {
			if ($beingdefend > 0) {
				$psudobeingdefend = $beingdefend / 6;
			} else {
				$psudobeingdefend = $beingdefend
			}
			$attackdamage = $force - $psudobeingdefend;
			$psudobeingdefend = 0;
		} elsif ($class == 2) {
			if ($beingdefend > 0) {
				$psudobeingdefend = $beingdefend / 4;
			} else {
				$psudobeingdefend = $beingdefend
			}
			$attackdamage = $force - $psudobeingdefend;
			$psudobeingdefend = 0;			
		} else {
			$attackdamage = $force;
		}
	} elsif ($beingarmor == 3) {
		if ($class == 4) {
			$attackdamage = $force - $beingdefend;
		} elsif ($class == 1) {
			if ($beingdefend > 0) {
				$psudobeingdefend = $beingdefend / 4.5;
			} else {
				$psudobeingdefend = $beingdefend
			}
			$attackdamage = $force - $psudobeingdefend;
			$psudobeingdefend = 0;
		} elsif ($class == 2) {
			if ($beingdefend > 0) {
				$psudobeingdefend = $beingdefend / 3;
			} else {
				$psudobeingdefend = $beingdefend
			}
			$attackdamage = $force - $psudobeingdefend;
			$psudobeingdefend = 0;			
		} else {
			$attackdamage = $force;
		}		
	} else {
	$attackdamage = $force;
	}
	$beinghealth = $beinghealth - $attackdamage;
	$attackdamage = 0;
}
##ATTACKBEING############################

##BOMBBEING##############################
sub bombbeing {
	if ($beinghealth > 0) { 
		$beinghealth = $beinghealth - $explosivecharge;
	} else {
	}
}
##BOMBBEING##############################

##NUKEBEING##############################
sub nukebeing {
	if ($beinghealth > 0) { 
		$beinghealth = $beinghealth - 100000000000000000;
	} else {
	}
}
##NUKEBEING##############################

sub armor_reset {
$armorclass = 0;
$armortype = "NA";
$armorginger = "none";
$armordefend = 0;
$armordur = 0;
}

##BEINGATTACKING#########################
#get assaulted by something
sub beingattacking {
	if ($beinginroom == 1) {
		$wprotectrand = int(rand(4));
		if ($spellshocktrig == 1) {
			$info = "      You cast shock and paralize the being     ";
			$info2 = "                                                ";
			
		} elsif ($beingphase >= 1) {
			$beinghealth = $beinghealth - $spelltoicelife;
			$beingphase = $beingphase - 1;			
		} else {
			if ($armorginger eq 'leather vest') {
				$evadearmor = int(rand(4));
				if ($evadearmor == 2) {
				$psudobeingattack = $beingattack;
				} elsif ($leathervestdur <= 0) {
				$psudobeingattack = $beingattack;
				$leathervestarmor = 0;
				armor_reset();
				} elsif ($leathervestdur <= $armordefend) {
				$psudobeingattack = $beingattack - $leathervestdur;
				$leathervestarmor = 0;
				armor_reset();
				} else {
				$psudobeingattack = $beingattack - $armordefend;
				$leathervestdur = $leathervestdur - $armordefend;
				}
			} elsif ($armorginger eq 'red t-shirt') {
				$evadearmor = int(rand(4));				
				if ($evadearmor == 2) {
				$psudobeingattack = $beingattack;
				} elsif ($evadearmor == 3) {
				$psudobeingattack = $beingattack;
				} elsif ($redtshirtdur <= 0) {
				$psudobeingattack = $beingattack;
				$redtshirtarmor = 0;
				armor_reset();
				} elsif ($redtshirtdur <= $armordefend) {
				$psudobeingattack = $beingattack - $redtshirtdur;
				$redtshirtarmor = 0;
				armor_reset();
				} else {
				$psudobeingattack = $beingattack - $armordefend;
				$redtshirtdur = $redtshirtdur - $armordefend;
				}
			} elsif ($armorginger eq 'ring mail vest') {
				$evadearmor = int(rand(5));				
				if ($evadearmor == 2) {
				$psudobeingattack = $beingattack;
				} elsif ($evadearmor == 3) {
				$psudobeingattack = $beingattack;
				} elsif ($ringmailvestdur <= 0) {
				$psudobeingattack = $beingattack;
				$ringmailvestarmor = 0;
				armor_reset();
				} elsif ($ringmailvestdur <= $armordefend) {
				$psudobeingattack = $beingattack - $ringmailvestdur;
				$ringmailvestarmor = 0;
				armor_reset();
				} else {
				$psudobeingattack = $beingattack - $armordefend;
				$ringmailvestdur = $ringmailvestdur - $armordefend;
				}
			} elsif ($armorginger eq 'white robe') {
				$evadearmor = int(rand(4));				
				if ($evadearmor == 2) {
				$psudobeingattack = $beingattack;
				} elsif ($evadearmor == 3) {
				$psudobeingattack = $beingattack;
				} elsif ($whiterobedur <= 0) {
				$psudobeingattack = $beingattack;
				$whiterobearmor = 0;
				armor_reset();
				} elsif ($whiterobedur <= $armordefend) {
				$psudobeingattack = $beingattack - $whiterobedur;
				$whiterobearmor = 0;
				armor_reset();
				} else {
				$psudobeingattack = $beingattack - $armordefend;
				$whiterobedur = $whiterobedur - $armordefend;
				}				
			} else {
				$psudobeingattack = $beingattack;
			}
			
			if ($psudobeingattack <= 0) {
				$psudobeingattack = 0;
			} else {
			}
		
			if ($weapprotect > 0) {
				if ($wprotectrand == 2) {
					$wprotectattack = $psudobeingattack - $wprotect;				
					if ($beingattack == 0) {
						#funtimes (quote from /dev/urandom)
					} elsif ($wprotectattack <= 0) {
						#your weapon absorbed all the damage	
						$info = "    You blocked the attack with your weapon!    ";
						$info2 = "                                                ";
					} else {
						$health = $health - $wprotectattack;
						$beingattackbodydam = $wprotectattack;
						$info = "    Your weapon absorbed some of the attack!    ";
						$info2 = "                                                ";
					} 			
				} else {
					$health = $health - $psudobeingattack;
					$beingattackbodydam = $psudobeingattack
				}
			} else {
				$health = $health - $psudobeingattack;
			}
		}
	} else {
	}
	beingattackbody();
	$beingattackbodydam = 0;
	$psudobeingattack = 0;
	$wprotectattack = 0;
}

sub beingattackbody {
	$bodyparthit = int(rand(20));
	if ($bodyparthit == 1) {
		$bodyhealth_head = $bodyhealth_head - $beingattack;
	} elsif ($bodyparthit == 2) {
		$bodyhealth_kneck = $bodyhealth_kneck - $beingattack;
	} elsif ($bodyparthit == 3) {
		$bodyparthit = int(rand(8));
		if ($bodyparthit == 2) {
			$bodyhealth_torso = $bodyhealth_torso - ($psudobeingattack * 2);
		} else {
			$bodyhealth_torso = $bodyhealth_torso - $psudobeingattack;
		}
	} elsif ($bodyparthit == 5) {
		$bodyparthit = int(rand(4));
		if ($bodyparthit == 2) {
			$bodyhealth_legR = $bodyhealth_legR - ($beingattack * 2);
		} else {
			$bodyhealth_legR = $bodyhealth_legR - $beingattack;
		}
	} elsif ($bodyparthit == 7) {
		$bodyparthit = int(rand(4));
		if ($bodyparthit == 2) {
			$bodyhealth_legL = $bodyhealth_legL - ($beingattack * 2);
		} else {
			$bodyhealth_legL = $bodyhealth_legL - $beingattack;
		}	
	} elsif ($bodyparthit == 9) {
		$bodyparthit = int(rand(4));
		if ($bodyparthit == 2) {
			$bodyhealth_armR = $bodyhealth_armR - ($beingattackbodydam * 2);
		} else {
			$bodyhealth_armR = $bodyhealth_armR - $beingattackbodydam;
		}
	} elsif ($bodyparthit == 11) {
		$bodyparthit = int(rand(4));
		if ($bodyparthit == 2) {
			$bodyhealth_armL = $bodyhealth_armL - ($beingattackbodydam * 2);
		} else {
			$bodyhealth_armL = $bodyhealth_armL - $beingattackbodydam;
		}
	} elsif ($bodyparthit == 14) {
		$bodyparthit = int(rand(4));
		if ($bodyparthit == 2) {
			$bodyhealth_chest = $bodyhealth_chest - ($psudobeingattack * 2);
		} else {
			$bodyhealth_chest = $bodyhealth_chest - $psudobeingattack
		}					
	} else {
		#No Damage
	}
}
##BEINGATTACKING#########################

##DOES THE BEING HAVE LUCK? DID IT DOGE YOUR ATTACK?#####
sub attackingluck {
	$evadeinfo = 0;
	$beingluckrand1 = int(rand(11));
	$pbeingluck = $beingluck;


	$pbeingluck = $pbeingluck - $accuracy; #apply the accuracy weapon attribute
	
	if ($firedRPGX14 == 1) {
		$pbeingluck = $pbeingluck - 3;
	} elsif ((($smg45calfired == 1) or ($brst45calfired == 1)) and ($gingertype eq '.45 SMG Carbine')) {
		$pbeingluck = $pbeingluck - 1;
	} elsif (($fired45cal== 1) and ($gingertype eq '.45 automatic pistol')) {
		$pbeingluck = $pbeingluck + 1;
	} elsif (($fired9mm == 1) and ($gingertype eq 'semiautomatic pistol')) {
		if ($visualblind != 0) {
			#leave as be, laser aiming requires sight
		} else {
			$pbeingluck = $pbeingluck - 1;
		}
	} else {
		#blah
	}

	if (($bodypart_armR == 0) or ($bodypart_armL == 0)) {
		if ($firedRPGX14 == 1) {
			$pbeingluck = $pbeingluck + 5;
		} elsif ((($smg45calfired == 1) or ($brst45calfired == 1) or ($fired45cal == 1)) and ($gingertype eq '.45 SMG Carbine')) {
			$pbeingluck = $pbeingluck + 4;
		} elsif (($fired12ga == 1) and ($gingertype eq '12GA pump action shotgun')) {
			$pbeingluck = $pbeingluck + 4;
		} elsif (($fired45cal == 1) and ($gingertype eq '.45 automatic pistol')) {
			$pbeingluck = $pbeingluck + 3;
		} elsif (($fired9mm == 1) and ($gingertype eq 'semiautomatic pistol')) {
			$pbeingluck = $pbeingluck + 3;
		} else {
			$pbeingluck = $pbeingluck + 2;
		}
	} else {
		#NA
	}

	if ($visualpsyc != 0) {
		$pbeingluck = $pbeingluck + 2;
	} else {
		#blah
	}
	
	if ($visualblind != 0) {
		$pbeingluck = $pbeingluck + 5;
	} else {
		#blah
	}	
	
	if ($pbeingluck <= 0) {
		$pbeingluck = 0;
	} elsif ($pbeingluck >= 10) {
		$pbeingluck = 10;	
	} else {
		#waste space
	}	

	
	if ($spellshocktrig >= 1) {
		beingattacked();
	} elsif ($nobeingevade >= 1) {
		beingattacked();		
	} else {
		if ($pbeingluck == 10) {
			if ($beingluckrand1 >= 10) {
				beingattacked();
			} else {
				$evadeinfo = 1;
			}
		} elsif ($pbeingluck == 9) {
			if ($beingluckrand1 >= 9) {
				beingattacked();
			} else {
				$evadeinfo = 1;
			}
		} elsif ($pbeingluck == 8) {
			if ($beingluckrand1 >= 8) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}		
		} elsif ($pbeingluck == 7) {
			if ($beingluckrand1 >= 7) {
				beingattacked();
			} else {		
			$evadeinfo = 1;
			}		
		} elsif ($pbeingluck == 6) {
			if ($beingluckrand1 >= 6) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}	
		} elsif ($pbeingluck == 5) {
			if ($beingluckrand1 >= 5) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}	
		} elsif ($pbeingluck == 4) {
			if ($beingluckrand1 >= 4) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}
		} elsif ($pbeingluck == 3) {
			if ($beingluckrand1 >= 3) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}
		} elsif ($pbeingluck == 2) {
			if ($beingluckrand1 >= 2) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}
		} elsif ($pbeingluck == 1) {
			if ($beingluckrand1 >= 1) {
				beingattacked();
			} else {
			$evadeinfo = 1;
			}
		} elsif ($pbeingluck == 0) {
				beingattacked();
		} else {
				beingattacked();	
		}	
	}							
}
##DOES THE BEING HAVE LUCK? DID IT DOGE YOUR ATTACK?#####


##START#BAR####################################################################
##START#BAR####################################################################
sub startbar {
t5(); t6();

	if ($debugmode == 1) {
		print colored ("DEBUG MODE ON:$health:",'red on_white');
		print color 'reset';
	} else {
	}

print color "$colorprompt";
}
##START#BAR####################################################################
##START#BAR####################################################################



##STDIN#START##################################################################
##STDIN#START##################################################################
sub stdinstart {
	$start = <STDIN>;
	chomp($start);
	
	print color 'reset';
	
	if ($start eq "exit") {
		bigassfuckingnuke_run();
	} elsif ($start eq "EXIT") {
		bigassfuckingnuke_run();
	} elsif ($start eq "quit") {
		bigassfuckingnuke_run();
	} elsif ($start eq "QUIT") {
		bigassfuckingnuke_run();			
	} elsif ($start eq "i") {
		inventorylist();
	} elsif ($start eq "I") {
		inventorylist();
	} elsif ($start eq "x") {
		showweapons();
	} elsif ($start eq "X") {
		showweapons();
	} elsif ($start eq "z") {
		showarmor();
	} elsif ($start eq "Z") {
		showarmor();		
	} elsif ($start eq "N") {
		north();	
	} elsif ($start eq "S") {
		if ($room eq "sbm2") {
			if ($sbm2blocked == 1) {
				$smb2cantgo = 1;
			} else {
			}
		} else {
		}	
		south();		
	} elsif ($start eq "E") {
		east();	
	} elsif ($start eq "W") {
		west();	
	} elsif ($start eq "n") {	
		north();	
	} elsif ($start eq "s") {
		if ($room eq "sbm2") {
			if ($sbm2blocked == 1) {
				$smb2cantgo = 1;
			} else {
			}
		} else {
		}	
		south();
	} elsif ($start eq "e") {
		east();	
	} elsif ($start eq "w") {
		west();		
	} elsif ($start eq "NE") {
		northeast();
	} elsif ($start eq "NW") {
		northwest();
	} elsif ($start eq "SE") {
		southeast();
	} elsif ($start eq "SW") {
		southwest();
	} elsif ($start eq "ne") {
		northeast();
	} elsif ($start eq "nw") {
		northwest();
	} elsif ($start eq "se") {
		southeast();
	} elsif ($start eq "sw") {
		southwest();
	} elsif ($start eq "up") {
		up();
	} elsif ($start eq "UP") {
		up();
	} elsif ($start eq "down") {
		down();
	} elsif ($start eq "DOWN") {
		down();													
	} elsif ($start eq 'B') {
		bombhelp();
		$bombbeing = 1;
	} elsif ($start eq 'b') {
		bombhelp();
		$bombbeing = 1;	
	} elsif ($start eq "H") {
		helpstatusinpho();
	} elsif ($start eq "h") {
		helpstatusinpho();
	} elsif ($start eq "?") {
		statusonlyinfo();		
	} elsif ($start eq "L") {
		readownbook();
	} elsif ($start eq "l") {
		readownbook();
	} elsif ($start eq "A") {
		$attacktrig = 1;	
		attackbeing();		
	} elsif ($start eq "a") {
		$attacktrig = 1;
		attackbeing();
	} elsif ($start eq "F") {
		foodpick();
	} elsif ($start eq "f") {
		foodpick();
	} elsif ($start eq "P" or $start eq "p" ) {
		if ($room eq "lzv1") {
			if ($gp >= 1) {
				$gp = $gp - 1;
				findslot();
				slotadd();
				$playpaytrig = 1;
			} else {
			}
		} elsif ($room eq "kewsszum6") {
			if ($keysewagecrdbp == 1) {
				#n/a
			} else {
				if ($keysewagecrdb == 1) {
					#nada, != probally would have been better but eh
				} else {
					if ($passcardredkewsszum6 == 1) {
						$keysewagecrds = 2;
						$playpaytrig = 1; #redundancy....
					} else {
					}
				}
			}	
		} else {
			$playpaytrig = 1;
		}				
	} elsif ($start eq "music") {
		if ($unix == 1) {
			if ($ogg123 == 0) {
				$ogg123 = 1;
				system("ogg123 -q -z -p 10 ap3b2.ogg  ap3b3.ogg  ap3b4.ogg  ap3b5.ogg &");
			} elsif ($ogg123 == 1) {
				$ogg123 = 0;
				system('killall -9 "ogg123" &');
			} else {
			}
		} else {
		}
	} elsif ($start eq "ls") {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
					$uzw4listterm = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}
		
	} elsif ($start eq "more decss.txt" && $termdir eq '~') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$decssreadlessterm = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}
		
	} elsif ($start eq "logout") {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {				
					if ($decssreadlessterm == 0) {
						$termdir = '~';
						$uzw4passwordputer = 0;
					} else {
					}
				}
			} else {
			}
		} else {
		}
					
	} elsif ($start eq "cat decss.txt" && $termdir eq '~') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$decssreadlessterm = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}		
				
	} elsif ($start eq "less decss.txt" && $termdir eq '~') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$decssreadlessterm = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}		
	} elsif (($start eq 'cd ..' && $termdir eq '~') or ($start eq 'cd ../' && $termdir eq '~') or ($start eq 'cd /home' && $termdir eq '~') or ($start eq 'cd /home/' && $termdir eq '~') or ($start eq 'cd ..' && $termdir eq '/home/supervisor') or ($start eq 'cd ../' && $termdir eq '/home/supervisor') or ($start eq 'cd /home' && $termdir eq '/home/supervisor') or ($start eq 'cd /home/' && $termdir eq '/home/supervisor')) {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$termdir = '../~';
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif (($start eq "kill $kill9pid") or ($start eq "kill -1 $kill9pid") or ($start eq "kill -2 $kill9pid") or ($start eq "kill -9 $kill9pid") or ($start eq "kill -15 $kill9pid") or ($start eq "kill -13 $kill9pid") or ($start eq "kill -14 $kill9pid")  or ($start eq 'killall sh') or ($start eq 'killall -9 sh') or ($start eq 'killall -15 sh') or ($start eq 'killall -1 sh') or ($start eq 'killall -2 sh') or ($start eq 'killall -13 sh') or ($start eq 'killall -14 sh')) {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$uzw4passwordputer = 0;
						$uzw4passwdset = 0;
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif ($start eq 'ps aux') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$uzw4psauxt = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif ($start eq 'ps') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$uzw4psauxt = 2;
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif ($start eq 'pwd') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$uzw4psauxt = 3;
					} else {
					}
				}
			} else {
			}
		} else {
		}				
	} elsif (($start eq 'cd techadmin' && $termdir eq '../~') or ($start eq 'cd ./techadmin' && $termdir eq '../~') or ($start eq 'cd ./techadmin/' && $termdir eq '../~') or ($start eq 'cd techadmin/' && $termdir eq '../~') or ($start eq 'cd /home/techadmin/' && $termdir eq '../~') or ($start eq 'cd /home/techadmin' && $termdir eq '../~')) {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$termdir = '~';
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif (($start eq 'cd supervisor' && $termdir eq '../~') or ($start eq 'cd ./supervisor' && $termdir eq '../~') or ($start eq 'cd ./supervisor/' && $termdir eq '../~') or ($start eq 'cd supervisor/' && $termdir eq '../~') or ($start eq 'cd /home/supervisor/' && $termdir eq '../~') or ($start eq 'cd /home/supervisor' && $termdir eq '../~')) {		
			if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$termdir = '/home/supervisor';
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif (($start eq 'less lettertoex.txt' && $termdir eq '/home/supervisor') or ($start eq 'cat lettertoex.txt' && $termdir eq '/home/supervisor') or ($start eq 'more lettertoex.txt' && $termdir eq '/home/supervisor')) {
				if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$notereadlessterm = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif (($start eq 'less dxmpass.txt' && $termdir eq '/home/supervisor') or ($start eq 'cat dxmpass.txt' && $termdir eq '/home/supervisor') or ($start eq 'more dxmpass.txt' && $termdir eq '/home/supervisor')) {
				if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$notereadlessterm2 = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif ($start eq $keyuzs4padnumber) {
		if ($room eq "keyuzs4") {
			if ($keyuzs4keyfuze == 0) {
				$room = uzs4;
			} else {
			}
		} else {
		}	
	} elsif ($start == $keyuzw4padnumber) {
		if ($room eq "keyuzw4") {
			if ($keyuzw4keyfuze == 0) {
				$room = ua4;
			} else {
			}
		} else {
		}				
	} elsif ($start == $keykewsszum6) {
		if ($keysewagecrdbp == 1) {
			#n/a
		} else {
			if ($room eq "kewsszum6") {
				if ($keysewagecrds == 1) {
					if ($keysewagecrdb == 1) {
						$keysewagecrdb = 0;
						$keysewagecrds = 0;
					} else {
						$keysewagecrdb = 0;
						$keysewagecrds = 0;
						$room = szum6;
					}
				} else {
					$keysewagecrdb = 0;
					$keysewagecrds = 0;
				}
			} else {
			}
		}						
	} elsif ($start eq $purgenamela2) {
		$voiceFXbuff = $start;
		voiceFX_play();
		if ($room eq "la2") {
			if ($drainedla2 == 0) {
			$floodla2 = 0;
			$purgedla2 = 1;
			$la2findgrate = 1;
			} else {
			}
		} else {
		}
	} elsif ($start eq 'R') { 
		readinscript();		
	} elsif ($start eq 'r') { 
		readinscript();
	} elsif ($start eq 'C') { 
		reload();		
	} elsif ($start eq 'c') { 
		reload();	
	} elsif ($start eq 'M') { 
		magebooklist();		
	} elsif ($start eq 'm') { 
		magebooklist();		
	} elsif ($start eq 'cast burn') { 
		castspellburn();		
	} elsif ($start eq 'cast shock') { 
		castspellshock();
	} elsif ($start eq 'cast life') { 
		castspelllife();
	} elsif ($start eq 'cast rage') { 
		castspellrage();
	} elsif ($start eq 'cast soultransfer') { 
		castspellsoultransfer();
	} elsif ($start eq 'cast toice') { 
		castspelltoice();
	} elsif ($start eq 'cast teleport') { 
		castspellteleport();
	} elsif ($start eq 'cast sustenance') { 
		castspellsustenance();					
	} elsif ($start eq 'nuke') {
		nukehelp();
	} elsif ($start eq 'NUKE') {
		nukehelp();
	} elsif ($start eq 'map') {
		ghmap();
	} elsif ($start eq 'MAP') {
		ghmap();
	} elsif ($start eq 'infomenu') {
		infomenu();
	} elsif ($start eq 'INFOMENU') {
		infomenu();								
	} elsif ($start eq 'manacheat') {
		if ($debuglock == 0) {
			if ($manacheat == 1) {
				$mana = 100;
			} else {
			}
		} else {
		}
	} elsif ($start eq 'magecheat') {
		if ($debuglock == 0) {
			if ($magecheat == 1) {
				$pmagicexp = 7;
				$pintellect = 7;
			} else {
			}
		} else {
		}
	} elsif ($start eq 'barbarycheat') {
		if ($debuglock == 0) {
			if ($barbarycheat == 1) {
				$psphysexp = 1064;
			} else {
			}
		} else {
		}				
	} elsif ($start eq 'bombcheat') {
		if ($debuglock == 0) {
			if ($bombcheat == 1) {
				$bombamount = 20;
				$nukeamount = 10;
			} else {
			}
		} else {
		}
	} elsif ($start eq 'weaponcheat') {
		if ($debuglock == 0) {
			if ($weaponcheat == 1) {
				$noweaponnone = 1;
				$crookddagger = 1;
				$cappedstaff = 1;
				$longsword = 1;
				$mace = 1;
				$redcrowbar = 1;
				$sapg = 1;
				$sap45cal = 1;
				$skive = 1;
				$bflyknife = 1;
				$sg12p = 1;
				$slug12gaamount = 4;
				$bullet9mmamount = 44;
				$bullet45calamount = 106;
				$smg9mm = 1;
				$smg45cal = 1;
				$doubleaxe = 1;
				$straightaxe = 1;
				$fireaxe = 1;
				$englishaxe = 1;
				$broadtipspear = 1;
				$rpgX14launcher = 1;
				$explosiveRPGX14amount = 3;
			} else {
			}
		} else {
		}
	} elsif ($start eq 'spellcheat') {
		if ($debuglock == 0) {
			if ($spellcheat == 1) {
				$spellburn = 1;
				$spellshock = 1;
				$spelllife = 1;
				$spellrage = 1;
				$spellsoultransfer = 1;
				$spelltoice = 1;
				$spellteleport = 1;
				$spellsustenance = 1;	
			} else {
			}
		} else {
		}
	} elsif ($start eq 'armorcheat') {
		if ($debuglock == 0) {
			if ($armorcheat == 1) {
				set_armordur();
				$leathervestarmor = 1;
				$redtshirtarmor = 1;
				$ringmailvestarmor = 1;
				$whiterobearmor = 1;
			} else {
			}
		} else {
		}
	} elsif ($start eq 'foodcheat') {
		if ($debuglock == 0) {
			if ($foodcheat == 1) {
				$f_bread = 10;
				$f_cake = 10;
				$f_lsd = 10;
				$f_elixirhealth100 = 10;
				$f_elixirpoison10 = 10;	
			} else {
			}
		} else {
		}																						
	} elsif ($start eq 'debugmode') { 
		if ($debuglock == 0) {
			if ($room eq 'uzw4') {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {
					if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
						if ($decssreadlessterm == 0) {
						debugmode();
						} else {
						}
					} else {
					}
				}
			} else {
			}	
		} else {
		}				
	} elsif ($start eq 'buffer') {
		printbufferinfo();
	} elsif ($start eq 'BUFFER') {
		printbufferinfo();
	} elsif ($start eq 'cbuffer') {
		printbufferstart();
	} elsif ($start eq 'CBUFFER') {
		printbufferstart();
	} elsif ($start eq 'rbuffer') {
		printbufferread();
	} elsif ($start eq 'RBUFFER') {
		printbufferread();
	} elsif ($start eq 'save exploits') {
		saveashtml();
	} elsif ($start eq 'SAVE EXPLOITS') {
		saveashtml();
	} elsif ($start eq '+') {
		if (($room eq 'reactormon1') && ($mainframe3b < 5)) {
			if ($termnboom2 == 1) {
			} else {
				if ($reactorcoolant >= 100) {
					$reactorcoolant = 100;
				} else {
					$reactorcoolant = $reactorcoolant + 10;
				}	
			}
		} else {
			#dn
		}
	} elsif ($start eq '-') {
		if (($room eq 'reactormon1') && ($mainframe3b < 5)) {
			if ($termnboom2 == 1) {
			} else {
				if ($reactorcoolant <= 0) {
					$reactorcoolant = 0;
				} else {
					$reactorcoolant = $reactorcoolant - 10;
				}	
			}
		} else {
			#dn
		}				
	} elsif ($start eq 'passwd') {
		if ($room eq "uzw4") {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 0) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						$uzw4passwdset = 1;
					} else {
					}
				}
			} else {
			}
		} else {
		}
	} elsif ($start eq $uzw4computerlogin) {
		if ($room eq "uzw4") {
			if ($termnboom == 1 or $mainframebroke == 1) {
			} else {			
				if ($uzw4passwordputer == 0) {
					$uzw4passwordputer = 1;
					$kill9a = int(rand(9));
					$kill9b = int(rand(9));
					$kill9c = int(rand(9));
					$kill9d = int(rand(9));
					$kill9pid = '3'."$kill9a"."$kill9b"."$kill9c"."$kill9d";
				} else {
				}
			}
		} else {
		}
	} elsif ($room eq 'uzw4') {
			if ($uzw4passwordputer == 1 && $uzw4passwdset == 1) {
				if ($termnboom == 1 or $mainframebroke == 1) {
				} else {			
					if ($decssreadlessterm == 0) {
						if ($uzw4passwdset == 1) {
							$uzw4passwdset = 2;
							$uzw4computerlogin = $start;
						} else {
						}
					} else {
					}
				}
			} else {
			}				
	} else {
		if (($start eq '') or ($start eq ' ')) {
			#yep.....
		} else {
			$voiceFXbuff = $start;
			voiceFX_play();
		}
	}
}
##STDIN#START##################################################################
##STDIN#START##################################################################

sub debugmode {
	if ($debugmode == 0) {
		$debugmode = 1;
		$manacheat = 1;
		$weaponcheat = 1;
		$bombcheat = 1;
		$spellcheat = 1;
		$armorcheat = 1;
		$magecheat = 1;
		$barbarycheat = 1;
		$foodcheat = 1;
	} elsif ($debugmode == 1) {
		$debugmode = 0;
		$manacheat = 0;
		$weaponcheat = 0;
		$bombcheat = 0;
		$spellcheat = 0;
		$armorcheat = 0;
		$magecheat = 0;
		$barbarycheat = 0;
		$foodcheat = 0;
	} else {
		$debugmode = 0;
		$manacheat = 0;
		$weaponcheat = 0;
		$bombcheat = 0;
		$spellcheat = 0;
		$armorcheat = 0;
		$magecheat = 0;
		$barbarycheat = 0;
		$foodcheat = 0;
	}
}


##BOMB##STUFF##################################################################
sub bombhelp {
	if ($bombamount >= 1) {
	$bombdetonate = 1;
	bombbeing();
	infinitenewlines();
	bombprint();
	print"\n\n\n\n\n";
	soundFX_play_explosion();
	sleep(1);
	print"\n";
	} else {
	$bombdetonate = 0;
	}
}
##BOMB##STUFF##################################################################

##BOMB##PRINT##################################################################
sub bombprint {
print color 'red';
print'             .    .    .             '; print"\n";
print'                .    .    .    .     '; print"\n";
print'          .  .    '; print color 'yellow'; print'/\\_ '; print color 'reset'; print color 'red'; print'   .          '; print"\n";
print'            .  '; print color 'yellow'; print'/\\/   \\^/\\'; print color 'reset'; print color 'red'; print'    .     '; print"\n";
print'         .   '; print color 'yellow'; print'/- '; print color 'bold yellow'; print'_/\\   '; print color 'reset'; print color 'yellow'; print'. / >. '; print color 'reset'; print color 'red'; print'    .  '; print"\n";
print'           .'; print color 'yellow'; print'< .'; print color 'bold yellow'; print'/   ^/\\  '; print color 'reset'; print color 'yellow'; print'\\_.>'; print color 'reset'; print color 'red'; print'  .    '; print"\n";
print'             '; print color 'yellow'; print'< '; print color 'bold yellow'; print'.'; print color 'white'; print'!B()()M!'; print color 'bold yellow'; print'. '; print color 'reset'; print color 'yellow'; print'\\'; print color 'reset'; print color 'red'; print' .       '; print"\n";
print'         . '; print color 'yellow'; print'< \\  '; print color 'bold yellow'; print'\\/\\ ./'; print color 'reset'; print color 'yellow'; print' . /> '; print color 'reset'; print color 'red'; print'.     '; print"\n";
print'            . '; print color 'yellow'; print'\\/ . '; print color 'bold yellow'; print'\\/'; print color 'reset'; print color 'yellow'; print' /\\/'; print color 'reset'; print color 'red'; print' .     . '; print"\n";
print'           .  '; print color 'yellow'; print'\\_/\\ ._/'; print color 'reset'; print color 'red'; print' .     .     '; print"\n";
print'             .  . '; print color 'yellow'; print'\\/'; print color 'reset'; print color 'red'; print' .    .         '; print"\n";
print'                  .     .       .    '; print"\n";
print'             .       .    .          '; print"\n";
print color 'reset';
}
##BOMB##PRINT##################################################################

##RPG##FIRE##PRINT#############################################################
sub rpgfireprint {
infinitenewlines();
print color 'bold green'; print'   __     _____________'; print"\n";
print color 'bold green'; print'--|  |   / ----------- \\'; print"\n";
print color 'bold green'; print'  |  |__/ ------------- \\'; print color 'reset'; print color 'bold white'; print'_'; print"\n"; print color 'reset';
print color 'green'; print'  |  |  |---------------'; print color 'reset'; print color 'white'; print'|_\\'; print"\n";
print color 'green'; print'  |  |__|---------------'; print color 'reset'; print color 'white'; print'|_/'; print"\n";
print color 'green'; print'  |  |  \\ ------------- /'; print"\n";
print color 'green'; print'--|__|   \\_____________/'; print"\n";
print"\n\n\n\n\n\n\n";
sleep(1);
infinitenewlines();

print color 'reset'; print color 'bold green'; print'   __                         '; print color 'reset'; print color 'bold green'; print'_____________'; print"\n";
print color 'reset'; print color 'bold green'; print'--|  |           '; print color 'reset'; print color 'bold green'; print'___         / ----------- \\'; print"\n";
print color 'reset'; print color 'bold green'; print'  |  | '; print color 'reset'; print color 'bold yellow'; print'*  '; print color 'reset'; print color 'red'; print'>   '; print color 'reset'; print color 'bold green'; print'__/___\\_______/ ------------- \\'; print color 'reset'; print color 'bold white'; print'_'; print"\n"; print color 'reset';
print color 'reset'; print color 'green'; print'  |  |'; print color 'reset'; print color 'red'; print'> '; print color 'reset'; print color 'bold yellow'; print'** * '; print color 'reset'; print color 'green'; print'|  _____       |---------------'; print color 'reset'; print color 'white'; print'|_\\'; print color 'reset'; print"\n";
print color 'reset'; print color 'green'; print'  |  |'; print color 'reset'; print color 'bold yellow'; print'  * '; print color 'reset'; print color 'bold white'; print'* *'; print color 'reset'; print color 'green'; print'|______________|---------------'; print color 'reset'; print color 'white'; print'|_/'; print color 'reset'; print"\n";
print color 'reset'; print color 'green'; print'  |  |'; print color 'reset'; print color 'bold yellow'; print' *  *'; print color 'reset'; print color 'red'; print'^    '; print color 'reset'; print color 'green'; print'\\___/       \\ ------------- /'; print"\n";
print color 'reset'; print color 'green'; print'--|__|'; print color 'reset'; print color 'bold yellow'; print'  *'; print color 'reset'; print color 'red'; print'<                   '; print color 'reset'; print color 'green'; print'\\_____________/'; print"\n";
print"\n\n\n\n\n\n\n";
soundFX_play_missile();
sleep(1);
infinitenewlines();

print color 'reset'; print color 'bold green'; print'                                  '; print color 'reset'; print color 'bold green'; print'_____________'; print"\n";
print color 'bold yellow'; print'    * *   * *        '; print color 'reset'; print color 'bold green'; print'___         / ----------- \\'; print"\n";
print color 'reset'; print color 'bold yellow'; print' *  * * * **  '; print color 'reset'; print color 'red'; print'>   '; print color 'reset'; print color 'bold green'; print'__/___\\_______/ ------------- \\'; print color 'reset'; print color 'bold white'; print'_'; print"\n"; print color 'reset';
print color 'reset'; print color 'red'; print'> '; print color 'reset'; print color 'bold yellow'; print'*   * *  *** * '; print color 'reset'; print color 'green'; print'|  _____       |---------------'; print color 'reset'; print color 'white'; print'|_\\'; print color 'reset'; print"\n";
print color 'reset'; print color 'bold yellow'; print' * *  *  *  * '; print color 'reset'; print color 'bold white'; print'* *'; print color 'reset'; print color 'green'; print'|______________|---------------'; print color 'reset'; print color 'white'; print'|_/'; print color 'reset'; print"\n";
print color 'reset'; print color 'bold yellow'; print'*  * *  ** *  *'; print color 'reset'; print color 'red'; print'^    '; print color 'reset'; print color 'green'; print'\\___/       \\ ------------- /'; print"\n";
print color 'reset'; print color 'bold yellow'; print'    * *   * *'; print color 'reset'; print color 'red'; print'<                   '; print color 'reset'; print color 'green'; print'\\_____________/'; print"\n";
print"\n\n\n\n\n\n\n";
sleep(1);
infinitenewlines();

print color 'reset'; print color 'bold green'; print'                                     _____________'; print"\n";
print color 'reset'; print color 'bold green'; print'                        ___         / ----------- \\'; print"\n";
print color 'reset'; print color 'bold green'; print'                     __/___\\_______/ ------------- \\'; print color 'reset'; print color 'bold white'; print'_'; print"\n"; print color 'reset';
print color 'reset'; print color 'green'; print'                    |  _____       |---------------'; print color 'reset'; print color 'white'; print'|_\\'; print color 'reset'; print"\n";
print color 'reset'; print color 'green'; print'                    |______________|---------------'; print color 'reset'; print color 'white'; print'|_/'; print color 'reset'; print"\n";
print color 'reset'; print color 'green'; print'                       \\___/       \\ ------------- /'; print"\n";
print color 'reset'; print color 'green'; print'                                    \\_____________/'; print"\n";
print"\n\n\n\n\n\n\n";
sleep(1);
infinitenewlines();

print color 'reset'; print color 'bold green'; print'                                         _____________'; print"\n";
print color 'reset'; print color 'bold green'; print'                            ___         / ----------- \\'; print"\n";
print color 'reset'; print color 'bold green'; print'                         __/___\\_______/ ------------- \\'; print color 'reset'; print color 'bold white'; print'_'; print"\n"; print color 'reset';
print color 'reset'; print color 'green'; print'                        |  _____       |---------------'; print color 'reset'; print color 'white'; print'|_\\'; print color 'reset'; print"\n";
print color 'reset'; print color 'green'; print'                        |______________|---------------'; print color 'reset'; print color 'white'; print'|_/'; print color 'reset'; print"\n";
print color 'reset'; print color 'green'; print'                           \\___/       \\ ------------- /'; print"\n";
print color 'reset'; print color 'green'; print'                                        \\_____________/'; print"\n";
print"\n\n\n\n\n\n\n";
sleep(1);
infinitenewlines();

print color 'red';
print'                                   .    .    .             '; print"\n";
print'                                      .    .    .    .     '; print"\n";
print'                                .  .    '; print color 'yellow'; print'/\\_ '; print color 'reset'; print color 'red'; print'   .          '; print"\n";
print'                                  .  '; print color 'yellow'; print'/\\/   \\^/\\'; print color 'reset'; print color 'red'; print'    .     '; print"\n";
print'                               .   '; print color 'yellow'; print'/- '; print color 'bold yellow'; print'_/\\   '; print color 'reset'; print color 'yellow'; print'. / >. '; print color 'reset'; print color 'red'; print'    .  '; print"\n";
print'                                 .'; print color 'yellow'; print'< .'; print color 'bold yellow'; print'/   ^/\\  '; print color 'reset'; print color 'yellow'; print'\\_.>'; print color 'reset'; print color 'red'; print'  .    '; print"\n";
print'                                   '; print color 'yellow'; print'< '; print color 'bold yellow'; print'.'; print color 'white'; print'!B()()M!'; print color 'bold yellow'; print'. '; print color 'reset'; print color 'yellow'; print'\\'; print color 'reset'; print color 'red'; print' .       '; print"\n";
print'                               . '; print color 'yellow'; print'< \\  '; print color 'bold yellow'; print'\\/\\ ./'; print color 'reset'; print color 'yellow'; print' . /> '; print color 'reset'; print color 'red'; print'.     '; print"\n";
print'                                  . '; print color 'yellow'; print'\\/ . '; print color 'bold yellow'; print'\\/'; print color 'reset'; print color 'yellow'; print' /\\/'; print color 'reset'; print color 'red'; print' .     . '; print"\n";
print'                                 .  '; print color 'yellow'; print'\\_/\\ ._/'; print color 'reset'; print color 'red'; print' .     .     '; print"\n";
print'                                   .  . '; print color 'yellow'; print'\\/'; print color 'reset'; print color 'red'; print' .    .         '; print"\n";
print'                                        .     .       .    '; print"\n";
print'                                   .       .    .          '; print"\n";
print color 'reset';
print"\n\n\n\n\n";
soundFX_play_explosion();
sleep(1.5);
infinitenewlines();
}
##RPG##FIRE##PRINT#############################################################

##BOMB##EVERYTHING#############################################################
sub nukehelp {
	if ($nukeamount >= 1) {
	$nukedetonate = 1;
	$room = x10mtnw;
	soundFX_play_nuke();	
	nukebeing();
	} else {
	$nukedetonate = 0;
	}
}
##HAHAHHAHAH##RED#BUTTON#PRESSED!!!!#HAHAHAHAHHAAHHAHAH!!!!!# SUKAZ!!##########


sub north {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($n == 1) {
			northroom();
		} else {
		}
	} else {
	}		
}


sub south {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($s == 1) {
			southroom();
		} else {
		}
	} else {
	}
}


sub east {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($e == 1) {
			eastroom()
		} else {
		}
	} else {
	}		
}


sub west {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($w == 1) {
			westroom();
		} else {
		}
	} else {
	}	
}

sub northeast {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($ne == 1) {
			northeastroom();
		} else {
		}
	} else {
	}		
}


sub northwest {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($nw == 1) {
			northwestroom();
		} else {
		}
	} else {
	}	
}


sub southeast {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($se == 1) {
			southeastroom()
		} else {
		}
	} else {
	}		
}


sub southwest {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($sw == 1) {
			southwestroom();
		} else {
		}
	} else {
	}		
}

sub up {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($up == 1) {
			uproom()
		} else {
		}
	} else {
	}		
}


sub down {
	if (($immobile == 0) && ($movetog == 0)) {
		if ($down == 1) {
			downroom();
		} else {
		}
	} else {
	}	
}
################################################################################

sub eastroom {
	if ($room eq "ua1") {
		$room = ua2;
	} elsif ($room eq "sa1") {
		$room = sa2;		
	} elsif ($room eq "sa0") {
		$room = sa1;	
	} elsif ($room eq "sa2") {
		$room = sa3;	
	} elsif ($room eq "sa3") {
		$room = sa4;	
	} elsif ($room eq "lavm1") {	
		$room = lav0;	
	} elsif ($room eq "sam1") {	
		$room = sa0;	
	} elsif ($room eq "szx3") {	
		$room = uzx4;
	} elsif ($room eq "lavm2") {	
		$room = lavm1;	
	} elsif ($room eq "uzz4") {	
		$room = uzz5;
	} elsif ($room eq "uzz5") {	
		$room = uzz6;	
	} elsif ($room eq "uzx6") {
		$room = uzx7;
	} elsif ($room eq "uzv5") {
		$room = uzv6;
	} elsif ($room eq "uzv4") {
		$room = uzv5;
	} elsif ($room eq "uzv6") {
		$room = uzv7;
	} elsif ($room eq "uzv3") {
		$room = uzv4;
	} elsif ($room eq "sam2") {
		$room = sam1;
	} elsif ($room eq "lav0") {
		$room = lav1;
	} elsif ($room eq "lav1") {
		$room = lav2;	
	} elsif ($room eq "lzv2") {
		$room = lzv3;
	} elsif ($room eq "lzv3") {
		$room = kzv3;
	} elsif ($room eq "izv3") {
		$room = jzv3;	
	} elsif ($room eq "hzv3") {
		$room = gzv3;
	} elsif ($room eq "ezv3") {
		$room = fzv3;
	} elsif ($room eq "gab4") {
		$room = gab5;	
	} elsif ($room eq "dzv3") {
		$room = czv3;
	} elsif ($room eq "caa2") {
		$room = caa3;
	} elsif ($room eq "caa1") {
		$room = caa2;
	} elsif ($room eq "caa0") {
		$room = caa1;
	} elsif ($room eq "caa3") {
		$room = caa4;
	} elsif ($room eq "czv2") {
		$room = czv3xxd;
	} elsif ($room eq "czv3xxd") {
		$room = czv3xxu;
	} elsif ($room eq "daa3") {
		$room = daa4;	
	} elsif ($room eq "zug1") {
		$room = daa3;	
	} elsif ($room eq "daa4") {
		$room = daa5;
	} elsif ($room eq "caa4") {
		$room = caa5;
	} elsif ($room eq "szxm3") {
		$room = szxm2;
	} elsif ($room eq "szxm4") {
		$room = szxm3;		
	} elsif ($room eq "szxm5") {
		$room = szxm4;	
	} elsif ($room eq "szxm6") {
		$room = szxm5;
	} elsif ($room eq "szxm7") {
		$room = szxm6;		
	} elsif ($room eq "caam1") {
		$room = caa0;
	} elsif ($room eq "caam2") {
		$room = caam1;
	} elsif ($room eq "czzm2") {
		$room = czzm1;
	} elsif ($room eq "czzm1") {
		$room = czz0;
	} elsif ($room eq "czz0") {
		$room = czz1;
	} elsif ($room eq "cab2") {
		$room = cab3;
	} elsif ($room eq "cab1") {
		$room = cab2;
	} elsif ($room eq "cab0") {
		$room = cab1;
	} elsif ($room eq "cabm1") {
		$room = cab0;
	} elsif ($room eq "cabm2") {
		$room = cabm1;
	} elsif ($room eq "lav2") {
		$room = lav3;
	} elsif ($room eq "sam8") {
		$room = sam7;
	} elsif ($room eq "sam9") {
		$room = sam8;
	} elsif ($room eq 'sam10') {
		$room = sam9;
	} elsif ($room eq 'sam11') {
		$room = sam10;
	} elsif ($room eq 'szwm9') {
		$room = szwm8;
	} elsif ($room eq 'szwm8') {
		$room = szwm7;
	} elsif ($room eq 'szwm7') {
		$room = szwm6;
	} elsif ($room eq "switchswrszum5") {
		$room = szum6;
	} elsif ($room eq 'szum6') {
		$room = szum5;
	} elsif ($room eq 'uzt3') {
		$room = uzt4;
	} elsif ($room eq 'uzs3') {
		$room = keyuzs4;	
	} elsif ($room eq 'uzs2') {
		$room = uzs3;
	} elsif ($room eq 'uzs1') {
		$room = uzs2;
	} elsif ($room eq 'conzs1') {
		$room = conzs2;	
	} elsif ($room eq 'conzs2') {
		$room = conzs3;
	} elsif ($room eq 'uzv2') {
		$room = uzv3;
	} elsif ($room eq 'u2zv1') {
		$room = uzv2;
	} elsif ($room eq 'u2zv0') {
		$room = u2zv1;				
	} else {
	}
}

sub westroom {
	if ($room eq "ua2") {
		$room = ua1;
	} elsif ($room eq "la2") {
		$room = sa2;
	} elsif ($room eq "sa2") {
		$room = sa1;
	} elsif ($room eq "sa1") {
		$room = sa0;
	} elsif ($room eq "sa3") {
		$room = sa2;	
	} elsif ($room eq "sa4") {
		$room = sa3;
	} elsif ($room eq "lav0") {	
		$room = lavm1;
	} elsif ($room eq "sa0") {	
		$room = sam1;
	} elsif ($room eq "uzx4") {	
		$room = szx3;	
	} elsif ($room eq "lavm1") {	
		$room = lavm2;		
	} elsif ($room eq "uzz5") {	
		$room = uzz4;		
	} elsif ($room eq "uzz6") {	
		$room = uzz5;		
	} elsif ($room eq "uzx7") {
		$room = uzx6;
	} elsif ($room eq "uzv6") {
		$room = uzv5;
	} elsif ($room eq "uzv5") {
		$room = uzv4;
	} elsif ($room eq "uzv7") {
		$room = uzv6;
	} elsif ($room eq "uzv4") {
		$room = uzv3;
	} elsif ($room eq "sam1") {
		$room = sam2;
	} elsif ($room eq "lav1") {
		$room = lav0;
	} elsif ($room eq "lav2") {
		$room = lav1;
	} elsif ($room eq "lzv3") {
		$room = lzv2;																						
	} elsif ($room eq "kzv3") {
		$room = lzv3;
	} elsif ($room eq "jzv3") {
		$room = izv3;
	} elsif ($room eq "gzv3") {
		$room = hzv3;
	} elsif ($room eq "fzv3") {
		$room = ezv3;
	} elsif ($room eq "gab5") {
		$room = gab4;
	} elsif ($room eq "czv3") {
		$room = dzv3;
	} elsif ($room eq "caa3") {
		$room = caa2;
	} elsif ($room eq "caa2") {
		$room = caa1;
	} elsif ($room eq "caa1") {
		$room = caa0;
	} elsif ($room eq "caa4") {
		$room = caa3;	
	} elsif ($room eq "czv3xxd") {
		$room = czv2;																	
	} elsif ($room eq "czv3xxu") {
		$room = czv3xxd;	
	} elsif ($room eq "daa4") {
		$room = daa3;	
	} elsif ($room eq "daa3") {
		$room = zug1;
	} elsif ($room eq "daa5") {
		$room = daa4;
	} elsif ($room eq "caa5") {
		$room = caa4;
	} elsif ($room eq "szxm2") {
		$room = szxm3;
	} elsif ($room eq "szxm3") {
		$room = szxm4;
	} elsif ($room eq "szxm4") {
		$room = szxm5;
	} elsif ($room eq "szxm5") {
		$room = szxm6;
	} elsif ($room eq "szxm6") {
		$room = szxm7;			
	} elsif ($room eq "caa0") {
		$room = caam1;
	} elsif ($room eq "caam1") {
		$room = caam2;
	} elsif ($room eq 'czzm1') {
		$room = czzm2;
	} elsif ($room eq 'czz0') {
		$room = czzm1;
	} elsif ($room eq 'czz1') {
		$room = czz0;
	} elsif ($room eq 'cab3') {
		$room = cab2;
	} elsif ($room eq 'cab2') {
		$room = cab1;
	} elsif ($room eq 'cab1') {
		$room = cab0;
	} elsif ($room eq 'cab0') {
		$room = cabm1;
	} elsif ($room eq 'cabm1') {
		$room = cabm2;
	} elsif ($room eq 'lav3') {
		$room = lav2;
	} elsif ($room eq 'sam7') {
		$room = sam8;
	} elsif ($room eq 'sam8') {
		$room = sam9;
	} elsif ($room eq 'sam9') {
		$room = sam10;
	} elsif ($room eq 'sam10') {
		$room = sam11;
	} elsif ($room eq 'szwm8') {
		$room = szwm9;
	} elsif ($room eq 'szwm7') {
		$room = szwm8;
	} elsif ($room eq 'szwm6') {
		$room = szwm7;
	} elsif ($room eq 'szum6') {
		$room = switchswrszum5;
	} elsif ($room eq 'szum5') {
		$room = szum6;
	} elsif ($room eq 'uzt4') {
		$room = uzt3;
	} elsif ($room eq 'keyuzs4') {
		$room = uzs3;
	} elsif ($room eq 'uzs4') {
		$room = uzs3;		
	} elsif ($room eq 'uzs3') {
		$room = uzs2;
	} elsif ($room eq 'uzs2') {
		$room = uzs1;
	} elsif ($room eq 'conzs2') {
		$room = conzs1;	
	} elsif ($room eq 'conzs3') {
		$room = conzs2;
	} elsif ($room eq 'uzv3') {
		$room = uzv2;
	} elsif ($room eq 'uzv2') {
		$room = u2zv1;
	} elsif ($room eq 'u2zv1') {
		$room = u2zv0;																																
	} else {
	}
}

sub northroom {
	if ($room eq "sa3") {
		$room = szz3;
	} elsif ($room eq "szz3") {
		$room = szy3;						
	} elsif ($room eq "sa0") {
		$room = szz0;
	} elsif ($room eq "lav0") {
		$room = szz0;	
	} elsif ($room eq "szy3") {
		$room = szx3;	
	} elsif ($room eq "uzx4") {
		$room = uzw4;	
	} elsif ($room eq "uzy4") {
		$room = uzx4;
	} elsif ($room eq "uzz4") {
		$room = uzy4;	
	} elsif ($room eq "keyuzw4") {
		$room = uzz4;	
	} elsif ($room eq "ua4") {
		$room = uzz4;	
	} elsif ($room eq "uzz6") {
		$room = uzy6;	
	} elsif ($room eq "uzy6") {
		$room = uzx6;		
	} elsif ($room eq "uzx6") {
		$room = uzw6;	
	} elsif ($room eq "uzw6") {
		$room = uzv6;
	} elsif ($room eq "sbm2") {
		$room = sam2;
	} elsif ($room eq "lav1") {
		$room = lzv1;
	} elsif ($room eq "lav2") {
		$room = lzv2;
	} elsif ($room eq "kzv3") {
		$room = jzv3;
	} elsif ($room eq "hzv3") {
		$room = izv3;
	} elsif ($room eq "gzv3") {
		$room = fzv3;
	} elsif ($room eq "dzv3") {
		$room = ezv3;		
	} elsif ($room eq "gaa3") {
		$room = gzv3;
	} elsif ($room eq "gac4") {
		$room = gab4;
	} elsif ($room eq "gad4") {
		$room = gac4;																												
	} elsif ($room eq "caa3") {
		$room = czv3;
	} elsif ($room eq "caa2") {
		$room = czv2;	
	} elsif ($room eq "czv3xxq") {
		$room = czv3xxu;
	} elsif ($room eq "dzv4") {
		$room = czv3xxq;	
	} elsif ($room eq "daa4") {
		$room = dzv4;
	} elsif ($room eq "caa4") {
		$room = czv3xxq;						
	} elsif ($room eq "cab3") {
		$room = caa3;
	} elsif ($room eq "dab4") {
		$room = daa4;
	} elsif ($room eq "lavm2") {
		$room = lzvm2;		
	} elsif ($room eq "cac3") {	
		if ($cac3levelin == 1) {
			$room = cab3;
		} elsif ($cac3levelin == 0) {
			$room = dab4;
		} else {
		}
	} elsif ($room eq "cab5") {
		$room = caa5;
	} elsif ($room eq "sam2") {
		$room = szzm2;
	} elsif ($room eq "szzm2") {
		$room = szym2;
	} elsif ($room eq "szym2") {
		$room = szxm2;
	} elsif ($room eq "caam2") {
		$room = czzm2;
	} elsif ($room eq "szym7") {
		$room = szxm7;
	} elsif ($room eq "cabm2") {
		$room = caam2;
	} elsif ($room eq "gad5") {
		$room = gac5;
	} elsif ($room eq "gac5") {
		$room = gab5;
	} elsif ($room eq "lbv3") {
		$room = lav3;
	} elsif ($room eq "cbb1") {
		$room = cab1;
	} elsif ($room eq "szzm7") {
		$room = szym7;
	} elsif ($room eq "sam7") {
		$room = szzm7;
	} elsif ($room eq "sbm7") {
		$room = sam7;
	} elsif ($room eq "sam11") {
		$room = szzm11;
	} elsif ($room eq "sbm11") {
		$room = sam11;
	} elsif ($room eq "szzm11") {
		$room = szym11;
	} elsif ($room eq "szxm8") {
		$room = szwm8;
	} elsif ($room eq 'szwm6') {
		$room = szvm6;
	} elsif ($room eq 'szvm6') {
		$room = kewsszum6;
	} elsif ($room eq 'uzw3') {
		$room = uzv3;
	} elsif ($room eq 'conzw3') {
		$room = conzv3;
	} elsif ($room eq 'conzv3') {
		$room = conzu3;
	} elsif ($room eq 'conzu3') {
		$room = conzt3;
	} elsif ($room eq 'conzt3') {
		$room = conzs3;				
	} elsif ($room eq 'uzv3') {
		$room = padduzu3;
	} elsif ($room eq 'uzu3') {
		$room = uzt3;
	} elsif ($room eq 'uzt4') {
		$room = reactormon1;
	} elsif ($room eq 'uzt4term') {
		$room = uzt4;
	} elsif ($room eq 'uzt3') {
		$room = uzs3;
	} elsif ($room eq 'uzv1') {
		$room = uzu1;
	} elsif ($room eq 'uzu1') {
		$room = uzt1;
	} elsif ($room eq 'uzt1') {
		$room = uzs1;
	} elsif ($room eq 'uzw1') {
		$room = uzv1;																												
	} else {
	}
}

sub southroom {
	if ($room eq "szz3") {
		$room = sa3;
	} elsif ($room eq "szy3") {
		$room = szz3;
	} elsif ($room eq "szz0") {	
		if ($szz0levelin == 0) {
			$room = sa0;
		} elsif ($szz0levelin == 1) {
			$room = lav0;
		} else {
		}
	} elsif ($room eq "szx3") {
		$room = szy3;
	} elsif ($room eq "uzw4") {
		$room = uzx4;		
	} elsif ($room eq "uzx4") {
		$room = uzy4;	
	} elsif ($room eq "uzy4") {
		$room = uzz4;
	} elsif ($room eq "uzz4") {
		$room = $keyuzw4var;	
	} elsif ($room eq "uzy6") {
		$room = uzz6;
	} elsif ($room eq "uzx6") {
		$room = uzy6;
	} elsif ($room eq "uzw6") {
		$room = uzx6;
	} elsif ($room eq "uzv6") {
		$room = uzw6;
	} elsif ($room eq "sam2") {
		$room = sbm2;	
	} elsif ($room eq "lzv1") {
		$room = lav1;	
	} elsif ($room eq "lzv2") {
		$room = lav2;	
	} elsif ($room eq "jzv3") {
		$room = kzv3;
	} elsif ($room eq "izv3") {
		$room = hzv3;
	} elsif ($room eq "fzv3") {
		$room = gzv3;
	} elsif ($room eq "ezv3") {
		$room = dzv3;		
	} elsif ($room eq "gzv3") {
		$room = gaa3;
	} elsif ($room eq "gab4") {
		$room = gac4;
	} elsif ($room eq "gac4") {
		$room = gad4;																				
	} elsif ($room eq "czv3") {
		$room = caa3;
	} elsif ($room eq "czv2") {
		$room = caa2;	
	} elsif ($room eq "czv3xxu") {
		$room = czv3xxq;
	} elsif ($room eq "czv3xxq") {
		$room = dzv4;
	} elsif ($room eq "dzv4") {
		$room = daa4;
	} elsif ($room eq "caa3") {
		$room = cab3;
	} elsif ($room eq "daa4") {
		$room = dab4;
	} elsif ($room eq "lzvm2") {
		$room = lavm2;		
	} elsif ($room eq "dab4") {
		$room = cac3;
		$cac3levelin = 0;
	} elsif ($room eq "cab3") {
		$room = cac3;
		$cac3levelin = 1;
	} elsif ($room eq "caa5") {
		$room = cab5;
	} elsif ($room eq "szzm2") {
		$room = sam2;
	} elsif ($room eq "szym2") {
		$room = szzm2;
	} elsif ($room eq "szxm2") {
		$room = szym2;
	} elsif ($room eq "czzm2") {
		$room = caam2;
	} elsif ($room eq "szxm7") {
		$room = szym7;
	} elsif ($room eq "caam2") {
		$room = cabm2;
	} elsif ($room eq "gac5") {
		$room = gad5;
	} elsif ($room eq "gab5") {
		$room = gac5;
	} elsif ($room eq "lav3") {
		$room = lbv3;
	} elsif ($room eq "cab1") {
		$room = cbb1;
	} elsif ($room eq "szym7") {
		$room = szzm7;
	} elsif ($room eq "szzm7") {
		$room = sam7;
	} elsif ($room eq "sam7") {
		$room = sbm7;
	} elsif ($room eq "szzm11") {
		$room = sam11;
	} elsif ($room eq "sam11") {
		$room = sbm11;
	} elsif ($room eq "szym11") {
		$room = szzm11;
	} elsif ($room eq "szwm8") {
		$room = szxm8;
	} elsif ($room eq "szvm6") {
		$room = szwm6;
	} elsif ($room eq "kewsszum6") {
		$room = szvm6;
	} elsif ($room eq 'szum6') {
		$room = szvm6;
	} elsif ($room eq 'uzv3') {
		$room = uzw3;
	} elsif ($room eq 'conzv3') {
		$room = conzw3;
	} elsif ($room eq 'conzu3') {
		$room = conzv3;
	} elsif ($room eq 'conzt3') {
		$room = conzu3;	
	} elsif ($room eq 'conzs3') {
		$room = conzt3;				
	} elsif ($room eq 'uzu3') {
		$room = uzv3;
	} elsif ($room eq 'padduzu3') {
		$room = uzv3;
	} elsif ($room eq 'uzt3') {
		$room = uzu3;
	} elsif ($room eq 'reactormon1') {
		$room = uzt4;
	} elsif ($room eq 'uzt4') {
		$room = uzt4term;
	} elsif ($room eq 'uzs3') {
		$room = uzt3;
	} elsif ($room eq 'uzu1') {
		$room = uzv1;
	} elsif ($room eq 'uzt1') {
		$room = uzu1;
	} elsif ($room eq 'uzs1') {
		$room = uzt1;
	} elsif ($room eq 'uzv1') {
		$room = uzw1;																																					
	} else {
	}	
}

sub northeastroom {
	if ($room eq "szym11") {
		$room = szxm10;
	} elsif ($room eq "szxm10") {
		$room = szwm9;
	} elsif ($room eq "szwm9") {
		$room = szvm8;	
	} else {
	}
}

sub northwestroom {
	if ($room eq "gab4") {
		$room = gaa3;
	} else {
	}
}

sub southeastroom {
	if ($room eq "gaa3") {
		$room = gab4;
	} else {
	}	
}

sub southwestroom {
	if ($room eq "szxm10") {
		$room = szym11;
	} elsif ($room eq "szwm9") {
		$room = szxm10;
	} elsif ($room eq "szvm8") {
		$room = szwm9;	
	} else {
	}
}

sub uproom {
	if ($room eq 'zug1') {
		$room = yug1;
	} elsif ($room eq 'conzw3') {
		$room = uzw3;
	} elsif ($room eq 'conzu3') {
		$room = uzu3;
	} elsif ($room eq 'conzs1') {
		$room = uzs1;																															
	} else {
	}
}

sub downroom {
	if ($room eq 'yug1') {
		$room = zug1;
	} elsif ($room eq 'uzw3') {
		$room = conzw3;
	} elsif ($room eq 'uzu3') {
		$room = conzu3;
	} elsif ($room eq 'uzs1') {
		$room = conzs1;
	} elsif ($room eq 'u2zv1') {
		$room = uzv1;			
	} else {
	}
}


sub readinscript {
infinitenewlines();
inventorybar1();

if ($read eq "sa0map") {
print"####################################################
# Sewage Sector A1:                                #
#                                                  #
#                                |    |            #
#                                |    |            #  
#    +------+                    |    |            #  
#    |      |                    |    |            #  
# ---+^^^^^^+--------------------+    +----------+ #
#  X                                        =    | #
#  X                                        =    | #
# -----------------------------------------------+ #
#                                                  #
####################################################
";

	if ($sa0readintel <= 2) {
		$pintellect = $pintellect + 0.1;
	} else {
	}
	$sa0readintel = $sa0readintel + 1;

} elsif ($read eq "gac4read") {
print"################################\n";
print"#         PINUP POSTER         #\n";
print"#   *                          #\n";
print"#                              #\n";
print"#                              #\n";
print"#                        *     #\n";
print"#                              #\n";
print"#                              #\n";
print"#                              #\n";
print"#          *                   #\n";
print"#                              #\n";
print"#                              #\n";
print"#                     *        #\n";
print"#                              #\n";
print"#                              #\n";
print"#                            * #\n";   
print"#                              #\n";
print"# *                            #\n";
print"#                              #\n";
print"#                              #\n";
print"#                              #\n";
print"#         JANUARY 2162         #\n";
print"#--SDX109 Cloaked StarFighter--#\n";
print"################################\n";


	if ($gac4readintel <= 3) {
		$pintellect = $pintellect + 0.05;
	} else {
	}
	$gac4readintel = $gac4readintel + 1;
} elsif ($read eq "roomlbvtrg") {
print"1) Tome Containing The GNU General Public License\n";
print"2) Pamphlet Containing The BSD License\n";
print"3) Contraband Editorial Concerning IP\n";
print"4) Tomus Rhymus\n";	
} else {
print"$read\n";
}

inventorybar2();
	if ($read eq "roomlbvtrg") {
		print color "reset"; print'Choose Book To Read: ';
	
		$readlbvtrg = <STDIN>;
		chomp($readlbvtrg);
		readlbvtrg();
	
	} else {	
		print color "reset";
		print"press ["; 
		print color 'green'; 
		print"ENTER";
		print color 'reset'; 
		print"]";
			
		$placeholder = <STDIN>;
		chomp($placeholder);
	}
readtrack();
}

sub readlbvtrg {

if ($readlbvtrg == 1) {
$ggpltext = <<"ENDGPLLCNS";
		    GNU GENERAL PUBLIC LICENSE
		       Version 2, June 1991

 Copyright (C) 1989, 1991 Free Software Foundation, Inc.
                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

			    Preamble

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation's software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Library General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps: (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author's protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone's free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.

		    GNU GENERAL PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The "Program", below,
refers to any such program or work, and a "work based on the Program"
means either the Program or any derivative work under copyright law:
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term "modification".)  Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program's
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.

  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.

  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and "any
later version", you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

			    NO WARRANTY

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

		     END OF TERMS AND CONDITIONS
ENDGPLLCNS
infinitenewlines();
cyanbar1();
print($ggpltext);
cyanbar2();
	print color "reset";
	print"press ["; 
	print color 'green'; 
	print"ENTER";
	print color 'reset'; 
	print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
} elsif ($readlbvtrg == 2) {
$bsdltext = <<"ENDBSDLCNS";

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
   2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
   3. The name of the author may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

ENDBSDLCNS
infinitenewlines();
cyanbar1();
print($bsdltext);
cyanbar2();
	print color "reset";
	print"press ["; 
	print color 'green'; 
	print"ENTER";
	print color 'reset'; 
	print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
} elsif ($readlbvtrg == 3) {
$bedittext = <<"ENDBEDITORIAL";
NOTICE FROM FEDERAL PRESS: THE PUBLISHING OF THIS CONTRABAND ARTICLE IS TO SHED LIGHT ON THE FLAWED AND REPULSIVE LOGIC OF THE HACKERS AND PIRATES WHO CONTINUE TO INFECT OUR GREAT SOCIETY. DICTATION, REPLICATION, AND DISTROBUTION OF THIS ARTICLE BY PARTIES OTHER THE FEDERAL PRESS IS PROHIBITIED AND WILL BE PROCECUTED TO THE FULLEST EXTENT OF THE HALLOWED LAW!

HERE IS EVIDENT THE LOGIC OF THOSE WHOM WHISH TO DESTROY OUR GREAT INSTITUTIONS:

Once upon a time during one of my brief slashdot (NOTE: "SLASHDOT" WAS THE PRIMARY MEANS OF COMMUNICATION THAT THE PIRATES AND HACKERS USED TO CARRY OUT THEIR NEFERIOUS DEEDS. THIS SCOURGE HAS BEEN ELIMINATED BY THE FEDERAL GOVERMENT) forays I came across a topic concerning (!) IP.

The discussion was about a wedding photographer's copyright and strangely enough someone, deciding principle is moot, sided with the photographers but against the MPAA and RIAA on the very same issue. Forth from this post came the dissenting viewpoint of an individual who shall not be named:

 "What difference does it make if it's a billion dollar company you're cheating, or a guy barely scraping by. Either way it is wrong. The MPAA deserves the same respect that an individual photographer deserves for copyrighted works. Everything you complain about, the MPAA members deal with on the order of millions of dollars instead of thousands of dollars. They're taking risks as well."

To this I respond.

Neither the MPAA nor the photographer "little guy" deserve respect in this instance. Duplication is not wrong. Copyright is, however, very wrong. It destroys information and art which would normally make it into the next generation; It is damaging to the very freedom of a people; and, in the spirit of the catholic church, it is unnatural. There is absolutely nothing wrong with the duplication of information and art regardless of the labor he who original created it expended. Duplication of information and art is NOT destruction and has no ill effect on the art or information. In addition since duplication destroys nothing it also has no ill effect on the person of whom created it. The only thing that may not happen is that the creator receives less wealth (in monetary terms) from the creation of said information or art, how is this a morally wrong thing? Does avarice equal the right-thing? Is the love of money paramount over all to make it the right-thing and anything that would decrease the assumed amount of money morally reprehensible? 

(C) FEDERAL PRESS 2155, AUTHOR UNKNOWN
ENDBEDITORIAL
infinitenewlines();
cyanbar1();
print($bedittext);
cyanbar2();
	print color "reset";
	print"press ["; 
	print color 'green'; 
	print"ENTER";
	print color 'reset'; 
	print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
} elsif ($readlbvtrg == 4) {
$tomusrhymustext = <<"ENDTOMUSRHYMUS";
It ain't fun but it's very respectable        | ::Voice Uno, slight lisp
(Yeah) Drug dealing to the crack recepticle   | ::Voice Dos, un thugg!
-----------------------------------------------------------------------------------
Voodoo caps in the head!
Two you aquired 'fore you was done-in 'n fell dead.
-----------------------------------------------------------------------------------
No thanks did you give to me
Shakallahed yo ass,
Lettin you rest in peace finnally
-----------------------------------------------------------------------------------
Bustin caps including lead.
Firing randomly with mah temper turn red.
-----------------------------------------------------------------------------------
Two were expelled before you knew: 
Commin in contact, strikeith upon you.
-----------------------------------------------------------------------------------
I thought to myself how you was something before
But now you ain't nothing more than a worthless, helpless glucose whore.
-----------------------------------------------------------------------------------
A thugg is a thugg where evah he may be
just front on mah grill and then shall you see
cut you up like woa
bust in yo door
see yo lil hoe
n' fuck that bitch raw
then you might run, probally to grab yo gun
hand on mah strap, ready my gat
put yo head on a plattah
rat-a-tat-tat, splatah splattah
...
The law?  Ain't no mattah

('N thats what happens to bitches: Their bodies - roll into ditches)
-----------------------------------------------------------------------------------
oh mah dear father in heaven
bless me and mah MAC eleven

show me the best way to go about
to go drop these fools and gain some clout

I know you love me down to the bone
But the'res some dumb niggaz that haftah get shown
Why It's stupid ta jump my ride
Or to run up on mah boyz when they don't got a nine.
Fool these cats take from mah house
and mah flesh n blood they decide to douse
with some chemicals that upset the brain
by eating through it's encasing, the bone, the frame
releasing some H plus, instructing organic chemicals to bond
to mah kid's head n turn it into red crayon

Niggah they killed him n ah don't give a shit
Bout love fo an enemy. Its a head fo an eye and they're about to get hit
-----------------------------------------------------------------------------------
shakallin to the cops
fo they get there the're met by hot rocks
-----------------------------------------------------------------------------------
You are a bitch through n' throught
What the fuck do you expect?
Me to just give shit to you?
-----------------------------------------------------------------------------------
I am submerged so underneath the tide that, I, you can not ever hope to see
Be it if you were here, then you might come to know, that there is nothing below me
ENDTOMUSRHYMUS
infinitenewlines();
cyanbar1();
print($tomusrhymustext);
cyanbar2();
	print color "reset";
	print"press ["; 
	print color 'green'; 
	print"ENTER";
	print color 'reset'; 
	print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);	
} else {
	
}

}

sub bpbcf {
infinitenewlines();
cyanbar1();
$pbcpr0ntext = <<"ENDUNDCYPTXTBK";
----------------------------------------------------------------------------
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
>--------------------------------------------------------------------------<
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |
|                                                                          |                                                                        |
----------------------------------------------------------------------------
ENDUNDCYPTXTBK
print($pbcpr0ntext);
cyanbar2();
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
	infinitenewlines();
}

##SHOW#WEAPONS#################################################################
sub showweapons {
	infinitenewlines();
	
	if ($crookddagger == 1) { 
		temp_crookddagger(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done();
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}
	
	
	if ($cappedstaff == 1) { 
		temp_cappedstaff();
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done();
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done(); 
		} else { 
		}
	} else { 
	}	
	
	
	if ($longsword == 1) { 
			temp_longsword(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
	
	if ($redcrowbar == 1) { 
			temp_redcrowbar(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
		
	if ($mace == 1) { 
			temp_mace(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}	

	if ($skive == 1) { 
			temp_skive(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}

	if ($broadtipspear == 1) { 
			temp_broadtipspear(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
	
	if ($bflyknife == 1) { 
			temp_bflyknife(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}

	if ($fireaxe == 1) { 
			temp_fireaxe(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
	
	if ($englishaxe == 1) { 
			temp_englishaxe(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
		
	if ($straightaxe == 1) { 
			temp_straightaxe(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
		
	if ($doubleaxe == 1) { 
			temp_doubleaxe(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
		
	if ($sapg == 1) { 
			temp_semiautopistol(); 
			print color "reset";
			print color 'red'; 
			print'Magazine Capacity: 14 Rounds'; print"\n";		
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
		
	if ($sap45cal == 1) { 
			temp_pistol45cal(); 
			print color "reset";
			print color 'red'; 
			print'Magazine Capacity: 10 Rounds'; print"\n";			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
	
	if ($sg12p == 1) { 
			temp_sg12p();
			print color "reset";
			print color 'red'; 
			print'Magazine Capacity: 4 Shells'; print"\n";	
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}		

	if ($smg9mm == 1) {
			smg9mmsetcheck();
			temp_smg9mm();
			print color "reset";
			print color 'red'; 
			print'Magazine Capacity: 30 Rounds';
						 			
			print color "reset";
			print"\nChose a setting by entering the pertaining number:\n"; 
			print color 'green'; 
			print"1";
			print color 'reset'; 
			print" Semiautomatic\n";
			
			print color 'green'; 
			print"2";
			print color 'reset'; 
			print" Three Round Burst\n";
			
			print color 'green'; 
			print"3";
			print color 'reset'; 
			print" Fully Automatic\n";						
			
			print'or press [ENTER] to continue without selecting';
			print"\n"; print'this weapon or type end or ok to select this';
			print"\n"; print'weapon with the current settings unchanged: ';
			
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "ok") {
			smg9mmsetcheck();
			temp_smg9mmmini();
			assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "end") {
			smg9mmsetcheck();
			temp_smg9mmmini();
			assume_we_are_done(); 		
		} elsif ($keeplookingatguns == 1) {
			$smg9mmsetnbr = 1;
			smg9mmsetcheck();
			temp_smg9mmmini();
			assume_we_are_done(); 
		} elsif ($keeplookingatguns == 2) {
			$smg9mmsetnbr = 2;
			smg9mmsetcheck();
			temp_smg9mmmini();
			assume_we_are_done();
		} elsif ($keeplookingatguns == 3) {
			$smg9mmsetnbr = 3;
			smg9mmsetcheck();
			temp_smg9mmmini();
			assume_we_are_done();
		} else { 
		}
	} else { 
	}

	if ($smg45cal == 1) {
			smg45calsetcheck();
			temp_smg45cal();
			print color "reset";
			print color 'red'; 
			print'Magazine Capacity: 32 Rounds';
						 			
			print color "reset";
			print"\nChose a setting by entering the pertaining number:\n"; 
			print color 'green'; 
			print"1";
			print color 'reset'; 
			print" Semiautomatic\n";
			
			print color 'green'; 
			print"2";
			print color 'reset'; 
			print" Three Round Burst\n";
			
			print color 'green'; 
			print"3";
			print color 'reset'; 
			print" Fully Automatic\n";						
			
			print'or press [ENTER] to continue without selecting';
			print"\n"; print'this weapon or type end or ok to select this';
			print"\n"; print'weapon with the current settings unchanged: ';
			
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "ok") {
			smg45calsetcheck();
			temp_smg45calmini();
			assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "end") {
			smg45calsetcheck();
			temp_smg45calmini();
			assume_we_are_done(); 		
		} elsif ($keeplookingatguns == 1) {
			$smg45calsetnbr = 1;
			smg45calsetcheck();
			temp_smg45calmini();
			assume_we_are_done(); 
		} elsif ($keeplookingatguns == 2) {
			$smg45calsetnbr = 2;
			smg45calsetcheck();
			temp_smg45calmini();
			assume_we_are_done();
		} elsif ($keeplookingatguns == 3) {
			$smg45calsetnbr = 3;
			smg45calsetcheck();
			temp_smg45calmini();
			assume_we_are_done();
		} else { 
		}
	} else { 
	}
	
	if ($rpgX14launcher == 1) { 
			temp_rpgx14(); 			
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done(); 
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();
		} else { 
		}
	} else { 
	}
			
	if ($noweaponnone == 1) { 
		temp_none(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this weapon";
			print"\n";
		$keeplookingatguns = <STDIN>;
		chomp($keeplookingatguns);
		if ($keeplookingatguns eq "end") { assume_we_are_done();
		} elsif ($keeplookingatguns eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}
		
}
##SHOW#WEAPONS#END#############################################################


##SHOW#ARMOR###################################################################
sub showarmor {
	infinitenewlines();
	
	if ($leathervestarmor == 1) { 
		armor_leather1(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this armor";
			print"\n";
		$keeplookingatarmor = <STDIN>;
		chomp($keeplookingatarmor);
		if ($keeplookingatarmor eq "end") { assume_we_are_done();
		} elsif ($keeplookingatarmor eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}
	
	if ($redtshirtarmor == 1) { 
		armor_shirt1(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this armor";
			print"\n";
		$keeplookingatarmor = <STDIN>;
		chomp($keeplookingatarmor);
		if ($keeplookingatarmor eq "end") { assume_we_are_done();
		} elsif ($keeplookingatarmor eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}
		
	if ($ringmailvestarmor == 1) { 
		armor_ringmail1(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this armor";
			print"\n";
		$keeplookingatarmor = <STDIN>;
		chomp($keeplookingatarmor);
		if ($keeplookingatarmor eq "end") { assume_we_are_done();
		} elsif ($keeplookingatarmor eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}
	
	if ($whiterobearmor == 1) { 
		armor_whiterobe1(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this armor";
			print"\n";
		$keeplookingatarmor = <STDIN>;
		chomp($keeplookingatarmor);
		if ($keeplookingatarmor eq "end") { assume_we_are_done();
		} elsif ($keeplookingatarmor eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}
		
	if ($nonearmor == 1) { 
		armor_none(); 
			print color "reset";
			print"type "; 
			print color 'green'; 
			print"end";
			print color 'reset'; 
			print" or ";
			print color 'green'; 
			print"ok";
			print color 'reset';
			print" to select this armor";
			print"\n";
		$keeplookingatarmor = <STDIN>;
		chomp($keeplookingatarmor);
		if ($keeplookingatarmor eq "end") { assume_we_are_done();
		} elsif ($keeplookingatarmor eq "ok") { assume_we_are_done();		 
		} else { 
		}		
	} else { 
	}	
}
##SHOW#ARMOR#END###############################################################


##MANA#AND#HEALTH#CHECKS#######################################################
##MANA#AND#HEALTH#CHECKS#######################################################

##HEALTH##CHECK2################################################################
sub healthcheck2 {
	if ($health >= 100) {
		$healthcheckvar = 0;
		$health = 100;
		#keeping things in check and dodging the ????????????? bar
	} else {
	}
}

##HEALTH##CHECK################################################################
sub healthcheck {

	if ($physexp <= 0) {
		$fcphysexp = 0.1;
	} else {
		$fcphysexp = $physexp;
	}
	
	if ($health >= 100) {
		$healthcheckvar = 0;
		$health = 100;
		#do nothing
	} else {
		$healthcheckvar = (($healthbonus * 0.5) * (1 + ($fcphysexp / 10)));		
		$health = $health + $healthcheckvar;
		$healthcheckvar = 0;
	}
	#keeping health at or under 100
	#hopefully this didn't kill your guy
}

##MANA##CHECK##################################################################

sub manacheck2 {
	if ($mana >= 100) {
		$manacheckvar = 0;
		$mana = 100;
		#do nothing
	} else {
	}
}

sub manacheck {
	if ($mana >= 100) {
		$manacheckvar = 0;
		$mana = 100;
		#do nothing
	} else {
		$manacheckvar = $magicexp * 0.5;
		$mana = $mana + $manacheckvar;
		$manacheckvar = 0;
	}
	#done with that part now to limit the mana to 100
	#ok we are done
}
##MANA##CHECK##################################################################

##MANA#AND#HEALTH#CHECKS#######################################################
##MANA#AND#HEALTH#CHECKS#######################################################




##ROOMS#ETC####################################################################
##ROOMS#ETC####################################################################
sub findroom {
	if ($room eq "start") {
	
	} elsif ($room eq "ua1") {
		room_ua1();	
	} elsif ($room eq "ua2") {
		room_ua2();	
	} elsif ($room eq "la2") {
		room_la2();
	} elsif ($room eq "sa2") {
		room_sa2();
	} elsif ($room eq "sa1") {
		room_sa1();
	} elsif ($room eq "sa0") {
		room_sa0();	
	} elsif ($room eq "sa3") {
		room_sa3();							
	} elsif ($room eq "sa4") {
		room_sa4();	
	} elsif ($room eq "szz3") {
		room_szz3();
	} elsif ($room eq "szy3") {
		room_szy3();
	} elsif ($room eq "szz0") {
		room_szz0();		
	} elsif ($room eq "lav0") {
		room_lav0();
	} elsif ($room eq "lavm1") {
		room_lavm1();	
	} elsif ($room eq "szx3") {
		room_szx3();		
	} elsif ($room eq "uzx4") {
		room_uzx4();
	} elsif ($room eq "sam1") {
		room_sam1();	
	} elsif ($room eq "uzw4") {
		room_uzw4();
	} elsif ($room eq "lavm2") {
		room_lavm2();
	} elsif ($room eq "uzy4") {
		room_uzy4();
	} elsif ($room eq "uzz4") {
		room_uzz4();	
	} elsif ($room eq "keyuzw4") {	
		room_keyuzw4();	
	} elsif ($room eq "ua4") {	
		room_ua4();
	} elsif ($room eq "uzz5") {	
		room_uzz5();
	} elsif ($room eq "uzz6") {	
		room_uzz6();
	} elsif ($room eq "uzy6") {	
		room_uzy6();
	} elsif ($room eq "uzx6") {	
		room_uzx6();
	} elsif ($room eq "uzx7") {	
		room_uzx7();
	} elsif ($room eq "uzw6") {	
		room_uzw6();
	} elsif ($room eq "uzv6") {	
		room_uzv6();
	} elsif ($room eq "uzv5") {	
		room_uzv5();
	} elsif ($room eq "uzv4") {	
		room_uzv4();
	} elsif ($room eq "uzv7") {	
		room_uzv7();
	} elsif ($room eq "x10mtnw") {	
		room_x10mtnw();		
	} elsif ($room eq "uzv3") {	
		room_uzv3();
	} elsif ($room eq "sam2") {
		room_sam2();
	} elsif ($room eq "sbm2") {
		room_sbm2();	
	} elsif ($room eq "lav1") {
		room_lav1();
	} elsif ($room eq "lzv1") {
		room_lzv1();
	} elsif ($room eq "lav2") {
		room_lav2();
	} elsif ($room eq "lzv2") {
		room_lzv2();
	} elsif ($room eq "lzv3") {
		room_lzv3();
	} elsif ($room eq "kzv3") {
		room_kzv3();
	} elsif ($room eq "jzv3") {
		room_jzv3();
	} elsif ($room eq "izv3") {
		room_izv3();
	} elsif ($room eq "hzv3") {
		room_hzv3();
	} elsif ($room eq "gzv3") {
		room_gzv3();
	} elsif ($room eq "fzv3") {
		room_fzv3();
	} elsif ($room eq "ezv3") {
		room_ezv3();
	} elsif ($room eq "dzv3") {
		room_dzv3();
	} elsif ($room eq "czv3") {
		room_czv3();				
	} elsif ($room eq "gaa3") {
		room_gaa3();
	} elsif ($room eq "gab4") {
		room_gab4();
	} elsif ($room eq "gac4") {
		room_gac4();
	} elsif ($room eq "gad4") {
		room_gad4();
	} elsif ($room eq "gab5") {
		room_gab5();	
	} elsif ($room eq "usfa4") {
		room_usfa4();
	} elsif ($room eq "zug1") {
		room_zug1();
	} elsif ($room eq "yug1") {
		room_yug1();
	} elsif ($room eq "caa3") {
		room_caa3();
	} elsif ($room eq "caa2") {
		room_caa2();
	} elsif ($room eq "caa1") {
		room_caa1();
	} elsif ($room eq "caa0") {
		room_caa0();
	} elsif ($room eq "caa4") {
		room_caa4();
	} elsif ($room eq "czv2") {
		room_czv2();
	} elsif ($room eq "czv3xxd") {
		room_czv3xxd();
	} elsif ($room eq "czv3xxu") {
		room_czv3xxu();
	} elsif ($room eq "czv3xxq") {
		room_czv3xxq();
	} elsif ($room eq "dzv4") {
		room_dzv4();
	} elsif ($room eq "daa4") {
		room_daa4();
	} elsif ($room eq "daa3") {
		room_daa3();
	} elsif ($room eq "cab3") {
		room_cab3();
	} elsif ($room eq "dab4") {
		room_dab4();
	} elsif ($room eq "cac3") {
		room_cac3();
	} elsif ($room eq "daa5") {
		room_daa5();
	} elsif ($room eq "lzvm2") {
		room_lzvm2();
	} elsif ($room eq "caa5") {
		room_caa5();
	} elsif ($room eq "cab5") {
		room_cab5();
	} elsif ($room eq "szzm2") {
		room_szzm2();
	} elsif ($room eq "szym2") {
		room_szym2();
	} elsif ($room eq "szxm2") {
		room_szxm2();
	} elsif ($room eq "szxm3") {
		room_szxm3();
	} elsif ($room eq "szxm4") {
		room_szxm4();
	} elsif ($room eq "szxm5") {
		room_szxm5();
	} elsif ($room eq "szxm6") {
		room_szxm6();
	} elsif ($room eq "szxm7") {
		room_szxm7();
	} elsif ($room eq "szym7") {
		room_szym7();				
	} elsif ($room eq "caam1") {
		room_caam1();
	} elsif ($room eq "caam2") {
		room_caam2();
	} elsif ($room eq "czzm2") {
		room_czzm2();
	} elsif ($room eq "czzm1") {
		room_czzm1();
	} elsif ($room eq "czz0") {
		room_czz0();
	} elsif ($room eq "czz1") {
		room_czz1();
	} elsif ($room eq "cab2") {
		room_cab2();
	} elsif ($room eq "cab1") {
		room_cab1();
	} elsif ($room eq "cab0") {
		room_cab0();
	} elsif ($room eq "cabm1") {
		room_cabm1();
	} elsif ($room eq "cabm2") {
		room_cabm2();
	} elsif ($room eq "gac5") {
		room_gac5();
	} elsif ($room eq "gad5") {
		room_gad5();
	} elsif ($room eq "lav3") {
		room_lav3();
	} elsif ($room eq "lbv3") {
		room_lbv3();
	} elsif ($room eq "cbb1") {
		room_cbb1();
	} elsif ($room eq "szzm7") {
		room_szzm7();
	} elsif ($room eq "sam7") {
		room_sam7();
	} elsif ($room eq "sbm7") {
		room_sbm7();
	} elsif ($room eq "sam8") {
		room_sam8();
	} elsif ($room eq "sam9") {
		room_sam9();	
	} elsif ($room eq "sam10") {
		room_sam10();
	} elsif ($room eq "sam11") {
		room_sam11();
	} elsif ($room eq "sbm11") {
		room_sbm11();	
	} elsif ($room eq "szzm11") {
		room_szzm11();
	} elsif ($room eq "szym11") {
		room_szym11();
	} elsif ($room eq "szxm10") {
		room_szxm10();
	} elsif ($room eq "szwm9") {
		room_szwm9();
	} elsif ($room eq "szwm8") {
		room_szwm8();
	} elsif ($room eq "szxm8") {
		room_szxm8();
	} elsif ($room eq "szwm7") {
		room_szwm7();
	} elsif ($room eq "szvm8") {
		room_szvm8();
	} elsif ($room eq "szwm6") {
		room_szwm6();
	} elsif ($room eq "szvm6") {
		room_szvm6();
	} elsif ($room eq "kewsszum6") {
		room_kewsszum6();
	} elsif ($room eq 'szum6') {
		room_szum6();
	} elsif ($room eq "switchswrszum5") {
		room_switchswrszum5();
	} elsif ($room eq 'szum5') {
		room_szum5();
	} elsif ($room eq 'uzw3') {
		room_uzw3();
	} elsif ($room eq 'conzw3') {
		room_conzw3();
	} elsif ($room eq 'conzv3') {
		room_conzv3();
	} elsif ($room eq 'conzu3') {
		room_conzu3();
	} elsif ($room eq 'uzu3') {
		room_uzu3();
	} elsif ($room eq 'padduzu3') {
		room_padduzu3();
	} elsif ($room eq 'uzt3') {
		room_uzt3();
	} elsif ($room eq 'reactormon1') {
		room_reactormon1();
	} elsif ($room eq 'uzt4') {
		room_uzt4();
	} elsif ($room eq 'uzt4term') {
		room_uzt4term();
	} elsif ($room eq 'conzt3') {
		room_conzt3();
	} elsif ($room eq 'conzs3') {
		room_conzs3();
	} elsif ($room eq 'keyuzs4') {
		room_keyuzs4();
	} elsif ($room eq 'uzs4') {
		room_uzs4();	
	} elsif ($room eq 'uzs3') {
		room_uzs3();
	} elsif ($room eq 'uzs2') {
		room_uzs2();
	} elsif ($room eq 'uzs1') {
		room_uzs1();
	} elsif ($room eq 'conzs2') {
		room_conzs2();
	} elsif ($room eq 'conzs1') {
		room_conzs1();
	} elsif ($room eq 'uzv2') {
		room_uzv2();
	} elsif ($room eq 'u2zv1') {
		room_u2zv1();
	} elsif ($room eq 'u2zv0') {
		room_u2zv0();
	} elsif ($room eq 'uzv1') {
		room_uzv1();
	} elsif ($room eq 'uzu1') {
		room_uzu1();
	} elsif ($room eq 'uzt1') {
		room_uzt1();
	} elsif ($room eq 'uzw1') {
		room_uzw1();																																																											
	} else {
	}
}


##ROOMS#ETC####################################################################
##ROOMS#ETC####################################################################



##ITEMS#RED#BAR################################################################
##ITEMS#RED#BAR################################################################
sub redbar {
t187(); t89(); t187(); t89(); t187(); t89(); t187(); t89(); t187(); t89(); t187(); t89(); t187(); 
t89(); t187(); t89(); t187(); t89(); t187(); t89(); t187(); t89(); t187(); t89(); t187(); t89();
}
##ITEMS#RED#BAR################################################################
##ITEMS#RED#BAR################################################################


##ITEMS#BLOOD#BAR##############################################################
##ITEMS#BLOOD#BAR##############################################################
sub bloodbar1 {
t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); 
t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89();
print"\n";
}

sub bloodbar2 {
t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89();
t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159(); t89(); t159();
print"\n";
}
##ITEMS#BLOOD#BAR##############################################################
##ITEMS#BLOOD#BAR##############################################################


##MAIN#BLUE#BAR################################################################
##MAIN#BLUE#BAR################################################################
sub sbluebar {
t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); 
t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6();
print"\n";
}

sub sbluebar2 {
t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6();
t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5(); t6(); t5();
print"\n";
}

sub bluebar {
t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); 
t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187();
print"\n";
}

sub bluebar2 {
t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187();
t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186(); t187(); t186();
print"\n";
}
##MAIN#BLUE#BAR################################################################
##MAIN#BLUE#BAR################################################################



##HEALTH#BAR###################################################################
##HEALTH#BAR###################################################################
sub healthbar {
t6(); t5();

if ($health <= 1) {
	print colored ("                    ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 5) {
	print colored ("[                   ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 10) {
	print colored ("[]                  ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 15) {
	print colored ("[][                 ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 20) {
	print colored ("[][]                ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 25) {
	print colored ("[][][               ","$colorfhealthbar on_$colorhealthbar");	
} elsif ($health <= 30) {
	print colored ("[][][]              ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 35) {
	print colored ("[][][][             ","$colorfhealthbar on_$colorhealthbar");	
} elsif ($health <= 40) {
	print colored ("[][][][]            ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 45) {
	print colored ("[][][][][           ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 50) {
	print colored ("[][][][][]          ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 55) {
	print colored ("[][][][][][         ","$colorfhealthbar on_$colorhealthbar");	
} elsif ($health <= 60) {
	print colored ("[][][][][][]        ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 65) {
	print colored ("[][][][][][][       ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 70) {
	print colored ("[][][][][][][]      ","$colorfhealthbar on_$colorhealthbar")
} elsif ($health <= 75) {
	print colored ("[][][][][][][][     ","$colorfhealthbar on_$colorhealthbar");	
} elsif ($health <= 80) {
	print colored ("[][][][][][][][]    ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 85) {
	print colored ("[][][][][][][][][   ","$colorfhealthbar on_$colorhealthbar");		
} elsif ($health <= 90) {
	print colored ("[][][][][][][][][]  ","$colorfhealthbar on_$colorhealthbar");
} elsif ($health <= 95) {
	print colored ("[][][][][][][][][][ ","$colorfhealthbar on_$colorhealthbar");	
} elsif ($health <= 100) {
	print colored ("[][][][][][][][][][]","$colorfhealthbar on_$colorhealthbar");	
} else {
	print colored ("????????????????????","$colorfhealthbar on_$colorhealthbar");
}

t6();

if ($health <= 0) {
	print colored ("                    ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 1) {
	print colored ("                    ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 5) {
	print colored ("[                   ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 10) {
	print colored ("[]                  ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 15) {
	print colored ("[][                 ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 20) {
	print colored ("[][]                ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 25) {
	print colored ("[][][               ","$colorfmanabar on_$colormanabar");	
} elsif ($mana <= 30) {
	print colored ("[][][]              ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 35) {
	print colored ("[][][][             ","$colorfmanabar on_$colormanabar");	
} elsif ($mana <= 40) {
	print colored ("[][][][]            ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 45) {
	print colored ("[][][][][           ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 50) {
	print colored ("[][][][][]          ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 55) {
	print colored ("[][][][][][         ","$colorfmanabar on_$colormanabar");	
} elsif ($mana <= 60) {
	print colored ("[][][][][][]        ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 65) {
	print colored ("[][][][][][][       ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 70) {
	print colored ("[][][][][][][]      ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 75) {
	print colored ("[][][][][][][][     ","$colorfmanabar on_$colormanabar");	
} elsif ($mana <= 80) {
	print colored ("[][][][][][][][]    ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 85) {
	print colored ("[][][][][][][][][   ","$colorfmanabar on_$colormanabar");		
} elsif ($mana <= 90) {
	print colored ("[][][][][][][][][]  ","$colorfmanabar on_$colormanabar");
} elsif ($mana <= 95) {
	print colored ("[][][][][][][][][][ ","$colorfmanabar on_$colormanabar");	
} elsif ($mana <= 100) {
	print colored ("[][][][][][][][][][]","$colorfmanabar on_$colormanabar");	
} else {
	print colored ("????????????????????","$colorfmanabar on_$colormanabar");
}

t5(); t6(); t5();
print"\n";

}
##HEALTH#BAR###################################################################
##HEALTH#BAR###################################################################





##INVENTORY#BAR################################################################
##INVENTORY#BAR################################################################

##TOP##########################################################################
sub inventorybar1 {
t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187();
t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71();
print"\n";
}
##BOTTOM#######################################################################
sub inventorybar2 {
t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71();
t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187(); t71(); t187();
print"\n";
}
##INVENTORY#BAR################################################################
##INVENTORY#BAR################################################################



##CYAN#BAR################################################################
##CYAN#BAR################################################################

##TOP##########################################################################
sub cyanbar1 {
t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187();
t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123();
print"\n";
}
##BOTTOM#######################################################################
sub cyanbar2 {
t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123();
t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187(); t123(); t187();
print"\n";
}
##CYAN#BAR################################################################
##CYAN#BAR################################################################



##ICE#BAR#################################################################
##ICE#BAR#################################################################

##TOP##########################################################################
sub icebar1 {
t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123();
t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186();
print"\n";
}
##BOTTOM#######################################################################
sub icebar2 {
t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186();
t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123(); t186(); t123();
print"\n";
}
##ICE#BAR#################################################################
##ICE#BAR#################################################################


##TOP##########################################################################
sub darkbar1 {
t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); 
t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); 
print"\n";
}
##BOTTOM#######################################################################
sub darkbar2 {
t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); 
t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); t159(); t187(); 
print"\n";
}
##ICE#BAR#################################################################
##ICE#BAR#################################################################


##Brown#BAR###############################################################
##Brown#BAR###############################################################

##TOP##########################################################################
sub brownbar1 {
t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187();
t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122();
print"\n";
}
##BOTTOM#######################################################################
sub brownbar2 {
t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122();
t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187(); t122(); t187();
print"\n";
}
##Brown#BAR###############################################################
##Brown#BAR###############################################################



##MAGE#BAR################################################################
##MAGE#BAR################################################################

##TOP##########################################################################
sub magebar1 {
t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89();
t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124();
print"\n";
}
##BOTTOM#######################################################################
sub magebar2 {
t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124();
t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89(); t124(); t89();
print"\n";
}
##MAGE#BAR################################################################
##MAGE#BAR################################################################



sub magebooklist {
	infinitenewlines();
	magebar1();
	print color 'bold yellow'; print"Spells and Incantations You Know:\n";
	print color 'reset';
	spellslist();
	magebar2();
	
		print color "reset";
		print"press ["; 
		print color 'green'; 
		print"ENTER";
		print color 'reset'; 
		print"]";
		
	$placeholder = <STDIN>;
	chomp($placeholder);
}



##INVENTORY#LIST###############################################################
sub inventorylist {
	infinitenewlines();
	inventorybar1();
	print color 'bold yellow'; print"Your Inventory:\n"; print color 'reset'; 
	weaponslist();
	armorlist();
	miscolist();
	foodlist();
	inventorybar2();	
	
			print color "reset";
			print"press ["; 
			print color 'green'; 
			print"ENTER";
			print color 'reset'; 
			print"]";
			
	$placeholder = <STDIN>;
	chomp($placeholder);
}
##WEAPONS#LIST#################################################################
sub weaponslist {

print"Weapons:\n";
#Yea, I know, this is inefficient

	if ($crookddagger == 1) { print"Crook'd Dagger\n"; } else { };
	if ($longsword == 1) { print"Long Sword\n"; } else { };
	if ($cappedstaff == 1) { print"Capped Staff\n"; } else { };
	if ($redcrowbar == 1) { print"Red Crowbar\n"; } else { };	
	if ($mace == 1) { print"Mace\n"; } else { };
	if ($skive == 1) { print"Skive\n"; } else { };
	if ($broadtipspear == 1) { print"Broad Tip Spear\n"; } else { };
	if ($bflyknife == 1) { print"Butterfly Knife\n"; } else { };
	if ($fireaxe == 1) { print"Fire Axe\n"; } else { };
	if ($englishaxe == 1) { print"English Axe\n"; } else { };
	if ($straightaxe == 1) { print"Straight Axe\n"; } else { };
	if ($doubleaxe == 1) { print"Double Headed Axe\n"; } else { };
	if ($sapg == 1) { print"Semiautomatic Pistol + Laser Sight\n"; } else { };
	if ($sap45cal == 1) { print".45 Caliber Semiautomatic Pistol\n"; } else { };
	if ($sg12p == 1) { print"12GA Pump Action Shotgun\n"; } else { };
	if ($smg9mm == 1) { print"9MM Submachinegun + Silencer\n"; } else { };
	if ($smg45cal == 1) { print".45 Caliber Submachinegun Carbine\n"; } else { };
	if ($rpgX14launcher == 1) { print"RPG-X14 Launcher\n"; } else { };					
	
print"\n";
}
##WEAPONS#LIST#################################################################

sub armorlist {

print"Armor:\n";
#IaSEIA: inefficincy and spelling errors in ACTION!
	if ($leathervestarmor == 1) { print"leather vest\n"; } else { };
	if ($redtshirtarmor == 1) { print"red t-shirt\n"; } else { };
	if ($ringmailvestarmor == 1) { print"ring mail vest\n"; } else { };	
	if ($whiterobearmor == 1) { print"white robe\n"; } else { };
print"\n";
}


##SPELLS#LIST##################################################################
sub spellslist {

#print"Spells:\n";
#Yea, I know, this is inefficient just like the one before
	print"\n";
	if ($spellburn == 1) { print"burn\n"; } else { };
	if ($spellshock == 1) { print"shock\n"; } else { };
	if ($spelllife == 1) { print"life\n"; } else { };
	if ($spellrage == 1) { print"rage\n"; } else { };
	if ($spellsoultransfer == 1) { print"soultransfer\n"; } else { };
	if ($spelltoice == 1) { print"toice\n"; } else { };
	if ($spellteleport == 1) { print"teleport\n"; } else { };
	if ($spellsustenance == 1) { print"sustenance\n"; } else { };	
			
print"\n";
}
##SPELLS#LIST##################################################################



##MISC#LIST####################################################################
sub miscolist {
print"Misc Items:\n";

	if ($sachel == 1) { print"sachel\n"; } else { };
	
	if ($passcardredkewsszum6 == 1) { 
		print"red passcard ";
		print color 'bold red'; print" PASSCODE: $keykewsszum6\n"; print color 'reset';
	} else { };
	
	if ($spflashlight == 1) { print"solar powered flashlight\n"; } else { };
	
	if ($bullet9mmamount <= 0) {
		#do nothing :)
	} elsif ($bullet9mmamount == 1) {
		print"1 9mm bullet\n";
	} elsif ($bullet9mmamount >= 2) {
		print"$bullet9mmamount 9mm bullets\n";
	} else {
	}

	if ($bullet45calamount <= 0) {
		#do nothing :)
	} elsif ($bullet45calamount == 1) {
		print"1 .45 caliber bullet\n";
	} elsif ($bullet45calamount >= 2) {
		print"$bullet45calamount .45 caliber bullets\n";
	} else {
	}
		
	if ($slug12gaamount <= 0) {
		#do nothing :)
	} elsif ($slug12gaamount == 1) {
		print"1 12GA shotgun shell\n";
	} elsif ($slug12gaamount >= 2) {
		print"$slug12gaamount 12GA shotgun shells\n";
	} else {
	}
	
	if ($explosiveRPGX14amount <= 0) {
		#do nothing :)
	} elsif ($explosiveRPGX14amount == 1) {
		print"1 X14 Rocket Propelled Grenade\n";
	} elsif ($explosiveRPGX14amount >= 2) {
		print"$explosiveRPGX14amount X14 Rocket Propelled Grenades\n";
	} else {
	}		
		
	if ($bombamount <= 0) {
		#do nothing :)
	} elsif ($bombamount == 1) {
		print"1 bomb\n";
	} elsif ($bombamount >= 2) {
		print"$bombamount bombs\n";
	} else {
	}
		
	if ($nukeamount <= 0) {
		#do nothing :)
	} elsif ($nukeamount == 1) {
		print"1 10MT warhead\n";
	} elsif ($nukeamount >= 2) {
		print"$nukeamount 10MT warheads\n";
	} else {
	}	
	
	if ($gp <= 0) {
		#do nothing :)
	} elsif ($gp == 1) {
		print"1 Gold Piece\n";
	} elsif ($gp >= 2) {
		print"$gp Gold Pieces\n";
	} else {
	}
	
	if ($glassbottleempty <= 0) {
		#do nothing :)
	} elsif ($glassbottleempty == 1) {
		print"1 empty glass bottle\n";
	} elsif ($glassbottleempty >= 2) {
		print"$glassbottleempty empty glass bottles\n";
	} else {
	}
	
	if ($blackbppen == 1) { 
		print"Black Ballpoint Pen"; 
		print color 'bold black'; print" INK: $bbpink\n"; 
		print color 'reset';
	} else {
	};	
	
	if ($bookpr0n == 1) { print"Tome of the Best [Undecipherable]\n"; } else { };
	if ($ancientredbook == 1) { print"Ancient Red Book\n"; } else { };
	if ($spellbookshock == 1) { print"Tome of Shock\n"; } else { };	
	if ($spellbooklife == 1) { print"Spellbook of Life\n"; } else { };
	if ($spellbookrage == 1) { print"Written Rag of Rage\n"; } else { };
	if ($spellbooksoultransfer == 1) { print"Directions on Soultransfer, Volume 1\n"; } else { };				
	if ($spellbookburn == 1) { print"Book of Fire\n"; } else { };
	if ($spellbooktoice == 1) { print"Book of Frost\n"; } else { };
	if ($spellbooksustenance == 1) { print"Writ of Sustenance\n"; } else { };
	if ($spellbookteleport == 1) { print"Ancient Treatise of Teleportation\n"; } else { };
	if ($bookjournal == 1) { print"Journal\n"; } else { };
print"\n";
}
##MISC#LIST####################################################################

##FOOD#LIST####################################################################
sub foodlist {
	print"Food:\n";
	if ($f_apple == 1) { print"1 apple\n"; 
	} elsif ($f_apple > 1) { print"$f_apple apples\n";
	} else {
	}

	if ($f_carrot == 1) { print"1 carrot\n"; 
	} elsif ($f_carrot > 1) { print"$f_carrot carrots\n";
	} else {
	}

	if ($f_bread == 1) { print"1 loaf of bread\n"; 
	} elsif ($f_bread > 1) { print"$f_bread loaves of bread\n";
	} else {
	}

	if ($f_cake == 1) { print"1 cake\n"; 
	} elsif ($f_cake > 1) { print"$f_cake cakes\n";
	} else {
	}

	if ($f_tripebread == 1) { print"1 tripe loaf of bread\n"; 
	} elsif ($f_tripebread > 1) { print"$f_tripebread tripe loaves of bread\n";
	} else {
	}
	
	if ($f_lsd == 1) { print"1 LSD cube\n"; 
	} elsif ($f_lsd > 1) { print"$f_lsd LSD cubes\n";
	} else {
	}
	
	if ($f_elixirhealth100 == 1) { print"1 $colorelixirH100 elixir\n"; 
	} elsif ($f_elixirhealth100 > 1) { print"$f_elixirhealth100 $colorelixirH100 elixirs\n";
	} else {
	}
	
	if ($f_elixirpoison10 == 1) { print"1 $colorelixirP10 elixir\n"; 
	} elsif ($f_elixirpoison10 > 1) { print"$f_elixirpoison10 $colorelixirP10 elixirs\n";
	} else {
	}	
}
##FOOD#LIST####################################################################

#################################################################################
#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#
#################################################################################
#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#
#################################################################################
#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#TEMPLATES#
#################################################################################

sub set_armordur {
$nonedur = 0;
$leathervestdur = 500;
$redtshirtdur = 20;
$ringmailvestdur = 1200;
$whiterobedur = 45;
}


##ARMOR####

sub armor_none {
$armorclass = 0;
$armortype = 'NA';
$armorginger = 'none';
$armordefend = 0;
$armordur = 0; #$nonedur
$armormagik = 0; #magic bonus (mana etc)

brownbar1();
t122(); print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Armor Info:         '; t187(); print"\n";
t187();   print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Type: NA            '; t122(); print"\n";
t122(); print color 'yellow'; print'                            ';
print color 'reset'; print color 'bold yellow'; print'Name: none          '; t187(); print"\n";
t187();   print color 'yellow'; print'                          ';
print color 'reset'; print color 'bold yellow'; print'  Protection: 0       '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122();print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
brownbar1();
}

sub armor_leather1 {
$armorclass = 4;
$armortype = "leather";
$armorginger = "leather vest";
$armordefend = 12;
$armordur = 500; # $leathervestdur
$armormagik = 0; #magic bonus (mana etc)

brownbar1();
t122(); print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Armor Info:         '; t187(); print"\n";
t187();   print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Type: leather       '; t122(); print"\n";
t122(); print color 'yellow'; print'   ____   ____              ';
print color 'reset'; print color 'bold yellow'; print'Name: leather vest  '; t187(); print"\n";
t187();   print color 'yellow'; print'   \\---\\_/---/            ';
print color 'reset'; print color 'bold yellow'; print'  Protection: 12      '; t122(); print"\n";
t122(); print color 'yellow'; print'   /---------\\                                  '; t187(); print"\n";
t187();   print color 'yellow'; print'   |---------|                                  '; t122();print"\n";
t122(); print color 'yellow'; print'   |---------|                                  '; t187(); print"\n";
t187();   print color 'yellow'; print'   |---------|                                  '; t122(); print"\n";
t122(); print color 'yellow'; print'   |_________|                                  '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
brownbar1();
}

sub armor_ringmail1 {
$armorclass = 6;
$armortype = "ring mail";
$armorginger = "ring mail vest";
$armordefend = 20;
$armordur = 1200; # $ringmailvestdur
$armormagik = 0; #magic bonus (mana etc)

brownbar1();
t122(); print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Armor Info:         '; t187(); print"\n";
t187();   print color 'white'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Type: ring mail     '; t122(); print"\n";
t122(); print color 'white'; print'   __/\\   /\\__              ';
print color 'reset'; print color 'bold yellow'; print'Name: ring mail vest'; t187(); print"\n";
t187();   print color 'white'; print'   \\oOo\\_/oOo/            ';
print color 'reset'; print color 'bold yellow'; print'  Protection: 20      '; t122(); print"\n";
t122(); print color 'white'; print'   /OoOoOoOoO\\                                  '; t187(); print"\n";
t187();   print color 'white'; print'   |oOoOoOoOo|                                  '; t122();print"\n";
t122(); print color 'white'; print'   |OoOoOoOoO|                                  '; t187(); print"\n";
t187();   print color 'white'; print'   |oOoOoOoOo|                                  '; t122(); print"\n";
t122(); print color 'white'; print'   |OoOoOoOoO|                                  '; t187(); print"\n";
t187();   print color 'white'; print'   |oOoOoOoOo|                                  '; t122(); print"\n";
t122(); print color 'white'; print'   \\OoOoOoOoO/                                  '; t187(); print"\n";
t187();   print color 'white'; print'                                                '; t122(); print"\n";
t122(); print color 'white'; print'                                                '; t187(); print"\n";
brownbar1();
}

sub armor_shirt1 {
$armorclass = 1;
$armortype = "light cloth";
$armorginger = "red t-shirt";
$armordefend = 2;
$armordur = 20; # $redtshirtdur
$armormagik = 0; #magic bonus (mana etc)

brownbar1();
t122(); print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Armor Info:         '; t187(); print"\n";
t187();   print color 'yellow'; print'                            '; 
print color 'reset'; print color 'bold yellow'; print'Type: light cloth   '; t122(); print"\n";
t122(); print color 'red'; print'   ____  ____               ';
print color 'reset'; print color 'bold yellow'; print'Name: red t-shirt   '; t187(); print"\n";
t187();   print color 'red'; print'  /    \\/    \\              ';
print color 'reset'; print color 'bold yellow'; print'Protection: 2       '; t122(); print"\n";
t122(); print color 'red'; print' /_/|------|\\_\\                                 '; t187(); print"\n";
t187();   print color 'red'; print'    |';
	print color 'reset'; print color 'yellow'; print' BEER '; print color 'reset';
	print color 'red'; print'|                                    '; t122();print"\n";
t122(); print color 'red'; print'    |------|                                    '; t187(); print"\n";
t187();   print color 'red'; print'    |______|                                    '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
t187();   print color 'yellow'; print'                                                '; t122(); print"\n";
t122(); print color 'yellow'; print'                                                '; t187(); print"\n";
brownbar1();
}

sub armor_whiterobe1 {
$armorclass = 1;
$armortype = 'light cloth';
$armorginger = 'white robe';
$armordefend = 4;
$armordur = 45; #$whiterobedur
$armormagik = 1; #magic bonus (mana etc)

brownbar1();
t122(); print color 'bold white'; print'    ___  ___                '; 
print color 'reset'; print color 'bold yellow'; print'Armor Info:         '; t187(); print"\n";
t187(); print color 'bold white'; print'   /   \\/   \\               '; 
print color 'reset'; print color 'bold yellow'; print'Type: light cloth   '; t122(); print"\n";
t122(); print color 'bold white'; print'  /          \\              ';
print color 'reset'; print color 'bold yellow'; print'Name: white robe    '; t187(); print"\n";
t187(); print color 'bold white'; print'  | |      | |              ';
print color 'reset'; print color 'bold yellow'; print'Protection: 4       '; t122(); print"\n";
t122(); print color 'bold white'; print'  |_|      |_|                                  '; t187(); print"\n";
t187();   print color 'bold white'; print'    |      |                                    '; t122();print"\n";
t122(); print color 'white'; print'    |XXXXXX|                                    '; t187(); print"\n";
t187();   print color 'bold white'; print'    |      |                                    '; t122(); print"\n";
t122(); print color 'bold white'; print'    |      |                                    '; t187(); print"\n";
t187();   print color 'bold white'; print'    |      |                                    '; t122(); print"\n";
t122(); print color 'bold white'; print'    |      |                                    '; t187(); print"\n";
t187();   print color 'bold white'; print'    |      |                                    '; t122(); print"\n";
t122(); print color 'bold white'; print'    |/\\/\\/\\|                                    '; t187(); print"\n";
brownbar1();
}

##WEAPONS##

##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_none {
##NOTHING########

$class = 0;
$type = 'NA';
$gingertype = 'none';
$power = 0;
$magic = 0;
$weapprotect = 0;
$fright = 0;
$armsneeded = 0;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;

redbar();

print"\n";

#print colored ("[][][][][][][][][][][][][][][][][][][][][][][][][]",'bold white on_red');
#print"\n";


#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                            '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                          '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                          '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; 
print'           '; 
print color 'reset';
print color 'white';
print' ';
print color 'reset';
print color 'bold white';
print'             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'bold white'; print'                          '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset';print color 'bold white'; print'                          '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'bold white'; print'                          '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'                          '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_doubleaxe {
##NOTHING########

$class = 2;
$type = 'axe';
$gingertype = 'double headed axe';
$power = 432;
$magic = 0;
$weapprotect = 24;
$fright = 10;
$armsneeded = 2;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = '-1';

redbar();
print"\n";

t89();
print color 'reset'; print'    ';
print color 'bold white'; print'   /'; print color 'reset'; print color 'bold black'; print'\\    __    /'; 
print color 'bold white'; print'\\'; print color 'reset';
	print'     ';
	t89(); print color 'bold yellow'; print"    Weapon Info"; 
	print color 'reset';
	print"\n";

t6();
print color 'reset'; print'    ';
print color 'bold white'; print'  /'; print color 'reset'; print color 'white'; print'/'; 
print color 'reset'; print color 'bold black'; print' \\  /..\\  / '; print color 'reset';
print color 'white'; print'\\'; print color 'reset'; print color 'bold white'; print'\\'; print color 'reset';;
 	print'    '; 
	print color 'reset'; print color 'bold yellow'; print"TYPE: $type"; print"\n";
	print color 'reset';

t89();
print color 'reset'; print'    ';
print color 'bold white'; print' /'; print color 'reset'; print color 'white'; print'/';
print color 'reset'; print color 'bold black'; print' /~\\_|--|_/~\\ '; print color 'reset';
print color 'white'; print'\\'; print color 'reset'; print color 'bold white'; print'\\'; print color 'reset';
 	print' ';
	print color 'reset'; print color 'bold yellow'; print"  NAME: $gingertype"; print"\n";
	print color 'reset';

t6();
print color 'reset'; print'    ';
print color 'bold white'; print'|'; print color 'reset'; print color 'white'; print'|';
print color 'reset'; print color 'bold black'; print'  |~~ |..| ~~|  '; print color 'reset';
print color 'white'; print'|'; print color 'reset'; print color 'bold white'; print'|'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'bold white'; print'|'; print color 'reset'; print color 'white'; print'|';
print color 'reset'; print color 'bold black'; print'  |~~~|--|~~~|  '; print color 'reset';
print color 'white'; print'|'; print color 'reset'; print color 'bold white'; print'|'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'bold white'; print'|'; print color 'reset'; print color 'white'; print'|';
print color 'reset'; print color 'bold black'; print'  |~~~|..|~~~|  '; print color 'reset';
print color 'white'; print'|'; print color 'reset'; print color 'bold white'; print'|'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'bold white'; print'|'; print color 'reset'; print color 'white'; print'|';
print color 'reset'; print color 'bold black'; print'  |~~_|--|_~~|  '; print color 'reset';
print color 'white'; print'|'; print color 'reset'; print color 'bold white'; print'|'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'bold white'; print' \\'; print color 'reset'; print color 'white'; print'\\';
print color 'reset'; print color 'bold black'; print' \\~/ |..| \\~/ '; print color 'reset';
print color 'white'; print'/'; print color 'reset'; print color 'bold white'; print'/'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'bold white'; print'  \\'; print color 'reset'; print color 'white'; print'\\';
print color 'reset'; print color 'bold black'; print' /  |__|  \\ '; print color 'reset';
print color 'white'; print'/'; print color 'reset'; print color 'bold white'; print'/'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'bold white'; print'   \\'; print color 'reset'; print color 'bold black'; print'/';
print color 'reset'; print color 'yellow'; print'   ||||   '; print color 'reset';
print color 'bold black'; print'\\'; print color 'reset'; print color 'bold white'; print'/'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";   

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";

t6();
print color 'reset'; print'    ';
print color 'yellow'; print'        ||||'; print color 'reset'; print"\n";
	
t89();
print color 'reset'; print'    ';
print color 'yellow'; print'        \\__/'; print color 'reset';
	print'          ';
	t89();
	print"\n";
redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_straightaxe {
##NOTHING########

$class = 2;
$type = 'axe';
$gingertype = 'straight axe';
$power = 205;
$magic = 0;
$weapprotect = 18;
$fright = 6;
$armsneeded = 2;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = '-2';

redbar();

print"\n";

t89();  
print color 'bold white'; print'  |\\'; print color 'reset'; print color 'bold yellow'; print'    _';
print color 'reset';
print'                 ';
t89();
print color 'bold yellow'; print"    Weapon Info"; 
print color 'reset';
print"\n";

t6();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'|\  ';
print color 'reset'; print color 'bold yellow'; print'/|\\';
print color 'reset';
print'                ';
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';


t89();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| \ ';
print color 'reset'; print color 'bold yellow'; print'|_|';
print color 'reset';
print'                  ';
print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
print color 'reset';
	
t6();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| ';
print color 'reset'; print color 'bold black'; print'/\\|';
print color 'reset'; print color 'bold yellow'; print'.';
print color 'reset'; print color 'bold black'; print'|';
print color 'reset'; print"\n";

t89();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| ';
print color 'reset'; print color 'bold black'; print'|-|';
print color 'reset'; print color 'bold yellow'; print'.';
print color 'reset'; print color 'bold black'; print'|';
print color 'reset'; print"\n";

t6();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| ';
print color 'reset'; print color 'bold black'; print'|-|';
print color 'reset'; print color 'bold yellow'; print'.';
print color 'reset'; print color 'bold black'; print'|';
print color 'reset'; print"\n";

t89();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| ';
print color 'reset'; print color 'bold black'; print'|-|';
print color 'reset'; print color 'bold yellow'; print'.';
print color 'reset'; print color 'bold black'; print'|';
print color 'reset'; print"\n";

t6();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| ';
print color 'reset'; print color 'bold black'; print'|-|';
print color 'reset'; print color 'bold yellow'; print'.';
print color 'reset'; print color 'bold black'; print'|';
print color 'reset'; print"\n";

t89();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| ';
print color 'reset'; print color 'bold black'; print'\\/|';
print color 'reset'; print color 'bold yellow'; print'.';
print color 'reset'; print color 'bold black'; print'|';
print color 'reset'; print"\n";

t6();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'| / ';
print color 'reset'; print color 'bold black'; print'|_|';
print color 'reset'; print"\n";

t89();
print color 'bold white'; print'  |'; print color 'reset'; print color 'white'; print'|/  ';
print color 'reset'; print color 'yellow'; print'| |';
print color 'reset'; print"\n";

t6();
print color 'bold white'; print'  |/'; print color 'reset'; print color 'yellow'; print'   | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'       | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'       | |';
print color 'reset';
	print'                ';
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";

t89();
print color 'yellow'; print'       |_|';
print color 'reset';
	print'                ';
	t89();
	print"\n";
redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_englishaxe {
##NOTHING########

$class = 2;
$type = 'axe';
$gingertype = 'english axe';
$power = 240;
$magic = 0;
$weapprotect = 22.5;
$fright = 8;
$armsneeded = 2;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = '-2';

redbar();

print"\n";

t89();
print color 'reset';
print color 'white'; print'     /'; print color 'reset'; print color 'bold black'; print'|'; 
print color 'reset';
print'                   '; t89(); print color 'bold yellow'; print'    Weapon Info'; 
print color 'reset';
print"\n";

t6();
print color 'reset';
print color 'white'; print'    /'; print color 'reset'; print color 'bold black'; print'/\\________'; 
print color 'reset';
print'           ';	
	#Spike thing
	print color 'bold white'; print'\\'; print color 'reset'; 
	print color 'white'; print'/';
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';

t89();
print color 'reset';
print color 'white'; print'   /'; print color 'reset'; print color 'bold black'; print'/       |  |'; 
print color 'reset';
print color 'reset'; print color 'bold yellow'; print"             NAME: $gingertype"; print"\n";
print color 'reset';

t6();
print color 'reset';
print color 'white'; print'  /'; print color 'reset'; print color 'bold black'; print'/     ___|  |'; 
print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'white'; print'  |'; print color 'reset'; print color 'bold black'; print'|    /   |  |'; 
print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'white'; print'  |'; print color 'reset'; print color 'bold black'; print'|   /    |__|'; 
print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'white'; print'  \\'; print color 'reset'; print color 'bold black'; print'\\  /     '; 
print color 'reset'; print color 'yellow'; print'|  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'white'; print'   \\'; print color 'reset'; print color 'bold black'; print'\\ |     '; 
print color 'reset'; print color 'yellow'; print'|  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'white'; print'    \\'; print color 'reset'; print color 'bold black'; print'\\|     '; 
print color 'reset'; print color 'yellow'; print'|  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'white'; print'     \\'; print color 'reset'; print color 'bold black'; print'|     '; 
print color 'reset'; print color 'yellow'; print'|  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset'; print"\n";

t6();
print color 'reset';
print color 'yellow'; print'            |  |'; print color 'reset';
print'          '; #searching... where the fuck is spike thing?!... found... c/p ahhh there::::
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";

t89();
print color 'reset';
print color 'yellow'; print'            |__|'; print color 'reset';
print'          ';
	t89();
	print"\n";
redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##




##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_fireaxe {
##NOTHING########

$class = 2;
$type = 'axe';
$gingertype = 'fire axe';
$power = 285;
$magic = 0;
$weapprotect = 18.5;
$fright = 7;
$armsneeded = 2;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = '-1';

redbar();

print"\n";

t89();
print color 'reset';
print color 'white'; print'    /|                    ';
print color 'reset'; 
t89(); print color 'bold yellow'; print"    Weapon Info"; 
print color 'reset';
print"\n";

t6();
print color 'white'; print'   /'; print color 'reset';
print color 'red'; print'/\\                    '; 
print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';

t89();
print color 'white'; print'  /'; print color 'reset';
print color 'red'; print'/  \\_________         '; 
print color 'reset'; 
	print color 'reset'; print color 'bold yellow'; print"    NAME: $gingertype"; print"\n";
	print color 'reset';

t6();
print color 'white'; print'  |'; print color 'reset';
print color 'red'; print'|     | |___/'; 
print color 'reset'; print"\n";

t89();
print color 'white'; print'  |'; print color 'reset';
print color 'red'; print'|   __| |';
print color 'reset'; print"\n";

t6();
print color 'white'; print'  \\'; print color 'reset';
print color 'red'; print'\\  /  |_|';
print color 'reset'; print"\n";

t89();
print color 'white'; print'   \\'; print color 'reset'; 
print color 'red'; print'\\/'; print color 'reset'; 
print color 'yellow'; print'   | |'; 
print color 'reset'; print"\n";

t6();   
print color 'white'; print'    \\|'; 
print color 'reset'; print color 'yellow'; print'   | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";


t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";


t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";


t89();
print color 'yellow'; print'         | |';
print color 'reset'; print"\n";

t6();
print color 'yellow'; print'         | |              ';
print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";

t89();
print color 'yellow'; print'         |_|              ';
print color 'reset'; t89(); print"\n";

print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##




##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_sg12p {
##NOTHING########
$class = 12;
$type = 'shotgun';
$gingertype = '12GA pump action shotgun';
$power = $prj12ga;
$magic = 0;
$weapprotect = 13;
$fright = 8;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 4; #$sg12pcapacity
$accuracy = 0;

redbar();

print"\n";

#print colored ("[][][][][][][][][][][][][][][][][][][][][][][][][]",'bold white on_red');
#print"\n";


#Long Sword
print color 'white';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                            '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print" NAME: 12GA Pump"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; 
print color 'reset'; print color 'bold yellow'; print"         Action Shotgun";
print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; 		
print color 'bold white'; print'  ________'; print color 'reset'; print color 'white'; print'_____________________'; 
print color 'reset'; print color 'bold white'; print'/|';print color 'reset'; print color 'white'; print'__'; 
print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print' /  '; print color 'reset'; print colored ('|___|','bold black on_white');
print color 'reset'; print color 'bold white'; print' \\'; print color 'reset'; print color 'white'; print'____________________'; 
print color 'reset'; print color 'bold white'; print'||';
print color 'reset'; print color 'white'; print'__|'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print' |_________|'; print color 'reset'; print color 'white'; print'_'; 
print color 'reset'; print color 'yellow'; print'||||||||||||'; print color 'reset'; 
print color 'white'; print'______'; print color 'reset'; print color 'bold white'; print'||'; 
print color 'reset'; print color 'white'; print'_|'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'  \\ XXX |( | '; print color 'reset';
print color 'yellow'; print'\\||||||||||/'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'white'; print'  /XXXX |_/'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print' /XXXXX/'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'white'; print' |XXXX/'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'                          '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print" 12GA AMMO: $slug12gaamount\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##




##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#

sub temp_cappedstaff {
##CAPPED#STAFF###

$class = 5;
$type = 'staff';
$gingertype = 'capped staff';
$power = 50;
$magic = 0;
$weapprotect = 20;
$fright = 1;
$armsneeded = 2;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;

redbar();

print"\n";

#print colored ("[][][][][][][][][][][][][][][][][][][][][][][][][]",'bold white on_red');
#print"\n";


#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold yellow'; print'          (~)             '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold yellow'; print'          [|]             '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          |'; print color 'reset'; 
print color 'bold yellow'; print'V'; print color 'reset'; print color 'yellow'; print'|               '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |-|             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          |-|             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |-|             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'          |'; print color 'reset'; 
print color 'bold yellow'; print'A'; print color 'reset'; print color 'yellow'; print'|               '; print color 'reset';
print"\n";
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold yellow'; print'          [|]             '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'bold yellow'; print'          (~)             '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##





##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_longsword{
##LONG#SWORD#####

$class = 1;
$type = 'sword';
$gingertype = 'long sword';
$power = 392;
$magic = 0;
$weapprotect = 15;
$fright = 6;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 1;

redbar();
print"\n";

#print colored ("[][][][][][][][][][][][][][][][][][][][][][][][][]",'bold white on_red');
#print"\n";


#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          /|\             '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |||             '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          |||               '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          |||             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; 
print'        [[['; 
print color 'reset';
print color 'white';
print'|';
print color 'reset';
print color 'bold white';
print']]]          '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'bold white'; print'          |/|             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset';print color 'bold white'; print'          |/|             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'bold white'; print'          |/|             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'          (/)             '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'           V              '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##




sub temp_skive {
##SKIVE#####

$class = 4;
$type = 'knife';
$gingertype = 'skive';
$power = 72;
$magic = 0;
$weapprotect = 0;
$fright = 5;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;

redbar();
print"\n";

print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print'                          '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           /|               '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'           ||             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           ||             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'           ||             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           ||             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'           ||               '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'white'; print'           []             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'           []             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'white'; print'           []             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print'                          '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##





##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_crookddagger {
##CROOK'D#DAGGER#####

$class = 4;
$type = 'dagger';
$gingertype = "crook'd dagger";
$power = 85;
$magic = 0;
$weapprotect = 0;
$fright = 4;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;

redbar();
print"\n";

print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print'                          '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           /)               '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'          (((             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           )))            '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'          (((             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           )))            '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold yellow'; print'         ~~++~~             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'yellow'; print'           []             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'           []             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset';print'                          ';  print color 'reset';
print"\n";
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print'                          '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#

sub temp_mace {
##MACE###########

$class = 9;
$type = 'blunt force';
$gingertype = 'mace';
$power = 150;
$magic = 0;
$weapprotect = 12;
$fright = 8;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;

redbar();

print"\n";

#MACE
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          ___             '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'         <[|]>            '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'         <[|]>              ';	
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'         <[|]>             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'         <[|]>             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          |'; print color 'reset'; 
print color 'white'; print'V'; print color 'reset'; print color 'yellow'; print'|               '; print color 'reset';
print"\n";
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          | |             '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'          [_]             '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##   



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_pistol45cal {
##Pistol#45cal########
$class = 10;
$type = 'concealable firearm';
$gingertype = '.45 automatic pistol';
$power = $prj45cal;
$magic = 0;
$weapprotect = 0;
$fright = 0;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 10; #$pistol45calcapacity
$accuracy = 0;

redbar();

print"\n";

#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold white'; print'     _______________________________'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'  __'; print color 'reset'; print color 'bold white';
print'/ \\\\\\\\  \\_____/           O O O |';
print color 'reset'; print color 'white'; print'__'; print color 'reset'; print"\n";
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'white'; print'  \\'; print color 'reset'; print color 'bold white'; print'/  ////                   O O O O|';
print color 'reset'; print color 'white'; print'__|'; print color 'reset'; print"\n";
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold white'; print'   |____________..............______|'; print color 'reset'; print"\n";


#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'white'; print'   \\ ><><><>< __'; print color 'reset'; print color 'bold white'; print'|____________|';
 print color 'reset'; print color 'white'; print'_____|'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'   / <><><>< |'; print color 'reset'; print color 'bold black'; print'(';
print color 'reset'; print color 'white'; print'  |'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'white'; print'  / <><><>< /____/'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'  | ><><><> |'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'white'; print'  | ><><><> |'; print color 'reset'; print"\n";
print color 'reset'; print color 'bold yellow'; 
	print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'  | ><><><> |              '; print color 'reset';
 print color 'bold yellow'; print'    Weapon Info';
print color 'reset'; print"\n";
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'white';      print'  \\_________/           '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print"TYPE: $type"; print"\n";
	print color 'reset';

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'    | |   |             '; print color 'reset';

	print color 'bold yellow'; print"NAME: $gingertype\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold black'; print'    |_|___|               '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print" .45 AMMO: $bullet45calamount\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_semiautopistol {
##NOTHING########

$class = 8;
$type = 'concealable firearm';
$gingertype = 'semiautomatic pistol';
$power = $prj9mm;
$magic = 0;
$weapprotect = 0;
$fright = 0;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 14; #$semiautopistolcapacity
$accuracy = 0;

redbar();

print"\n";

#print colored ("[][][][][][][][][][][][][][][][][][][][][][][][][]",'bold white on_red');
#print"\n";


#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: concealable"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                            '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print"       firearm"; print"\n";
	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'   _ _________________    '; print color 'reset';
print color 'bold yellow'; print"   NAME: semiautomatic"; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'   \\| //// '; print color 'reset'; 
print colored ('|___|','bold black on_white'); print color 'reset'; print color 'white'; print'    __|   ';
print color 'reset'; print color 'bold yellow'; print"         pistol";
print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'   /_______________|__|   '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'   \\      /\\ |\\______|'; print color 'reset'; 
print color 'red'; print'----------------------'; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'    | XX  \\__/           ';  print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'white'; print'    / XXX /               '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset';print color 'white'; print'   / XXX /                 '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'white'; print'  |_____/                    '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'  /___/                   '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print" 9MM AMMO: $bullet9mmamount\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_rpgx14 {
##RPG-X14###########
$class = 17;
$type = 'explosive';
$gingertype = 'RPG-X14';
$power = $prjRPGX14;
$magic = 0;
$weapprotect = 14;
$fright = 10;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 1; #$rpgx14capacity
$accuracy = 0;

redbar();

print"\n";

#MACE
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'                          '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'                            ';	
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'   '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold green'; print'    ___                         _     _______'; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold green'; print'   |   \\-----------------------| |___/-------\\'; print color 'bold white'; print'_'; print"\n"; print color 'reset';

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'green'; print'   |   |  RPG-X14              | |-----------'; print color 'white'; print'| \\'; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'green'; print'   |   |           '; print color 'yellow'; print'|-'; print color 'green'; print'____      | |___--------'; print color 'white'; print'|_/'; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'green'; print'   |___/-----------'; print color 'yellow'; print'|-|'; print color 'white'; print'( |'; print color 'green'; print'------|_|   \\_______/'; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'                   |-|'; print color 'white'; print'__|'; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'                   |-|'; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'                   |_|    '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	print color 'white';
	print' AMMO: ';
	
	if ($explosiveRPGX14amount == 1) {
		print"$explosiveRPGX14amount grenade\n";
	} else {
		print"$explosiveRPGX14amount grenades\n";
	}
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##   





##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_smg45calmini {
$class = 10;
$type = 'sub machinegun';
$gingertype = '.45 SMG Carbine';
$power = $smg45calpower;
$magic = 0;
$weapprotect = 10;
$fright = 10;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 32; #$smg45calcapacity
$accuracy = 0;
}

sub temp_smg45cal {
##SMG#45cal########
$class = 10;
$type = 'sub machinegun';
$gingertype = '.45 SMG Carbine';
$power = $smg45calpower;
$magic = 0;
$weapprotect = 10;
$fright = 10;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 32; #$smg45calcapacity
$accuracy = 0;

redbar();

print"\n";

#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');

print color 'white'; print'            ___               '; print color 'reset'; print color 'bold black'; print'      _'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');

print color 'bold black'; print' _________'; print color 'reset'; print color 'white'; print'_|_|_|________'; print color 'reset'; print color 'bold black'; print'___________/_|___________ '; print"\n";
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');

print color 'bold black'; print'| __ ____'; print color 'reset'; print color 'white'; print'/      '; print color 'reset'; print colored ('|____|','bold black on_white'); print color 'reset'; print color 'white'; print' |'; print color 'reset'; print color 'bold black'; print'_______________O_o_O_o_O_|'; print"\n";
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');

print color 'bold black'; print'|| //   '; print color 'reset'; print color 'white'; print' |------__     '; print color 'reset'; print color 'yellow'; print'|_|__|__|__/'; print color 'reset'; print color 'bold black'; print'-----\''; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');

print color 'bold black'; print'||//  '; print color 'reset'; print color 'white'; print'   \\ooooo|( |_____|  '; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');

print color 'bold black'; print'|_/   '; print color 'reset'; print color 'white'; print'   /oooo/\\_/'; print color 'reset'; print color 'bold black'; print' || |';  print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');

print color 'bold black'; print'      '; print color 'reset'; print color 'white'; print'  /oooo/    '; print color 'reset'; print color 'bold black'; print' || |'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');

print color 'bold black'; print'     '; print color 'reset'; print color 'white'; print'   \\ooo/    '; print color 'reset'; print color 'bold black'; print'  || |'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 

print color 'bold black'; print'                   || |'; print color 'reset';
print color 'reset'; print color 'bold yellow'; print'         Weapon Info'; print"\n";
	print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');

print color 'bold black'; print'                   || |'; print color 'reset';
print color 'reset'; print color 'bold yellow'; print"      TYPE: $type"; print"\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold black'; print'                   || |   '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print"   NAME: $gingertype"; print"\n";
	print color 'reset';

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'                   || |   '; print color 'reset';

	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print" Setting: $smg45calsetwrd\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold black'; print'                   ||_|   '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print" .45 AMMO: $bullet45calamount\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##




##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#
sub temp_smg9mmmini {
$class = 8;
$type = 'sub machinegun';
$gingertype = 'SMG 9MM';
$power = $smg9mmpower;
$magic = 0;
$weapprotect = 0;
$fright = 9;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 30; #$smg9mmcapacity
$accuracy = 0;
}

sub temp_smg9mm {
##SMG#9MM########

$class = 8;
$type = 'sub machinegun';
$gingertype = 'SMG 9MM';
$power = $smg9mmpower;
$magic = 0;
$weapprotect = 0;
$fright = 9;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 1;
$ammocapacity = 30; #$smg9mmcapacity
$accuracy = 0;

redbar();

print"\n";

#print colored ("[][][][][][][][][][][][][][][][][][][][][][][][][]",'bold white on_red');
#print"\n";


#Long Sword
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');

print color 'bold black'; print'      __         __       '; print color 'reset';

	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'    _/__\_______/__\_     '; print color 'reset';

	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold black'; print'   |     '; print color 'reset'; print colored ('|____|','white on_white'); print color 'reset'; 
print color 'bold black'; print'      |__     '; print color 'reset'; print color 'white'; print' ___________'; print color 'reset'; print"\n";


#	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
#	print color 'reset';
	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'   | --------------- ||||----'; print color 'reset';
print color 'white'; print'|           |'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold black'; print'   |_________________||||----'; print color 'reset';
print color 'white'; print'|___________|'; print color 'reset'; print"\n";


#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'         \----|\ |        '; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'bold black'; print'         /----|__/        '; print color 'reset'; print"\n";


#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'         |----|'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'bold black'; print'         |----|'; print color 'reset'; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'bold black'; print'         \____|'; print color 'reset'; print"\n";

#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'white'; print'          || |            '; print color 'reset';
	print color 'reset'; print color 'bold yellow'; print"   NAME: $gingertype"; print"\n";
	print color 'reset';

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'          || |            '; print color 'reset';

	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print" Setting: $smg9mmsetwrd\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'white'; print'          ||_|            '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print" 9MM AMMO: $bullet9mmamount\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##



##BEGIN#TEMPLATE#
#################
#################
##BEGIN#TEMPLATE#

sub temp_redcrowbar {
##RED#CROWBAR####

$class = 9;
$type = "blunt force";
$gingertype = "red crowbar";
$power = 70;
$magic = 0;
$weapprotect = 18;
$fright = 5;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = '-1';

redbar();

print"\n";

#red crow bar
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'red'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'red'; print'          \\V\\             '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'red'; print'          | |               ';	
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'red'; print'          | |              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'red'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'red'; print'          | |              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'red'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'          |C|             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'          |R|             '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'          |O|             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'red'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'red'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'red'; print'          | |             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'red'; print'          | |             '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'red'; print'          | |             '; print"\n"; print color 'reset';

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'red'; print'          \\A\\             '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'white'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##

  

sub temp_bflyknife {
##BUTTERFLY#KNIFE#####

$class = 4;
$type = "concealable knife";
$gingertype = "butterfly knife";
$power = 65;
$magic = 0;
$weapprotect = 0;
$fright = 0;
$armsneeded = 1;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 0;

redbar();
print"\n";

print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print'                          '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'            /|            '; print color 'reset'; 
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: concealable"; print"\n";
	print color 'reset';
	
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           /'; print color 'reset';
print color 'white'; print'/|             ';
	print color 'reset'; print color 'bold yellow'; print"        knife"; print"\n";
	print color 'reset';	
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');

print color 'reset'; print color 'bold white'; print'           |'; print color 'reset';
print color 'white'; print'||            '; print color 'reset';
	print color 'bold yellow'; print"   NAME: $gingertype"; print"\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           |'; print color 'reset';
print color 'white'; print'||            '; print color 'reset'; print"\n";
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'bold white'; print'           |'; print color 'reset';
print color 'white'; print'||            '; print color 'reset'; print"\n";
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold white'; print'           |'; print color 'reset';
print color 'white'; print'||            '; print color 'reset'; print"\n";
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'          ('; print color 'reset';
print color 'bold yellow'; print'*'; print color 'reset';
print color 'white'; print'|'; print color 'reset'; print color 'bold yellow'; print'*'; 
print color 'reset'; print color 'white'; print')              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); print color 'white'; print'          |0|0|           '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'          |0|0|           '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'white'; print'          |0|0|           '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'white'; print'          |0|0|           '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
	print color 'reset'; print color 'white'; print'          |0|0|           '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print"\n";	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##


sub temp_broadtipspear {
##BROAD#TIP#SPEAR####

$class = 3;
$type = 'spear';
$gingertype = 'broad tip spear';
$power = 171;
$magic = 0;
$weapprotect = 23;
$fright = 6;
$armsneeded = 2;
$legsneeded = 0;
$ranged = 0;
$ammocapacity = 0;
$accuracy = 1;

redbar();

print"\n";

#broad tip spear
print color 'white'; 
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'          /\\              '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset';
	
	print color 'bold yellow'; print"    Weapon Info"; print"\n";

#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'white'; print'         /'; print color 'reset';
print color 'bold black'; print'/\\';
print color 'reset'; print color 'white'; print'\\             '; print color 'reset'; 
	
	#Spike thing
	print color 'bold white'; print"\\"; print color 'reset'; 
	print color 'white'; print"/"; 
	print color 'reset'; print color 'bold yellow'; print" TYPE: $type"; print"\n";
	print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'white'; print'         \\';
print color 'reset'; print color 'yellow'; print'||';
print color 'reset'; print color 'white'; print'/               ';	
	print color 'reset'; print color 'bold yellow'; print" NAME: $gingertype"; print"\n";
	print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||               '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'bold black'; print'         <';
print color 'reset'; print color 'yellow'; print'||';
print color 'reset'; print color 'bold black'; print'>             '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
print color 'white'; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red'); 
print color 'reset'; print color 'yellow'; print'          ||              '; print"\n"; print color 'reset';
#[<>] gray
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset'; print color 'yellow'; print'          ||              '; print color 'reset';
	#Spike thing
	print color 'bold white'; print"/"; print color 'reset'; 
	print color 'white'; print"\\"; print"\n";
		  	  
#[<>] red
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset'; print color 'reset'; print color 'yellow'; print'          ||              '; print color 'reset';
	#[<>] red
	print colored ("<",'bold red on_red');
	print colored (">",'black on_red');
	print color 'reset'; print"\n";
	
print color 'reset'; 

redbar();
print"\n";
}
##END#OF#TEMPLATE##
###################
###################
###################
##END#OF#TEMPLATE##




################################################################################################################################
##ROOM#TEMPLATES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ROOM#TEMPLATES##
##ROOM#TEMPLATES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ROOM#TEMPLATES##
################################################################################################################################
##ROOM#TEMPLATES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ROOM#TEMPLATES##
##ROOM#TEMPLATES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ROOM#TEMPLATES##
################################################################################################################################
sub viseffect {
	if ($visualblind != 0) {
		$veffect = 1;	
	} elsif ($visualpsyc != 0) {
		$veffectrand  = int(rand(3));
		if ($veffectrand == 1) {
			$veffect = 1;
		} else {
			$veffect = 0;
			$veffectrand  = int(rand(5));
			if ($veffectrand == 1) {
				colors_crazy();
			} elsif ($veffectrand == 2) {
				colors_frost();	
			} else {
				colors_standard();
			}	
		}	
	} else {
		$veffect = 0;
	}
}

sub visprint {
	if ($visualpsyc != 0) {
		$vpsycrand  = int(rand(5));
		if ($vpsycrand == 1) {
			print color 'reset';
			print colored('>^<','blue on_cyan');
			print color 'reset';
		} elsif ($vpsycrand == 2) {
			print color 'reset';
			print colored(')&(','cyan on_red');
			print color 'reset';	
		} elsif ($vpsycrand == 3) {
			print color 'reset';
			print colored('*%%','bold yellow on_magenta');
			print color 'reset';
		} elsif ($vpsycrand == 4) {
			print color 'reset';
			print colored('^*>','bold white on_white');
			print color 'reset';					
		} else {
			print color 'reset';
			print colored('@@@','magenta on_blue');
			print color 'reset';
		}
	} elsif ($visualblind != 0) {
		print color 'reset';
		print colored('???','bold black on_black');
		print color 'reset';		
	} else {
		print color 'reset';
		print colored('ERR','red on_black');
		print color 'reset';
	}
}
#TILES##TILES##TILES##TILES##TILES##TILES##TILES##TILES##TILES#

sub t1 {
#stonebrick1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[_]',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t2 {
#stonebrick2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[-]',"$white on_$black");
	print color 'reset';	
	} else {
	visprint();
	}
}

sub t3 {
#marblefloor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("   ","$black on_$green");
	print color 'reset';	
	} else {
	visprint();
	}
}

sub t4 {
#marblefloor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("   ","$black on_$white");
	print color 'reset';	
	} else {
	visprint();
	}
}

sub t5 {
	if ($templateC1 == 0) {
		t186();
	} elsif ($templateC1 == 1) {
		t187();
	} elsif ($templateC1 == 2) {
		t71();
	} elsif ($templateC1 == 3) {
		t89();
	} elsif ($templateC1 == 4) {
		t122();
	} elsif ($templateC1 == 5) {
		t123();
	} elsif ($templateC1 == 6) {
		t124();
	} elsif ($templateC1 == 7) {
		t159();		
	} else {
		t188();
	}
}

sub t6 {
	if ($templateC2 == 0) {
		t186();
	} elsif ($templateC2 == 1) {
		t187();
	} elsif ($templateC2 == 2) {
		t71();
	} elsif ($templateC2 == 3) {
		t89();
	} elsif ($templateC2 == 4) {
		t122();
	} elsif ($templateC2 == 5) {
		t123();
	} elsif ($templateC2 == 6) {
		t124();
	} elsif ($templateC2 == 7) {
		t159();		
	} else {
		t188();
	}
}

sub t7 {
#marblefloor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ||","$yellow on_$green");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t8 {
#marblefloor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ||","$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t9 {
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print'   ';
	print color 'reset';
	} else {
	visprint();
	}
}

sub t10 {
#grate
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("-|-","$yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t11 {
#water
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t12 {
#blood water
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $red on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t13 {
#metal studded floor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" . ","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t14 {
#west grate
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("-|]","bold $white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t15 {
#metal
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[/]',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t16 {
#metal with stud
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[\]',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t17 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $green on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t18 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","$yellow on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t19 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","$green on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t20 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $yellow on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t21 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $green on_$green");
	print color 'reset';
	} else {
	visprint();
	}		
}

sub t22 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","$yellow on_$green");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t23 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","$blue on_$green");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t24 {
#vertical grate
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/|/',"$white on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t25 {
#vertical grate
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\|\\',"$white on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t26 {
#sewage fall 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~|","$green on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t27 {
#sewage fall 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~|","bold $green on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t28 {
#sewage fall 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~|","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t29 {
#sewage fall spray 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".  ","bold $green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t30 {
#sewage fall spray 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".  ","bold $blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t31 {
#sewage fall spray 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".  ","bold $yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t32 {
#inkey blackness
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("   ","$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t33 {
#elevator
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t34 {
#steel floor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('<_>',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t35 {
#elevator wall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|||',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t36 {
#inkey elevator wall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|=|',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t37 {
#inkey elevator wall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('   ',"bold $red on_$red");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t38 {
#inkey elevator wall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' @ ',"bold $yellow on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t39 {
#inkey elevator wall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('I',"bold $yellow on_$white");
	print colored('[]',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t40 {
#elevator
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"bold $white on_$red");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t41 {
#sewage ladder1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  [',"$white on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t42 {
#sewage ladder2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  [',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t43 {
#strangefloor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.:.',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t44 {
#puter term
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[","$blue on_$white"); print colored("_","$black on_$white"); print colored("]","$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t45 {
#puter term
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[","$yellow on_$white"); print colored("x","$black on_$white"); print colored("]","$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t46 {
#door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t47 {
#blackmarblefloor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("   ","$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t48 {
#lavwall2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[]',"$white on_$black");
	print colored('I',"bold $yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t49 {
#locker
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[#I',"bold $green on_$green");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t50 {
#locker open
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[#',"bold $green on_$green"); 
	print colored('_',"bold $green on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t51 {
#locker open floor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('_',"bold $green on_$white");
	print colored(':.',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t52 {
#locker
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('I#]',"bold $green on_$green");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t53 {
#thickglass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('///',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t54 {
#metaldoor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t55 {
#metaldoor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[_\\","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t56 {
#metaldoor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/_]","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t57 {
#metaldoor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[_/","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t58 {
#metaldoor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\_]","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t59 {
#marblefloor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ||","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t60 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored("^","bold $blue on_$white");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t61 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(">","bold $blue on_$white");
	print colored(":","bold $white on_$white");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t62 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored(":","bold $white on_$white");
	print colored("x","bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t63 {
#door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t64 {
#door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ||","$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t65 {
#tv
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[","$black on_$white"); print colored("_","$black on_$white"); print colored("]","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t66 {
#wood
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_-_","bold $yellow on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t67 {
#tv
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[","$black on_$white"); print colored("X","$black on_$white"); print colored("]","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t68 {
#bucket o water
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("(","$black on_$white");
	print colored("O","$blue on_$white");
	print colored(")","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t69 {
#book on shelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_","bold $yellow on_$yellow");
	print colored("|","bold $magenta on_$magenta");
	print colored("]","bold $magenta on_$magenta");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t70 {
#wood
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("| |","bold $yellow on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t71 {
#[<>] green
print color 'reset';
print colored ("<",'bold green on_green');
print colored (">",'black on_green');
print color 'reset';
}

sub t72 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored('/',"bold $blue on_$blue");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t73 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored('=',"$black on_$blue");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t74 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored('-',"$black on_$blue");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}


sub t75 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored('||',"$green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t76 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored('=',"$black on_$white");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t77 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(".","bold $white on_$white");
	print colored('-',"$black on_$white");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t78 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("x","bold $blue on_$white");
	print colored("`","bold $blue on_$white");
	print colored(".","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t79 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t80 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","$yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t81 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","$green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t82 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t83 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ~ ","bold $green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t84 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("  ~","$yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t85 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~  ","$green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t86 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ~ ","bold $yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t87 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ~ ","bold $blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}


sub t88 {
#sewage 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("~~~","bold $blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t89 {
#[<>] red
print color 'reset';
print colored ("<",'bold red on_red');
print colored (">",'black on_red');
print color 'reset';
}

sub t90 {
#slots
print colored ("I","bold $yellow on_$blue");
print color 'reset';
}

sub t91 {
#one armed bandit
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[","bold $yellow on_$blue"); print colored('$$',"$green on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t92 {
#one armed bandit
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('$$',"$green on_$blue"); print colored("]","bold $yellow on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t93 {
#elevator
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"bold $white on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t94 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ","bold $white on_$white");
	print colored('@',"$yellow on_$white");
	print colored(" ","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

##stairs down
sub t95 {
#stairs west to east down -->
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  |',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t96 {
#stairs south to north down ^
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('^^^',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t97 {
#stairs east to west down <--
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|  ',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t98 {
viseffect();
	if ($veffect == 0) {
	#stairs north to south down <--
	print color 'reset';
	print colored('___',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

##stairs up
sub t99 {
#stairs west to east up -->
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  |',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t100 {
#stairs south to north up ^
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('^^^',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t101 {
#stairs east to west up <--
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|  ',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t102 {
#stairs north to south up <--
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('___',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}
##EOS

sub t103 {
#darkness of unknowinng
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' ? ',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t104 {
#SWdoor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\\\ ","$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t105 {
#SWdoor2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" \\\\","$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t106 {
#SEdoor1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' //',"$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t107 {
#SEdoor2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('// ',"$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t108 {
#hex1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/  ',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t109 {
#hex2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\__","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t110 {
#bedblue
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|  ',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t111 {
#bedblue
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('   ',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t112 {
#bedblue end
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('___',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t113 {
#pillow
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[_]',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t114 {
#potty
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/-\\","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t115 {
#potty2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $white on_$white"); print colored('~',"bold $blue on_$blue"); print colored('|',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t116 {
#potty3
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[ ]',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t117 {
#wash basin
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\","bold $white on_$white"); print colored('_',"bold $white on_$blue"); print colored('/',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t118 {
#floorx1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/\\/","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t119 {
#floorx2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\/\\","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t120 {
#showerdoor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("|","$black on_$white"); print colored('--',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t121 {
#showerdoor2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('--',"bold $blue on_$white"); print colored("|","$black on_$white"); 
	print color 'reset';
	} else {
	visprint();
	}
}

sub t122 {
#yellowtile [<>]
print color 'reset';
print colored ("<",'bold yellow on_yellow');
print colored (">",'black on_yellow');
print color 'reset';
}

sub t123 {
#cyantile [<>]
print color 'reset';
print colored ("<",'bold cyan on_cyan');
print colored (">",'black on_cyan');
print color 'reset';
}

sub t124 {
#magentatile [<>]
print color 'reset';
print colored ("<",'bold magenta on_magenta');
print colored (">",'black on_magenta');
print color 'reset';
}

sub t125 {
#118 dark glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/","bold $white on_$white");
	print colored(" /","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t126 {
#119 dark glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\","bold $white on_$white");
	print colored("/ ","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t127 {
#synthetic brick/blue wall thang
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[_]',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t128 {
#synthetic brick/blue wall thang end cap etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[_\\","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t129 {
#synthetic brick/blue wall thang end cap etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/_]","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t130 {
#synthetic brick/blue wall thang end cap etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("[_/","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t131 {
#synthetic brick/blue wall thang end cap etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\_]","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t132 {
#ladder
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("-","$yellow on_$black");
	print colored("[|","bold $white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t133 {
#ladder2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ","$yellow on_$black");
	print colored("[|","bold $white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t134 {
#ladder hole 118
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/\\","bold $white on_$white");
	print colored(" ","$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t135 {
#ladder hole 119
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\/","bold $white on_$white");
	print colored(" ","$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t136 {
#cell bed bottem corner 1 (concrete)
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|__',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t137 {
#cell bed bottem corner 2 (concrete)
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('__|',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t138 {
#thickglass tinted no-see-through side
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('///',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t139 {
#thickglass tinted see-through side
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('///',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t140 {
#synthetic brick/blue wall thang end cap etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\_/","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t141 {
#white door 59
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("|| ","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t142 {
#brokenglass blue
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ","bold $white on_$white");
	print colored("^","bold $blue on_$white");
	print colored(" ","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t143 {
#brokenglass blue
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(">","bold $blue on_$white");
	print colored(" ","bold $white on_$white");
	print colored(" ","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t144 {
#brokenglass blue
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ","bold $white on_$white");
	print colored(".","bold $white on_$white");
	print colored("x","bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t145 {
#brokenglass blue
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("X","bold $blue on_$white");
	print colored(".","bold $white on_$white");
	print colored("v","bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t146 {
#brokenglass black
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("*","$black on_$white");
	print colored("^","bold $black on_$white");
	print colored(" ","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t147 {
#brokenglass black
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(">","$black on_$white");
	print colored(" ","bold $white on_$white");
	print colored(" ","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t148 {
#brokenglass black
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("^","$black on_$white");
	print colored(">","$black on_$white");
	print colored("x","bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t149 {
#brokenglass black
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("X","bold $black on_$white");
	print colored(" ","bold $white on_$white");
	print colored("v","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t150 {
#concretechelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("| |","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}	
}

sub t151 {
#white door 59
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("|_|","$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t152 {
#cell bed bottem corner 1 (concrete)
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|^^',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t153 {
#cell bed bottem corner 2 (concrete)
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('^^|',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t154 {
#blood water
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('~',"bold $blue on_$blue");
	print colored('~~',"bold $red on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t155 {
#blood water
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('~~',"bold $red on_$blue");
	print colored('~',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t156 {
#mirrorwall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[ ',"$white on_$black");
	print colored('|',"bold $white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t157 {
#125 118 dark glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("/","bold $white on_$white");
	print colored(" /","bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t158 {
#126 119 dark glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\","bold $white on_$white");
	print colored("/ ","bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t159 {
#blacktile [<>]
print color 'reset';
print colored ("<",'bold black on_black');
print colored (">",'black on_black');
print color 'reset';
}

sub t160 {
#dark metal ~t15
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[/]',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t161 {
#dark metal ~t16
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[\]',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t162 {
# dark glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print " ";
	print colored("//","bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t163 {
# dark glass l
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(" ","bold $white on_$white");
	print colored("//","$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t164 {
# dark tile 1
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' . ',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t165 {
#virtical grate dark
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/|/',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t166 {
#virtical grate dark
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\|\\',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t167 {
#door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"$yellow on_$green");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t168 {
#book on shelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_","bold $yellow on_$yellow");
	print colored("|","bold $blue on_$blue");
	print colored("]","bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t169 {
#book on shelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_","bold $yellow on_$yellow");
	print colored("|","bold $red on_$red");
	print colored("]","bold $red on_$red");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t170 {
#book on shelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_","bold $yellow on_$yellow");
	print colored("|","bold $black on_$black");
	print colored("]","bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t171 {
#book on shelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_","bold $yellow on_$yellow");
	print colored("|","bold $green on_$green");
	print colored("]","bold $green on_$green");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t172 {
#book on shelf
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("_","bold $yellow on_$yellow");
	print colored("|","bold $white on_$white");
	print colored("]","bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t173 {
#steel door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('===',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t174 {
#hex1 dark
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/  ',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t175 {
#hex2 dark
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored("\\__","bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t176 {
#dark metal with stud pannel/button etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[|_',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t177 {
#metal with stud pannel/button etc
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[|',"$white on_$black");
	print colored('_',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t178 {
#hex1end dark + door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\',"bold $black on_$black");
	print colored('||',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t179 {
#hex2end dark + door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $black on_$black");
	print colored('||',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t180 {
#hex1end + door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\',"bold $white on_$white");
	print colored('||',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t181 {
#hex2end + door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $white on_$white");
	print colored('||',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t182 {
#hex1end dark + door2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('||',"$white on_$black");
	print colored('_',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t183 {
#hex2end dark + door2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('||',"$white on_$black");
	print colored(' ',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t184 {
#hex1end + door2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('||',"bold $white on_$white");
	print colored('_',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t185 {
#hex2end + door2
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('||',"bold $white on_$white");
	print colored(' ',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t186{
#bluetile [<>]
print color 'reset';
print colored ("<",'bold blue on_blue');
print colored (">",'black on_blue');
print color 'reset';
}

sub t187 {
#graytile [<>]
print color 'reset';
print colored ("<",'bold white on_white');
print colored (">",'black on_white');
print color 'reset';
}

sub t188 {
#nulltile [<>]
print color 'reset';
print '<>';
print color 'reset';
}

sub t189 {
#mainframe
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|||',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t190 {
#mainframe Logo
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('IBM',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t191 {
#mainframe case north
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('___',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t192 {
#mainframe case west
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.:',"bold $white on_$white");
	print colored('|',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t193 {
#mainframe case east
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $black on_$white");
	print colored(':.',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t194 {
#mainframe case north burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('___',"$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t195 {
#mainframe case west burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.:',"bold $white on_$white");
	print colored('|',"$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t196 {
#mainframe case east burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$yellow on_$white");
	print colored(':.',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t197 {
#mainframe burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|||',"$yellow on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t198 {
#mainframe burnt badly
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|||',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t199 {
#mainframe Logo burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('IBM',"$yellow on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t200 {
#mainframe burnt badly and breaking
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('||',"$black on_$yellow");
	print colored('.',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t201 {
#mainframe burnt badly and breaking more
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$black on_$yellow");
	print colored(':.',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t202 {
#mainframe Logo burnt badly
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('IBM',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t203 {
#mainframe burnt tile
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.:.',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t204 {
#mainframe burnt tile + conduit
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.',"$black on_$white");
	print colored('  ',"$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t205 {
#mainframe burnt tile + conduit
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  ',"$black on_$black");
	print colored('.',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t206 {
#mainframe burnt badly and breaking + conduit
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('||',"$black on_$yellow");
	print colored(' ',"$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t207 {
#mainframe burnt badly and breaking more + conduit
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$black on_$yellow");
	print colored('  ',"$black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t208 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$red on_$black");
	print colored('|',"bold $black on_$black");
	print colored('|',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t209 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$red on_$black");
	print colored('|',"bold $black on_$black");
	print colored('/',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t210 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$red on_$black");
	print colored('| ',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t211 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$red on_$black");
	print colored('|',"$blue on_$black");
	print colored('\\',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t212 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"$red on_$black");
	print colored('|',"$blue on_$black");
	print colored('|',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t213 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $red on_$white");
	print colored('|',"bold $black on_$white");
	print colored('|',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t214 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $red on_$white");
	print colored('|',"bold $black on_$white");
	print colored('/',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t215 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $red on_$white");
	print colored('| ',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t216 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $red on_$white");
	print colored('|',"bold $blue on_$white");
	print colored('\\',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t217 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|',"bold $red on_$white");
	print colored('|',"bold $blue on_$white");
	print colored('|',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t218 {
#darkconduitwall W
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print'  ';
	print colored(']',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t219 {
#darkconduitwall W
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[',"bold $black on_$black");
	print'  ';
	print color 'reset';
	} else {
	visprint();
	}
}

sub t220 {
#ltconduitwall W
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print'  ';
	print colored(']',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t221 {
#ltconduitwall W
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[',"bold $black on_$white");
	print'  ';
	print color 'reset';
	} else {
	visprint();
	}
}

sub t222 {
#darkconduit + wire connect
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t223 {
#ltconduit + wire connect
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t224 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"$red on_$black");
	print colored('/',"bold $black on_$black");
	print colored('/',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t225 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' /',"$red on_$black");
	print colored('/',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t226 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  /',"$red on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t227 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/  ',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t228 {
#darkconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $black on_$black");
	print colored('/ ',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t229 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $red on_$white");
	print colored('/',"bold $black on_$white");
	print colored('/',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t230 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' /',"bold $red on_$white");
	print colored('/',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t231 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  /',"bold $red on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t232 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/  ',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t233 {
#ltconduit + wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $black on_$white");
	print colored('/ ',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t234 {
#grate
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('+++',"bold $white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t235 {
#grate w
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.:|',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t236 {
#grate e
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|:.',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t237 {
#puter
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|||',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t238 {
#puter logo
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('IBM',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t239 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.',"bold $white on_$white");
	print colored(' /',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t240 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.',"bold $white on_$white");
	print colored('/ ',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t241 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $blue on_$blue");
	print colored('  ',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t242 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('=',"$black on_$blue");
	print colored('__',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t243 {
#glass
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-',"$black on_$blue");
	print colored('__',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t244 {
#glass/wall
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[',"$white on_$black");
	print colored('/ ',"bold $blue on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t245 {
#monitor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('[',"$red on_$white");
	print colored('_',"$black on_$white");
	print colored(']',"$red on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t246 {
#mainframe case west
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/ ',"bold $white on_$white");
	print colored('|',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t247 {
#mainframe case west
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\_',"bold $white on_$white");
	print colored('|',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t248 {
#glass 241
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"bold $white on_$white");
	print colored('> ',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t249 {
#glass 242
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('=',"$black on_$white");
	print colored('__',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t250 {
#glass 243
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-',"$black on_$white");
	print colored('__',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t251 {
#mainframe case west burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\_',"bold $white on_$white");
	print colored('|',"$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t252 {
#mainframe case west burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/ ',"bold $white on_$white");
	print colored('|',"$yellow on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t253 {
#mainframe west broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\',"$black on_$white");
	print colored('||',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t254 {
#mainframe west broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"$black on_$white");
	print colored('||',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t255 {
#mainframe case west broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\_',"$black on_$white");
	print colored('|',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t256 {
#mainframe case west broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/ ',"$black on_$white");
	print colored('|',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t257 {
#puter logo
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('IBM',"$yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t258 {
#manframe burnt
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|||',"$yellow on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t259 {
#mainframe logo broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('\\',"$black on_$white");
	print colored('BM',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t260 {
#mainframe logo broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('/',"$black on_$white");
	print colored('BM',"$black on_$yellow");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t261 {
#conduit wall N
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('__|',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t262 {
#conduit wall S
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|  ',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t263 {
#conduit near wall S
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' __',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t264 {
#conduit wire trans
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-',"$red on_$black");
	print colored('|',"bold $black on_$black");
	print colored('|',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t265 {
#conduit wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"$red on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t266 {
#conduit wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"bold $black on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t267 {
#conduit wire
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t268 {
#door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.',"bold $white on_$white");
	print colored('||',"$black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t269 {
#conduit wire trans
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('--',"bold $black on_$black");
	print colored('|',"$blue on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t270 {
#conduit wire265
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"bold $red on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t271 {
#conduit wire266
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t272 {
#conduit wire267
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('---',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t273 {
#conduit wall N
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('__|',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t274 {
#conduit wall S
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('|  ',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t275 {
#conduit near wall S
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' __',"bold $black on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t276 {
#conduit wire trans264 
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-',"bold $red on_$white");
	print colored('|',"bold $black on_$white");
	print colored('|',"$blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t277 {
#conduit wire trans269
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('--',"bold $black on_$white");
	print colored('|',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t278 {
#glass floor
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-|-',"$white on_$blue");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t279 {
#glass floorbroken
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-|',"$white on_$blue");
	print colored('-',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t280 {
#glass floorbroken
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('-  ',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t281 {
#glass floorbroken
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('  -',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}


sub t282 {
#glass floorbroken
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' |-',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t283 {
#glass floorbroken
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' | ',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t284 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('V',"bold $blue on_$white");
	print colored(':',"bold $white on_$white");
	print colored('>',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t285 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('.',"bold $white on_$white");
	print colored('X',"bold $blue on_$white");
	print colored('>',"bold $blue on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t286 {
#glass broke
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored('<',"bold $blue on_$white");
	print colored('*',"bold $blue on_$white");
	print colored('.',"bold $white on_$white");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t287 {
#green door
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(' ||',"$green on_$black");
	print color 'reset';
	} else {
	visprint();
	}
}

sub t288 {
#ladder3
viseffect();
	if ($veffect == 0) {
	print color 'reset';
	print colored(']  ',"$white on_$black");
	print color 'reset';
	} else {
	visprint();
	}	
}

##Print#Game#Templates######
sub showtemplates {
print"\n";
svars();
print color 'reset';

 print color 'bold black'; print'['; print color 'bold white'; print't1: '; print color 'reset'; t1(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't2: '; print color 'reset'; t2(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't3: '; print color 'reset'; t3(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't4: '; print color 'reset'; t4(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't5: '; print color 'reset'; t5(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't6: '; print color 'reset'; t6(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't7: '; print color 'reset'; t7(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't8: '; print color 'reset'; t8(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't9: '; print color 'reset'; t9(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't10: '; print color 'reset'; t10(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't11: '; print color 'reset'; t11(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't12: '; print color 'reset'; t12(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't13: '; print color 'reset'; t13(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't14: '; print color 'reset'; t14(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't15: '; print color 'reset'; t15(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't16: '; print color 'reset'; t16(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't17: '; print color 'reset'; t17(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't18: '; print color 'reset'; t18(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't19: '; print color 'reset'; t19(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't20: '; print color 'reset'; t20(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't21: '; print color 'reset'; t21(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't22: '; print color 'reset'; t22(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't23: '; print color 'reset'; t23(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't24: '; print color 'reset'; t24(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't25: '; print color 'reset'; t25(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't26: '; print color 'reset'; t26(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't27: '; print color 'reset'; t27(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't28: '; print color 'reset'; t28(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't29: '; print color 'reset'; t29(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't30: '; print color 'reset'; t30(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't31: '; print color 'reset'; t31(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't32: '; print color 'reset'; t32(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't33: '; print color 'reset'; t33(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't34: '; print color 'reset'; t34(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't35: '; print color 'reset'; t35(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't36: '; print color 'reset'; t36(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't37: '; print color 'reset'; t37(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't38: '; print color 'reset'; t38(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't39: '; print color 'reset'; t39(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't40: '; print color 'reset'; t40(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't41: '; print color 'reset'; t41(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't42: '; print color 'reset'; t42(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't43: '; print color 'reset'; t43(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't44: '; print color 'reset'; t44(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't45: '; print color 'reset'; t45(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't46: '; print color 'reset'; t46(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't47: '; print color 'reset'; t47(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't48: '; print color 'reset'; t48(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't49: '; print color 'reset'; t49(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't50: '; print color 'reset'; t50(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't51: '; print color 'reset'; t51(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't52: '; print color 'reset'; t52(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't53: '; print color 'reset'; t53(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't54: '; print color 'reset'; t54(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't55: '; print color 'reset'; t55(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't56: '; print color 'reset'; t56(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't57: '; print color 'reset'; t57(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't58: '; print color 'reset'; t58(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't59: '; print color 'reset'; t59(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't60: '; print color 'reset'; t60(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't61: '; print color 'reset'; t61(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't62: '; print color 'reset'; t62(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't63: '; print color 'reset'; t63(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't64: '; print color 'reset'; t64(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't65: '; print color 'reset'; t65(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't66: '; print color 'reset'; t66(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't67: '; print color 'reset'; t67(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't68: '; print color 'reset'; t68(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't69: '; print color 'reset'; t69(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't70: '; print color 'reset'; t70(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't71: '; print color 'reset'; t71(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't72: '; print color 'reset'; t72(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't73: '; print color 'reset'; t73(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't74: '; print color 'reset'; t74(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't75: '; print color 'reset'; t75(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't76: '; print color 'reset'; t76(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't77: '; print color 'reset'; t77(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't78: '; print color 'reset'; t78(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't79: '; print color 'reset'; t79(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't80: '; print color 'reset'; t80(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't81: '; print color 'reset'; t81(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't82: '; print color 'reset'; t82(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't83: '; print color 'reset'; t83(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't84: '; print color 'reset'; t84(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't85: '; print color 'reset'; t85(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't86: '; print color 'reset'; t86(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't87: '; print color 'reset'; t87(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't88: '; print color 'reset'; t88(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't89: '; print color 'reset'; t89(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't90: '; print color 'reset'; t90(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't91: '; print color 'reset'; t91(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't92: '; print color 'reset'; t92(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't93: '; print color 'reset'; t93(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't94: '; print color 'reset'; t94(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't95: '; print color 'reset'; t95(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't96: '; print color 'reset'; t96(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't97: '; print color 'reset'; t97(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't98: '; print color 'reset'; t98(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't99: '; print color 'reset'; t99(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't100: '; print color 'reset'; t100(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't101: '; print color 'reset'; t101(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't102: '; print color 'reset'; t102(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't103: '; print color 'reset'; t103(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't104: '; print color 'reset'; t104(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't105: '; print color 'reset'; t105(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't106: '; print color 'reset'; t106(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't107: '; print color 'reset'; t107(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't108: '; print color 'reset'; t108(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't109: '; print color 'reset'; t109(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't110: '; print color 'reset'; t110(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't111: '; print color 'reset'; t111(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't112: '; print color 'reset'; t112(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't113: '; print color 'reset'; t113(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't114: '; print color 'reset'; t114(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't115: '; print color 'reset'; t115(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't116: '; print color 'reset'; t116(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't117: '; print color 'reset'; t117(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't118: '; print color 'reset'; t118(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't119: '; print color 'reset'; t119(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't120: '; print color 'reset'; t120(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't121: '; print color 'reset'; t121(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't122: '; print color 'reset'; t122(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't123: '; print color 'reset'; t123(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't124: '; print color 'reset'; t124(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't125: '; print color 'reset'; t125(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't126: '; print color 'reset'; t126(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't127: '; print color 'reset'; t127(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't128: '; print color 'reset'; t128(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't129: '; print color 'reset'; t129(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't130: '; print color 'reset'; t130(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't131: '; print color 'reset'; t131(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't132: '; print color 'reset'; t132(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't133: '; print color 'reset'; t133(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't134: '; print color 'reset'; t134(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't135: '; print color 'reset'; t135(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't136: '; print color 'reset'; t136(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't137: '; print color 'reset'; t137(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't138: '; print color 'reset'; t138(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't139: '; print color 'reset'; t139(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't140: '; print color 'reset'; t140(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't141: '; print color 'reset'; t141(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't142: '; print color 'reset'; t142(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't143: '; print color 'reset'; t143(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't144: '; print color 'reset'; t144(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't145: '; print color 'reset'; t145(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't146: '; print color 'reset'; t146(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't147: '; print color 'reset'; t147(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't148: '; print color 'reset'; t148(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't149: '; print color 'reset'; t149(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't150: '; print color 'reset'; t150(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't151: '; print color 'reset'; t151(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't152: '; print color 'reset'; t152(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't153: '; print color 'reset'; t153(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't154: '; print color 'reset'; t154(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't155: '; print color 'reset'; t155(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't156: '; print color 'reset'; t156(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't157: '; print color 'reset'; t157(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't158: '; print color 'reset'; t158(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't159: '; print color 'reset'; t159(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't160: '; print color 'reset'; t160(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't161: '; print color 'reset'; t161(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't162: '; print color 'reset'; t162(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't163: '; print color 'reset'; t163(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't164: '; print color 'reset'; t164(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't165: '; print color 'reset'; t165(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't166: '; print color 'reset'; t166(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't167: '; print color 'reset'; t167(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't168: '; print color 'reset'; t168(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't169: '; print color 'reset'; t169(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't170: '; print color 'reset'; t170(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't171: '; print color 'reset'; t171(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't172: '; print color 'reset'; t172(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't173: '; print color 'reset'; t173(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't174: '; print color 'reset'; t174(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't175: '; print color 'reset'; t175(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't176: '; print color 'reset'; t176(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't177: '; print color 'reset'; t177(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't178: '; print color 'reset'; t178(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't179: '; print color 'reset'; t179(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't180: '; print color 'reset'; t180(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't181: '; print color 'reset'; t181(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't182: '; print color 'reset'; t182(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't183: '; print color 'reset'; t183(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't184: '; print color 'reset'; t184(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't185: '; print color 'reset'; t185(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't186: '; print color 'reset'; t186(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't187: '; print color 'reset'; t187(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't188: '; print color 'reset'; t188(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't189: '; print color 'reset'; t189(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't190: '; print color 'reset'; t190(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't191: '; print color 'reset'; t191(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't192: '; print color 'reset'; t192(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't193: '; print color 'reset'; t193(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't194: '; print color 'reset'; t194(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't195: '; print color 'reset'; t195(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't196: '; print color 'reset'; t196(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't197: '; print color 'reset'; t197(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't198: '; print color 'reset'; t198(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't199: '; print color 'reset'; t199(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't200: '; print color 'reset'; t200(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't201: '; print color 'reset'; t201(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't202: '; print color 'reset'; t202(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't203: '; print color 'reset'; t203(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't204: '; print color 'reset'; t204(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't205: '; print color 'reset'; t205(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't206: '; print color 'reset'; t206(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't207: '; print color 'reset'; t207(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't208: '; print color 'reset'; t208(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't209: '; print color 'reset'; t209(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't210: '; print color 'reset'; t210(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't211: '; print color 'reset'; t211(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't212: '; print color 'reset'; t212(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't213: '; print color 'reset'; t213(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't214: '; print color 'reset'; t214(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't215: '; print color 'reset'; t215(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't216: '; print color 'reset'; t216(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't217: '; print color 'reset'; t217(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't218: '; print color 'reset'; t218(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't219: '; print color 'reset'; t219(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't220: '; print color 'reset'; t220(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't221: '; print color 'reset'; t221(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't222: '; print color 'reset'; t222(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't223: '; print color 'reset'; t223(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't224: '; print color 'reset'; t224(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't225: '; print color 'reset'; t225(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't226: '; print color 'reset'; t226(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't227: '; print color 'reset'; t227(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't228: '; print color 'reset'; t228(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't229: '; print color 'reset'; t229(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't230: '; print color 'reset'; t230(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't231: '; print color 'reset'; t231(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't232: '; print color 'reset'; t232(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't233: '; print color 'reset'; t233(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't234: '; print color 'reset'; t234(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't235: '; print color 'reset'; t235(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't236: '; print color 'reset'; t236(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't237: '; print color 'reset'; t237(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't238: '; print color 'reset'; t238(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't239: '; print color 'reset'; t239(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't240: '; print color 'reset'; t240(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't241: '; print color 'reset'; t241(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't242: '; print color 'reset'; t242(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't243: '; print color 'reset'; t243(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't244: '; print color 'reset'; t244(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't245: '; print color 'reset'; t245(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't246: '; print color 'reset'; t246(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't247: '; print color 'reset'; t247(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't248: '; print color 'reset'; t248(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't249: '; print color 'reset'; t249(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't250: '; print color 'reset'; t250(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't251: '; print color 'reset'; t251(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't252: '; print color 'reset'; t252(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't253: '; print color 'reset'; t253(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't254: '; print color 'reset'; t254(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't255: '; print color 'reset'; t255(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't256: '; print color 'reset'; t256(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't257: '; print color 'reset'; t257(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't258: '; print color 'reset'; t258(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't259: '; print color 'reset'; t259(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't260: '; print color 'reset'; t260(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't261: '; print color 'reset'; t261(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't262: '; print color 'reset'; t262(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't263: '; print color 'reset'; t263(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't264: '; print color 'reset'; t264(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't265: '; print color 'reset'; t265(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't266: '; print color 'reset'; t266(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't267: '; print color 'reset'; t267(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't268: '; print color 'reset'; t268(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't269: '; print color 'reset'; t269(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't270: '; print color 'reset'; t270(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't271: '; print color 'reset'; t271(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't272: '; print color 'reset'; t272(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't273: '; print color 'reset'; t273(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't274: '; print color 'reset'; t274(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't275: '; print color 'reset'; t275(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't276: '; print color 'reset'; t276(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't277: '; print color 'reset'; t277(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't278: '; print color 'reset'; t278(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't279: '; print color 'reset'; t279(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't280: '; print color 'reset'; t280(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't281: '; print color 'reset'; t281(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't282: '; print color 'reset'; t282(); print color 'bold black'; print' ] '; print"\n\n";
 print color 'bold black'; print'['; print color 'bold white'; print't283: '; print color 'reset'; t283(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't284: '; print color 'reset'; t284(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't285: '; print color 'reset'; t285(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't286: '; print color 'reset'; t286(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't287: '; print color 'reset'; t287(); print color 'bold black'; print' ] '; print color 'bold black'; print'['; print color 'bold white'; print't288: '; print color 'reset'; t288(); print color 'bold black'; print' ] '; print"\n\n";

print color 'reset';
print"\n";
}
##Print#Game#Templates#END##

#ROOM A1
sub room_ua1 {
$roomauthor = "$name_mikeeusa";
$room = ua1;
$n = 0;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";

if ($rsaroom_ua1 == 1) {
	$info = "       You find yourself in a strange room      ";
	$info2 = "                                                ";
} elsif ($rsaroom_ua1 == 2)  { 
	$info = "After further inspection of the room you come to";
	$info2 = "        the conclusion that it is large         ";
} elsif ($rsaroom_ua1 == 6)  {
	$info = "      You notice something... what is it        ";
	$info2 = "                                                ";
} elsif ($rsaroom_ua1 == 7)  {
	$info = "  You journy near the alien object and discover ";
	$info2 = "  that it is a Capped Staff! Yay a new weapon!  ";
	$cappedstaff = 1;
} elsif ($rsaroom_ua1 == 10)  {
	$info = "This room is getting rather dull, let us move on";
	$info2 = "                                                ";	
} else {
	$info = "                                                ";
	$info2 = "                                                ";
}

#blow shite up!!!
if ($bombdetonate == 1) {
	$info = "  You detonate a bomb, it shatters some marble  ";
	$info2 = "    tiles and you are knocked off your feet     ";
	$health = $health - 6;
	$bombdetonate = 0;
	$bombamount = $bombamount - 1;
} else {
}


wallunoa1(); print"\n";
floorunoa1(); print"\n"; floorunoa2(); print"\n"; floorunoa1(); print"\n"; floorunoa2(); print"\n"; 
floorunoa1(); print"\n"; floorunoa2(); print"\n"; floorunoa1(); print"\n"; floorunoa4(); print"\n"; 
floorunoa3(); print"\n"; floorunoa2(); print"\n"; floorunoa1(); print"\n"; floorunoa2(); print"\n"; 
floorunoa1(); print"\n"; floorunoa2(); print"\n"; floorunoa1(); print"\n"; 
wallunoa1(); print"\n";
$rsaroom_ua1 = $rsaroom_ua1 + 1;
}
#ROOM A1 END


#ROOM ZUG1
sub room_zug1 {
$roomauthor = "$name_mikeeusa";
$room = zug1;

if ($room2startin == 1) {
	if ($rsaroom_zug1 == 1) {
		$info = "       You find yourself in a strange room      ";
		$info2 = "                                                ";
	} elsif ($rsaroom_zug1 == 2)  { 
		$info = "  There is a rusted drain in the middle of the  ";
		$info2 = " room and to the east is a dark pannel of glass ";
	} elsif ($rsaroom_zug1 == 3)  { 
		$info = "             The walls are blue...              ";
		$info2 = "                                                ";
	} elsif ($rsaroom_zug1 == 5)  { 
		$info = " You hear a loud clank as a ladder is extended  ";
		$info2 = "  down from above to intersect with the grate   ";
		$zug1ltrig = 1;			
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
} else {
	if ($rsaroom_zug1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";	
	}
}

#blow shite up!!!
if ($bombdetonate == 1) {
	$info = "  You detonate a bomb, it shatters some tiles   ";
	$info2 = "       and you are knocked off your feet        ";
	$health = $health - 6;
	$bombdetonate = 0;
	$bombamount = $bombamount - 1;	
		
	if ($zug1winbtrig <= 4) {
		$zug1winbtrig = $zug1winbtrig + 1;
	} else {
	}
	
	if ($zug1winbtrig == 4) {
	$info = "     You detonate a bomb. The glass shatters    ";
	$info2 = "                                                ";					
	} else {
	}
		
	if ($zug1winbtrig >= 4) {
		$zug1winb = 1;
	} else {
	}
	
} else {
}

if ($zug1ltrig == 0) {
$n = 0;
$s = 0;
	if ($zug1winb == 0) {
	$e = 0;
	} else { 
	$e = 1; 
	}
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";
} else {
$n = 0;
$s = 0;
	if ($zug1winb == 0) {
	$e = 0;
	} else { 
	$e = 1; 
	}
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 1;
$down = 0;
$read = " ";
}

wallblueunoa1(); print"\n";
if ($zug1winb == 0) {
	srtroom2a(); print"\n"; srtroom1(); print"\n"; srtroom2(); print"\n"; srtroom1(); print"\n"; 
	srtroom2(); print"\n";
	if ($zug1ltrig == 0) { 
	srtroom1d(); print"\n"; srtroom2d();
	} else {
	srtroom1dl(); print"\n"; srtroom2dl(); 
	}
	print"\n"; srtroom1(); print"\n"; 
	srtroom2(); print"\n"; srtroom1(); print"\n"; srtroom2(); print"\n"; srtroom1a(); print"\n"; 
} else {
	srtroom2a(); print"\n"; srtroom1bm(); print"\n"; srtroom2bm(); print"\n"; srtroom1bm(); print"\n"; 
	srtroom2bm(); print"\n";
	if ($zug1ltrig == 0) { 
	srtroom1dbm(); print"\n"; srtroom2dbm();
	} else {
	srtroom1dlbm(); print"\n"; srtroom2dlbm(); 
	}
	print"\n"; srtroom1bm(); print"\n"; 
	srtroom2bm(); print"\n"; srtroom1bm(); print"\n"; srtroom2bm(); print"\n"; srtroom1a(); print"\n";
}
wallblueunoa2e(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 
$rsaroom_zug1 = $rsaroom_zug1 + 1;


}
#ROOM ZUG1 END

sub jandoor1 {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t46(); t46(); t127(); t127(); t127(); t127(); t9(); t9(); t9(); t9(); t5();
}

sub janfloor2 {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t68(); t43(); t43(); t43(); t70(); t127(); t9(); t9(); t9(); t9(); t6();
}

sub janfloor1 {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t43(); t43(); t43(); t43(); t70(); t127(); t9(); t9(); t9(); t9(); t5();
}

sub janfloor2a {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t43(); t43(); t43(); t43(); t70(); t127(); t9(); t9(); t9(); t9(); t6();
}

sub janfloor1a {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t49(); t43(); t66(); t66(); t70(); t127(); t9(); t9(); t9(); t9(); t5();
}

sub janwall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t9(); t9(); t9(); t9(); t6();
}

sub lvforwall1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t3(); t37(); t37(); t4(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub lvforwall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t4(); t37(); t37(); t3(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub lvforwall1a {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t3(); t4(); t3(); t4(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub lvforwall2a {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t4(); t3(); t4(); t3(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub lvforwall1b {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t46(); t46(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub lvforwall2b {
t5(); t9(); t9(); t9(); t9(); t9(); t39(); t39(); t46(); t46(); t48(); t39(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub lvforwall1c {
t6(); t9(); t9(); t9(); t9(); t9(); t156(); t3(); t37(); t37(); t4(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub lvforwall2c {
t5(); t9(); t9(); t9(); t9(); t9(); t156(); t4(); t37(); t37(); t3(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub contrabwall1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub contrabfloor1 {
t6(); t1(); t13(); t13(); t13(); t101(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub contrabdoor2 {
t5(); t59(); t13(); t13(); t13(); t101(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub contrabdoor1 {
t6(); t59(); t13(); t13(); t13(); t101(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub contrabfloor2 {
t5(); t1(); t13(); t13(); t13(); t101(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub contrabfloor1a {
t6(); t1(); t13(); t13(); t13(); t152(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub contrabfloor1b {
t6(); t1(); t13(); t13(); t13(); t136(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub contrabshelf2a {
t5(); t1(); t136(); t102(); t102(); t137(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub contrabshelf2b {
t5(); t1(); t152(); t100(); t100(); t153(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bcellwwall1 {
t6(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub bcellwwall2 {
t5(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub bcellwwall1d {
t6(); t141(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub bcellwwall2d {
t5(); t141(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub bcellwwall1d2 {
t6(); t1(); t1(); t1(); t1(); t1(); t54(); t54(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub bcellstairway1d {
t6(); t13(); t13(); t13(); t13(); t13(); t13(); t95(); t95(); t95(); t95(); t95(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub bcellstairway2d {
t5(); t13(); t13(); t13(); t13(); t13(); t13(); t95(); t95(); t95(); t95(); t95(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub bcellstairway1u {
t6(); t103(); t103(); t103(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub bcellstairway2u {
t5(); t103(); t103(); t103(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub bcellstairway1q {
t6(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t5();
}

sub bcellstairway2q {
t5(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t6();
}

sub bcellstairway1wk {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub bcellstairway1wq {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t103(); t103(); t103(); t103(); t1(); t5();
}

sub bcellstairway1k2d {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t98(); t98(); t98(); t98(); t1(); t5();
}

sub bcellstairway2k2d {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t98(); t98(); t98(); t98(); t1(); t6();
}

sub bcellstairway1k2u {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t102(); t102(); t102(); t102(); t1(); t5();
}

sub bcellstairway2k2u {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t102(); t102(); t102(); t102(); t1(); t6();
}

sub bcellstairway1k2 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub bcellstairway2k2 {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub bcellstairway1q2 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t103(); t103(); t103(); t103(); t1(); t5();
}

sub bcellstairway2q2 {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t103(); t103(); t103(); t103(); t1(); t6();
}

sub bstairdown1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t98(); t98(); t98(); t98(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bstairdown2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t98(); t98(); t98(); t98(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bcellblockwindow2 {
t5(); t127(); t127(); t127(); t127(); t127(); t127(); t53(); t53(); t53(); t53(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub bcellblockwindow2b {
t5(); t127(); t127(); t127(); t127(); t127(); t127(); t142(); t143(); t144(); t145(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub bcellblockcove2 {
t5(); t127(); t127(); t127(); t128(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t129(); t127(); t127(); t127(); t127(); t6();
}

sub bcellblockcove1 {
t6(); t9(); t9(); t9(); t127(); t128(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t9(); t9(); t9(); t9(); t5();
}

sub bcellblockcove2b {
t5(); t9(); t9(); t9(); t9(); t127(); t128(); t13(); t13(); t13(); t13(); t13(); t127(); t9(); t9(); t9(); t9(); t6();
}

sub bcellblockcove1b {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t127(); t54(); t54(); t127(); t139(); t127(); t9(); t9(); t9(); t9(); t5();
}

sub bcellblockcove2c {
t5(); t9(); t9(); t9(); t9(); t9(); t103(); t103(); t103(); t103(); t140(); t118(); t131(); t103(); t103(); t9(); t9(); t6();
}

sub bcellblockcove1c {
t6(); t9(); t9(); t9(); t9(); t9(); t103(); t103(); t103(); t103(); t118(); t119(); t101(); t103(); t103(); t9(); t9(); t5();
}

sub bcellblockcove2d {
t5(); t9(); t9(); t9(); t9(); t9(); t103(); t103(); t103(); t118(); t119(); t118(); t101(); t99(); t103(); t9(); t9(); t6();
}

sub bcellblockcove1d {
t6(); t9(); t9(); t9(); t9(); t9(); t103(); t103(); t119(); t118(); t119(); t118(); t136(); t137(); t127(); t9(); t9(); t5();
}

sub bcellblockcove2e {
t5(); t9(); t9(); t9(); t9(); t9(); t103(); t119(); t118(); t135(); t133(); t119(); t118(); t119(); t127(); t9(); t9(); t6();
}

sub bcellblockcove1e {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t118(); t119(); t134(); t133(); t118(); t119(); t118(); t127(); t9(); t9(); t5();
}

sub bcellblockhall1r {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t5();
}

sub bcellblockhall1rw {
t6(); t9(); t9(); t9(); t9(); t9(); t162(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t5();
}

sub bcellblockhall2r {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t6();
}

sub bcellblockwall1r {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub bcellblockwall1rb {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub bcellblockwall2r {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t1(); t1(); t1(); t1(); t1(); t1(); t6();
}

sub bcellblockhall1 {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t127(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bcellblockhall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t127(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bcellblockhallw2 {
t5(); t127(); t127(); t127(); t127(); t127(); t127(); t13(); t13(); t13(); t13(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub cellblockhall3 {
t6(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t5();
}

sub cellblockhall4 {
t5(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t6();
}

sub cellblockhall333rw {
t6(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t163(); t5();
}

sub cellblockhall333r {
t6(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t5();
}

sub cellblockhall444r {
t5(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t6();
}

sub cellblockhall3l {
t6(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t5();
}

sub cellblockhall4l {
t5(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t6();
}

sub cellblockhall3x {
t6(); t127(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t5();
}

sub cellblockhall4x {
t5(); t127(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t127(); t6();
}

sub cellblockwall3x {
t6(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t54(); t54(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t5();
}

sub bcellblock1d {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t33(); t33(); t1(); t9(); t5();
}
 
sub bcellblock2d {
t5(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t130(); t13(); t13(); t131(); t127(); t6();
}

sub cbcellblockhall1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall1b {
t6(); t9(); t9(); t9(); t9(); t9(); t141(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall2b {
t5(); t9(); t9(); t9(); t9(); t9(); t141(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall1c {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t59(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall2c {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t59(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall2d {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t55(); t13(); t13(); t56(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall2d2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t57(); t13(); t13(); t58(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall1d {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t54(); t54(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall1e {
t6(); t9(); t9(); t9(); t9(); t141(); t13(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall2e {
t5(); t9(); t9(); t9(); t9(); t141(); t13(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall1f {
t6(); t9(); t9(); t9(); t9(); t1(); t57(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall2f {
t5(); t9(); t9(); t9(); t9(); t1(); t55(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cbcellblockhall1g {
t6(); t9(); t9(); t9(); t9(); t9(); t59(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub cbcellblockhall2g {
t5(); t9(); t9(); t9(); t9(); t9(); t59(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub cellblockhall33l {
t6(); t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t5();
}

sub cellblockhall44l {
t5(); t9(); t9(); t9(); t9(); t9(); t127();  t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t6();
}

sub bcellblockhallw22l {
t5();  t9(); t9(); t9(); t9(); t9(); t127(); t13(); t13(); t13(); t13(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub bcellblockhallw22lf {
t5();  t9(); t9(); t9(); t9(); t9(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub bcelldoor2 {
t5(); t9(); t9(); t9(); t9(); t9(); t127(); t54(); t54(); t127(); t138(); t127(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bcellwall1d {
t6(); t9(); t9(); t9(); t9(); t127(); t130(); t119(); t118(); t140(); t118(); t131(); t127(); t127(); t9(); t9(); t9(); t5();
}

sub bcellwall1 {
t6(); t9(); t9(); t9(); t9(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t9(); t9(); t9(); t5();
}

sub bcellwall2 {
t5(); t9(); t9(); t9(); t9(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t9(); t9(); t9(); t6();
}

sub bcellroom1b {
t6(); t9(); t9(); t9(); t9(); t127(); t118(); t119(); t118(); t119(); t118(); t101(); t99(); t127(); t9(); t9(); t9(); t5();
}

sub bcellroom2b {
t5(); t9(); t9(); t9(); t9(); t127(); t119(); t118(); t119(); t118(); t119(); t101(); t99(); t127(); t9(); t9(); t9(); t6();
}

sub bcellroom2b2 {
t5(); t9(); t9(); t9(); t9(); t127(); t119(); t118(); t119(); t118(); t119(); t136(); t137(); t127();t9(); t9(); t9(); t6();
}

sub bcellroom1 {
t6(); t9(); t9(); t9(); t9(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t127(); t9(); t9(); t9(); t5();
}

sub bcellroom2 {
t5(); t9(); t9(); t9(); t9(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t127(); t9(); t9(); t9(); t6();
}

sub bcellroom1p {
t6(); t9(); t9(); t9(); t9(); t127(); t114(); t119(); t118(); t119(); t118(); t119(); t118(); t127(); t9(); t9(); t9(); t5();
}

sub bcellroom2p {
t5(); t9(); t9(); t9(); t9(); t127(); t115(); t118(); t119(); t118(); t119(); t118(); t119(); t127(); t9(); t9(); t9(); t6();
}

sub bcellroom1p2 {
t6(); t9(); t9(); t9(); t9(); t127(); t116(); t119(); t118(); t119(); t118(); t119(); t118(); t127(); t9(); t9(); t9(); t5();
}

sub bcellroom1l {
t6(); t9(); t9(); t9(); t9(); t127(); t118(); t119(); t134(); t133(); t118(); t119(); t118(); t127(); t9(); t9(); t9(); t5();
}

sub bcellroom2l {
t5(); t9(); t9(); t9(); t9(); t127(); t119(); t118(); t135(); t133(); t119(); t118(); t119(); t127(); t9(); t9(); t9(); t6();
}

sub wallblueunoa1 {
t6(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t5();
}

sub wallblueunoa2e {
t5(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub wallblueunoa2ejadr {
t5(); t127(); t127(); t127(); t127(); t46(); t46(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t127(); t6();
}

sub srtroom1a {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t129(); t5();
}

sub srtroom2a {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t131(); t6();
}

sub srtroom1 {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t157(); t5();
}

sub srtroom2 {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t158(); t6();
}

sub srtroom1d {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t10(); t10(); t118(); t119(); t118(); t119(); t118(); t119(); t157(); t5();
}

sub srtroom2d {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t10(); t10(); t119(); t118(); t119(); t118(); t119(); t118(); t158(); t6();
}

sub srtroom1dl {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t10(); t132(); t118(); t119(); t118(); t119(); t118(); t119(); t157(); t5();
}

sub srtroom2dl {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t10(); t132(); t119(); t118(); t119(); t118(); t119(); t118(); t158(); t6();
}

sub srtroom1bm {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t149(); t5();
}

sub srtroom2bm {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t119(); t118(); t148(); t6();
}

sub srtroom1dbm {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t10(); t10(); t118(); t119(); t118(); t119(); t118(); t119(); t147(); t5();
}

sub srtroom2dbm {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t10(); t10(); t119(); t118(); t119(); t118(); t119(); t118(); t146(); t6();
}

sub srtroom1dlbm {
t6(); t127(); t118(); t119(); t118(); t119(); t118(); t119(); t10(); t132(); t118(); t119(); t118(); t119(); t118(); t119(); t147(); t5();
}

sub srtroom2dlbm {
t5(); t127(); t119(); t118(); t119(); t118(); t119(); t118(); t10(); t132(); t119(); t118(); t119(); t118(); t119(); t118(); t146(); t6();
}

sub daa3wallunoa1 {
t6(); t127(); t127(); t127(); t127(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub daa3blueunoa2e {
t5(); t127(); t127(); t127(); t127(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t6();
}

sub daa31abm {
t6(); t119(); t118(); t119(); t129(); t151(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub daa32abm {
t5(); t118(); t119(); t118(); t131(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub daa31bm {
t6(); t119(); t118(); t119(); t149(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub daa32bm {
t5(); t118(); t119(); t118(); t148(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub daa31dbm {
t6(); t119(); t118(); t119(); t147(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t59(); t5();
}

sub daa32dbm {
t5(); t118(); t119(); t118(); t146(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t59(); t6();
}

sub daa31 {
t6(); t119(); t118(); t119(); t125(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t5();
}

sub daa32 {
t5(); t118(); t119(); t118(); t126(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t6();
}

sub daa31d {
t6(); t119(); t118(); t119(); t125(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t59(); t5();
}

sub daa32d {
t5(); t118(); t119(); t118(); t126(); t150(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t59(); t6();
}

sub bathroomdorm1 {
t6(); t9(); t9(); t9(); t1(); t46(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bathroomdorm2 {
t5(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t117(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bathroomdorm3 {
t6(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bathroomdorm4 {
t5(); t9(); t9(); t9(); t1(); t114(); t43(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bathroomdorm5 {
t6(); t9(); t9(); t9(); t1(); t115(); t43(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bathroomdorm6 {
t5(); t9(); t9(); t9(); t1(); t116(); t43(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bathroomdorm7 {
t6(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t1(); t120(); t121(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bathroomdorm8 {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t118(); t119(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub bathroomdorm9 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t119(); t118(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub bathroomdorm10 {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub wallaltdorm1 {
t6(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t46(); t46(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t5();
}

sub wallaltdorm3 {
t6(); t9(); t9(); t9(); t1(); t46(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t5();
}

sub sidealtdorm2 {
t5(); t9(); t9(); t9(); t1(); t108(); t109(); t108(); t109(); t108(); t101(); t113(); t4(); t1(); t9(); t9(); t9(); t6();
}

sub sidealtdorm3 {
t6(); t9(); t9(); t9(); t1(); t109(); t108(); t109(); t108(); t109(); t110(); t111(); t111(); t1(); t9(); t9(); t9(); t5();
}

sub sidealtdorm4 {
t5(); t9(); t9(); t9(); t1(); t108(); t109(); t108(); t109(); t108(); t110(); t111(); t111(); t1(); t9(); t9(); t9(); t6();
}

sub sidealtdorm5 {
t6(); t9(); t9(); t9(); t1(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t1(); t9(); t9(); t9(); t5();
}

sub sidealtdorm6 {
t5(); t9(); t9(); t9(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t9(); t9(); t9(); t6();
}

sub sidealtdorm7 {
t6(); t9(); t9(); t9(); t1(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t70(); t1(); t9(); t9(); t9(); t5();
}

sub sidealtdorm8 {
t5(); t9(); t9(); t9(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t66(); t66(); t1(); t9(); t9(); t9(); t6();
}

sub wallaltdoor1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t33(); t33(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub wallaltdoor2 {
t5(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t46(); t46(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t6();
}

sub corridalt2 {
t5(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t6();
}

sub corridalt1 {
t6(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t5();
}

sub corridalt3 {
t6(); t1(); t1(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t5();
}

sub greetwallalt1 {
t6(); t1(); t1(); t1(); t1(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub greetroomalt1 {
t6(); t9(); t9(); t9(); t9(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t9(); t9(); t9(); t9(); t5();
}

sub greetroomalt2 {
t5(); t9(); t9(); t9(); t9(); t1(); t109(); t108(); t109(); t108(); t109(); t108(); t1(); t9(); t9(); t9(); t9(); t6();
}

sub greetroomalt3 {
t6(); t9(); t9(); t9(); t1(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t1(); t9(); t9(); t9(); t5();
}

sub greetroomalt4 {
t5(); t9(); t9(); t1(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t1(); t9(); t9(); t6();
}

sub greetroomalt5 {
t6(); t9(); t1(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t1(); t9(); t5();
}

sub greetroomalt6 {
t5(); t1(); t1(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t1(); t1(); t6();
}

sub greetroomalt7 {
t6(); t104(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t106(); t5();
}

sub greetroomalt8 {
t5(); t105(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t109(); t108(); t107(); t6();
}

sub wallaltoqw2 {
t5(); t9(); t9(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub greetroomalt9 {
t6(); t9(); t106(); t109(); t108(); t109(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub greetroomalt10 {
t5(); t9(); t107(); t108(); t109(); t108(); t109(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t6();
}

sub wallaltdoor3 {
t6(); t9(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t5();
}
#stair well
#stair well
#lzv3
sub stairwellu_lzv3_2 {
t5(); t1(); t102(); t102(); t102(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t103(); t103(); t103(); t1(); t6();
}

sub stairwellu_lzv3_1 {
t6(); t1(); t102(); t102(); t102(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t103(); t103(); t103(); t1(); t5();
}

sub stairwellu_lzv3_3 {
t6(); t1(); t102(); t102(); t102(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t103(); t103(); t103(); t1(); t5();
}


sub stairwellq_lzv3_1 {
t6(); t1(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t5();
}

sub stairwellq_lzv3_2 {
t5(); t1(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t6();
}


sub stairwelld_lzv3_2 {
t5(); t59(); t43(); t43(); t43(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t43(); t43(); t43(); t1(); t6();
}

sub stairwelld_lzv3_1 {
t6(); t59(); t43(); t43(); t43(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t43(); t43(); t43(); t1(); t5();
}

sub stairwelld_lzv3_4 {
t5(); t1(); t43(); t43(); t43(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t43(); t43(); t43(); t1(); t6();
}

#kzv3
sub stairwellu_kzv3_2 {
t5(); t1(); t103(); t103(); t103(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t96(); t96(); t96(); t1(); t6();
}

sub stairwellu_kzv3_1 {
t6(); t1(); t103(); t103(); t103(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t96(); t96(); t96(); t1(); t5();
}

sub stairwellu_kzv3_3 {
t6(); t1(); t103(); t103(); t103(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t96(); t96(); t96(); t1(); t5();
}


sub stairwellq_kzv3_1 {
t6(); t1(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t43(); t43(); t43(); t1(); t5();
}

sub stairwellq_kzv3_2 {
t5(); t1(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t43(); t43(); t43(); t1(); t6();
}


sub stairwelld_kzv3_2 {
t5(); t103(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t1(); t6();
}

sub stairwelld_kzv3_1 {
t6(); t103(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t1(); t5();
}

sub stairwelld_kzv3_4 {
t5(); t1(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t1(); t6();
}

#jzv3
sub stairwellu_jzv3_2 {
t5(); t1(); t103(); t103(); t103(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t100(); t100(); t100(); t1(); t6();
}

sub stairwellu_jzv3_1 {
t6(); t1(); t103(); t103(); t103(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t100(); t100(); t100(); t1(); t5();
}

sub stairwellu_jzv3_3 {
t6(); t1(); t103(); t103(); t103(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t100(); t100(); t100(); t1(); t5();
}


sub stairwellq_jzv3_1 {
t6(); t1(); t43(); t43(); t43(); t97(); t97(); t97(); t97(); t97(); t97(); t97(); t97(); t43(); t43(); t43(); t1(); t5();
}

sub stairwellq_jzv3_2 {
t5(); t1(); t43(); t43(); t43(); t97(); t97(); t97(); t97(); t97(); t97(); t97(); t97(); t43(); t43(); t43(); t1(); t6();
}


sub stairwelld_jzv3_2 {
t5(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t6()
}

sub stairwelld_jzv3_1 {
t6(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t5(); 
}

sub stairwelld_jzv3_4 {
t5(); t1(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t6();
}

#izv1
sub stairwellu_izv3_2 {
t5(); t1(); t98(); t98(); t98(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t103(); t103(); t103(); t1(); t6();
}

sub stairwellu_izv3_1 {
t6(); t1(); t98(); t98(); t98(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t103(); t103(); t103(); t1(); t5();
}

sub stairwellu_izv3_3 {
t6(); t1(); t98(); t98(); t98(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t103(); t103(); t103(); t1(); t5();
}


sub stairwellq_izv3_1 {
t6(); t1(); t43(); t43(); t43(); t101(); t101(); t101(); t101(); t101(); t101(); t101(); t101(); t103(); t103(); t103(); t1(); t5();
}

sub stairwellq_izv3_2 {
t5(); t1(); t43(); t43(); t43(); t101(); t101(); t101(); t101(); t101(); t101(); t101(); t101(); t103(); t103(); t103(); t1(); t6();
}


sub stairwelld_izv3_1 {
t6(); t1(); t43(); t43(); t43(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t5();
}

sub stairwelld_izv3_2 {
t5(); t1(); t43(); t43(); t43(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t6();
}

#hzv1
sub stairwdoor1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t33(); t33(); t1(); t5();
}

sub stairwdoor3 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t103(); t103(); t1(); t5();
}

sub stairwelld_hzv3_1 {
t6(); t1(); t43(); t43(); t43(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t95(); t43(); t43(); t43(); t1(); t5();
}

#gzv1
sub stairwelld_gzv3_1 {
t6(); t1(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t1(); t5();
}

sub stairwelld_gzv3_2 {
t5(); t1(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t1(); t6();
}

#fzv1
sub stairwelld_fzv3_1 {
t6(); t1(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t103(); t1(); t5(); 
}
#EOS
#EOS

sub sewrwall1bdkf {
t5(); t9(); t9(); t9(); t9(); t15(); t80(); t22(); t20(); t17(); t88(); t79(); t16(); t9(); t9(); t9(); t9(); t6();
}

sub sewrwall2bdk {
t6(); t9(); t9(); t9(); t9(); t16(); t81(); t88(); t82(); t81(); t79(); t80(); t15(); t9(); t9(); t9(); t9(); t5();
}

sub sewrwall1bdk {
t5(); t9(); t9(); t9(); t9(); t15(); t80(); t82(); t81(); t80(); t88(); t79(); t16(); t9(); t9(); t9(); t9(); t6();
}

sub sewrwall2bdkb {
t6(); t9(); t9(); t9(); t9(); t161(); t83(); t85(); t87(); t86(); t84(); t85(); t160(); t9(); t9(); t9(); t9(); t5();
}

sub sewrwall1bdkb {
t5(); t9(); t9(); t9(); t9(); t160(); t86(); t84(); t85(); t87(); t85(); t87(); t161(); t9(); t9(); t9(); t9(); t6();
}

sub sewrwall1WEx {
t6(); t9(); t9(); t9(); t9(); t15(); t17(); t22(); t17(); t21(); t23(); t19(); t15(); t16(); t15(); t15(); t16(); t5();
}

sub sewrwall2WEx {
t5(); t9(); t9(); t9(); t9(); t15(); t18(); t19(); t17(); t19(); t20(); t18(); t15(); t16(); t15(); t15(); t16(); t6();
}

sub sewrwall2Ex {
t5(); t9(); t9(); t9(); t9(); t15(); t18(); t19(); t17(); t19(); t20(); t18(); t20(); t17(); t22(); t23(); t17(); t6();
}

sub sewrwall1Ex {
t6(); t9(); t9(); t9(); t9(); t16(); t17(); t18(); t20(); t19(); t17(); t17(); t22(); t19(); t17(); t18(); t19(); t5();
}

sub sewrwall3Ex {
t6(); t9(); t9(); t9(); t9(); t16(); t17(); t18(); t20(); t19(); t17(); t17(); t18(); t22(); t19(); t20(); t21(); t5();
}

sub wallunoa1d1w {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t43(); t43(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub wallunoa1d2w {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t33(); t33(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub longhall7bx {
t6(); t43(); t43(); t78(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t5();
}

sub longhall7b {
t6(); t43(); t43(); t60(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t5();
}

sub longhall6b {
t5(); t43(); t43(); t77(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t6();
}

sub longhall8b {
t5(); t43(); t43(); t76(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t6();
}

sub wallunoalonghall1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t5();
}

sub longhall11 {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t75(); t9(); t9(); t9(); t9(); t5();
}

sub longhall12 {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t75(); t9(); t9(); t9(); t9(); t6();
}

sub longhall10 {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t1(); t9(); t9(); t9(); t9(); t6();
}

sub longhall7 {
t6(); t43(); t43(); t72(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t5();
}

sub longhall6 {
t5(); t43(); t43(); t74(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t6();
}

sub longhall8 {
t5(); t43(); t43(); t73(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t6();
}

sub closetwall1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub closetwall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub closetfloor1 {
t6(); t9(); t9(); t9(); t9(); t9(); t59(); t43(); t43(); t70(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub closetfloor2 {
t5(); t9(); t9(); t9(); t9(); t9(); t59(); t43(); t68(); t70(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
} 

sub closetshelvs1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t66(); t66(); t70(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub closetshelvs2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t69(); t66(); t70(); t1(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub longhall3 {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t5();
}

sub longhall4 {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t6();
}

sub longhallwall1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t43(); t43(); t43(); t43(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub longhall1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall1door {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t93(); t93(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
} 

sub longhall1b {
t6(); t9(); t9(); t9(); t9(); t9(); t59(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2b {
t5(); t9(); t9(); t9(); t9(); t9(); t59(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub longhall1c {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t59(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2c {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t59(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub tvwall1 {
t6(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t5();
}

sub tvwall2 {
t5(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t6();
}

sub tvfloor1 {
t6(); t9(); t9(); t9(); t9(); t59(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t59(); t9(); t9(); t9(); t5();
}

sub tvfloor2 {
t5(); t9(); t9(); t9(); t9(); t59(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t59(); t9(); t9(); t9(); t6();
}

sub tvfloor3 {
t6(); t9(); t9(); t9(); t9(); t1(); t66(); t66(); t66(); t43(); t66(); t66(); t66(); t1(); t9(); t9(); t9(); t5();
}

sub tvwall4 {
t5(); t9(); t9(); t9(); t9(); t1(); t65(); t65(); t65(); t65(); t65(); t65(); t65(); t1(); t9(); t9(); t9(); t6();
}

sub tvwall6 {
t5(); t9(); t9(); t9(); t9(); t1(); t45(); t65(); t67(); t67(); t65(); t45(); t65(); t1(); t9(); t9(); t9(); t6();
}

sub labbfloor1doore {
t6(); t9(); t9(); t64(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t64(); t5();
}

sub labbfloor2doore {
t5(); t9(); t9(); t64(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t64(); t6();
}

sub labbfloor1dooreb {
t6(); t9(); t9(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t64(); t5();
}

sub labbfloor2dooreb {
t5(); t9(); t9(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t64(); t6();
}

sub labbfloor1 {
t6(); t9(); t9(); t1(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t1(); t5();
}

sub labbfloor2 {
t5(); t9(); t9(); t9(); t1(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t1(); t9(); t6();
}

sub labbfloor3 {
t6(); t9(); t9(); t9(); t9(); t1(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t1(); t9(); t9(); t5();
}

sub labbfloor4 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t43(); t43(); t43(); t43(); t1(); t1(); t9(); t9(); t9(); t6();
}

sub labbfloor5 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t55(); t43(); t43(); t56(); t1(); t9(); t9(); t9(); t9(); t5();
}

sub labbfloor6 {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t63(); t63(); t1(); t1(); t9(); t9(); t9(); t9(); t6();
}

sub puterfloor1doore {
t6(); t9(); t9(); t16(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t59(); t5();
}

sub puterfloor2doore {
t5(); t9(); t9(); t16(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t59(); t6();
}

sub glasslockwal1 {
t6(); t9(); t9(); t16(); t1(); t1(); t53(); t53(); t53(); t53(); t53(); t53(); t1(); t1(); t54(); t54(); t1(); t5();
}

sub glasslockwal1bx {
t6(); t9(); t9(); t16(); t1(); t1(); t43(); t60(); t43(); t62(); t61(); t43(); t1(); t1(); t54(); t54(); t1(); t5();
}

sub glasslockwal2 {
t5(); t9(); t9(); t16(); t1(); t55(); t43(); t43(); t43(); t43(); t43(); t43(); t56(); t55(); t43(); t43(); t1(); t6();
}

sub glasslockwal4 {
t5(); t9(); t9(); t16(); t1(); t57(); t43(); t43(); t43(); t43(); t43(); t43(); t58(); t57(); t43(); t43(); t1(); t6();
}

sub lockerfloor1 {
t6(); t9(); t9(); t16(); t49(); t43(); t43(); t43(); t43(); t52(); t49(); t43(); t43(); t43(); t43(); t52(); t1(); t5();
}

sub lockerfloor1b {
t6(); t9(); t9(); t16(); t50(); t51(); t43(); t43(); t43(); t52(); t49(); t43(); t43(); t43(); t43(); t52(); t1(); t5();
}

sub lockerfloor2 {
t5(); t9(); t9(); t16(); t49(); t43(); t43(); t43(); t43(); t52(); t49(); t43(); t43(); t43(); t43(); t52(); t1(); t6();
}

sub endlavwall1 {
t6(); t9(); t9(); t9(); t9(); t39(); t39(); t39(); t39(); t46(); t46(); t48(); t39(); t39(); t39(); t9(); t9(); t5();
}

sub endlavtrim2 {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t48(); t9(); t9(); t6();
}

sub endlavmid1 {
t6(); t9(); t9(); t9(); t9(); t39(); t4(); t3(); t3(); t47(); t47(); t3(); t3(); t4(); t39(); t39(); t39(); t5();
}

sub endlavmid1y {
t6(); t9(); t9(); t9(); t9(); t39(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t39(); t39(); t39(); t5();
}

sub endlavmid2 {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t3(); t3(); t47(); t47(); t3(); t3(); t4(); t38(); t38(); t38(); t6();
}

sub endlavmid1b {
t6(); t9(); t9(); t9(); t9(); t39(); t4(); t3(); t3(); t47(); t47(); t3(); t3(); t4(); t37(); t37(); t37(); t5();
}

sub endlavmid1x {
t6(); t9(); t9(); t9(); t9(); t39(); t4(); t47(); t47(); t3(); t3(); t47(); t47(); t4(); t37(); t37(); t37(); t5();
}

sub endlavmid2b {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t47(); t47(); t3(); t3(); t47(); t47(); t4(); t37(); t37(); t37(); t6();
}

sub endlavmid2x {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t47(); t47(); t3(); t3(); t47(); t47(); t4(); t38(); t38(); t38(); t6();
}

sub endlavmid1c {
t6(); t9(); t9(); t9(); t9(); t39(); t4(); t47(); t47(); t3(); t3(); t47(); t47(); t4(); t37(); t37(); t37(); t5();
}

sub endlavmid2c {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t47(); t47(); t3(); t3(); t47(); t47(); t4(); t37(); t37(); t37(); t6();
}

sub endlavmid1d {
t6(); t9(); t9(); t9(); t9(); t39(); t4(); t3(); t3(); t47(); t47(); t3(); t3(); t4(); t37(); t37(); t37(); t5();
}

sub endlavmid2d {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t3(); t3(); t47(); t47(); t3(); t3(); t4(); t37(); t37(); t37(); t6();
}

sub puterwall1 {
t6(); t9(); t9(); t16(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub puterwallh1 {
t6(); t9(); t9(); t16(); t1(); t43(); t43(); t43(); t1(); t1(); t1(); t1(); t43(); t43(); t43(); t1(); t1(); t5();
}

sub puterwallh2 {
t5(); t9(); t9(); t16(); t1(); t43(); t43(); t43(); t1(); t1(); t1(); t1(); t43(); t43(); t43(); t1(); t1(); t6();
}

sub puterwall1b {
t6(); t9(); t9(); t16(); t1(); t1(); t1(); t1(); t1(); t1(); t45(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub puterwall1c {
t6(); t9(); t9(); t16(); t1(); t1(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub puterfloor1 {
t6(); t9(); t9(); t16(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub puterfloor2 {
t5(); t9(); t9(); t16(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub puterfloor1b {
t6(); t9(); t42(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub puterfloor2b {
t5(); t9(); t42(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub lavishwall3 {
t6(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t5();
}

sub lavishwall5 {
t6(); t39(); t39(); t39(); t39(); t39(); t55(); t46(); t167(); t1(); t167(); t46(); t56(); t39(); t39(); t39(); t39(); t5();
}

sub lavishwall6 {
t6(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t93(); t93(); t39(); t39(); t5();
}

sub lavishwall1 {
t6(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t40(); t40(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t5();
}

sub lavishtrim2 {
t5(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t37(); t37(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t6();
}

sub lavishtrim4 {
t5(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t38(); t6();
}

sub lavishtrim6 {
t5(); t38(); t38(); t38(); t38(); t38(); t38(); t37(); t37(); t38(); t37(); t37(); t38(); t38(); t38(); t38(); t38(); t6();
}

sub lavishwall10 {
t6(); t39(); t39(); t39(); t39(); t39(); t57(); t38(); t91(); t92(); t38(); t58(); t39(); t39(); t39(); t39(); t39(); t5();
}

sub lavishwall11 {
t5(); t9(); t9(); t9(); t9(); t9(); t39(); t39(); t39(); t39(); t39(); t39(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub lavishwall7 {
t6(); t9(); t9(); t9(); t9(); t39(); t55(); t46(); t167(); t1(); t167(); t46(); t56(); t39(); t9(); t9(); t9(); t5();
}

sub lavishwall9 {
t6(); t9(); t9(); t9(); t9(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t39(); t9(); t9(); t9(); t5();
}

sub lavishstdy2 {
t5(); t9(); t9(); t9(); t9(); t48(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t48(); t9(); t9(); t9(); t6();
}

sub lavishstdy1 {
t6(); t9(); t9(); t9(); t9(); t39(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t39(); t9(); t9(); t9(); t5();
}

sub lavishstdy4 {
t5(); t9(); t9(); t9(); t9(); t48(); t69(); t169(); t168(); t170(); t171(); t172(); t168(); t48(); t9(); t9(); t9(); t6();
}

#velvet
sub carpetred1 {
t6(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t5();
}

sub carpetred2 {
t5(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t37(); t6();
}

sub elevator2 {
t6(); t9(); t9(); t9(); t9(); t35(); t36(); t36(); t36(); t36(); t36(); t36(); t36(); t9(); t9(); t9(); t9(); t5();
}

sub elevator1 {
t6(); t9(); t9(); t9(); t9(); t36(); t36(); t36(); t33(); t33(); t36(); t36(); t35(); t9(); t9(); t9(); t9(); t5();
}

sub floorele2 {
t6(); t9(); t9(); t9(); t9(); t35(); t34(); t34(); t34(); t34(); t34(); t34(); t35(); t9(); t9(); t9(); t9(); t5();
}

sub floorele1 {
t5(); t9(); t9(); t9(); t9(); t35(); t34(); t34(); t34(); t34(); t34(); t34(); t35(); t9(); t9(); t9(); t9(); t6();
}

sub platwall2 {
t6(); t15(); t15(); t15(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t15(); t15(); t15(); t16(); t15(); t5();
}

sub platwall1 {
t5(); t15(); t15(); t15(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t15(); t16(); t15(); t15(); t15(); t6();
}

sub platwall3 {
t5(); t15(); t15(); t15(); t13(); t13(); t13(); t13(); t13(); t94(); t13(); t13(); t15(); t16(); t15(); t15(); t15(); t6();
}

sub sewrwall2 {
t6(); t9(); t9(); t9(); t9(); t15(); t18(); t19(); t17(); t19(); t20(); t18(); t15(); t9(); t9(); t9(); t9(); t5();
}

sub sewrwall1 {
t5(); t9(); t9(); t9(); t9(); t16(); t17(); t18(); t20(); t19(); t17(); t17(); t15(); t9(); t9(); t9(); t9(); t6();
}

sub sewrwall3 {
t5(); t15(); t15(); t16(); t15(); t16(); t17(); t18(); t20(); t19(); t17(); t17(); t15(); t16(); t15(); t15(); t15(); t6();
}

sub sewrwall4 {
t6(); t15(); t15(); t16(); t15(); t16(); t17(); t18(); t19(); t18(); t18(); t17(); t15(); t16(); t15(); t15(); t15(); t5();
}

sub sewrwall2b {
t6(); t9(); t9(); t9(); t9(); t15(); t19(); t20(); t22(); t21(); t19(); t23(); t15(); t9(); t9(); t9(); t9(); t5();
}

sub sewrwall1b {
t5(); t9(); t9(); t9(); t9(); t16(); t21(); t19(); t23(); t19(); t22(); t21(); t15(); t9(); t9(); t9(); t9(); t6();
}

sub sewrwall2c {
t6(); t16(); t19(); t20(); t23(); t21(); t19(); t20(); t18(); t21(); t17(); t23(); t18(); t19(); t22(); t17(); t15(); t5();
}

sub sewrwall1c {
t5(); t15(); t17(); t22(); t19(); t22(); t23(); t18(); t23(); t22(); t22(); t21(); t22(); t17(); t23(); t20(); t16(); t6();
}

sub sewrwall1d {
t5(); t15(); t17(); t22(); t19(); t22(); t23(); t18(); t23(); t22(); t22(); t21(); t22(); t17(); t23(); t41(); t15(); t6();
}

sub sewrwall2d {
t6(); t16(); t18(); t22(); t19(); t22(); t17(); t18(); t20(); t22(); t21(); t17(); t22(); t22(); t17(); t41(); t15(); t5();
}

sub nothing1wall {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub nothing2wall {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub metalwall1 {
t6(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t5();
}

sub metalwall2 {
t5(); t16(); t15(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t16(); t15(); t15(); t15(); t15(); t15(); t16(); t6();
}

sub metalwall4 {
t5(); t16(); t15(); t15(); t15(); t16(); t33(); t33(); t16(); t15(); t16(); t15(); t15(); t15(); t15(); t15(); t16(); t6();
}

sub sewagefallen1 {
t6(); t16(); t16(); t103(); t103(); t79(); t82(); t83(); t85(); t86(); t85(); t83(); t87(); t85(); t86(); t87(); t88(); t5();
}

sub sewagefallen2 {
t5(); t15(); t16(); t103(); t103(); t80(); t81(); t84(); t87(); t88(); t84(); t86(); t88(); t88(); t84(); t85(); t87(); t6();
}

sub sewage1 {
t6(); t17(); t17(); t18(); t20(); t23(); t19(); t17(); t17(); t17(); t22(); t20(); t18(); t21(); t23(); t17(); t18(); t5();
}

sub sewage2 {
t5(); t18(); t19(); t21(); t17(); t23(); t17(); t17(); t22(); t18(); t19(); t22(); t21(); t21(); t18(); t19(); t20(); t6();
}

sub sewage3 {
t6(); t20(); t21(); t17(); t22(); t18(); t20(); t23(); t19(); t22(); t21(); t19(); t18(); t17(); t20(); t18(); t17(); t5();
}

sub sewage1b {
t6(); t23(); t24(); t23(); t18(); t17(); t19(); t17(); t18(); t19(); t22(); t18(); t18(); t21(); t22(); t17(); t20(); t5();
}

sub sewage2b {
t5(); t19(); t25(); t17(); t19(); t23(); t18(); t20(); t23(); t18(); t19(); t20(); t18(); t17(); t18(); t18(); t17(); t6();
}

sub sewage3b {
t6(); t17(); t24(); t18(); t21(); t18(); t20(); t23(); t19(); t22(); t23(); t20(); t18(); t17(); t20(); t18(); t21(); t5();
}

sub sewage1c {
t6(); t23(); t20(); t23(); t18(); t17(); t19(); t26(); t29(); t32(); t32(); t32(); t32(); t32(); t32(); t32(); t15(); t5();
}

sub sewage2c {
t5(); t19(); t18(); t17(); t19(); t23(); t18(); t27(); t30(); t32(); t32(); t32(); t32(); t32(); t32(); t32(); t16(); t6();
}

sub sewage3c {
t6(); t17(); t19(); t18(); t21(); t18(); t20(); t28(); t31(); t32(); t32(); t32(); t32(); t32(); t32(); t32(); t15(); t5();
}

sub wallunoa1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub wallunoa2 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t5();
}

sub wallunoa2e {
t5(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t6();
}

sub wallunoa3 {
t6(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t5();
}

sub wallunoa4 {
t5(); t9(); t9(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t9(); t9(); t6();
}

sub wallunoa5 {
t6(); t9(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t9(); t5();
}

sub wallunoa6 {
t5(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t6();
}

sub wallunoa7 {
t6(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t5();
}

sub wallunoa4bld {
t5(); t9(); t9(); t9(); t1(); t1(); t11(); t11(); t11(); t12(); t11(); t11(); t1(); t1(); t9(); t9(); t9(); t6();
}

sub wallunoa5bld {
t6(); t9(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t155(); t11(); t11(); t11(); t1(); t1(); t9(); t9(); t5();
}

sub wallunoa6bld {
t5(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t11(); t154(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t6();
}

sub wallunoa7bld {
t6(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t11(); t155(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t5();
}

sub wallunoa8 {
t5(); t9(); t1(); t1(); t11(); t11(); t11(); t12(); t12(); t12(); t11(); t11(); t11(); t11(); t1(); t1(); t9(); t6();
}

sub wallunoa9 {
t6(); t9(); t1(); t1(); t11(); t11(); t11(); t11(); t12(); t12(); t12(); t11(); t11(); t11(); t1(); t1(); t9(); t5();
}

sub wallunoa4b {
t5(); t9(); t9(); t9(); t1(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t1(); t9(); t9(); t9(); t6();
}

sub wallunoa5b {
t6(); t9(); t9(); t1(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t1(); t9(); t9(); t5();
}

sub wallunoa6b {
t5(); t9(); t1(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t1(); t9(); t6();
}

sub wallunoa7b {
t6(); t9(); t1(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t1(); t9(); t5();
}

sub wallunoa6bre {
t5(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t6();
}

sub wallunoa7bre {
t6(); t9(); t9(); t1(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t5();
}

sub wallunoa8b {
t5(); t9(); t1(); t14(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t1(); t9(); t6();
}

sub wallunoa9b {
t6(); t9(); t1(); t14(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t13(); t1(); t1(); t9(); t5();
}

sub wallunoa8bre {
t5(); t9(); t9(); t287(); t13(); t13(); t13(); t13(); t288(); t13(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t6();
}

sub wallunoa9bre {
t6(); t9(); t9(); t287(); t13(); t13(); t13(); t13(); t288(); t13(); t13(); t13(); t13(); t13(); t1(); t9(); t9(); t5();
}

sub floorunoa1 {
t5(); t2(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t2(); t6();
}

sub floorunoa2 {
t6(); t2(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t2(); t5();
}

sub floorunoa3 {
t5(); t2(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t7(); t6();
}

sub floorunoa4 {
t6(); t2(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t4(); t3(); t8(); t5();
}

sub floorunoa5 {
t6(); t2(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t5();
}

sub floorunoa6 {
t5(); t2(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t6();
}

sub floorunoa7 {
t5(); t2(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t2(); t9(); t9(); t6();
}

sub floorunoa8 {
t6(); t2(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t2(); t9(); t5();
}

sub floorunoa9 {
t5(); t2(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t2(); t6();
}

sub floorunoa10 {
t6(); t8(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t5();
}

sub floorunoa11 {
t5(); t7(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t6();
}

#5
sub floorunoa12 {
t6(); t2(); t4(); t4(); t4(); t10(); t10(); t10(); t10(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t5();
}

#6
sub floorunoa13 {
t5(); t2(); t4(); t4(); t4(); t10(); t10(); t10(); t10(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t6();
}

#5
sub floorunoa14 {
t6(); t8(); t4(); t4(); t4(); t10(); t10(); t10(); t10(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t5();
}

#6
sub floorunoa15 {
t5(); t7(); t4(); t4(); t4(); t10(); t10(); t10(); t10(); t4(); t4(); t4(); t2(); t9(); t9(); t9(); t9(); t6();
}

sub lsewage1 {
t6(); t17(); t17(); t18(); t20(); t23(); t19(); t17(); t17(); t17(); t22(); t20(); t16(); t9(); t9(); t9(); t9(); t5();
}

sub lsewage2 {
t5(); t18(); t19(); t21(); t17(); t23(); t17(); t17(); t22(); t18(); t19(); t22(); t15(); t9(); t9(); t9(); t9(); t6();
}

sub lsewage3 {
t6(); t20(); t21(); t17(); t22(); t18(); t20(); t23(); t19(); t22(); t21(); t19(); t16(); t9(); t9(); t9(); t9(); t5();
}

sub lsewrwall2 {
t5(); t15(); t16(); t15(); t15(); t16(); t17(); t18(); t20(); t19(); t17(); t22(); t15(); t9(); t9(); t9(); t9(); t6();
}

sub lsewrwall1 {
t6(); t15(); t15(); t16(); t16(); t15(); t20(); t19(); t21(); t17(); t20(); t23(); t15(); t9(); t9(); t9(); t9(); t5();
}

sub lsewrwall3 {
t6(); t15(); t15(); t16(); t16(); t15(); t16(); t15(); t15(); t16(); t15(); t16(); t15(); t9(); t9(); t9(); t9(); t5();
}

sub lsewrwall4 {
t5(); t16(); t15(); t16(); t15(); t16(); t15(); t16(); t15(); t15(); t16(); t15(); t16(); t9(); t9(); t9(); t9(); t6();
}

sub tdlmetalwall1 {
t6(); t160(); t161(); t160(); t161(); t160(); t160(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t15(); t16(); t15(); t5();
}

sub tdlmetalwall2 {
t5(); t161(); t161(); t160(); t160(); t161(); t160(); t15(); t16(); t15(); t16(); t15(); t15(); t15(); t15(); t15(); t16(); t6();
}

sub tdlsewage1 {
t6(); t83(); t85(); t86(); t84(); t81(); t87(); t80(); t82(); t79(); t22(); t20(); t18(); t21(); t23(); t17(); t18(); t5();
}

sub tdlsewage2 {
t5(); t84(); t86(); t87(); t85(); t83(); t79(); t85(); t81(); t80(); t82(); t22(); t21(); t21(); t18(); t19(); t20(); t6();
}

sub tdlsewage3 {
t6(); t85(); t87(); t83(); t86(); t84(); t80(); t82(); t80(); t81(); t79(); t81(); t18(); t17(); t20(); t18(); t17(); t5();
}

sub tdlsewage1b {
t6(); t86(); t83(); t84(); t87(); t85(); t86(); t79(); t82(); t82(); t22(); t18(); t18(); t21(); t22(); t17(); t20(); t5();
}

sub tdlsewage2b {
t5(); t87(); t84(); t85(); t83(); t86(); t81(); t83(); t81(); t80(); t79(); t82(); t18(); t17(); t18(); t18(); t17(); t6();
}

sub tdlsewage3b {
t6(); t83(); t85(); t86(); t84(); t82(); t83(); t81(); t79(); t81(); t80(); t20(); t18(); t17(); t20(); t18(); t21(); t5();
}

sub dkmetalwall1 {
t6(); t160(); t161(); t160(); t161(); t160(); t160(); t161(); t160(); t161(); t160(); t161(); t161(); t161(); t160(); t161(); t160(); t5();
}

sub dkmetalwall2 {
t5(); t161(); t161(); t160(); t160(); t161(); t160(); t160(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t6();
}

sub dkmetalwall1b {
t6(); t9(); t9(); t9(); t9(); t160(); t160(); t161(); t160(); t161(); t160(); t161(); t161(); t161(); t160(); t161(); t160(); t5();
}

sub dkmetalwall2b {
t5(); t9(); t9(); t9(); t9(); t161(); t160(); t160(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t6();
}

sub dksewage1 {
t6(); t83(); t85(); t86(); t84(); t83(); t87(); t84(); t83(); t84(); t87(); t86(); t85(); t87(); t83(); t87(); t84(); t5();
}

sub dksewage2 {
t5(); t84(); t86(); t87(); t85(); t84(); t85(); t85(); t84(); t86(); t85(); t86(); t87(); t84(); t86(); t86(); t87(); t6();
}

sub dksewage3 {
t6(); t85(); t83(); t86(); t83(); t85(); t86(); t83(); t85(); t87(); t86(); t83(); t84(); t85(); t87(); t83(); t84(); t5();
}

sub dksewage4 {
t5(); t83(); t84(); t85(); t86(); t87(); t83(); t84(); t85(); t86(); t87(); t84(); t85(); t83(); t84(); t85(); t86(); t6();
}

sub swrcrcle1 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t161(); t161(); t161(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub swrcrcle2 {
t5(); t9(); t9(); t9(); t9(); t9(); t161(); t161(); t83(); t85(); t161(); t161(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub swrcrcle3 {
t6(); t9(); t9(); t9(); t9(); t161(); t161(); t87(); t84(); t87(); t84(); t161(); t161(); t9(); t9(); t9(); t9(); t5();
}

sub swrcrcle4 {
t5(); t9(); t9(); t9(); t161(); t161(); t86(); t85(); t87(); t84(); t86(); t87(); t161(); t161(); t9(); t9(); t9(); t6();
}

sub swrcrcle5 {
t6(); t161(); t161(); t161(); t161(); t84(); t86(); t87(); t164(); t164(); t84(); t87(); t85(); t161(); t161(); t161(); t161(); t5();
}

sub swrcrcle6 {
t5(); t161(); t161(); t161(); t161(); t85(); t86(); t164(); t164(); t164(); t164(); t83(); t85(); t161(); t161(); t161(); t161(); t6();
}

sub swrcrcle7 {
t6(); t83(); t86(); t83(); t165(); t85(); t84(); t164(); t164(); t164(); t164(); t86(); t85(); t85(); t87(); t86(); t83(); t5();
}

sub swrcrcle8 {
t5(); t84(); t85(); t86(); t166(); t84(); t83(); t164(); t164(); t164(); t164(); t84(); t85(); t87(); t86(); t84(); t85(); t6();
}

sub swrcrcle10 {
t5(); t9(); t9(); t9(); t161(); t161(); t86(); t85(); t164(); t164(); t86(); t87(); t161(); t161(); t9(); t9(); t9(); t6();
}

sub swrcrcle11 {
t6(); t9(); t9(); t9(); t9(); t161(); t161(); t87(); t164(); t164(); t84(); t161(); t161(); t9(); t9(); t9(); t9(); t5();
}

sub swrcrcle12 {
t5(); t9(); t9(); t9(); t9(); t9(); t161(); t161(); t164(); t164(); t161(); t161(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub swrcrcle13 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t161(); t164(); t164(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub swrcrcle6b {
t5(); t161(); t161(); t161(); t161(); t85(); t86(); t87(); t164(); t164(); t84(); t83(); t85(); t161(); t161(); t161(); t161(); t6();
}

sub swrdkhallns1 {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t161(); t164(); t164(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub swrdkhallns2 {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t161(); t164(); t164(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub swrdkwall1 {
t6(); t9(); t9(); t161(); t161(); t161(); t161(); t161(); t164(); t164(); t161(); t161(); t161(); t161(); t161(); t9(); t9(); t5();
}

sub swrdkfloor1 {
t6(); t9(); t9(); t161(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t5();
}

sub swrdkfloor2 {
t5(); t9(); t9(); t161(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t6();
}

sub swrdkfloor3 {
t6(); t161(); t161(); t161(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t5();
}

sub swrdkfloor4 {
t5(); t161(); t161(); t161(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t6();
}

sub swrdkfloor5 {
t6(); t84(); t85(); t86(); t87(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t5();
}

sub swrdkfloor6 {
t5(); t87(); t86(); t84(); t85(); t86(); t87(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t6();
}

sub swrdkfloor7 {
t6(); t85(); t86(); t87(); t84(); t86(); t85(); t87(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t9(); t9(); t5();
}

sub dksewage1nse {
t6(); t9(); t9(); t9(); t9(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t85(); t87(); t83(); t87(); t84(); t5();
}

sub dksewage2nse {
t5(); t9(); t9(); t9(); t9(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t87(); t84(); t86(); t86(); t87(); t6();
}

sub dksewage3nse {
t6(); t9(); t9(); t9(); t9(); t160(); t86(); t83(); t85(); t87(); t86(); t83(); t84(); t85(); t87(); t83(); t84(); t5();
}

sub dksewage1nsew {
t6(); t9(); t9(); t9(); t9(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t160(); t161(); t160(); t161(); t5();
}

sub dksewage2nsew {
t5(); t9(); t9(); t9(); t9(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t160(); t161(); t160(); t161(); t160(); t6();
}

sub dksewage1nset {
t6(); t9(); t9(); t9(); t9(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage2nset {
t5(); t9(); t9(); t9(); t9(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t160(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage3nset {
t6(); t9(); t9(); t9(); t9(); t160(); t86(); t83(); t85(); t87(); t86(); t83(); t161(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage4nset {
t5(); t9(); t9(); t9(); t9(); t161(); t83(); t84(); t86(); t85(); t87(); t84(); t160(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage5nset {
t6(); t9(); t9(); t9(); t9(); t160(); t84(); t87(); t86(); t83(); t84(); t85(); t161(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage1nsetd {
t6(); t9(); t9(); t9(); t9(); t161(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t5();
}

sub dksewage2nsetd {
t5(); t9(); t9(); t9(); t9(); t160(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t164(); t6();
}

sub dksewage3nsetd {
t6(); t9(); t9(); t9(); t9(); t160(); t164(); t164(); t164(); t164(); t164(); t164(); t161(); t160(); t160(); t160(); t161(); t5();
}

sub dksewage4nsetd {
t5(); t9(); t9(); t9(); t9(); t161(); t160(); t161(); t164(); t164(); t160(); t161(); t160(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage5nsetd {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t160(); t173(); t173(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage7nsetd {
t6(); t9(); t9(); t9(); t9(); t9(); t161(); t160(); t173(); t173(); t161(); t160(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage1mhall {
t6(); t9(); t9(); t9(); t9(); t9(); t161(); t175(); t174(); t175(); t174(); t160(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage2mhall {
t5(); t9(); t9(); t9(); t9(); t9(); t160(); t174(); t175(); t174(); t175(); t161(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage1mhalld {
t6(); t9(); t9(); t9(); t9(); t9(); t161(); t175(); t174(); t175(); t174(); t178(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage2mhalld {
t5(); t9(); t9(); t9(); t9(); t9(); t160(); t174(); t175(); t174(); t175(); t179(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage2mhallp {
t5(); t9(); t9(); t9(); t9(); t9(); t176(); t174(); t175(); t174(); t175(); t161(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage1mhallw {
t6(); t9(); t9(); t9(); t9(); t9(); t161(); t160(); t161(); t160(); t161(); t160(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage2mhallw {
t5(); t9(); t9(); t9(); t9(); t9(); t160(); t161(); t175(); t174(); t160(); t161(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage1mhalld2 {
t6(); t9(); t9(); t9(); t9(); t9(); t183(); t175(); t174(); t175(); t174(); t160(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage2mhalld2 {
t5(); t9(); t9(); t9(); t9(); t9(); t182(); t174(); t175(); t174(); t175(); t161(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage1nesw {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9();  t9(); t9(); t9(); t161();  t160(); t87(); t84(); t83(); t5();
}

sub ltsewage5nsetd {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t15(); t33(); t33(); t16(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub ltsewage7nsetd {
t6(); t9(); t9(); t9(); t9(); t9(); t16(); t15(); t33(); t33(); t16(); t15(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub ltsewage1mhall {
t6(); t9(); t9(); t9(); t9(); t9(); t15(); t109(); t108(); t109(); t108(); t15(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub ltsewage2mhall {
t5(); t9(); t9(); t9(); t9(); t9(); t16(); t108(); t109(); t108(); t109(); t16(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub ltsewage1mhalld {
t6(); t9(); t9(); t9(); t9(); t9(); t15(); t109(); t108(); t109(); t108(); t180(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub ltsewage2mhalld {
t5(); t9(); t9(); t9(); t9(); t9(); t16(); t108(); t109(); t108(); t109(); t181(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub ltsewage2mhallp {
t5(); t9(); t9(); t9(); t9(); t9(); t177(); t108(); t109(); t108(); t109(); t16(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub ltsewage1mhallw {
t6(); t9(); t9(); t9(); t9(); t9(); t16(); t15(); t16(); t15(); t16(); t15(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub ltsewage2mhallw {
t5(); t9(); t9(); t9(); t9(); t9(); t15(); t16(); t109(); t108(); t15(); t16(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub ltsewage1mhalld2 {
t6(); t9(); t9(); t9(); t9(); t9(); t185(); t109(); t108(); t109(); t108(); t15(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub ltsewage2mhalld2 {
t5(); t9(); t9(); t9(); t9(); t9(); t184(); t108(); t109(); t108(); t109(); t16(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage2nesw {
t5(); t9(); t9(); t9(); t9();  t9(); t9(); t9(); t9(); t9(); t9(); t160(); t161(); t85(); t85(); t84(); t86(); t6();
}

sub dksewage3nesw {
t6(); t9(); t9(); t9(); t9(); t9(); t9();  t9(); t9(); t9(); t161(); t160(); t86(); t83(); t85(); t87(); t86(); t5();
}

sub dksewage4nesw {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t160(); t161(); t86(); t85(); t85(); t86(); t85(); t86(); t6();
}

sub dksewage5nesw {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t161(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t5();
}

sub dksewage6nesw {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t160(); t161(); t84(); t86(); t84(); t86(); t85(); t84(); t160(); t161(); t6();
}

sub dksewage7nesw {
t6(); t9(); t9(); t9(); t9(); t9(); t161(); t160(); t87(); t85(); t84(); t83(); t87(); t87(); t161(); t160(); t9(); t5();
}

sub dksewage8nesw {
t5(); t9(); t9(); t9(); t9(); t160(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t160(); t161(); t9(); t9(); t6();
}

sub dksewage9nesw {
t6(); t9(); t9(); t9(); t9(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t160(); t9(); t9(); t9(); t5();
}

sub dksewage9swneu {
t6(); t9(); t9(); t9(); t161(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t160(); t9(); t9(); t9(); t5();
}

sub dksewage9swne {
t6(); t9(); t9(); t9(); t161(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage8swne {
t5(); t9(); t9(); t160(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t160(); t161(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage7swne {
t6(); t9(); t161(); t160(); t86(); t83(); t85(); t87(); t86(); t83(); t161(); t160(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage6swne {
t5(); t160(); t161(); t83(); t87(); t84(); t85(); t85(); t87(); t160(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage5swne {
t6(); t160(); t85(); t84(); t87(); t83(); t86(); t87(); t161(); t160(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage4swne {
t5();  t85(); t85(); t84(); t86(); t85(); t86(); t160(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage3swne {
t6(); t83(); t85(); t87(); t86(); t83(); t161(); t160(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage2swne {
t5(); t84(); t86(); t85(); t86(); t160(); t161(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub dksewage1swne {
t6(); t84(); t87(); t86(); t161(); t160(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub dksewage7nee {
t6(); t9(); t9(); t9(); t9(); t9(); t161(); t160(); t87(); t85(); t84(); t83(); t87(); t87(); t84(); t85(); t83(); t5();
}

sub dksewage8nee {
t5(); t9(); t9(); t9(); t9(); t160(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t87(); t84(); t83(); t86(); t6();
}

sub dksewage9swene {
t6(); t9(); t9(); t9(); t161(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t85(); t84(); t83(); t84(); t85(); t5();
}

sub dksewage8swene {
t5(); t9(); t9(); t160(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t83(); t84(); t85(); t86(); t87(); t83(); t6();
}

sub dksewage7swene {
t6(); t9(); t161(); t160(); t86(); t83(); t85(); t87(); t86(); t83(); t87(); t84(); t85(); t86(); t83(); t85(); t87(); t5();
}

sub dksewage6swene {
t5(); t160(); t161(); t83(); t87(); t84(); t85(); t85(); t87(); t160(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t6();
}

sub dksewage5swene {
t6(); t160(); t85(); t84(); t87(); t83(); t86(); t87(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t160(); t161(); t5();
}

sub swrdkwallns1 {
t6(); t161(); t161(); t161(); t161(); t160(); t161(); t160(); t164(); t164(); t160(); t161(); t160(); t161(); t161(); t161(); t160(); t5();
}

sub swrdkwallns2 {
t5(); t161(); t161(); t161(); t160(); t161(); t160(); t161(); t164(); t164(); t160(); t160(); t161(); t161(); t161(); t160(); t161(); t6();
}

sub swrdkwallns3 {
t6(); t9(); t9(); t9(); t9(); t160(); t161(); t160(); t164(); t164(); t160(); t161(); t160(); t161(); t161(); t161(); t160(); t5();
}

sub swrdkwallns4 {
t5(); t9(); t9(); t9(); t9(); t161(); t160(); t161(); t164(); t164(); t160(); t160(); t161(); t161(); t161(); t160(); t161(); t6();
}

sub dksewage1ngt {
t6(); t9(); t9(); t9(); t9(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t85(); t87(); t83(); t87(); t165(); t5();
}

sub dksewage2ngt {
t5(); t9(); t9(); t9(); t9(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t87(); t84(); t85(); t86(); t166(); t6();
}

sub dksewage3ngt {
t6(); t9(); t9(); t9(); t9(); t160(); t86(); t83(); t85(); t87(); t86(); t83(); t84(); t83(); t86(); t83(); t165(); t5();
}

sub dksewage1nswall {
t6(); t160(); t161(); t160(); t161(); t160(); t87(); t84(); t83(); t84(); t87(); t86(); t161(); t160(); t161(); t160(); t161(); t5();
}

sub dksewage2nswall {
t5(); t161(); t160(); t161(); t160(); t161(); t85(); t85(); t84(); t86(); t85(); t86(); t160(); t161(); t160(); t161(); t160(); t6();
}

sub mainframefl0 {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframefl1 {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframefl2 {
t5(); t1(); t66(); t170(); t66(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframefl3 {
t6(); t1(); t70(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframefl4 {
t5(); t1(); t70(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0 {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t191(); t191(); t191(); t191(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1 {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t189(); t189(); t193(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2 {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t189(); t189(); t193(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3 {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t190(); t189(); t193(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframewall1 {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t58(); t1(); t1(); t57(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframewall2 {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframewall3 {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframewall4 {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t44(); t1(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0b {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t191(); t191(); t194(); t194(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1b {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t189(); t197(); t196(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe0bb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t191(); t194(); t194(); t194(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t197(); t197(); t196(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t189(); t197(); t196(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t194(); t194(); t194(); t194(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t197(); t197(); t198(); t196(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t197(); t197(); t196(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t190(); t197(); t196(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe0bbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t194(); t194(); t194(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t197(); t198(); t198(); t200(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t197(); t198(); t198(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t199(); t198(); t196(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t189(); t197(); t196(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t194(); t194(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t198(); t200(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t197(); t198(); t198(); t201(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t197(); t202(); t198(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t189(); t197(); t198(); t196(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t194(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t201(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t206(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t197(); t198(); t202(); t200(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t189(); t197(); t198(); t198(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t194(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t200(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t207(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t197(); t198(); t198(); t200(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t195(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t200(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t198(); t201(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t195(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t192(); t201(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t198(); t200(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t195(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t192(); t200(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t195(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t195(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe0bbbbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe1bbbbbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe2bbbbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub mainframe3bbbbbbbbbbbb {
t6(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t204(); t205(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub mainframe4bbbbbbbbbbbb {
t5(); t1(); t43(); t43(); t43(); t43(); t43(); t203(); t203(); t203(); t203(); t43(); t43(); t43(); t43(); t43(); t1(); t6();
}

sub conduit1dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t208(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit2dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t208(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit3dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t209(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit4dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t209(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit5dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t210(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit6dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t210(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit7dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t211(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit8dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t211(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit9dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t212(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit10dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t212(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit11dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t224(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit12dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218();  t224(); t32(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit13dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218();  t225(); t227(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit14dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218();  t225(); t227(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit15dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218();  t226(); t228(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit16dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9();  t218(); t226(); t228(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit17dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t32(); t224(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit18dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t32(); t224(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit19dk {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t32(); t208(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit20dk {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t32(); t208(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit21dk {
t6(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t264(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t5();
}

sub conduit22dk {
t5(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t32(); t208(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t6();
}

sub conduit23dk {
t6(); t262(); t262(); t262(); t262(); t262(); t262(); t218(); t32(); t208(); t219(); t262(); t262(); t262(); t262(); t262(); t262(); t5();
}

sub conduit24dk {
t5(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t269(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t6();
}

sub conduit25dk {
t6(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t267(); t5();
}

sub conduit26dk {
t5(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t6();
}

sub conduit27dk {
t6(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t265(); t5();
}

sub conduit28dk {
t5(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t266(); t6();
}

sub conduit29dk {
t6(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t262(); t5();
}

sub conduit30dk {
t5(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t263(); t6();
}

sub conduit1lt {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t213(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit2lt {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t213(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit3lt {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t214(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit4lt {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t214(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit5lt {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t215(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit6lt {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t215(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit7lt {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t216(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit8lt {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t216(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit9lt {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t217(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit10lt {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t217(); t4(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit19lt {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t4(); t213(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit20lt {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t4(); t213(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit19trans {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t4(); t213(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit20trans {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t4(); t213(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit9trans {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t217(); t4(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit10trans {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t217(); t4(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit9transw {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t217(); t223(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit10transw {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t217(); t223(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit21trans {
t6(); t265(); t265(); t265(); t265(); t265(); t265(); t270(); t270(); t276(); t270(); t265(); t265(); t265(); t265(); t265(); t265(); t5();
}

sub conduit22trans {
t5(); t263(); t263(); t263(); t263(); t263(); t263(); t275(); t4(); t213(); t275(); t263(); t263(); t263(); t263(); t263(); t263(); t6();
}

sub conduit23trans {
t6(); t262(); t262(); t262(); t262(); t262(); t262(); t218(); t4(); t213(); t219(); t262(); t262(); t262(); t262(); t262(); t262(); t5();
}

sub conduit24trans {
t5(); t266(); t266(); t266(); t266(); t266(); t266(); t271(); t271(); t277(); t271(); t266(); t266(); t266(); t266(); t266(); t266(); t6();
}

sub conduit25trans {
t6(); t267(); t267(); t267(); t267(); t267(); t267(); t272(); t272(); t272(); t272(); t267(); t267(); t267(); t267(); t267(); t267(); t5();
}

sub conduit26trans {
t5(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t273(); t273(); t261(); t261(); t261(); t261(); t261(); t261(); t261(); t6();
}

sub conduit9dkw {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t212(); t222(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit10dkw {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t218(); t212(); t222(); t219(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub conduit9ltw {
t6(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t217(); t223(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub conduit10ltw {
t5(); t9(); t9(); t9(); t9(); t9(); t9(); t220(); t217(); t223(); t221(); t9(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub computelab0a {
t5(); t1(); t70(); t192(); t237(); t237(); t193(); t235(); t234(); t234(); t236(); t192(); t237(); t237(); t193(); t43(); t1(); t6();
}

sub computelab1a {
t6(); t1(); t70(); t192(); t237(); t237(); t193(); t235(); t234(); t234(); t236(); t192(); t237(); t237(); t193(); t43(); t1(); t5();
}

sub computelab2a {
t5(); t1(); t70(); t192(); t237(); t237(); t193(); t43(); t43(); t43(); t43(); t192(); t237(); t237(); t193(); t43(); t1(); t6();
}

sub computelab3a {
t6(); t1(); t70(); t192(); t237(); t237(); t193(); t43(); t43(); t43(); t43(); t192(); t237(); t237(); t193(); t43(); t1(); t5();
}

sub computelab4a {
t5(); t1(); t70(); t43(); t191(); t191(); t43(); t43(); t43(); t43(); t43(); t43(); t191(); t191(); t43(); t43(); t1(); t6();
}

sub computelab5a {
t6(); t1(); t70(); t43(); t191(); t191(); t43(); t43(); t43(); t43(); t43(); t43(); t191(); t191(); t43(); t43(); t1(); t5();
}

sub computelab6a {
t5(); t1(); t70(); t192(); t44(); t44(); t193(); t43(); t43(); t43(); t43(); t192(); t44(); t44(); t193(); t43(); t1(); t6();
}

sub computelab7a {
t6(); t1(); t70(); t192(); t44(); t44(); t193(); t43(); t43(); t43(); t43(); t192(); t44(); t44(); t193(); t43(); t1(); t5();
}

sub computelab9a {
t6(); t1(); t70(); t192(); t237(); t238(); t193(); t43(); t43(); t43(); t43(); t192(); t237(); t237(); t193(); t43(); t1(); t5();
}

sub computelab11a {
t6(); t1(); t70(); t192(); t237(); t237(); t193(); t43(); t43(); t43(); t43(); t192(); t237(); t238(); t193(); t43(); t1(); t5();
}

sub computelab0ab {
t5(); t1(); t70(); t192(); t237(); t237(); t196(); t235(); t234(); t234(); t236(); t195(); t237(); t237(); t193(); t43(); t1(); t6();
}

sub computelab1ab {
t6(); t1(); t70(); t192(); t237(); t237(); t196(); t235(); t234(); t234(); t236(); t195(); t237(); t237(); t193(); t43(); t1(); t5();
}

sub computelab2abb {
t5(); t1(); t70(); t192(); t237(); t237(); t196(); t43(); t43(); t43(); t43(); t195(); t237(); t237(); t193(); t43(); t1(); t6();
}

sub computelab3abb {
t6(); t1(); t70(); t192(); t237(); t237(); t196(); t43(); t43(); t43(); t43(); t195(); t237(); t237(); t193(); t43(); t1(); t5();
}

sub computelab2abbb {
t5(); t1(); t70(); t192(); t237(); t237(); t193(); t43(); t43(); t43(); t43(); t195(); t237(); t237(); t193(); t43(); t1(); t6();
}

sub complonghall1 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t1(); t1(); t1(); t1(); t1(); t1(); t5();
}

sub complonghall2 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t1(); t1(); t1(); t1(); t1(); t1(); t6();
}

sub complonghall4 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t244(); t108(); t109(); t108(); t6();
}

sub complonghall5 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t239(); t109(); t108(); t109(); t5();
}

sub complonghall6 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t240(); t108(); t109(); t108(); t6();
}

sub complonghall7 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t243(); t108(); t109(); t5();
}

sub complonghall8 {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t241(); t109(); t108(); t6();
}

sub complonghall9 {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t242(); t108(); t109(); t5();
}

sub complonghall7b {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t250(); t108(); t109(); t5();
}

sub complonghall8b {
t5(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t248(); t109(); t108(); t6();
}

sub complonghall9b {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t249(); t108(); t109(); t5();
}

sub complonghall1e {
t6(); t9(); t9(); t9(); t9(); t9(); t1(); t1(); t43(); t43(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon1 {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t9(); t9(); t9(); t9(); t9();t5();
}

sub compreacmon1b {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t1(); t45(); t1(); t1(); t9(); t9(); t9(); t9(); t9();t5();
}

sub compreacmon1t {
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t245(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon1tb { #terminal gots a virus?
t6(); t1(); t1(); t1(); t1(); t1(); t1(); t45(); t1(); t1(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon4 {
t5(); t43(); t244(); t108(); t109(); t108(); t109(); t108(); t109(); t246(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon5 {
t6(); t43(); t239(); t109(); t108(); t109(); t108(); t109(); t108(); t247(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon6 {
t5(); t43(); t240(); t108(); t109(); t108(); t109(); t108(); t109(); t246(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon7 {
t6(); t43(); t43(); t243(); t108(); t109(); t108(); t109(); t108(); t247(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon8 {
t5(); t43(); t43(); t241(); t109(); t108(); t109(); t108(); t109(); t246(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon9 {
t6(); t43(); t43(); t242(); t108(); t109(); t108(); t109(); t108(); t247(); t238(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon7b {
t6(); t43(); t43(); t250(); t108(); t109(); t108(); t109(); t108(); t247(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon8b {
t5(); t43(); t43(); t248(); t109(); t108(); t109(); t108(); t109(); t246(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon9b {
t6(); t43(); t43(); t249(); t108(); t109(); t108(); t109(); t108(); t247(); t238(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon7bb {
t6(); t43(); t43(); t250(); t108(); t109(); t108(); t109(); t108(); t251(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon8bb {
t5(); t43(); t43(); t248(); t109(); t108(); t109(); t108(); t109(); t252(); t237(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon9bb {
t6(); t43(); t43(); t249(); t108(); t109(); t108(); t109(); t108(); t251(); t238(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon7bbb {
t6(); t43(); t43(); t250(); t108(); t109(); t108(); t109(); t108(); t251(); t258(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon8bbb {
t5(); t43(); t43(); t248(); t109(); t108(); t109(); t108(); t109(); t252(); t258(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon9bbb {
t6(); t43(); t43(); t249(); t108(); t109(); t108(); t109(); t108(); t251(); t257(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon7bbbb {
t6(); t43(); t43(); t250(); t108(); t109(); t108(); t109(); t108(); t109(); t198(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon8bbbb {
t5(); t43(); t43(); t248(); t109(); t108(); t109(); t108(); t109(); t108(); t198(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon9bbbb {
t6(); t43(); t43(); t249(); t108(); t109(); t108(); t109(); t108(); t109(); t202(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon7bbbbb {
t6(); t43(); t43(); t250(); t108(); t109(); t108(); t109(); t108(); t109(); t254(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compreacmon8bbbbb {
t5(); t43(); t43(); t248(); t109(); t108(); t109(); t108(); t109(); t108(); t253(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub compreacmon9bbbbb {
t6(); t43(); t43(); t249(); t108(); t109(); t108(); t109(); t108(); t109(); t260(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub compuhallw1 {
t6(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t44(); t1(); t54(); t54(); t1(); t1(); t1(); t5();
}

sub compuhallw2 {
t5(); t43(); t192(); t237(); t238(); t70(); t43(); t192(); t237(); t238(); t70(); t43(); t43(); t192(); t237(); t238(); t1(); t6();
}

sub compuhallw3{ 
t6(); t43(); t192(); t237(); t237(); t70(); t43(); t192(); t237(); t237(); t70(); t43(); t43(); t192(); t237(); t237(); t1(); t5();
}

sub compuhallw4 {
t5(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t43(); t66(); t66(); t44(); t6();
}

sub compuhallw5 {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t1(); t5();
}

sub compuhallw6 {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t75(); t6();
}

sub compuhallw7 {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t75(); t5();
}

sub compuhallw8 {
t5(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t66(); t66(); t1(); t6();
}

sub compuhallw9 { 
t6(); t43(); t192(); t237(); t237(); t70(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t192(); t237(); t237(); t1(); t5();
}

sub compuhallw10 {
t5(); t43(); t192(); t237(); t238(); t70(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t192(); t237(); t238(); t1(); t6();
}

sub compuhallw11 {
t6(); t1(); t1(); t1(); t1(); t44(); t1(); t43(); t43(); t43(); t43(); t1(); t1(); t44(); t1(); t1(); t1(); t5();
}

sub compuhallw13 {
t6(); t44(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t44(); t5();
}

sub compuhallw14 {
t5(); t70(); t43(); t192(); t237(); t238(); t70(); t43(); t192(); t237(); t238(); t70(); t43(); t192(); t237(); t238(); t70(); t6();
}

sub compuhallw15 {
t6(); t70(); t43(); t192(); t237(); t237(); t70(); t43(); t192(); t237(); t237(); t70(); t43(); t192(); t237(); t237(); t70(); t5();
}

sub compuhallw16 {
t5(); t66(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t66(); t66(); t66(); t6();
}

sub compuhallw17 {
t6(); t9(); t1(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t5();
}

sub compuhallw18 {
t5(); t9(); t1(); t43(); t192(); t237(); t238(); t70(); t43(); t192(); t237(); t238(); t70(); t43(); t192(); t237(); t238(); t6();
}

sub compuhallw19 {
t6(); t9(); t1(); t43(); t192(); t237(); t237(); t70(); t43(); t192(); t237(); t237(); t70(); t43(); t192(); t237(); t237(); t5();
}

sub compuhallw20 {
t5(); t9(); t1(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t66(); t66(); t66(); t43(); t43(); t66(); t66(); t6();
}

sub compuhallw21 {
t6(); t9(); t1(); t54(); t54(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t44(); t1(); t1(); t1(); t1(); t5();
}

sub compuhallw22 {
t5(); t9(); t1(); t43(); t43(); t43(); t43(); t235(); t234(); t234(); t236(); t43(); t43(); t43(); t43(); t43(); t43(); t6();
}

sub compuhallw23 {
t6(); t9(); t1(); t43(); t43(); t43(); t43(); t235(); t234(); t234(); t236(); t43(); t43(); t43(); t43(); t43(); t43(); t5();
}

sub compuhallw25 {
t6(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t43(); t5();
}

sub longhallstepup1 {
t6(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t43(); t5();
}

sub longhallstepup2 {
t5(); t103(); t103(); t103(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t99(); t43(); t43(); t43(); t43(); t6();
}

sub longhallstepup3 {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t278(); t278(); t278(); t278(); t278(); t43(); t95(); t95(); t95(); t95(); t5();
}

sub longhallstepup4 {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t278(); t278(); t278(); t278(); t278(); t43(); t95(); t95(); t95(); t95(); t6();
}

sub longhallstepup4bg {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t278(); t278(); t278(); t278(); t278(); t43(); t95(); t95(); t95(); t95(); t6();
}

sub longhallstepup3bg {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t278(); t278(); t32(); t282(); t278(); t43(); t95(); t95(); t95(); t95(); t5();
}

sub longhallstepup2bg {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t278(); t32(); t32(); t32(); t32(); t43(); t95(); t95(); t95(); t95(); t6();
}

sub longhallstepup1bg {
t6(); t43(); t43(); t43(); t43(); t43(); t43(); t279(); t32(); t32(); t32(); t283(); t43(); t95(); t95(); t95(); t95(); t5();
}

sub longhallstepup0bg {
t5(); t43(); t43(); t43(); t43(); t43(); t43(); t278(); t280(); t32(); t281(); t278(); t43(); t95(); t95(); t95(); t95(); t6();
}

sub longhall1wide {
t6(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2wide {
t5(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
} 
		
sub longhall4uzv1 {
t5(); t9(); t9(); t9(); t9(); t1(); t43(); t62(); t61(); t60(); t78(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}
 
sub longhall3uzv1 {
t6(); t9(); t9(); t9(); t9(); t1(); t43(); t60(); t284(); t285(); t62(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2uzv1 {
t5(); t9(); t9(); t9(); t9(); t1(); t78(); t284(); t285(); t284(); t286(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}
 
sub longhall1uzv1 {
t6(); t9(); t9(); t9(); t9(); t1(); t284(); t286(); t286(); t285(); t284(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall0uzv1 {
t5(); t9(); t9(); t9(); t9(); t1(); t61(); t284(); t285(); t284(); t60(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
}

sub longhall1wideD {
t6(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t268 (); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2wideD {
t5(); t9(); t9(); t9(); t9(); t1(); t43(); t43(); t43(); t43(); t43(); t268 (); t9(); t9(); t9(); t9(); t9(); t6();
}

sub longhall1wideEDle {
t6(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t54(); t54(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t5();
}

sub longhall2wideEDle {
t5(); t9(); t9(); t9(); t9(); t1(); t1(); t1(); t54(); t54(); t1(); t1(); t9(); t9(); t9(); t9(); t9(); t6();
} 

sub temproom_nsl_sewer1 {
sewrwall2(); print"\n";
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; 
sewrwall2(); print"\n";
}

sub temproom_nsl_sewer2 {
sewrwall2(); print"\n";
sewrwall1(); print"\n"; sewrwall2b(); print"\n"; sewrwall1(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2b(); print"\n"; sewrwall1(); print"\n"; sewrwall2b(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2b(); print"\n"; sewrwall1(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1b(); print"\n"; sewrwall2(); print"\n"; sewrwall1b(); print"\n"; 
sewrwall2b(); print"\n";
}

sub temproom_nsl_sewer3 {
sewrwall2b(); print"\n";
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1b(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1b(); print"\n"; sewrwall2(); print"\n"; sewrwall1b(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; sewrwall2b(); print"\n"; 
sewrwall1b(); print"\n"; sewrwall2b(); print"\n"; sewrwall1(); print"\n"; 
sewrwall2(); print"\n";
}

sub temproom_wsl_sewer1 {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; lsewrwall3(); print"\n"; 
lsewrwall4(); print"\n"; lsewage1(); print"\n"; lsewage2(); print"\n"; lsewage3(); print"\n"; 
lsewage2(); print"\n"; lsewage3(); print"\n"; lsewrwall2(); print"\n"; lsewrwall1(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2b(); print"\n"; sewrwall1b(); print"\n"; 
sewrwall2(); print"\n";
}

sub temproom_wel_sewer1 {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; tdlmetalwall1(); print"\n"; 
tdlmetalwall2(); print"\n"; tdlsewage1(); print"\n"; tdlsewage2b(); print"\n"; tdlsewage3(); print"\n"; 
tdlsewage2(); print"\n"; tdlsewage1b(); print"\n"; tdlmetalwall2(); print"\n"; tdlmetalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}

sub temproom_wel_sewer2 {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; dkmetalwall1(); print"\n"; 
dkmetalwall2(); print"\n"; dksewage1(); print"\n"; dksewage2(); print"\n"; dksewage3(); print"\n"; 
dksewage2(); print"\n"; dksewage1(); print"\n"; dkmetalwall2(); print"\n"; dkmetalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}

sub temproom_wel_sewer3 {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; dkmetalwall1(); print"\n"; 
dkmetalwall2(); print"\n"; dksewage3(); print"\n"; dksewage2(); print"\n"; dksewage1(); print"\n"; 
dksewage2(); print"\n"; dksewage3(); print"\n"; dkmetalwall2(); print"\n"; dkmetalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}

sub temproom_wel_sewer4 {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; dkmetalwall1(); print"\n"; 
dkmetalwall2(); print"\n"; dksewage3(); print"\n"; dksewage2(); print"\n"; dksewage3(); print"\n"; 
dksewage2(); print"\n"; dksewage1(); print"\n"; dkmetalwall2(); print"\n"; dkmetalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}

sub temproom_nse_sewer1 {
dksewage1nset(); print"\n";
dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nsew(); print"\n"; 
dksewage2nsew(); print"\n"; dksewage1nse(); print"\n"; dksewage2nse(); print"\n"; dksewage3nse(); print"\n"; 
dksewage2nse(); print"\n"; dksewage3nse(); print"\n"; dksewage2nsew(); print"\n"; dksewage1nsew(); print"\n"; 
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; 
dksewage1nset(); print"\n";
}

sub temproom_ns_sewer1 {
dksewage1nset(); print"\n";
dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; 
dksewage3nset(); print"\n";
}

sub temproom_ns_sewer2 {
dksewage3nset(); print"\n";
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; 
dksewage3nset(); print"\n";
}

sub temproom_nes_sewer1 {
dksewage1nesw(); print"\n";
dksewage2nesw(); print"\n"; dksewage3nesw(); print"\n"; dksewage4nesw(); print"\n"; dksewage5nesw(); print"\n"; 
dksewage6nesw(); print"\n"; dksewage7nesw(); print"\n"; dksewage8nesw(); print"\n"; dksewage9nesw(); print"\n"; 
dksewage2nset(); print"\n"; dksewage3nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; 
dksewage2nset(); print"\n"; dksewage1nset(); print"\n"; dksewage2nset(); print"\n"; 
dksewage3nset(); print"\n";
}

sub temproom_swne_sewer1 {
dksewage1nesw(); print"\n";
dksewage2nesw(); print"\n"; dksewage3nesw(); print"\n"; dksewage4nesw(); print"\n"; dksewage5nesw(); print"\n"; 
dksewage6nesw(); print"\n"; dksewage7nesw(); print"\n"; dksewage8nesw(); print"\n"; dksewage9swneu(); print"\n"; 
dksewage8swne(); print"\n"; dksewage7swne(); print"\n"; dksewage6swne (); print"\n"; dksewage5swne(); print"\n"; 
dksewage4swne(); print"\n"; dksewage3swne(); print"\n"; dksewage2swne(); print"\n"; 
dksewage1swne(); print"\n";
}

sub temproom_swene_sewer1 {
dksewage1nesw(); print"\n";
dksewage2nesw(); print"\n"; dksewage3nesw(); print"\n"; dksewage4nesw(); print"\n"; dksewage5nesw(); print"\n"; 
dksewage6nesw(); print"\n"; dksewage7nee(); print"\n"; dksewage8nee(); print"\n"; dksewage9swene(); print"\n"; 
dksewage8swene(); print"\n"; dksewage7swene(); print"\n"; dksewage6swene (); print"\n"; dksewage5swene(); print"\n"; 
dksewage4swne(); print"\n"; dksewage3swne(); print"\n"; dksewage2swne(); print"\n"; 
dksewage1swne(); print"\n";
}

#ROOM YUG1
sub room_yug1 {
$roomauthor = "$name_mikeeusa";
$room = yug1;

if ($room2startin == 1) {
	if ($rsaroom_yug1 == 1) {
		$info = "     You enter into a cell... Your cell?        ";
		$info2 = "    There is a concrete bed to the east         ";
	} elsif ($rsaroom_yug1 == 2) {
		$info = "         To the southwest is a latrine          ";
		$info2 = "       The door to the north is locked          ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
} else {
	if ($rsaroom_yug1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
		$thuggbeing1_yug1 = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
}

#blow shite up!!!
if ($bombdetonate == 1) {
	$info = "  You detonate a bomb, it shatters some tiles   ";
	$info2 = "              and you are injured               ";
	$health = $health - 50;
	$bombdetonate = 0;
	$bombamount = $bombamount - 1;
} else {
}

if ($zug1ltrig == 0) {
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";
} else {
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 1;
$read = " ";
}

nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n";
bcelldoor2(); print"\n"; bcellwall1d(); print"\n"; bcellroom2b(); print"\n"; bcellroom1b(); print"\n"; 
bcellroom2b2(); print"\n"; bcellroom1l(); print"\n"; bcellroom2l(); print"\n"; bcellroom1p(); print"\n"; 
bcellroom2p(); print"\n"; bcellroom1p2(); print"\n"; bcellwall2(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n";

if ($room2startin == 1) {
	#bla
} else {
	#he's gunnah FUCK j00 up!... then rape you
	$thuggbeing1_yug1 = $thuggbeing1_yug1 + 1;
	if ($thuggbeing1_yug1 == 1) {			
		$info = "Prisoner: YO! Why the FUCK joo in mah cell!!    ";
		$info2 = "The prisoner brandishes a skive and attacks you ";
		$voiceFXbuff = 'YO   Why the FUCK joo in mah cell';
		voiceFX_play_manA();
		thuggbeing1_define();
		thuggbeing1_exe();	
	} elsif ($thuggbeing1_yug1 >= 2) {
		thuggbeing1_exe();
		$thugg1readcomment = int(rand(2));
		if ($health <= 15) {
			$thugg1readcomment = int(rand(4));
			if ($thugg1readcomment == 3) {
			} else {
				thuggbeing1_comments();
			}		
		} else {
			if ($thugg1readcomment == 1) {
				thuggbeing1_comments();
			} else {
			}
		}
	} else {
	}
}
 
$rsaroom_yug1 = $rsaroom_yug1 + 1;
}
#ROOM YUG1 END



#ROOM A2
sub room_ua2 {
$roomauthor = "$name_mikeeusa";
$room = ua2;
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";

	if ($rsaroom_ua2 == 1) {
		$info = "  As you enter the new room you hear a menacing ";
		$info2 = " 'wirring' sound comming from the far NE corner ";	
	} elsif ($rsaroom_ua2 == 2) {
		$info = "     The room is very dark. Nevertheless you    ";
		$info2 = "         journey to the center of it...         ";
	} elsif ($rsaroom_ua2 == 3) {
		$info = "      You hear a mysterious creaking sound...   ";
		$info2 = "       You are standing on a rusted grate!!!    ";
		$room = la2;
		$n = 0;
		$s = 0;
		$e = 0;
		$w = 0;
		$ne = 0;
		$nw = 0;
		$se = 0;
		$sw = 0;
		$up = 0;
		$down = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}

	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it is very loud but you  ";
		$info2 = "               escape its blast                 ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
	if ($rsaroom_ua2 >= 3) {
	wallunoa1(); print"\n";
	floorunoa9(); print"\n"; floorunoa8(); print"\n"; floorunoa7(); print"\n"; floorunoa5(); print"\n"; 
	floorunoa6(); print"\n"; floorunoa12(); print"\n"; floorunoa13(); print"\n"; floorunoa14(); print"\n"; 
	floorunoa15(); print"\n"; floorunoa12(); print"\n"; floorunoa13(); print"\n"; floorunoa5(); print"\n"; 
	floorunoa6(); print"\n"; floorunoa5(); print"\n"; floorunoa6(); print"\n"; 
	wallunoa2(); print"\n";
	} else {
	wallunoa1(); print"\n";
	floorunoa9(); print"\n"; floorunoa8(); print"\n"; floorunoa7(); print"\n"; floorunoa5(); print"\n"; 
	floorunoa6(); print"\n"; floorunoa5(); print"\n"; floorunoa6(); print"\n"; floorunoa10(); print"\n"; 
	floorunoa11(); print"\n"; floorunoa5(); print"\n"; floorunoa6(); print"\n"; floorunoa5(); print"\n"; 
	floorunoa6(); print"\n"; floorunoa5(); print"\n"; floorunoa6(); print"\n"; 
	wallunoa2(); print"\n";
	}

 
$rsaroom_ua2 = $rsaroom_ua2 + 1;
}

#ROOM A2 END

#ROOM LA2
sub room_la2 {
$roomauthor = "$name_mikeeusa";
$room = la2;

if ($la2findgrate == 1) {
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
} else {
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
}

	if ($rsaroom_la2 == 1) {
		$info = " The grate gave way and you came crashing down  ";
		$info2 = "     into this water filled circular room...    ";
		$floodla2 = 1;
		$health = $health - 35;
		$read = " ";
		$purgedla2 = 0;
		$bodyhealth_legL = $bodyhealth_legL - 60;
	} elsif ($rsaroom_la2 == 2) {
		$info = "   You seem to have been injured by the fall    ";
		$info2 = "  You have a nasty cut and your leg is broken   ";
		$floodla2 = 1;
	} elsif ($rsaroom_la2 == 3) {
		$info = " The water around you starts to fill with blood ";
		$info2 = "                                                ";
		$floodla2 = 1;
	} elsif ($rsaroom_la2 == 5) {
		$info = " You notice an inscription on the northern wall ";
		$info2 = "       you decide to take a closer look...      ";
	} elsif ($rsaroom_la2 == 6) {
		if ($cappedstaff == 1) {
		$info = "   By using your capped staff as a crutch you   ";
		$info2 = "   manage to get close to the northern wall     ";
		$read = '[Inscription] NOTICE: to initinalize purge'."\n                      say $purgenamela2";
		$roominforeadla2 = $read;
		$la2movetrig = 1;
		} else {
		$info = "     You try but fail to get closer to the      ";
		$info2 = "    inscription because of your leg injury      ";		
		}
	} elsif ($purgedla2 == 1) {
		$info = "  The water drains away around you, along with  ";
		$info2 = "            some of your blood                  ";
		$purgedla2 = 0;
		$drainedla2 = 1;
	} elsif ($rsaroom_la2 == 7) {
		if ($cappedstaff == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
		} else {
		$info = "            Hrrm... You're in a bind            ";
		$info2 = "                                                ";
		}
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, the room echos with the  ";
		$info2 = "   sound of its explosion... You are injured    ";
		$health = $health - 15; 
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
	
$read = $roominforeadla2;
	if ($floodla2 == 1) {
		if ($rsaroom_la2 >= 3) {
		wallunoa3(); print"\n";
			if ($la2movetrig == 1) {
			wallunoa4bld(); print"\n"; wallunoa5bld(); print"\n"; wallunoa6bld(); print"\n"; wallunoa7bld(); print"\n"; 
			wallunoa6bld(); print"\n"; wallunoa7bld(); print"\n";	
			} else {
			wallunoa4(); print"\n"; wallunoa5(); print"\n"; wallunoa6(); print"\n"; wallunoa7(); print"\n"; 
			wallunoa6(); print"\n"; wallunoa7(); print"\n";
			}
		wallunoa8(); print"\n"; wallunoa9(); print"\n"; 
		wallunoa8(); print"\n"; wallunoa9(); print"\n"; wallunoa6(); print"\n"; wallunoa7(); print"\n"; 
		wallunoa6(); print"\n"; wallunoa5(); print"\n"; wallunoa4(); print"\n"; 
		wallunoa3(); print"\n";
		} else {
		#wallunoa3-7
		wallunoa3(); print"\n";
		wallunoa4(); print"\n"; wallunoa5(); print"\n"; wallunoa6(); print"\n"; wallunoa7(); print"\n"; 
		wallunoa6(); print"\n"; wallunoa7(); print"\n"; wallunoa6(); print"\n"; wallunoa7(); print"\n"; 
		wallunoa6(); print"\n"; wallunoa7(); print"\n"; wallunoa6(); print"\n"; wallunoa7(); print"\n"; 
		wallunoa6(); print"\n"; wallunoa5(); print"\n"; wallunoa4(); print"\n"; 
		wallunoa3(); print"\n";
		}
	} else {
	wallunoa3(); print"\n";
	wallunoa4b(); print"\n"; wallunoa5b(); print"\n"; wallunoa6b(); print"\n"; wallunoa7b(); print"\n"; 
	wallunoa6b(); print"\n"; wallunoa7b(); print"\n"; wallunoa8b(); print"\n"; wallunoa9b(); print"\n"; 
	wallunoa8b(); print"\n"; wallunoa7b(); print"\n"; wallunoa6b(); print"\n"; wallunoa7b(); print"\n"; 
	wallunoa6b(); print"\n"; wallunoa5b(); print"\n"; wallunoa4b(); print"\n"; 
	wallunoa3(); print"\n";
	}
 
$rsaroom_la2 = $rsaroom_la2 + 1;
}

#ROOM LA2 END



#ROOM SA2 (SEWER/BIELGE)
sub room_sa2 {
$roomauthor = "$name_mikeeusa";
$room = sa2;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sa2 == 1) {
		$info = " You drop down the grate on the west side of the";
		$info2 = "   circular room into a sewer system.. yeucch!  ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; metalwall1(); print"\n"; 
metalwall2(); print"\n"; sewage1(); print"\n"; sewage2(); print"\n"; sewage3(); print"\n"; 
sewage2(); print"\n"; sewage1(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 1) {
		bsnake1ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
 	
$rsaroom_sa2 = $rsaroom_sa2 + 1;
}
#ROOM SA2 END

#ROOM SA1 (SEWER/BIELGE)
sub room_sa1 {
$roomauthor = "$name_mikeeusa";
$room = sa1;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sa1 == 1) {
		$info = "  You travel westwards down the sewer pipe and  ";
		$info2 = "      find yourself in more raw sewage...       ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; metalwall1(); print"\n"; 
metalwall2(); print"\n"; sewage1(); print"\n"; sewage2(); print"\n"; sewage1(); print"\n"; 
sewage2(); print"\n"; sewage3(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 	

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 0) {
		bsnake1ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}

$rsaroom_sa1 = $rsaroom_sa1 + 1;
}
#ROOM SA1 END



#ROOM SA0 (SEWER/BIELGE)
sub room_sa0 {
$roomauthor = "$name_mikeeusa";
$room = sa0;

	if ($rsaroom_sa0 == 1) {
		$info = " You come to a dry platform in the sewage system";
		$info2 = "                                                ";
		$read = " ";
		$ratbeing1_sa0 = 1;
		$ratbeinginroom_1 = 0;	
	} elsif ($rsaroom_sa0 == 4) {
		$info = "You notice a map on the far wall of the platform";
		$info2 = "       It is a map of this sewage sector!       ";		
		$read = "sa0map";
		$roominforeadsa0 = $read;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($sa0grateblown == 1) {
		if ($bombdetonate == 1) {
			$info = "  You detonate a bomb, it goes off underwater   ";
			$info2 = "                                                ";
			$bombdetonate = 0;	
			$bombamount = $bombamount - 1;
		} else {
		}
	} else {
		if ($bombdetonate == 1) {
			$info = " You detonate a bomb, it explodes near the grate";
			$info2 = "              and destroys it                   ";
			$sa0grateblown = 1;
			$bombdetonate = 0;	
			$bombamount = $bombamount - 1;
		} else {
		}
	}
	
if ($sa0grateblown == 1) {
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
} else {
$n = 1;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
}	
		
$read = $roominforeadsa0;

if ($sa0grateblown == 1) {
nothing1wall(); print"\n";
metalwall4(); print"\n"; platwall2(); print"\n"; 
if ($ratbeinginroom_1 == 1) { platwall3(); } else { platwall1(); } print"\n"; platwall2(); print"\n"; 
platwall1(); print"\n"; sewage1(); print"\n"; sewage2(); print"\n"; sewage3(); print"\n"; 
sewage2(); print"\n"; sewage1(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 
} else {
nothing1wall(); print"\n";
metalwall4(); print"\n"; platwall2(); print"\n"; 
if ($ratbeinginroom_1 == 1) { platwall3(); } else { platwall1(); } print"\n"; platwall2(); print"\n"; 
platwall1(); print"\n"; sewage1b(); print"\n"; sewage2b(); print"\n"; sewage3b(); print"\n"; 
sewage2b(); print"\n"; sewage1b(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 	
}
$ratbeing1_sa0 = $ratbeing1_sa0 + 1;

	if ($ratbeing1_sa0 == 7) {			
		$info = "              You see something...              ";
		$info2 = "                IT ATTACKS!                     ";
		ratbeing1_define();
		ratbeing1_exe();	
	} elsif ($ratbeing1_sa0 == 8) {			
		$info = "     A rat enters into your field of vision     ";
		$info2 = "       The rat continues it's attackage...      ";
		ratbeing1_exe();
	} elsif ($ratbeing1_sa0 >= 9) {
		ratbeing1_exe();
	} else {
	}

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 4) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 2) {
		bsnake2ataxor();			
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
	
$rsaroom_sa0 = $rsaroom_sa0 + 1;
}

#ROOM SA0 END


#ROOM SAM1 (SEWER/BIELGE)
sub room_sam1 {
$roomauthor = "$name_mikeeusa";
$room = sam1;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($bombdetonate == 1) {
		if ($spellbookragepresent == 1) {
			if ($rsaroom_sam1 == 2) {
			$bombsam1trig = 1;
			} else {
			}
		} else {
		}					
	} else {
	}

	if ($rsaroom_sam1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} elsif ($rsaroom_sam1 == 2) {
		if ($bombsam1trig == 1) {
		$info = "                                                ";
		$info2 = "                                                ";		
		} else {
			if ($spellbookragepresent == 1) {
			$info = "You notice a book bobing like a duck in the muck";
			$info2 = "              and pick it up...                 ";
			$spellbookrage = 1;
			} else {
			$info = "                                                ";
			$info2 = "                                                ";		
			}
		}
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		if ($spellbookragepresent == 1) {
			if ($rsaroom_sam1 == 2) {
			$info2 = "     Something crumbles beneath the sewage      ";
			} else {
			}
		} else {
		}			
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; metalwall1(); print"\n"; 
metalwall2(); print"\n"; sewage3(); print"\n"; sewage2(); print"\n"; sewage1(); print"\n"; 
sewage2(); print"\n"; sewage1(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";

if ($rsaroom_sam1 >= 3) {
	if ($snakeroomrand == 1) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 2) {
		bsnake2ataxor();			
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}

$rsaroom_sam1 = $rsaroom_sam1 + 1;
}
#ROOM SAM1 END

#ROOM SAM2 (SEWER/BIELGE)
sub room_sam2 {
$roomauthor = "$name_mikeeusa";
$room = sam2;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sam2 == 1) {
		$info = "  And sorry you are that you cannot travel both ";
		$info2 = "            and be one traveler...              ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb. After detonation the bomb ";
		$info2 = "  proceeds to explode in a violent outburst...  ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
sewrwall2(); print"\n";
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; sewrwall1WEx(); print"\n"; 
sewrwall2WEx(); print"\n"; sewrwall3Ex(); print"\n"; sewrwall2Ex(); print"\n"; sewrwall3Ex(); print"\n"; 
sewrwall2Ex(); print"\n"; sewrwall1Ex(); print"\n"; sewrwall2WEx(); print"\n"; sewrwall1WEx(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; 
sewrwall2(); print"\n";

if ($rsaroom_sam2 >= 2) {
	if ($snakeroomrand == 2) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 4) {
		bsnake2ataxor();			
	} else {	
	$snakeroomrand = int(rand(5));
	}
} else {
}
	
$rsaroom_sam2 = $rsaroom_sam2 + 1;
}
#ROOM SAM2 END

#ROOM SZZM2 (SEWER/BIELGE)
sub room_szzm2 {
$roomauthor = "$name_mikeeusa";
$room = szzm2;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szzm2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_nsl_sewer3();

	if ($snakeroomrand == 4) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 2) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}

	
$rsaroom_szzm2 = $rsaroom_szzm2 + 1;
}
#ROOM SZZM2 END

#ROOM SZYM2 (SEWER/BIELGE)
sub room_szym2 {
$roomauthor = "$name_mikeeusa";
$room = szym2;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szym2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it explodes underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_nsl_sewer2();

	if ($snakeroomrand == 3) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 1) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}

	
$rsaroom_szym2 = $rsaroom_szym2 + 1;
}
#ROOM SZYM2 END

#ROOM SZXM2 (SEWER/BIELGE)
sub room_szxm2 {
$roomauthor = "$name_mikeeusa";
$room = szxm2;
$n = 0;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "       You detonate a bomb ... BOOM ...         ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wsl_sewer1();

	if ($snakeroomrand == 2) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 3) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}

	
$rsaroom_szxm2 = $rsaroom_szxm2 + 1;
}
#ROOM SZXM2 END

#ROOM SZXM3 (SEWER/BIELGE)
sub room_szxm3 {
$roomauthor = "$name_mikeeusa";
$room = szxm3;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm3 == 1) {
		$info = "    The amount of light penetrating westwards   ";
		$info2 = "             decreases greatly...               ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "       You detonate a bomb ... BOOM ...         ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer1();

if ($rsaroom_szxm3 > 1) {
	if ($snakeroomrand == 0) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 4) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
	
$rsaroom_szxm3 = $rsaroom_szxm3 + 1;
}
#ROOM SZXM3 END

#ROOM SZXM4 (SEWER/BIELGE)
sub room_szxm4 {
$roomauthor = "$name_mikeeusa";
$room = szxm4;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm4 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer2();

	if ($snakeroomrand == 1) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 2) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}

	
$rsaroom_szxm4 = $rsaroom_szxm4 + 1;
}
#ROOM SZXM4 END

#ROOM SZXM5 (SEWER/BIELGE)
sub room_szxm5 {
$roomauthor = "$name_mikeeusa";
$room = szxm5;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm5 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer3();

	if ($snakeroomrand == 3) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 1) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}

	
$rsaroom_szxm5 = $rsaroom_szxm5 + 1;
}
#ROOM SZXM5 END

#ROOM SZXM6 (SEWER/BIELGE)
sub room_szxm6 {
$roomauthor = "$name_mikeeusa";
$room = szxm6;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm6 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer4();

	if ($snakeroomrand == 1) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 2) {
		bsnake2ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}

	
$rsaroom_szxm6 = $rsaroom_szxm6 + 1;
}
#ROOM SZXM6 END

#ROOM SZXM7 (SEWER/BIELGE)
sub room_szxm7 {
$roomauthor = "$name_mikeeusa";
$room = szxm7;
$n = 0;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm7 == 1) {
		$info = "    There is a dry platform here and a grate    ";
		$info2 = "                to the west                     ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
swrcrcle1(); print"\n";
swrcrcle2(); print"\n"; swrcrcle3(); print"\n"; swrcrcle4(); print"\n"; swrcrcle5(); print"\n";
swrcrcle6(); print"\n"; swrcrcle7(); print"\n"; swrcrcle8(); print"\n";
swrcrcle7(); print"\n"; swrcrcle8(); print"\n"; swrcrcle7(); print"\n"; swrcrcle6b(); print"\n"; 
swrcrcle5(); print"\n";  swrcrcle10(); print"\n"; swrcrcle11(); print"\n"; swrcrcle12(); print"\n"; 
swrcrcle13(); print"\n";
	
$rsaroom_szxm7 = $rsaroom_szxm7 + 1;
}
#ROOM SZXM7 END

#ROOM SZYM7 (SEWER/BIELGE)
sub room_szym7 {
$roomauthor = "$name_mikeeusa";
$room = szym7;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szym7 == 1) {
		$info = "          This hall is very narrow              ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$health = $health - 50;
	} else {
	}
	
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n";
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n";
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
	
$rsaroom_szym7 = $rsaroom_szym7 + 1;
}
#ROOM SZYM7 END

#ROOM SZZM7 (SEWER/BIELGE)
sub room_szzm7 {
$roomauthor = "$name_mikeeusa";
$room = szzm7;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szzm7 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$health = $health - 50;
	} else {
	}
	
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n";
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n";
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
	
$rsaroom_szzm7 = $rsaroom_szzm7 + 1;
}
#ROOM SZZM7 END

#ROOM SAM7 (SEWER/BIELGE)
sub room_sam7 {
$roomauthor = "$name_mikeeusa";
$room = sam7;
$n = 1;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sam7 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
		$sagebeing1_sam7 = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
$sagebeing1_sam7 = $sagebeing1_sam7 + 1;

	if ($sagebeing1_sam7 == 2) {			
		$info = "       A sage is woken up by the commotion      ";
		$info2 = "               of your presence                 ";
		sagebeing1_define();
		sagebeing1_exe();	
	} elsif ($sagebeing1_sam7 > 2) {			
		sagebeing1_exe();
		sagebeing1_comments();
	} else {
	}
	
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkwall1(); print"\n";
swrdkfloor2(); print"\n"; swrdkfloor3(); print"\n"; swrdkfloor4(); print"\n";
swrdkfloor5(); print"\n"; swrdkfloor6(); print"\n"; swrdkfloor7(); print"\n";
swrdkfloor6(); print"\n"; swrdkfloor5(); print"\n"; swrdkfloor4(); print"\n";
swrdkfloor3(); print"\n"; swrdkfloor2(); print"\n"; swrdkwall1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
	
$rsaroom_sam7 = $rsaroom_sam7 + 1;
}
#ROOM SAM7 END

#ROOM SBM7 (SEWER/BIELGE)
sub room_sbm7 {
$roomauthor = "$name_mikeeusa";
$room = sbm7;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sbm7 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$health = $health - 50;
	} else {
	}
	
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n";
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n";
swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n";
	
$rsaroom_sbm7 = $rsaroom_sbm7 + 1;
}
#ROOM SBM7 END

#ROOM SAM8 (SEWER/BIELGE)
sub room_sam8 {
$roomauthor = "$name_mikeeusa";
$room = sam8;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sam8 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer4();
	
$rsaroom_sam8 = $rsaroom_sam8 + 1;
}
#ROOM SAM8 END

#ROOM SAM9 (SEWER/BIELGE)
sub room_sam9 {
$roomauthor = "$name_mikeeusa";
$room = sam9;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sam9 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer2();
	
$rsaroom_sam9 = $rsaroom_sam9 + 1;
}
#ROOM SAM9 END

#ROOM SAM10 (SEWER/BIELGE)
sub room_sam10 {
$room = sam10;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sam10 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer3();
	
$rsaroom_sam10 = $rsaroom_sam10 + 1;
}
#ROOM SAM10 END

#ROOM SAM11 (SEWER/BIELGE)
sub room_sam11 {
$roomauthor = "$name_mikeeusa";
$room = sam11;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sam11 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_nse_sewer1();
	
$rsaroom_sam11 = $rsaroom_sam11 + 1;
}
#ROOM SAM11 END

#ROOM SBM11 (SEWER/BIELGE)
sub room_sbm11 {
$roomauthor = "$name_mikeeusa";
$room = sbm11;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sbm11 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_ns_sewer1();
	
$rsaroom_sbm11 = $rsaroom_sbm11 + 1;
}
#ROOM SBM11 END

#ROOM SZZM11 (SEWER/BIELGE)
sub room_szzm11 {
$roomauthor = "$name_mikeeusa";
$room = szzm11;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szzm11 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_ns_sewer2();
	
$rsaroom_szzm11 = $rsaroom_szzm11 + 1;
}
#ROOM SZZM11 END

#ROOM SZYM11 (SEWER/BIELGE)
sub room_szym11 {
$roomauthor = "$name_mikeeusa";
$room = szym11;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 1;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szym11 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_nes_sewer1();
	
$rsaroom_szym11 = $rsaroom_szym11 + 1;
}
#ROOM SZYM11 END

#ROOM SZXM10 (SEWER/BIELGE)
sub room_szxm10 {
$roomauthor = "$name_mikeeusa";
$room = szxm10;
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 1;
$nw = 0;
$se = 0;
$sw = 1;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm10 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_swne_sewer1();
	
$rsaroom_szxm10 = $rsaroom_szxm10 + 1;
}
#ROOM SZXM10 END

#ROOM SZWM9 (SEWER/BIELGE)
sub room_szwm9 {
$roomauthor = "$name_mikeeusa";
$room = szwm9;
$n = 0;
$s = 0;
$e = 1;
$w = 0;
$ne = 1;
$nw = 0;
$se = 0;
$sw = 1;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szwm9 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_swene_sewer1();
	
$rsaroom_szwm9 = $rsaroom_szwm9 + 1;
}
#ROOM SZWM9 END

#ROOM SZVM8 (SEWER/BIELGE)
sub room_szvm8 {
$roomauthor = "$name_mikeeusa";
$room = szvm8;
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 1;
$nw = 0;
$se = 0;
$sw = 1;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szvm8 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_swne_sewer1();
	
$rsaroom_szvm8 = $rsaroom_szvm8 + 1;
}
#ROOM SZVM8 END

#ROOM SZWM8 (SEWER/BIELGE)
sub room_szwm8 {
$roomauthor = "$name_mikeeusa";
$room = szwm8;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szwm8 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; dkmetalwall1(); print"\n"; 
dkmetalwall2(); print"\n"; dksewage3(); print"\n"; dksewage2(); print"\n"; dksewage1(); print"\n"; 
dksewage2(); print"\n"; dksewage3(); print"\n"; swrdkwallns2(); print"\n";
swrdkwallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; 
swrdkhallns1(); print"\n";
	
$rsaroom_szwm8 = $rsaroom_szwm8 + 1;
}
#ROOM SZWM8 END

#ROOM SZWM7 START
sub room_szwm7 {
$roomauthor = "$name_mikeeusa";
$room = szwm7;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szwm7 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_wel_sewer4();
	
$rsaroom_szwm7 = $rsaroom_szwm7 + 1;
}
#ROOM SZWM7 END

#ROOM SZWM6 START
sub room_szwm6 {
$roomauthor = "$name_mikeeusa";
$room = szwm6;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szwm6 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
dksewage5nset(); print"\n";
dksewage4nset(); print"\n"; dksewage3nset(); print"\n"; dksewage2nset(); print"\n"; dksewage1nswall(); print"\n"; 
dksewage2nswall(); print"\n"; dksewage3(); print"\n"; dksewage4(); print"\n"; dksewage3(); print"\n"; 
dksewage4(); print"\n"; dksewage3(); print"\n"; dkmetalwall2(); print"\n"; dkmetalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
	
$rsaroom_szwm6 = $rsaroom_szwm6 + 1;
}
#ROOM SZWM6 END

#ROOM SZVM6 START
sub room_szvm6 {
$roomauthor = "$name_mikeeusa";
$room = szvm6;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szvm6 == 1) {
		$info = " You come to the end of this sewage pipe. To the";
		$info2 = "west is a hallway,to the north are metalic doors";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "   You detonate a bomb. For a brief moment it   ";
		$info2 = "         lights up your surroundings            ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; dksewage5nsetd(); print"\n"; 
dksewage4nsetd(); print"\n";  dksewage3nsetd(); print"\n"; dksewage2nsetd(); print"\n"; dksewage1nsetd(); print"\n"; 
dksewage2nsew(); print"\n"; dksewage1nsew(); print"\n"; dksewage4nset(); print"\n"; dksewage3nset(); print"\n";
dksewage2nset(); print"\n"; dksewage5nset(); print"\n"; dksewage2nset(); print"\n"; 
dksewage1nset(); print"\n";
	
$rsaroom_szvm6 = $rsaroom_szvm6 + 1;
}
#ROOM SZVM6 END

#ROOM SZUM6 START
sub room_szum6 {
$roomauthor = "$name_mikeeusa";
$room = szum6;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szum6 == 1) {
		if ($switchswr == 1) {
			$info = "                                                ";
			$info2 = "                                                ";			
		} else {

			$info = " This room is dark, yet dry as the sewer is not ";
			$info2 = "                                                ";			
		}	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		if ($switchswr == 1) {
			$info = "             You detonate a bomb.               ";
			$info2 = "                                                ";
		} else {
			$info = "   You detonate a bomb. For a brief moment it   ";
			$info2 = "         lights up your surroundings            ";			
		}
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n";
if ($switchswr == 1) {
ltsewage1mhallw(); print"\n"; 
ltsewage2mhalld(); print"\n"; ltsewage1mhalld(); print"\n"; ltsewage2mhallp(); print"\n"; ltsewage1mhall(); print"\n"; 
ltsewage2mhall(); print"\n"; ltsewage1mhall(); print"\n"; ltsewage2mhall(); print"\n"; ltsewage1mhall(); print"\n";
ltsewage2mhallw(); print"\n"; ltsewage5nsetd(); print"\n"; 
} else {
dksewage1mhallw(); print"\n"; 
dksewage2mhalld(); print"\n"; dksewage1mhalld(); print"\n"; dksewage2mhallp(); print"\n";dksewage1mhall(); print"\n"; 
dksewage2mhall(); print"\n"; dksewage1mhall(); print"\n"; dksewage2mhall(); print"\n"; dksewage1mhall(); print"\n";
dksewage2mhallw(); print"\n"; dksewage5nsetd(); print"\n"; 
}
nothing2wall(); print"\n"; nothing1wall(); print"\n";
	
$rsaroom_szum6 = $rsaroom_szum6 + 1;
}
#ROOM SZUM6 END

#ROOM SZUM5 START
sub room_szum5 {
$roomauthor = "$name_mikeeusa";
$room = szum5;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szum5 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb.               ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n";
if ($switchswr == 1) {
ltsewage7nsetd(); print"\n"; 
ltsewage2mhalld2(); print"\n"; ltsewage1mhalld2(); print"\n"; ltsewage2mhall(); print"\n"; ltsewage1mhall(); print"\n"; 
ltsewage2mhall(); print"\n"; ltsewage1mhalld(); print"\n"; ltsewage2mhalld(); print"\n"; ltsewage1mhall(); print"\n";
ltsewage2mhall(); print"\n"; ltsewage1mhallw(); print"\n";
} else {
dksewage7nsetd(); print"\n"; 
dksewage2mhalld2(); print"\n"; dksewage1mhalld2(); print"\n"; dksewage2mhall(); print"\n"; dksewage1mhall(); print"\n"; 
dksewage2mhall(); print"\n"; dksewage1mhalld(); print"\n"; dksewage2mhalld(); print"\n"; dksewage1mhall(); print"\n";
dksewage2mhall(); print"\n"; dksewage1mhallw(); print"\n"; 
}
nothing2wall(); print"\n"; nothing1wall(); print"\n";
	
$rsaroom_szum5 = $rsaroom_szum5 + 1;
}
#ROOM SZUM5 END

#ROOM SWITCHSWRSZUM5 START
sub room_switchswrszum5 {
$roomauthor = "$name_mikeeusa";
$room = switchswrszum5;
$n = 0;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

if ($bombdetonate == 1) {
	if ($switchswrb == 1) {
	$info = "         Be Oh Oh Em Exclamation-Char           ";
	$info2 = "                                                ";
	} else {
	$info = "   You detonate a bomb, and oh does it hurt!    ";
	$info2 = "      ...The switch looks inoperable now...     ";
	}	
	$bombamount = $bombamount - 1;
	$health = $health - 35;
	$switchswrb = 1;
} else {
}

if ($playpaytrig == 1) {
	if ($switchswrb == 1) {
		#bah! you allready blew it up, now you expect it to work?! wtf!
	} else {
		if ($switchswr == 1) {
			$switchswr = 0;
		} else {
			$switchswr = 1;
		}
	}
} else {
	#just... let it be
}

if ($switchswrb == 1) {
$switchswrcolor = 'black';
$switchswr1color = 'black';
$switchswr2color = 'black';
} elsif ($switchswr == 1) {
$switchswrcolor = 'white';
$switchswr1color = 'black';
$switchswr2color = 'green';
} else {
$switchswrcolor = 'black';
$switchswr1color = 'red';
$switchswr2color = 'black';
}

	if ($rsaroom_switchswrszum5 == 1) {
		$info = "   This is a switch of some sort, you deduce.   ";
		$info2 = "                                                ";
	} elsif ($bombdetonate == 1) {
		#grrrr /me bites
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$bombdetonate = 0;	
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n";
nothing1wall(); print"\n";

t5(); print'      '; print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t6(); print"\n";

t6(); print'      '; print colored("X                                  X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t5(); print"\n";

t5(); print'      '; print colored("X                                  X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset';  print'      '; t6(); print"\n";


t6(); print'      '; print colored("X    ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; 
print colored("##########","bold $switchswr1color on_$switchswr1color"); print color 'reset';
print colored("      ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset';
print colored("##########","bold $switchswr2color on_$switchswr2color"); print color 'reset';
print colored("    X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t5(); print"\n";

t5(); print'      '; print colored("X    ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; 
print colored("#        #","bold $switchswr1color on_$switchswr1color"); print color 'reset';
print colored("      ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset';
print colored("#        #","bold $switchswr2color on_$switchswr2color"); print color 'reset';
print colored("    X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t6(); print"\n";

t6(); print'      '; print colored("X    ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; 
print colored("#  OFF   #","bold $switchswr1color on_$switchswr1color"); print color 'reset';
print colored("      ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset';
print colored("#   ON   #","bold $switchswr2color on_$switchswr2color"); print color 'reset';
print colored("    X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t5(); print"\n";

t5(); print'      '; print colored("X    ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; 
print colored("#        #","bold $switchswr1color on_$switchswr1color"); print color 'reset';
print colored("      ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset';
print colored("#        #","bold $switchswr2color on_$switchswr2color"); print color 'reset';
print colored("    X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t6(); print"\n";

t6(); print'      '; print colored("X    ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; 
print colored("##########","bold $switchswr1color on_$switchswr1color"); print color 'reset';
print colored("      ","bold $switchswrcolor on_$switchswrcolor"); print color 'reset';
print colored("##########","bold $switchswr2color on_$switchswr2color"); print color 'reset';
print colored("    X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t5(); print"\n";

t5(); print'      '; print colored("X                                  X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t6(); print"\n";

t6(); print'      '; print colored("X                                  X","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t5(); print"\n";

t5(); print'      '; print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX","bold $switchswrcolor on_$switchswrcolor"); print color 'reset'; print'      '; t6(); print"\n";

nothing1wall(); print"\n";
nothing2wall(); print"\n";
nothing1wall(); print"\n";
	
$rsaroom_switchswrszum5 = $rsaroom_switchswrszum5 + 1;
}
#ROOM SWITCHSWRSZUM5 END

#ROOM KEWSSZUM6 START
sub room_kewsszum6 {
$roomauthor = "$name_mikeeusa";
$room = kewsszum6;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_kewsszum6 == 1) {
		$info = " You approach the metallic doors, to the left of";
		$info2 = "   them is this electronic passcard reader...   ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		if ($keysewagecrdb == 1 or $keysewagecrdbp == 1) {
		$info = "                  KABOOM!                       ";
		$info2 = "                                                ";
		} else {
		$info = "You detonate a bomb, burn your face, and destroy";
		$info2 = "  the passcard reader by way of excessive heat  ";
		}
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$keysewagecrdb = 1;
		$keysewagecrdbp = 1;
		$health = $health - 35;
	} else {
	}
	

t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\\/XX",'bold black on_white'); t5(); print"\n";
t5(); print colored("X                                           || X",'bold black on_white'); t6(); print"\n";
if ($keysewagecrdb == 1 or $keysewagecrdbp == 1) {
t6(); print colored("X     ",'bold black on_white'); 
print colored(" ^ / >< /   X  //   ^ >    X      ^<",'white on_black');
print colored("  || X",'bold black on_white'); t5(); print"\n";
} elsif ($keysewagecrds == 2) {
t6(); print colored("X     ",'bold black on_white'); 
print colored(" ENTER PASSCODE                     ",'green on_black');
print colored("  || X",'bold black on_white'); t5(); print"\n";
} else {
t6(); print colored("X     ",'bold black on_white'); 
print colored(" SWIPE CARD                         ",'green on_black');
print colored("  || X",'bold black on_white'); t5(); print"\n";
}
t5(); print colored("X                                           || X",'bold black on_white'); t6(); print"\n";
t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";


if ($keysewagecrdb == 1 or $keysewagecrdbp == 1) {
t5(); print colored("X                             ",'bold black on_white');
print colored("[>]  [<]  [9] ",'bold white on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("X                             ",'bold black on_white');
print colored("[X]  [>]  [>] ",'bold white on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("X                             ",'bold black on_white');
print colored("[/]  [2]  [^] ",'bold white on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("X                             ",'bold black on_white');
print colored("     [X]      ",'bold white on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";
} else {
t5(); print colored("X                             ",'bold black on_white');
print colored("[7]  [8]  [9] ",'black on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("X                             ",'bold black on_white');
print colored("[4]  [5]  [6] ",'black on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("X                             ",'bold black on_white');
print colored("[1]  [2]  [3] ",'black on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("X                             ",'bold black on_white');
print colored("     [0]      ",'black on_white');
print colored("|| X",'bold black on_white'); t6(); print"\n";
}

t6(); print colored("X                                           || X",'bold black on_white'); t5(); print"\n";

t5(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/\\XX",'bold black on_white'); t6(); print"\n";
t6(); print colored("                                                ",'bold white on_black'); t5(); print"\n";
t5(); print colored("                                                ",'bold white on_black'); t6(); print"\n";
t6(); print colored("                                                ",'bold white on_black'); t5(); print"\n";
$rsaroom_kewsszum6 = $rsaroom_kewsszum6 + 1;
}
#ROOM KEWSSZUM6 END


#ROOM SZXM8 (SEWER/BIELGE)
sub room_szxm8 {
$roomauthor = "$name_mikeeusa";
$room = szxm8;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szxm8 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
		$alligatorbeing1_szwm8 = 0;
	} elsif ($rsaroom_szxm8 == 2) {
		$info = '       Hrmm you wonder what that was...         ';
		$info2 = '                                                ';
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "             You detonate a bomb                ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
swrdkhallns1(); print"\n";
swrdkhallns2(); print"\n"; swrdkhallns1(); print"\n"; swrdkhallns2(); print"\n"; swrdkwallns3(); print"\n"; 
swrdkwallns4(); print"\n"; dksewage3ngt(); print"\n"; dksewage2ngt(); print"\n"; dksewage3ngt(); print"\n"; 
dksewage2ngt(); print"\n"; dksewage3ngt(); print"\n"; dkmetalwall2b(); print"\n";
dkmetalwall1b(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";

$alligatorbeing1_szwm8 = $alligatorbeing1_szwm8 + 1;

	if ($alligatorbeing1_szwm8 == 4) {			
		$info = '            It looks like a log...              ';
		$info2 = '                IT ATTACKS!                     ';
		alligatorbeing1_define();
		alligatorbeing1_exe();	
	} elsif ($alligatorbeing1_szwm8 >= 5) {
		if ($alligatorbeinginroom_1 == 0) {
			$info = '            You gut the alligator...            ';
			$info2 = '          and out falls a red card              ';
			$passcardredkewsszum6 = 1;
			$alligatorbeing1_szwm8 = '-10';
		} else {
			#OOOOOOHHH!!!!!!!
		}
		alligatorbeing1_exe();
	} elsif ($alligatorbeing1_szwm8 < '-1') {
		$alligatorbeing1_szwm8 = '-10';
	} else {
	}

$rsaroom_szxm8 = $rsaroom_szxm8 + 1;
}
#ROOM SZXM8 END

#ROOM SBM2 (SEWER/BIELGE)
sub room_sbm2 {
$roomauthor = "$name_mikeeusa";
$room = sbm2;

$read = " ";

	if ($rsaroom_sbm2 == 1) {
		$info = " The light entering your eyes decreases as you  ";
		$info2 = "       peer down the forboading path...         ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	#blow shite up!!!
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb. In great surprise to you  ";
		$info2 = "                 it explodes!                   ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}

	if ($smb2cantgo == 1) {
		$info = "     Gosh darnit! Something blocks your path.   ";
		$info2 = "                                                ";
		$smb2cantgo = 0;	
	} else {
	}
	
if ($sbm2blocked == 1) {
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
} else {
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
}

	
sewrwall2(); print"\n";
sewrwall1(); print"\n"; sewrwall2b(); print"\n"; sewrwall1(); print"\n"; sewrwall2(); print"\n"; 
sewrwall1(); print"\n"; sewrwall2b(); print"\n"; sewrwall1(); print"\n"; sewrwall2b(); print"\n"; 
sewrwall1bdkf(); print"\n"; sewrwall2bdk(); print"\n"; sewrwall1bdk(); print"\n"; sewrwall2bdk(); print"\n"; 
sewrwall1bdk(); print"\n"; sewrwall2bdkb(); print"\n"; sewrwall1bdkb(); print"\n"; 
sewrwall2bdkb(); print"\n";

if ($rsaroom_sbm2 >= 2) {
	if ($snakeroomrand == 3) {
		bsnake1ataxor();
	} elsif ($snakeroomrand == 2) {
		bsnake2ataxor();		
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}

$rsaroom_sbm2 = $rsaroom_sbm2 + 1;
}
#ROOM SBM2 END

#ROOM SA3 (SEWER/BIELGE)
sub room_sa3 {
$roomauthor = "$name_mikeeusa";
$room = sa3;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sa3 == 1) {
		$info = " Moving eastward through the sewer system gives ";
		$info2 = "         you a choice: North or East            ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
	
sewrwall2(); print"\n";
sewrwall1(); print"\n"; sewrwall2(); print"\n"; sewrwall1(); print"\n"; sewrwall4(); print"\n"; 
sewrwall3(); print"\n"; sewage1(); print"\n"; sewage2(); print"\n"; sewage1(); print"\n"; 
sewage2(); print"\n"; sewage1(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 2) {
		bsnake1ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
	
$rsaroom_sa3 = $rsaroom_sa3 + 1;
}
#ROOM SA3 END

#ROOM SA4 (SEWER/BIELGE)
sub room_sa4 {
$roomauthor = "$name_mikeeusa";
$room = sa4;
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_sa4 == 1) {
		$info = "  You feel the current of the sewage pickup...  ";
		$info2 = "        You plummet over a sewage fall          ";
		$health = $health - 3000; 
		#well if your dead your dead :P
		$room = usfa4;
		$n = 0;
		$s = 0;
		$e = 0;
		$w = 0;
		$ne = 0;
		$nw = 0;
		$se = 0;
		$sw = 0;
		$up = 0;
		$down = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
		$health = $health - 3000;
		$room = usfa4;
		$n = 0;
		$s = 0;
		$e = 0;
		$w = 0;
		$ne = 0;
		$nw = 0;
		$se = 0;
		$sw = 0;
		$up = 0;
		$down = 0;		
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb, it plummets over the falls";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; metalwall1(); print"\n"; 
metalwall2(); print"\n"; sewage3c(); print"\n"; sewage2c(); print"\n"; sewage1c(); print"\n"; 
sewage2c(); print"\n"; sewage3c(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 	
$rsaroom_sa4 = $rsaroom_sa4 + 1;
}
#ROOM SA4 END

#ROOM USFA4 (SEWER/BIELGE)
sub room_usfa4 {
$roomauthor = "$name_mikeeusa";
$room = usfa4;
$n = 0;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_usfa4 == 1) {
		$info = "    The sewage fall has deposited you here...   ";
		$info2 = "        Some how you survived the drop          ";
	} elsif ($rsaroom_usfa4 == 2) {
		$info = "                 It is dark                     ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";	
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb, It lights up the area for ";
		$info2 = "              a brief moment...                 ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; metalwall1(); print"\n"; 
metalwall2(); print"\n"; sewagefallen1(); print"\n"; sewagefallen2(); print"\n"; sewagefallen1(); print"\n"; 
sewagefallen2(); print"\n"; sewagefallen1(); print"\n"; metalwall2(); print"\n"; metalwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 	
$rsaroom_usfa4 = $rsaroom_usfa4 + 1;
}
#ROOM USFA4 END


#ROOM SZZ3 (SEWER/BIELGE)
sub room_szz3 {
$roomauthor = "$name_mikeeusa";
$room = szz3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szz3 == 1) {
		$info = " Yet more raw sewage you find on your journy... ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_nsl_sewer1();

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 3) {
		bsnake1ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
 	
$rsaroom_szz3 = $rsaroom_szz3 + 1;
}
#ROOM SZZ3 END

#ROOM SZY3 (SEWER/BIELGE)
sub room_szy3 {
$roomauthor = "$name_mikeeusa";
$room = szy3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szy3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off underwater   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
temproom_nsl_sewer2();

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 4) {
		bsnake1ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
	
$rsaroom_szy3 = $rsaroom_szy3 + 1;
}
#ROOM SZY3 END

#ROOM SZX3 (SEWER/BIELGE)
sub room_szx3 {
$roomauthor = "$name_mikeeusa";
$room = szx3;
$n = 0;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szx3 == 1) {
		$info = "  The sewage is stagnating here, the smell is   ";
		$info2 = "   unbearable. There is a ladder to the east    ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it goes off undersewage  ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
metalwall1(); print"\n";
sewrwall1c(); print"\n"; sewrwall2c(); print"\n"; sewrwall1c(); print"\n"; sewrwall2c(); print"\n"; 
sewrwall1c(); print"\n"; sewrwall2c(); print"\n"; sewrwall1c(); print"\n"; sewrwall2d(); print"\n"; 
sewrwall1d(); print"\n"; sewrwall2c(); print"\n"; sewrwall1c(); print"\n"; sewrwall2c(); print"\n"; 
sewrwall1c(); print"\n"; sewrwall2c(); print"\n"; sewrwall3(); print"\n"; 
sewrwall2b(); print"\n";

if ($sa0grateblown == 1) {
	if ($snakeroomrand == 1) {
		bsnake1ataxor();	
	} else {
	$snakeroomrand = int(rand(5));
	}
} else {
}
 	
$rsaroom_szx3 = $rsaroom_szx3 + 1;
}
#ROOM SZX3 END

#ROOM uzx4 (controll entrance with pc term)
sub room_uzx4 {
$roomauthor = "$name_mikeeusa";
$room = uzx4;
$read = " ";

	if ($rsaroom_uzx4 == 1) {
		$info = "   You climb up the ladder for some time till   ";
		$info2 = "      you discover this well lighted room       ";
	} elsif ($rsaroom_uzx4 == 3) {
		if ($ancientredbook == 1) {
			if ($uzx4termsmoke == 0) {
				$info = "You notice what your ancient book describes as a";
				$info2 = " computer terminal embedded into the north wall ";
				$uzx4term = 1;
			} else {
				$info = "             It's a nice room...                ";
				$info2 = "                                                ";
			}
		} else {
			$info = "                                                ";
			$info2 = "                                                ";
		}
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
			if ($uzx4term == 1) {
			$info = "   You detonate a bomb and manage to destroy    ";
			$info2 = "  the ancient computer terminal, good for you!  ";
			} else {
			$info = "       You detonate a bomb and feel great       ";
			$info2 = "    accomplishment as countless tiles shatter   ";
			}
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$uzx4termsmoke = 1;
		$uzx4term = 2;
	} else {
	}
	
if ($uzx4term == 1) {
$n = 1;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
} else {
$n = 0;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
}

if ($termnboom == 1) {
puterwall1b(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1b(); print"\n"; puterfloor2b(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterwallh2(); print"\n"; puterwallh1(); print"\n"; puterwallh2(); print"\n"; 
puterwallh1(); print"\n";
} elsif ($uzx4term == 1) {	
puterwall1c(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1b(); print"\n"; puterfloor2b(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterwallh2(); print"\n"; puterwallh1(); print"\n"; puterwallh2(); print"\n"; 
puterwallh1(); print"\n"; 
} elsif ($uzx4term == 2) {
puterwall1b(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1b(); print"\n"; puterfloor2b(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterwallh2(); print"\n"; puterwallh1(); print"\n"; puterwallh2(); print"\n"; 
puterwallh1(); print"\n";
} else {
puterwall1(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1b(); print"\n"; puterfloor2b(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterwallh2(); print"\n"; puterwallh1(); print"\n"; puterwallh2(); print"\n"; 
puterwallh1(); print"\n"; 	
}
	
$rsaroom_uzx4 = $rsaroom_uzx4 + 1;
}
#ROOM UZX4 END

#ROOM uzx4 (lockerroom)
sub room_uzy4 {
$roomauthor = "$name_mikeeusa";
$room = uzy4;
$read = " ";
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

	if ($rsaroom_uzy4 == 1) {
		if ($ancientredbook == 1) {
			$info = "  Heading south you come what your ancient red  ";
			$info2 = "       book describes as a locker room...       ";
			$lockersmarts = 1;
		} else {
			$info = "  You come to a room containing strange green   ";
			$info2 = "                 compartments                   ";	
		}	
	} elsif ($rsaroom_uzy4 == 2) {
		if ($lockersmarts == 1) {
			$info = "  You look around and notice that one locker is ";
			$info2 = "                  unlocked                      ";
		} else {
			$info = "      You look around and notice that one       ";
			$info2 = "           compartment is unlocked              ";
		}
	} elsif ($rsaroom_uzy4 == 3) {
		if ($lockersmarts == 1) {
			$info = "You open the locker and find two bombs Naturally";
			$info2 = "    you add them to your collection of toys     ";
		} else {
			$info = "  You open the compartment and find two bombs   ";
			$info2 = "   which you pick up and put in your sachel     ";
		}
		$uzy4lockeropen = 1;
		$bombamount = $bombamount + 2;	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, which you know can only  ";
		$info2 = "    give you bad luck in-between two lockers    ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$health = $health - 50;
	} else {
	}

if ($uzy4lockeropen == 1) {	
puterwallh1(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; 
lockerfloor2(); print"\n"; lockerfloor1b(); print"\n"; lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; 
lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; 
lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; puterfloor2(); print"\n"; 
puterwallh1(); print"\n";
} else {
puterwallh1(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; 
lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; 
lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; 
lockerfloor2(); print"\n"; lockerfloor1(); print"\n"; puterfloor2(); print"\n"; 
puterwallh1(); print"\n"; 	
}

$rsaroom_uzy4 = $rsaroom_uzy4 + 1;
}
#ROOM UZY4 END

#ROOM uzz4
sub room_uzz4 {
$roomauthor = "$name_mikeeusa";
$room = uzz4;
$read = " ";

	if ($rsaroom_uzz4 == 1) {
		$info = " You enter a room with a thick glass wall and a ";
		$info2 = "    a large metal sliding door to the south     ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$uzz4blowupglass = $uzz4blowupglass + 1;
		if ($uzz4blowupglass == 7) {
			$info = "You detonate a bomb, it explodes shattering the ";
			$info2 = "            northern glass wall                 ";
			$uzz4shatterglass = 1;
			$keyuzw4var = "ua4";
		} elsif ($uzz4blowupglass == 4) {
			$info = " You detonate a bomb, it explodes and a small   ";
			$info2 = "      crack appears in the glass wall           ";		
		} else {
			$info = "You detonate a bomb, it explodes destroying some";
			$info2 = "                  floor tiles                   ";
		}
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

if ($uzz4shatterglass == 1) {	
puterwallh1(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1doore(); print"\n"; puterfloor2doore(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1(); print"\n"; glasslockwal2(); print"\n"; glasslockwal1bx(); print"\n"; 
glasslockwal4(); print"\n"; puterfloor1(); print"\n"; 
} else {
puterwallh1(); print"\n";
puterfloor2(); print"\n"; puterfloor1(); print"\n"; puterfloor2(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1doore(); print"\n"; puterfloor2doore(); print"\n"; puterfloor1(); print"\n"; 
puterfloor2(); print"\n"; puterfloor1(); print"\n"; glasslockwal2(); print"\n"; glasslockwal1(); print"\n"; 
glasslockwal4(); print"\n"; puterfloor1(); print"\n";
}

if ($rsaroom_ua4 >= 3) {
labbfloor2dooreb(); print"\n"; 
labbfloor1dooreb(); print"\n";
} else {
labbfloor2doore(); print"\n"; 
labbfloor1doore(); print"\n";
} 


$rsaroom_uzz4 = $rsaroom_uzz4 + 1;
}


#ROOM UA4
sub room_ua4 {
$roomauthor = "$name_mikeeusa";
$room = ua4;
$read = " ";
$n = 1;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
	if ($rsaroom_ua4 == 1) {
		$info = "     You journy past the glass wall into a      ";
		$info2 = "              semi-circular room...             ";
		$pincerbeing1_ua4 = 0;	
	} elsif ($rsaroom_ua4 == 2) {
		$info = "There are blue sliding doors to the south, east,";
		$info2 = " and west... yet of them seem to want to open   ";		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {			
		$info = "You detonate a bomb, it explodes shattering some";
		$info2 = "         floor tiles, you feel tough!           ";		
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
 
if ($uzz4shatterglass == 1) {
glasslockwal1bx(); print"\n"; 
glasslockwal4(); print"\n";
} else {
glasslockwal1(); print"\n"; 
glasslockwal4(); print"\n";
}
puterfloor1(); print"\n"; 
if ($rsaroom_ua4 >= 3) {
labbfloor2dooreb(); print"\n"; 
labbfloor1dooreb(); print"\n";
} else {
labbfloor2doore(); print"\n"; 
labbfloor1doore(); print"\n";
} 
puterfloor2(); print"\n"; labbfloor1(); print"\n"; labbfloor2(); print"\n"; labbfloor3(); print"\n"; 
labbfloor4(); print"\n"; labbfloor5(); print"\n"; labbfloor6(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$pincerbeing1_ua4 = $pincerbeing1_ua4 + 1;

	if ($pincerbeing1_ua4 == 3) {			
		$info = "          You hear something barking...         ";
		$info2 = "  A dog bursts down the west door and attacks!  ";
		pincerbeing1_define();
		pincerbeing1_exe();	
	} elsif ($pincerbeing1_ua4 >= 4) {
		pincerbeing1_exe();
	} else {
	}
	
$rsaroom_ua4 = $rsaroom_ua4 + 1;
}
#ROOM UA4 END

sub room_uzz5 {
$roomauthor = "$name_mikeeusa";
$room = uzz5;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzz5 == 1) {
		if ($ancientredbook == 1) {
			$info = "  You enter a small room which boasts a TV wall ";
			$info2 = " to the north and two wooden desks to the south ";
		} else {
			$info = "  You enter a small room which has a wall made  ";
			$info2 = "   of black glass compartments to the north     ";
		}
	} elsif ($rsaroom_uzz5 == 2) {
		if ($ancientredbook == 1) {
			$info = "                                                ";
			$info2 = "                                                ";
		} else {
			$info = "    There are two wooden desks to the south     ";
			$info2 = "                                                ";		
		}	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb and become one with the TV ";
		$info2 = "                     wall...                    ";
		$bombdetonate = 0;
		$uzz5bomedup = 1;	
		$bombamount = $bombamount - 1;
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$bodypart_armR = 0;
		$bodypart_legR = 0;
		$bodypart_legL = 0;
		$health = $health - 30000;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; tvwall1(); print"\n"; 
if ($uzz5bomedup == 1) {
tvwall6();
} else {
tvwall4(); 
}
print"\n"; tvfloor1(); print"\n"; tvfloor2(); print"\n"; tvfloor3(); print"\n"; 
tvwall2(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";	
$rsaroom_uzz5 = $rsaroom_uzz5 + 1;
}

#ROOM UZZ6
sub room_uzz6 {
$roomauthor = "$name_mikeeusa";
$room = uzz6;
$n = 1;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzz6 == 1) {
		$info = "        You enter into a long hallway           ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You detonate a bomb, which is a bad idea in this";
		$info2 = "                 narrow passage...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
longhall1(); print"\n";
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1b(); print"\n"; 
longhall2b(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; 
longhall1(); print"\n";	
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}

$rsaroom_uzz6 = $rsaroom_uzz6 + 1;
}
#ROOM UZZ6 END

#ROOM UZY6
sub room_uzy6 {
$roomauthor = "$name_mikeeusa";
$room = uzy6;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzy6 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You detonate a bomb, which is a bad idea in this";
		$info2 = "                 narrow passage...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
longhall1(); print"\n";
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; 
longhall1(); print"\n";	
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}

$rsaroom_uzy6 = $rsaroom_uzy6 + 1;
}
#ROOM UZY6 END

#ROOM UZX7
sub room_uzx7 {
$roomauthor = "$name_mikeeusa";
$room = uzx7;
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;


	if ($rsaroom_uzx7 == 1) {
		$info = "You enter a utility room of some sort, there are";
		$info2 = "       shelves on three of the four walls       ";
	} elsif ($rsaroom_uzx7 == 2) {
		$info = "  You notice a water bucket on the floor and a  ";
		$info2 = "       purple book on one of the shelves        ";
	} elsif ($rsaroom_uzx7 == 3) {
		$info = "     You open the book to read its content...   ";
		$info2 = "                                                ";
		$uzx7readbook = 1;
	} elsif ($rsaroom_uzx7 == 5) {
		$info = "  You pick up a crowbar that was resting beside ";
		$info2 = "              the water bucket                  ";
		$redcrowbar = 1;					
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "    You detonate a bomb, inadvisable in such    ";
		$info2 = "                  a small room                  ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$bodypart_armR = 0;
		$bodypart_armL = 0;
		$health = $health - 30000;
	} else {
	}
	
if ($uzx7readbook == 1) {
	$read = "[Book] Key sequence: lab7 $keyuzw4padnumber";
} else {
	$read = ' ';
}

nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
closetwall2(); print"\n"; closetshelvs1(); print"\n"; closetfloor2(); print"\n"; closetfloor1(); print"\n"; 
closetshelvs2(); print"\n"; closetwall1(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";		
$rsaroom_uzx7 = $rsaroom_uzx7 + 1;
}
#ROOM UZX7 END

#ROOM UZX6
sub room_uzx6 {
$roomauthor = "$name_mikeeusa";
$room = uzx6;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzx6 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You detonate a bomb, which is a bad idea in this";
		$info2 = "                 narrow passage...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
longhall1(); print"\n";
longhall2(); print"\n"; longhall1c(); print"\n"; longhall2c(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; 
longhall1(); print"\n";	
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}

$rsaroom_uzx6 = $rsaroom_uzx6 + 1;
}

#ROOM UZW6
sub room_uzw6 {
$roomauthor = "$name_mikeeusa";
$room = uzw6;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzw6 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You detonate a bomb, which is a bad idea in this";
		$info2 = "                 narrow passage...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
longhall1(); print"\n";
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; 
longhall1(); print"\n";	
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}

$rsaroom_uzw6 = $rsaroom_uzw6 + 1;
}
#ROOM UZW6 END

#ROOM UZV6
sub room_uzv6 {
$roomauthor = "$name_mikeeusa";
$room = uzv6;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzv6 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "        You detonate a bomb and are shaken      ";
		$info2 = "                but not stirred...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 10;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhall4(); print"\n"; longhall3(); print"\n"; 
longhall4(); print"\n"; longhall3(); print"\n"; longhall4(); print"\n"; longhallwall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; 
longhall1(); print"\n";	
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}
$rsaroom_uzv6 = $rsaroom_uzv6 + 1;
}
#ROOM UZv6 END

#ROOM UZV7
sub room_uzv7 {
$roomauthor = "$name_mikeeusa";
$room = uzv7;
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzv7 == 1) {
		$info = "You travel east down the hall and come to a dead";
		$info2 = "end To the east is a very heavy green metal door";
		$droidbeing1_uzv7 = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "        You detonate a bomb, you get hurt       ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoalonghall1(); print"\n"; longhall10(); print"\n"; longhall11(); print"\n"; 
longhall12(); print"\n"; longhall11(); print"\n"; longhall10(); print"\n"; wallunoalonghall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$droidbeing1_uzv7 = $droidbeing1_uzv7 + 1;

	if ($droidbeing1_uzv7 == 1) {
		droidbeing1_define();
		droidbeing1_exe();
	} elsif ($droidbeing1_uzv7 == 2) {
		$info = "There is a droid standing gaurd before the door ";
		$info2 = "                                                ";
		droidbeing1_exe();		
	} elsif ($droidbeing1_uzv7 >= 3) {
		droidbeing1_exe();
	}
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}

	
$rsaroom_uzv7 = $rsaroom_uzv7 + 1;
}
#ROOM UZV7 END

#ROOM UZV5
sub room_uzv5 {
$roomauthor = "$name_mikeeusa";
$room = uzv5;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzv5 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "        You detonate a bomb, you get hurt       ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhall4(); print"\n"; longhall3(); print"\n"; 
longhall4(); print"\n"; longhall3(); print"\n"; longhall4(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}
$rsaroom_uzv5 = $rsaroom_uzv5 + 1;
}
#ROOM UZV5 END

#ROOM UZV4
sub room_uzv4 {
$roomauthor = "$name_mikeeusa";
$room = uzv4;
$read = " ";

	if ($rsaroom_uzv4 == 1) {
		$info = "You come to what seems to be the end of the hall";
		$info2 = "   To the west are locked double glass doors    ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		if ($uzv4bombedoutg == 0) {
		$info = " You detonate a bomb it explodes destroying the ";
		$info2 = " glass doors, the metal frames remain intact... ";		
		$uzv4bombedoutg = 1;
		} else {
		$info = "        You detonate a bomb, you get hurt       ";
		$info2 = "                                                ";
		}	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}
	
if ($uzv4bombedoutg == 1) {
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
} else {
$n = 0;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
}

if ($uzv4bombedoutg == 1) {	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhall6b(); print"\n"; longhall7b(); print"\n"; 
longhall8b(); print"\n"; longhall7bx(); print"\n"; longhall6b(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
} else {	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhall6(); print"\n"; longhall7(); print"\n"; 
longhall8(); print"\n"; longhall7(); print"\n"; longhall6(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}
		
	if (($uzv4bombedoutg == 1) && ($pincerbeing2_u2zv0 >= 2)) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}
	
$rsaroom_uzv4 = $rsaroom_uzv4 + 1;
}
#ROOM UZV4 END

#ROOM UZU3
sub room_uzu3 {
$roomauthor = "$name_mikeeusa";
$room = uzu3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 1;

$read = " ";

	if ($rsaroom_uzu3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$mainframe2b = $mainframe2b + 1;
		$bombamount = $bombamount - 1;
		$health = $health - 2;
	} else {
	}
wallunoa1d1w(); print"\n";
mainframefl4(); print"\n";
if ($mainframe2b == 0) {
computelab5a(); print"\n"; computelab2a(); print"\n"; computelab11a(); print"\n"; 
computelab2a(); print"\n"; computelab3a(); print"\n"; computelab0a(); print"\n"; computelab1a(); print"\n"; 
computelab2a(); print"\n"; computelab9a(); print"\n"; computelab2a(); print"\n"; computelab7a(); print"\n";
} elsif  ($mainframe2b == 1) {
computelab5a(); print"\n"; computelab2a(); print"\n"; computelab11a(); print"\n"; 
computelab2a(); print"\n"; computelab3a(); print"\n"; computelab0ab(); print"\n"; computelab1ab(); print"\n"; 
computelab2a(); print"\n"; computelab9a(); print"\n"; computelab2a(); print"\n"; computelab7a(); print"\n";
} elsif  ($mainframe2b == 2) {
computelab5a(); print"\n"; computelab2a(); print"\n"; computelab11a(); print"\n"; 
computelab2a(); print"\n"; computelab3abb(); print"\n"; computelab0ab(); print"\n"; computelab1ab(); print"\n"; 
computelab2abb(); print"\n"; computelab9a(); print"\n"; computelab2a(); print"\n"; computelab7a(); print"\n";
} elsif  ($mainframe2b == 3) {
computelab5a(); print"\n"; computelab2a(); print"\n"; computelab11a(); print"\n"; 
computelab2abbb(); print"\n"; computelab3abb(); print"\n"; computelab0ab(); print"\n"; computelab1ab(); print"\n"; 
computelab2abb(); print"\n"; computelab9a(); print"\n"; computelab2a(); print"\n"; computelab7a(); print"\n";
} else {
computelab5a(); print"\n"; computelab2a(); print"\n"; computelab11a(); print"\n"; 
computelab2abbb(); print"\n"; computelab3abb(); print"\n"; computelab0ab(); print"\n"; computelab1ab(); print"\n"; 
computelab2abb(); print"\n"; computelab9a(); print"\n"; computelab2a(); print"\n"; computelab7a(); print"\n";
}
mainframefl4(); print"\n"; wallunoa1d1w(); print"\n"; wallunoa1d2w(); print"\n";
nothing1wall(); print"\n";
$rsaroom_uzu3 = $rsaroom_uzu3 + 1;
}
#ROOM UZU3 END

#ROOM UZT3
sub room_uzt3 {
$roomauthor = "$name_mikeeusa";
$room = uzt3;
$n = 1;
$s = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzt3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		if ($uzt3bomb == 1) {
			#dn
		} else {
			$uzt3bomb = 1;
		}
		$bombamount = $bombamount - 1;
		$health = $health - 5;
	} else {
	}
longhall1(); print"\n";
longhall2(); print"\n"; complonghall1(); print"\n"; complonghall4(); print"\n"; complonghall5(); print"\n"; 
complonghall6(); print"\n"; 
if ($uzt3bomb == 1) {
complonghall7b(); print"\n"; complonghall8b(); print"\n"; complonghall9b(); print"\n"; 
complonghall8b(); print"\n"; complonghall7b(); print"\n";
$e = 1; 
} else {
complonghall7(); print"\n"; complonghall8(); print"\n"; complonghall9(); print"\n"; 
complonghall8(); print"\n"; complonghall7(); print"\n";
$e = 2;
}
complonghall6(); print"\n"; complonghall5(); print"\n"; 
complonghall4(); print"\n"; complonghall1(); print"\n"; longhall2(); print"\n"; 
complonghall1e(); print"\n";	
$rsaroom_uzt3 = $rsaroom_uzt3 + 1;
}
#ROOM UZT3 END

#ROOM KEYUZS4 (Computer)
sub room_keyuzs4 {
$roomauthor = "$name_mikeeusa";
$room = keyuzs4;
$read = " ";

	if ($rsaroom_keyuzs4 == 1) {
		if ($ancientredbook == 1) {
			$info = ' You approach the heavy green door and notice an';
			$info2 = '   electronic keypad to the left side of it     ';
		} else {
			$info = ' You approach the heavy green door and notice a ';
			$info2 = '       peculiar device to the left of it        ';
		}
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		if ($keyuzs4bombed == 0) {
			$info = "You detonate a bomb, the intense heat melts the ";
			$info2 = "       keypad and scorches your face badly      ";
			$keyuzs4bombed = 1;
		} else {
			$info = "      You detonate a bomb, you are burned       ";
			$info2 = "                                                ";		
		}
		$keyuzs4keyfuze = 1;
		$health = $health - 37;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}

#$keyuzs4keyfuze
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;



t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";
if ($keyuzs4keyfuze == 1) {
t6(); print colored("XX    ",'bold white on_white'); 
print colored(" ^ / >< /   X  //   ^ >    X      ^<",'white on_black');
print colored("    XX",'bold white on_white'); t5(); print"\n";
} else {
t6(); print colored("XX    ",'bold white on_white'); 
print colored(" ENTER KEY SEQUENCE                 ",'red on_black');
print colored("    XX",'bold white on_white'); t5(); print"\n";
}

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

if ($keyuzs4keyfuze == 1) {
t5(); print colored("XX                             ",'bold white on_white');
print colored("[>]  [<]  [9]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[X]  [>]  [>]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[/]  [2]  [^]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("     [X]     ",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";
} else {
t5(); print colored("XX                             ",'bold white on_white');
print colored("[7]  [8]  [9]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[4]  [5]  [6]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[1]  [2]  [3]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("     [0]     ",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";
}



t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",'bold white on_white'); t5(); print"\n";

t5(); print colored("                                                ",'bold white on_black'); t6(); print"\n";
t6(); print colored("                                                ",'bold white on_black'); t5(); print"\n";
$rsaroom_keyuzs4 = $rsaroom_keyuzs4 + 1;
}
#ROOM KEYUZS4 END

#ROOM UZS4
sub room_uzs4 {
$roomauthor = "$name_mikeeusa";
$room = uzs4;
$n = 0;
$s = 0;
$w = 1;
$e = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 1;

$read = " ";

	if ($rsaroom_uzs4 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}

wallunoa3(); print"\n";
wallunoa4b(); print"\n"; wallunoa5b(); print"\n"; wallunoa6bre(); print"\n"; wallunoa7bre(); print"\n"; 
wallunoa6bre(); print"\n"; wallunoa7bre(); print"\n"; wallunoa6bre(); print"\n"; wallunoa9bre(); print"\n"; 
wallunoa8bre(); print"\n"; wallunoa7bre(); print"\n"; wallunoa6bre(); print"\n"; wallunoa7bre(); print"\n"; 
wallunoa6bre(); print"\n"; wallunoa5b(); print"\n"; wallunoa4b(); print"\n"; 
wallunoa3(); print"\n";

$rsaroom_uzs4 = $rsaroom_uzs4 + 1;
}
#ROOM UZS4 END


#ROOM UZS3
sub room_uzs3 {
$roomauthor = "$name_mikeeusa";
$room = uzs3;
$n = 1;
$s = 1;
$w = 1;
$e = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzs3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; compuhallw1(); print"\n"; compuhallw2(); print"\n"; compuhallw3(); print"\n"; 
compuhallw4(); print"\n"; compuhallw5(); print"\n"; compuhallw6(); print"\n"; compuhallw7(); print"\n"; 
compuhallw8(); print"\n"; compuhallw9(); print"\n"; compuhallw10(); print"\n"; compuhallw11(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; 
longhall1(); print"\n";
$rsaroom_uzs3 = $rsaroom_uzs3 + 1;
}
#ROOM UZS3 END

#ROOM UZS2
sub room_uzs2 {
$roomauthor = "$name_mikeeusa";
$room = uzs2;
$n = 0;
$s = 0;
$w = 1;
$e = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzs2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; compuhallw13(); print"\n"; compuhallw14(); print"\n"; compuhallw15(); print"\n"; 
compuhallw16(); print"\n"; longhall3(); print"\n"; longhall4(); print"\n"; longhall3(); print"\n"; 
compuhallw16(); print"\n"; compuhallw15(); print"\n"; compuhallw14(); print"\n"; compuhallw13(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_uzs2 = $rsaroom_uzs2 + 1;
}
#ROOM UZS2 END

#ROOM UZS1
sub room_uzs1 {
$roomauthor = "$name_mikeeusa";
$room = uzs1;
$n = 0;
$s = 1;
$w = 0;
$e = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 1;

$read = " ";

	if ($rsaroom_uzs1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; compuhallw17(); print"\n"; compuhallw18(); print"\n"; compuhallw19(); print"\n"; 
compuhallw20(); print"\n"; compuhallw23(); print"\n"; compuhallw22(); print"\n"; compuhallw25(); print"\n"; 
compuhallw20(); print"\n"; compuhallw19(); print"\n"; compuhallw18(); print"\n"; compuhallw21(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_uzs1 = $rsaroom_uzs1 + 1;
}
#ROOM UZS1 END

#ROOM UZT4
sub room_uzt4 {
$roomauthor = "$name_mikeeusa";
$room = uzt4;
$n = 1;
$s = 1;
$e = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzt4 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		if ($uzt3bomb == 1) {
			#dn
		} else {
			$uzt3bomb = 1;
		}
		$mainframe3b = $mainframe3b + 1;
		$bombamount = $bombamount - 1;
		$health = $health - 5;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; 
if ($termnboom2 == 1) {
compreacmon1tb(); print"\n";
} else {
compreacmon1t(); print"\n"; 
}
compreacmon4(); print"\n"; compreacmon5(); print"\n"; 
compreacmon6(); print"\n"; 
if ($mainframe3b == 1) {
compreacmon7b(); print"\n"; compreacmon8b(); print"\n"; compreacmon9bb(); print"\n"; 
compreacmon8b(); print"\n"; compreacmon7b(); print"\n";
$w = 1; 
} elsif ($mainframe3b == 2) {
compreacmon7b(); print"\n"; compreacmon8bb(); print"\n"; compreacmon9bb(); print"\n"; 
compreacmon8bb(); print"\n"; compreacmon7b(); print"\n";
$w = 1; 
} elsif ($mainframe3b == 3) {
compreacmon7b(); print"\n"; compreacmon8bb(); print"\n"; compreacmon9bbb(); print"\n"; 
compreacmon8bb(); print"\n"; compreacmon7b(); print"\n";
$w = 1; 
} elsif ($mainframe3b == 4) {
compreacmon7bb(); print"\n"; compreacmon8bbb(); print"\n"; compreacmon9bbbb(); print"\n"; 
compreacmon8bbb(); print"\n"; compreacmon7bb(); print"\n";
$w = 1; 
} elsif ($mainframe3b == 5) {
compreacmon7bbb(); print"\n"; compreacmon8bbbb(); print"\n"; compreacmon9bbbbb(); print"\n"; 
compreacmon8bbbb(); print"\n"; compreacmon7bbb(); print"\n";
$w = 1; 
} elsif ($mainframe3b >= 6) {
compreacmon7bbbb(); print"\n"; compreacmon8bbbbb(); print"\n"; compreacmon9bbbbb(); print"\n"; 
compreacmon8bbbbb(); print"\n"; compreacmon7bbbb(); print"\n";
$w = 1;
} elsif ($uzt3bomb == 1) {
compreacmon7b(); print"\n"; compreacmon8b(); print"\n"; compreacmon9b(); print"\n"; 
compreacmon8b(); print"\n"; compreacmon7b(); print"\n";
$w = 1; 
} else {
compreacmon7(); print"\n"; compreacmon8(); print"\n"; compreacmon9(); print"\n"; 
compreacmon8(); print"\n"; compreacmon7(); print"\n";
$w = 0;
}
compreacmon6(); print"\n"; compreacmon5(); print"\n"; 
compreacmon4(); print"\n"; 
if ($termnboom3 == 1) {
compreacmon1b(); print"\n";
} else {
compreacmon1(); print"\n"; 
}
nothing2wall(); print"\n"; 
nothing1wall(); print"\n";	
$rsaroom_uzt4 = $rsaroom_uzt4 + 1;
}
#ROOM UZT4 END

#ROOM UZT4TERM
sub room_uzt4term {
$roomauthor = "$name_mikeeusa";
$room = uzt4term;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzt4term == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "              You detonate a bomb               ";
		$info2 = "Terminal CRT Shatters, Terminal Condition Ensues";	
		$bombdetonate = 0;
		if ($termnboom3 == 1) {
			#dn
		} else {
			$termnboom3 = 1;
		}
		$bombamount = $bombamount - 1;
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$health = $health - 3000;
	} else {
	}
if ($termnboom3 == 1) {
t6(); print colored('IIIIIIIIIIIIIIIIIIIIII','yellow on_white'); print color 'reset';
print colored("IBM®",'black on_white');print color 'reset';                                       #
print colored('IIIIIIIIIIIIIIIIIIIIII','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'bold black on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'bold black on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','yellow on_white'); t5(); print"\n";

t5(); print colored('     [1] [^] [3] [4] [x] [6] [7] [8] [9] [0]    ','bold black on_black'); t6(); print"\n";

t6(); print colored(' [TxX] [Q] [W] [!] [R] [T] [Y] [U] [>] [O] [P]  ','bold black on_black'); t5(); print"\n";

t5(); print colored('[Caps L^*c)] [A] [:] [D] [F] [<] [H] [J] [K] [L]','bold black on_black'); t6(); print"\n";

t6(); print colored('  [Sv&<t] [Z] [%] [C] [v] [B] [N] [M] [E^(ER]   ','bold black on_black'); t5(); print"\n";
} else {
t6(); print colored('IIIIIIIIIIIIIIIIIIIIII','bold white on_white'); print color 'reset';
print colored("IBM®",'blue on_white');print color 'reset';
print colored('IIIIIIIIIIIIIIIIIIIIII','bold white on_white'); t5(); print"\n";

if ($mainframe3b < 5) {
t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored(' Login: root                                ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored(' Password:                                  ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 
} else {
t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('               TERMINAL LOST                ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
}
t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','bold white on_white'); t5(); print"\n";
t5(); print colored("     [1] [2] [3] [4] [5] [6] [7] [8] [9] [0]    ",'white on_black'); t6(); print"\n";

t6(); print colored(" [Tab] [Q] [W] [E] [R] [T] [Y] [U] [I] [O] [P]  ",'white on_black'); t5(); print"\n";

t5(); print colored("[Caps Lock] [A] [S] [D] [F] [G] [H] [J] [K] [L] ",'white on_black'); t6(); print"\n";

t6(); print colored("  [Shift] [Z] [X] [C] [V] [B] [N] [M] [ENTER]   ",'white on_black'); t5(); print"\n";
}
$rsaroom_uzt4term = $rsaroom_uzt4term + 1;
}
#ROOM UZT4TERM END

#ROOM PADDUZV3
sub room_padduzu3 {
$roomauthor = "$name_mikeeusa";
$room = padduzu3;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_padduzu3 == 1) {
		$info = " You approach the door, it is locked. You notice";
		$info2 = "   a keypad to the eastern side of the it...    ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb, bad things happen     ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$padduzu3b = 1;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";
if ($padduzu3b == 1) {
t6(); print colored("XX    ",'bold white on_white'); 
print colored(" ^ / >< /   X  //   ^ >    X      ^<",'white on_black');
print colored("    XX",'bold white on_white'); t5(); print"\n";
} else {
t6(); print colored("XX    ",'bold white on_white'); 
print colored(" ENTER KEY SEQUENCE                 ",'green on_black');
print colored("    XX",'bold white on_white'); t5(); print"\n";
}

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

if ($padduzu3b == 1) {
t5(); print colored("XX                             ",'bold white on_white');
print colored("[>]  [<]  [9]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[X]  [>]  [>]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[/]  [2]  [^]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("     [X]     ",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";
} else {
t5(); print colored("XX                             ",'bold white on_white');
print colored("[7]  [8]  [9]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[4]  [5]  [6]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[1]  [2]  [3]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("     [0]     ",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";
}



t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",'bold white on_white'); t5(); print"\n";

t5(); print colored("                                                ",'bold white on_black'); t6(); print"\n";
t6(); print colored("                                                ",'bold white on_black'); t5(); print"\n";
$rsaroom_padduzu3 = $rsaroom_padduzu3 + 1;
}
#ROOM PADDUZU3 END

#ROOM UZV3
sub room_uzv3 {
$roomauthor = "$name_mikeeusa";
$room = uzv3;
$n = 1;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_uzv3 == 1) {
		$info = " To the north and south are white sliding doors ";
		$info2 = "         The hall continues westward            ";
		$ratbeing2_uzv3 = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb and suffer for it      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
wallunoa1d2w(); print"\n"; wallunoa1d1w(); print"\n"; longhall4(); print"\n"; longhall3(); print"\n"; 
longhall4(); print"\n"; longhall3(); print"\n"; longhall4(); print"\n"; wallunoa1d1w(); print"\n"; 
wallunoa1d2w(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";	
$ratbeing2_uzv3 = $ratbeing2_uzv3 + 1;

	if ($ratbeing2_uzv3 == 2) {			
		$info = "              A rat attacks you                 ";
		$info2 = "                                                ";
		ratbeing2_define();
		ratbeing2_exe();	
	} elsif ($ratbeing2_uzv3 >= 3) {
		ratbeing2_exe();
	} else {
	}
		
	if ($pincerbeing2_u2zv0 >= 2) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}
		
$rsaroom_uzv3 = $rsaroom_uzv3 + 1;
}
#ROOM UZV3 END

#ROOM UZV2
sub room_uzv2 {
$roomauthor = "$name_mikeeusa";
$room = uzv2;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = ' ';

	if ($rsaroom_uzv2 == 1) {
		$info = "       A staircase rises up before you...       ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb and suffer for it      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhallstepup2(); print"\n"; longhallstepup1(); print"\n"; 
longhallstepup2(); print"\n"; longhallstepup1(); print"\n"; longhallstepup2(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";	
		
	if ($pincerbeing2_u2zv0 >= 2) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}
	
$rsaroom_uzv2 = $rsaroom_uzv2 + 1;
}
#ROOM UZV2 END

#ROOM UZV1
sub room_uzv1 {
$roomauthor = "$name_mikeeusa";
$room = uzv1;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = ' ';

	if ($rsaroom_uzv1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb and suffer for it      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
if ($bombed_u2zv1 == 1) {
longhall1wide(); print"\n";
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall4uzv1(); print"\n"; longhall3uzv1(); print"\n"; 
longhall2uzv1(); print"\n"; longhall1uzv1(); print"\n"; longhall0uzv1(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; 
longhall1wide(); print"\n";	
} else {
longhall1wide(); print"\n";
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; 
longhall1wide(); print"\n";	
}
			
$rsaroom_uzv1 = $rsaroom_uzv1 + 1;
}
#ROOM UZV1 END

#ROOM UZU1
sub room_uzu1 {
$roomauthor = "$name_mikeeusa";
$room = uzu1;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = ' ';

	if ($rsaroom_uzu1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb and suffer for it      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
longhall1wide(); print"\n";
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; 
longhall1wide(); print"\n";	
			
$rsaroom_uzu1 = $rsaroom_uzu1 + 1;
}
#ROOM UZU1 END

#ROOM UZT1
sub room_uzt1 {
$roomauthor = "$name_mikeeusa";
$room = uzt1;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = ' ';

	if ($rsaroom_uzt1 == 1) {
		$info = '      The door to the east appears locked       ';
		$info2 = '                                                ';
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb and suffer for it      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
longhall1wideEDle(); print"\n";
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wideD(); print"\n"; 
longhall2wideD(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; 
longhall1wide(); print"\n";	
			
$rsaroom_uzt1 = $rsaroom_uzt1 + 1;
}
#ROOM UZT1 END

#ROOM UZW1
sub room_uzw1 {
$roomauthor = "$name_mikeeusa";
$room = uzw1;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = ' ';

	if ($rsaroom_uzt1 == 1) {
		$info = '                                                ';
		$info2 = '                                                ';
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "     You detonate a bomb and suffer for it      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
longhall1wide(); print"\n";
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; longhall1wide(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wideD(); print"\n"; longhall1wideD(); print"\n"; 
longhall2wide(); print"\n"; longhall1wide(); print"\n"; longhall2wide(); print"\n"; 
longhall1wideEDle(); print"\n";	
			
$rsaroom_uzw1 = $rsaroom_uzw1 + 1;
}
#ROOM UZW1 END

#ROOM U2ZV1
sub room_u2zv1 {
$roomauthor = "$name_mikeeusa";
$room = u2zv1;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
	if ($bombed_u2zv1 == 1) {
		$down = 1;
	} else {
		$down = 0;
	}

$read = ' ';

	if ($rsaroom_u2zv1 == 1) {
		$info = '    Underneath you there is a floor of glass.   ';
		$info2 = '   You can see a hallway through the glass.     ';
	} else {
		$info = '                                                ';
		$info2 = '                                                ';
	}
	
	if ($bombdetonate == 1) {
		if ($bombed_u2zv1 == 1) {
		$info = '     You detonate a bomb and suffer for it      ';
		$info2 = '                                                ';
		} else {
		$info = '             You detonate a bomb                ';
		$info2 = '         The glass floor shatters               ';
		$n = 0;
		$s = 0;
		$e = 0;
		$w = 0;
		$ne = 0;
		$nw = 0;
		$se = 0;
		$sw = 0;
		$up = 0;
		$down = 0;
		$room = uzv1;
		}
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
		$bombed_u2zv1 = 1;
	} else {
	}
	
if ($bombed_u2zv1 == 1) {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhallstepup4bg(); print"\n"; longhallstepup3bg(); print"\n"; 
longhallstepup2bg(); print"\n"; longhallstepup1bg(); print"\n"; longhallstepup0bg(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
} else {
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhallstepup4(); print"\n"; longhallstepup3(); print"\n"; 
longhallstepup4(); print"\n"; longhallstepup3(); print"\n"; longhallstepup4(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}
	
	if ($pincerbeing2_u2zv0 >= 2) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}
			
$rsaroom_u2zv1 = $rsaroom_u2zv1 + 1;
}
#ROOM U2ZV1 END

#ROOM U2ZV0
sub room_u2zv0 {
$roomauthor = "$name_mikeeusa";
$room = u2zv0;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = ' ';

	if ($rsaroom_u2zv0 == 1) {
		$info = '                                                ';
		$info2 = '                                                ';		
	} else {
		$info = '                                                ';
		$info2 = '                                                ';
	}
	
	if ($bombdetonate == 1) {
		$info = '     You detonate a bomb and suffer for it      ';
		$info2 = '                                                ';	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; wallunoa1(); print"\n"; longhall4(); print"\n"; longhall3(); print"\n"; 
longhall4(); print"\n"; longhall3(); print"\n"; longhall4(); print"\n"; wallunoa1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$pincerbeing2_u2zv0 = $pincerbeing2_u2zv0 + 1;
	if ($pincerbeing2_u2zv0 == 1) {			
		$info = '     Suddenly a dog lunges for your kneck!      ';
		$info2 = '                                                ';
		pincerbeing2_define();
		pincerbeing2_exe();
		$pincerbeing2_u2zv0 = $pincerbeing2_u2zv0 + 1;	
	} elsif ($pincerbeing2_u2zv0 >= 2) {
		pincerbeing2_exe();
	} else {
		#Waste Space
	}

$rsaroom_u2zv0 = $rsaroom_u2zv0 + 1;
}
#ROOM U2ZV0 END

#ROOM UZW3
sub room_uzw3 {
$roomauthor = "$name_mikeeusa";
$room = uzw3;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
#down var found down there:

$read = " ";

	if ($rsaroom_uzw3 == 1) {
		if ($ancientredbook == 1) {
			$info = "  This room houses what your ancient red book   ";
			$info2 = "   describes as a mainframe computer system...  ";
		} else {
			$info = "                                                ";
			$info2 = "                                                ";
		}	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "               You detonate a bomb              ";
		$info2 = "                                                ";
		$mainframeb = $mainframeb + 1;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
	if ($mainframeb == 7) {
		$info = " There appears to be a conduit under the ruins  ";
		$info2 = "               of the mainframe                 ";	
	} else {
		###hablar!!!
	}
nothing1wall(); print"\n";
wallunoa1d2w(); print"\n"; wallunoa1d1w(); print"\n"; mainframefl2(); print"\n"; mainframefl3(); print"\n"; 
mainframefl4(); print"\n"; mainframefl1(); print"\n"; 

if ($mainframeb == 0) {
mainframe0(); print"\n"; mainframe1(); print"\n"; 
mainframe2(); print"\n"; mainframe3(); print"\n"; mainframe2(); print"\n";
$down = 0;
} elsif ($mainframeb == 1) {
mainframe0b(); print"\n"; mainframe1b(); print"\n"; 
mainframe2(); print"\n"; mainframe3(); print"\n"; mainframe2(); print"\n";
$down = 0;
} elsif ($mainframeb == 2) {
mainframe0bb(); print"\n"; mainframe1bb(); print"\n"; 
mainframe2bb(); print"\n"; mainframe3(); print"\n"; mainframe2(); print"\n";
$down = 0;
} elsif ($mainframeb == 3) {
mainframe0bbb(); print"\n"; mainframe1bbb(); print"\n"; 
mainframe2bbb(); print"\n"; mainframe3bbb(); print"\n"; mainframe2(); print"\n";
$down = 0;
} elsif ($mainframeb == 4) {
mainframe0bbbb(); print"\n"; mainframe1bbbb(); print"\n"; 
mainframe2bbbb(); print"\n"; mainframe3bbbb(); print"\n"; mainframe4bbbb(); print"\n";
$down = 0;
$mainframebroke = 1;
} elsif ($mainframeb == 5) {
mainframe0bbbbb(); print"\n"; mainframe1bbbbb(); print"\n"; 
mainframe2bbbbb(); print"\n"; mainframe3bbbbb(); print"\n"; mainframe4bbbbb(); print"\n";
$down = 0;
$mainframebroke = 1;
} elsif ($mainframeb == 6) {
mainframe0bbbbbb(); print"\n"; mainframe1bbbbbb(); print"\n"; 
mainframe2bbbbbb(); print"\n"; mainframe3bbbbbb(); print"\n"; mainframe4bbbbbb(); print"\n";
$down = 0;
$mainframebroke = 1;
} elsif ($mainframeb == 7) {
mainframe0bbbbbbb(); print"\n"; mainframe1bbbbbbb(); print"\n"; 
mainframe2bbbbbbb(); print"\n"; mainframe3bbbbbbb(); print"\n"; mainframe4bbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
} elsif ($mainframeb == 8) {
mainframe0bbbbbbbb(); print"\n"; mainframe1bbbbbbbb(); print"\n"; 
mainframe2bbbbbbbb(); print"\n"; mainframe3bbbbbbbb(); print"\n"; mainframe4bbbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
} elsif ($mainframeb == 9) {
mainframe0bbbbbbbbb(); print"\n"; mainframe1bbbbbbbbb(); print"\n"; 
mainframe2bbbbbbbbb(); print"\n"; mainframe3bbbbbbbbb(); print"\n"; mainframe4bbbbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
} elsif ($mainframeb == 10) {
mainframe0bbbbbbbbbb(); print"\n"; mainframe1bbbbbbbbbb(); print"\n"; 
mainframe2bbbbbbbbbb(); print"\n"; mainframe3bbbbbbbbbb(); print"\n"; mainframe4bbbbbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
} elsif ($mainframeb == 11) {
mainframe0bbbbbbbbbbb(); print"\n"; mainframe1bbbbbbbbbbb(); print"\n"; 
mainframe2bbbbbbbbbbb(); print"\n"; mainframe3bbbbbbbbbbb(); print"\n"; mainframe4bbbbbbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
} elsif ($mainframeb == 12) {
mainframe0bbbbbbbbbbbb(); print"\n"; mainframe1bbbbbbbbbbbb(); print"\n"; 
mainframe2bbbbbbbbbbbb(); print"\n"; mainframe3bbbbbbbbbbbb(); print"\n"; mainframe4bbbbbbbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
} else {
mainframe0bbbbbbbbbbbb(); print"\n"; mainframe1bbbbbbbbbbbb(); print"\n"; 
mainframe2bbbbbbbbbbbb(); print"\n"; mainframe3bbbbbbbbbbbb(); print"\n"; mainframe4bbbbbbbbbbbb(); print"\n";
$down = 1;
$mainframebroke = 1;
}

mainframewall1(); print"\n"; 
mainframewall2(); print"\n"; mainframewall3(); print"\n"; mainframewall4(); print"\n"; 
wallunoa1(); print"\n";	
$rsaroom_uzw3 = $rsaroom_uzw3 + 1;
}
#ROOM UZW3 END


#ROOM CONZW3
sub room_conzw3 {
$roomauthor = "$name_mikeeusa";
$room = conzw3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
#up down thar
$down = 0;

$read = " ";
	if ($rsaroom_conzw3 == 1) {
		$info = "                  Cables...                     ";
		$info2 = "                                                ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb in a very small compartment";
		$info2 = "                   Hrm...                       ";
		$health = $health - 200;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
conduit1dk(); print"\n";
conduit2dk(); print"\n"; conduit3dk(); print"\n"; conduit6dk(); print"\n"; conduit5dk(); print"\n"; 
conduit6dk(); print"\n"; conduit7dk(); print"\n";
	if ($mainframeb > 5) {
	conduit10transw(); print"\n"; conduit9lt(); print"\n";
	conduit10lt(); print"\n"; conduit9trans(); print"\n";
	$up = 1; 
	} else {
	conduit10dkw(); print"\n"; conduit9dk(); print"\n"; 
	conduit10dkw(); print"\n"; conduit9dk(); print"\n";
	$up = 0;
	}
conduit10dk(); print"\n"; conduit9dk(); print"\n"; 
conduit10dk(); print"\n"; conduit9dk(); print"\n"; conduit10dk(); print"\n"; 
conduit9dk(); print"\n";
$rsaroom_conzw3 = $rsaroom_conzw3 + 1;
}
#ROOM CONZW3 END

#ROOM CONZV3
sub room_conzv3 {
$roomauthor = "$name_mikeeusa";
$room = conzv3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";
	if ($rsaroom_conzv3 == 1) {
		$info = "               More Cables...                   ";
		$info2 = "                                                ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb in a very small compartment";
		$info2 = "                   Hrm...                       ";
		$health = $health - 200;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n";
conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; 
conduit18dk(); print"\n"; conduit15dk(); print"\n";
conduit14dk(); print"\n"; conduit11dk(); print"\n"; 
conduit2dk(); print"\n"; conduit1dk(); print"\n"; conduit2dk(); print"\n"; 
conduit1dk(); print"\n";
$rsaroom_conzv3 = $rsaroom_conzv3 + 1;
}
#ROOM CONZV3 END

#ROOM CONZU3
sub room_conzu3 {
$roomauthor = "$name_mikeeusa";
$room = conzu3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 1;
$down = 0;

$read = " ";
	if ($rsaroom_conzu3 == 1) {
		$info = "         There is a grate above you...          ";
		$info2 = "It appears to be loose, you see no screws around";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb in a very small compartment";
		$info2 = "The explosion erupts up through the grate above ";
		$health = $health - 200;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n";
conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19trans(); print"\n";
conduit20lt(); print"\n"; conduit19lt(); print"\n"; 
conduit20trans(); print"\n"; conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n"; 
conduit19dk(); print"\n";
$rsaroom_conzu3 = $rsaroom_conzu3 + 1;
}
#ROOM CONZU3 END

#ROOM CONZT3
sub room_conzt3 {
$roomauthor = "$name_mikeeusa";
$room = conzt3;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";
	if ($rsaroom_conzt3 == 1) {
		$info = '                                                ';
		$info2 = '                                                ';	
	} else {
		$info = '                                                ';
		$info2 = '                                                ';
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb in a very small compartment";
		$info2 = "                   Hrm...                       ";		
		$health = $health - 200;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n";
conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n"; 
conduit19dk(); print"\n";
$rsaroom_conzt3 = $rsaroom_conzt3 + 1;
}
#ROOM CONZT3 END

#ROOM CONZS3
sub room_conzs3 {
$roomauthor = "$name_mikeeusa";
$room = conzs3;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";
	if ($rsaroom_conzs3 == 1) {
		$info = '                                                ';
		$info2 = '                                                ';	
	} else {
		$info = '                                                ';
		$info2 = '                                                ';
	}
	
	if ($bombdetonate == 1) {
		$info = "    You detonate a bomb in small compartment    ";
		$info2 = "                     ...                        ";		
		$health = $health - 170;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n";
nothing1wall(); print"\n"; 
conduit26dk(); print"\n"; conduit25dk(); print"\n";
conduit24dk(); print"\n"; conduit21dk(); print"\n"; 
conduit22dk(); print"\n"; conduit23dk(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n"; 
conduit19dk(); print"\n";
$rsaroom_conzs3 = $rsaroom_conzs3 + 1;
}
#ROOM CONZS3 END

#ROOM CONZS2
sub room_conzs2 {
$roomauthor = "$name_mikeeusa";
$room = conzs2;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";
	if ($rsaroom_conzs2 == 1) {
		$info = '                                                ';
		$info2 = '                                                ';	
	} else {
		$info = '                                                ';
		$info2 = '                                                ';
	}
	
	if ($bombdetonate == 1) {
		$info = "    You detonate a bomb in small compartment    ";
		$info2 = "                     ...                        ";		
		$health = $health - 170;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n";
nothing1wall(); print"\n"; 
conduit26dk(); print"\n"; conduit25dk(); print"\n";
conduit28dk(); print"\n"; conduit27dk(); print"\n"; 
conduit30dk(); print"\n"; conduit29dk(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_conzs2 = $rsaroom_conzs2 + 1;
}
#ROOM CONZS2 END

#ROOM CONZS1
sub room_conzs1 {
$roomauthor = "$name_mikeeusa";
$room = conzs1;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 1;
$down = 0;

$read = " ";
	if ($rsaroom_conzs1 == 1) {
		$info = '                                                ';
		$info2 = '                                                ';	
	} else {
		$info = '                                                ';
		$info2 = '                                                ';
	}
	
	if ($bombdetonate == 1) {
		$info = ' You detonate a bomb, the blast erupts through  ';
		$info2 = ' the grate above... you seem to lack a cadaver  ';		
		$health = $health - 150;
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n";
nothing1wall(); print"\n"; 
conduit26trans(); print"\n"; conduit25trans(); print"\n";
conduit24trans(); print"\n"; conduit21trans(); print"\n"; 
conduit22trans(); print"\n"; conduit23trans(); print"\n";
conduit20dk(); print"\n"; conduit19dk(); print"\n"; 
conduit20dk(); print"\n"; conduit19dk(); print"\n"; conduit20dk(); print"\n"; 
conduit19dk(); print"\n";
$rsaroom_conzs1 = $rsaroom_conzs1 + 1;
}
#ROOM CONZS1 END

#ROOM KEYUZZ4 (Computer)
sub room_keyuzw4 {
$roomauthor = "$name_mikeeusa";
$room = keyuzw4;
$read = " ";

	if ($rsaroom_keyuzw4 == 1) {
		if ($ancientredbook == 1) {
			$info = " You approach the large metal door and notice an";
			$info2 = "   electronic keypad to the left side of it     ";
		} else {
			$info = " You approach the large metal door and notice a ";
			$info2 = "       peculiar device to the left of it        ";
		}
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		if ($keyuzw4bombed == 0) {
			$info = "You detonate a bomb, the intense heat melts the ";
			$info2 = "       keypad and scorches your face badly      ";
			$keyuzw4bombed = 1;
		} else {
			$info = "      You detonate a bomb, you are burned       ";
			$info2 = "                                                ";		
		}
		$keyuzw4keyfuze = 1;
		$health = $health - 37;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}

#$keyuzw4keyfuze
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;



t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";
if ($keyuzw4keyfuze == 1) {
t6(); print colored("XX    ",'bold white on_white'); 
print colored(" ^ / >< /   X  //   ^ >    X      ^<",'white on_black');
print colored("    XX",'bold white on_white'); t5(); print"\n";
} else {
t6(); print colored("XX    ",'bold white on_white'); 
print colored(" ENTER KEY SEQUENCE                 ",'green on_black');
print colored("    XX",'bold white on_white'); t5(); print"\n";
}

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

if ($keyuzw4keyfuze == 1) {
t5(); print colored("XX                             ",'bold white on_white');
print colored("[>]  [<]  [9]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[X]  [>]  [>]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[/]  [2]  [^]",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("     [X]     ",'bold white on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";
} else {
t5(); print colored("XX                             ",'bold white on_white');
print colored("[7]  [8]  [9]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[4]  [5]  [6]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("[1]  [2]  [3]",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                             ",'bold white on_white');
print colored("     [0]     ",'black on_white');
print colored("  XX",'bold white on_white'); t6(); print"\n";
}



t6(); print colored("XX                                            XX",'bold white on_white'); t5(); print"\n";

t5(); print colored("XX                                            XX",'bold white on_white'); t6(); print"\n";

t6(); print colored("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",'bold white on_white'); t5(); print"\n";

t5(); print colored("                                                ",'bold white on_black'); t6(); print"\n";
t6(); print colored("                                                ",'bold white on_black'); t5(); print"\n";
$rsaroom_keyuzw4 = $rsaroom_keyuzw4 + 1;
}
#ROOM KEYUZZ4 END



#ROOM UZW4 (Computer)
sub room_uzw4 {
$roomauthor = "$name_mikeeusa";
$room = uzw4;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

if ($termnboom == 1) {
	$read = ' ';
} else {
	$read = '[Post-It Note] 12345';
}

	if ($rsaroom_uzw4 == 1) {
		if ($mainframebroke == 1) {
			$info = "                                                ";
			$info2 = "                                                ";		
		} else {
			$info = "      You sit down at the computer terminal     ";
			$info2 = "      You feel it wants something of you...     ";
		}
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb, it explodes shattering the";
		$info2 = "terminal CRT and sending glass through your dome";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$bodypart_head = 0;
		$health = $health - 30000;		
		$termnboom = 1;
	} else {
	}

if ($termnboom == 1) {
t6(); print colored('IIIIIIIIIIIIIIIIIIIIII','yellow on_white'); print color 'reset';
print colored("IBM®",'black on_white');print color 'reset';                                       #
print colored('IIIIIIIIIIIIIIIIIIIIII','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'bold black on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'bold black on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','yellow on_white'); t5(); print"\n";

} else {
#start                                           
t6(); print colored('IIIIIIIIIIIIIIIIIIIIII','bold white on_white'); print color 'reset';
print colored("IBM®",'blue on_white');print color 'reset';
                                       #
print colored('IIIIIIIIIIIIIIIIIIIIII','bold white on_white'); t5(); print"\n";

#decssness
if ($mainframebroke == 1) {
t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('               TERMINAL LOST                ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
} elsif ($decssreadlessterm == 1) {
t5(); print colored('II','bold white on_white'); 
print colored('efdtt.c in 7-bit ascii equivalent (eight or ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('leading bit is zero) view string of bits as ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('a single number:                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('94547005113906444550092967769278693366458905','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('02228978714950867838050065854710787768896313','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('32008164474758659031815003982230694217016824','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('69846895352775062933280780994198564105265333','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('45462508431400687465514095102042852544126482','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('04329860820006786692228727213507897567520105','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('60690079446509850383148101390483994796016226','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('10063536383842243246104161389920712851872208','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
$decssreadlessterm = 2;
} elsif ($decssreadlessterm == 2) {
t5(); print colored('II','bold white on_white'); 
print colored('87216563644799238515948762313652638660130983','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('56062871257185310658090233647322143645842184','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('22362536427009555723914211655124112039883768','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('22434289242349301261741816124630344157782839','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('80959764368524689078864161430654527689567152','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('45947770873346440144695871931815760877677825','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('73341499418826508606688418599672379789376667','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('80682566994676099876979345083447022603175841','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('33049261446761328219972912140993355969457407','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('49901115409148661355366182105603580400141122','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('75153295692243935821889493881197110565594118','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
$decssreadlessterm = 3;
} elsif ($decssreadlessterm == 3) {
t5(); print colored('II','bold white on_white'); 
print colored('52982478723859225405257720734123557637234111','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('7844388725202230195764060843081469          ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:~$                        ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
$decssreadlessterm = 0;
} elsif ($notereadlessterm == 1 && $uzw4passwdset == 0) {
t5(); print colored('II','bold white on_white'); 
print colored('Dear Hoe:                                   ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('      I wish to inform you of my current job','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('status: Almost gone. Because of you and your','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored('gossip I will now be living in the street,  ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('dishonorably discharged. Prepare to be as my','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('my job almost is; that is to say the next   ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('time I lay eyes upon you I shall pull an AK ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('off tha shelf and cap yo punk bitch ass,foo.','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('            Your Loving EX-Husband Nickolas ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('PS: Thugg LIFE!                             ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
$notereadlessterm = 0;
} elsif ($uzw4psauxt == 1 && $uzw4passwdset == 0) {
$kill9a = int(rand(9));
$kill9b = int(rand(9));
$kill9c = int(rand(9));
$kill9d = int(rand(9));
t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$ ps aux                  ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('USER       PID  %CPU %MEM TTY   STAT COMMAND','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored("techadmin  $kill9pid 0.0  0.1 tty24 S    sh     ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored("techadmin  3$kill9a$kill9b$kill9c$kill9d 0.0  0.2 tty24 S    ps aux ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
$uzw4psauxt = 0;
} elsif ($uzw4psauxt == 2 && $uzw4passwdset == 0) {
$kill9a = int(rand(9));
$kill9b = int(rand(9));
$kill9c = int(rand(9));
$kill9d = int(rand(9));
t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$ ps                      ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('  PID TTY          TIME CMD                 ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 

t6(); print colored('II','bold white on_white'); 
print colored("$kill9pid tty24    00:00:00 sh                  ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored("3$kill9a$kill9b$kill9c$kill9d tty24    00:00:00 ps                  ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
$uzw4psauxt = 0;
} elsif ($uzw4psauxt == 3 && $uzw4passwdset == 0) {
t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$ pwd                     ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

if ($termdir eq '~') {
t5(); print colored('II','bold white on_white'); 
print colored('/home/techadmin                             ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
} elsif ($termdir eq '../~') {
t5(); print colored('II','bold white on_white'); 
print colored('/home                                       ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
} elsif ($termdir eq '/home/supervisor') {
t5(); print colored('II','bold white on_white'); 
print colored('/home/supervisor                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
} else {
t5(); print colored('II','bold white on_white'); 
print colored('42                                          ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n"; 
}

t6(); print colored('II','bold white on_white'); 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
$uzw4psauxt = 0;
} else {

#regular
t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";
if ($uzw4passwdset == 1) {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$ passwd                  ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' Changing password for techadmin            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' (new) UNIX password:                       ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";
} elsif ($uzw4passwdset == 2) {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' password updated sucessfully               ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset';
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";
$uzw4passwdset = 0;
} elsif ($uzw4listterm == 1 && $termdir eq '~') {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$ ls                      ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' decss.txt                                  ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";
$uzw4listterm = 0;
} elsif ($uzw4listterm == 1 && $termdir eq '../~') {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$ ls                      ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin supervisor                       ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";
$uzw4listterm = 0;
} elsif ($uzw4listterm == 1 && $termdir eq '/home/supervisor') {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$ ls                      ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' lettertoex.txt dxmpass.txt                 ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";
$uzw4listterm = 0;
} elsif ($notereadlessterm2 == 1) {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(" Reactor  Access  Code: $keyuzs4padnumber        ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' Tech Admin Login Pass: 12345               ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";
$notereadlessterm2 = 0;
} elsif ($uzw4passwordputer == 1) {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' techadmin@mfrpg1:$                         ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored('                                            ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

} else {
t6(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(' Login: techadmin                           ','green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); print color 'reset'; 
print colored(" Password:                                  ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";

}


t5(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  

t6(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t5(); print"\n";  

t5(); print colored('II','bold white on_white'); 
print colored("                                            ",'green on_black');
print colored('II','bold white on_white'); t6(); print"\n";  
}                                                                   

#end and keyboard
t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','bold white on_white'); t5(); print"\n";
}

if ($termnboom == 1) {
t5(); print colored('     [1] [^] [3] [4] [x] [6] [7] [8] [9] [0]    ','bold black on_black'); t6(); print"\n";

t6(); print colored(' [TxX] [Q] [W] [!] [R] [T] [Y] [U] [>] [O] [P]  ','bold black on_black'); t5(); print"\n";

t5(); print colored('[Caps L^*c)] [A] [:] [D] [F] [<] [H] [J] [K] [L]','bold black on_black'); t6(); print"\n";

t6(); print colored('  [Sv&<t] [Z] [%] [C] [v] [B] [N] [M] [E^(ER]   ','bold black on_black'); t5(); print"\n";
} else {
t5(); print colored("     [1] [2] [3] [4] [5] [6] [7] [8] [9] [0]    ",'white on_black'); t6(); print"\n";

t6(); print colored(" [Tab] [Q] [W] [E] [R] [T] [Y] [U] [I] [O] [P]  ",'white on_black'); t5(); print"\n";

t5(); print colored("[Caps Lock] [A] [S] [D] [F] [G] [H] [J] [K] [L] ",'white on_black'); t6(); print"\n";

t6(); print colored("  [Shift] [Z] [X] [C] [V] [B] [N] [M] [ENTER]   ",'white on_black'); t5(); print"\n";
}
$rsaroom_uzw4 = $rsaroom_uzw4 + 1;
}
#ROOM uzw4 END


#ROOM SZZ0 (Indust Elevator)
sub room_szz0 {
$roomauthor = "$name_mikeeusa";
$room = szz0;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_szz0 == 1) {
		$info = "You enter into a small room with a metalic floor";
		$info2 = "        Your ears pick up a faint click         ";
		$szz0levelin = 0;
	} elsif ($rsaroom_szz0 == 2) {
		$info = "      You hear a wirr...   You feel             ";
		$info2 = " the room rocket upwards at incredible speed!!! ";
		$szz0levelin = 1;	
	} else {
		if ($szz0levelin == 1) {
		$info = "              The room decends                  ";
		$info2 = "                                                ";
		$szz0levelin = 0;
		} elsif ($szz0levelin == 0) {
		$info = "         The room accelerates upwards           ";
		$info2 = "                                                ";
		$szz0levelin = 1;
		} else {
		}
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it blows up the elevator ";
		$info2 = "                 along with you                 ";
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$bodypart_armR = 0;
		$bodypart_armL = 0;
		$bodypart_chest = 0;
		$bodypart_torso = 0;
		$bodypart_legR = 0;
		$bodypart_legL = 0;
		$health = $health - 30000;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
$rsaroom_szz0 = $rsaroom_szz0 + 1;
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; elevator2(); print"\n"; floorele1(); print"\n"; floorele2(); print"\n"; 
floorele1(); print"\n"; floorele2(); print"\n"; floorele1(); print"\n"; floorele2(); print"\n"; 
floorele1(); print"\n"; floorele2(); print"\n"; floorele1(); print"\n"; 
elevator1(); print"\n"; 
}

#ROOM lav0 (lavishhall0)
sub room_lav0 {
$roomauthor = "$name_mikeeusa";
$room = lav0;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lav0 == 1) {
		$info = "You are amazed at what you see before your eyes ";
		$info2 = "  A wide and luxurious hall lies ahead of you   ";
	} elsif ($rsaroom_lav0 == 2) {
		$info = "The floor is covered in a red velvet rug and the";
		$info2 = "walls are inlayed with gold, silver and platinum";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}

 	if ($bombdetonate == 1) {
			if ($ancientredbook == 1) {
				$burnredbook = int(rand(3));
				if ($burnredbook == 2) {
					$info = "You detonate a bomb, it singes the carpet, burns";
					$info2 = "your leg and turns your ancient red book to dust";
					$ancientredbook = 0;
				} else {
					$info = "  You detonate a bomb, it singes the carpet and ";
					$info2 = "                burns your leg                  ";
				}
			} else {
			$info = "  You detonate a bomb, it singes the carpet and ";
			$info2 = "                burns your leg                  ";
			}
		$health = $health - 11;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
		
$rsaroom_lav0 = $rsaroom_lav0 + 1;
nothing1wall(); print"\n";
nothing2wall(); print"\n"; lavishwall1(); print"\n"; lavishtrim2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
lavishtrim4(); print"\n"; lavishwall3(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 
}

#ROOM lav1 (lavishhall1)
sub room_lav1 {
$roomauthor = "$name_mikeeusa";
$room = lav1;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lav1 == 1) {
		$info = "       To your north is a familiar sight...     ";
		$info2 = "                                                ";	
		$catbeing1_lav1 = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
 	if ($bombdetonate == 1) {
			if ($ancientredbook == 1) {
				$burnredbook = int(rand(3));
				if ($burnredbook == 3) {
					$info = "You detonate a bomb, it singes the carpet, burns";
					$info2 = "your leg and turns your ancient red book to dust";
					$ancientredbook = 0;
				} else {
					$info = "  You detonate a bomb, it singes the carpet and ";
					$info2 = "                burns your leg                  ";
				}
			} else {
			$info = "  You detonate a bomb, it singes the carpet and ";
			$info2 = "                burns your leg                  ";
			}
		$health = $health - 11;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
$rsaroom_lav1 = $rsaroom_lav1 + 1;
nothing1wall(); print"\n";
lavishwall11(); print"\n"; lavishwall10(); print"\n"; lavishtrim2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
lavishtrim4(); print"\n"; lavishwall3(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 

	if ($catbeing1rand == 2) {
		$catbeing1_lav1 = $catbeing1_lav1 + 1;
		if ($catbeing1_lav1 == 2) {			
			$info = "              You are attacked!                 ";
			$info2 = "                                                ";
			catbeing1_define();
			catbeing1_exe();	
		} elsif ($catbeing1_lav1 >= 3) {
			catbeing1_exe();
		} else {
		}
	} else {
	}

}
#ROOM lav1 END

#ROOM lav2 (lavishhall1)
sub room_lav2 {
$roomauthor = "$name_mikeeusa";
$room = lav2;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lav2 == 1) {
		$info = "         The walls are SHINY oooooohhh          ";
		$info2 = "                                                ";
	} elsif ($rsaroom_lav2 == 2) {
		$info = "        You feel the impulse to STEAL!!!!....   ";
		$info2 = "                                                ";
	} elsif ($rsaroom_lav2 == 3) {
		$info = " Your desire to commit theft is quelled as you  ";		
		$info2 = "suddenly recall that stealing equals terrorism!!";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
 	if ($bombdetonate == 1) {
			if ($ancientredbook == 1) {
				$burnredbook = int(rand(3));
				if ($burnredbook == 3) {
					$info = " You detonate a bomb,the carpet caches fire and ";
					$info2 = "burns your leg. Your red book has been destroyed";
					$ancientredbook = 0;
				} else {
					$info = "  You detonate a bomb, it singes the carpet and ";
					$info2 = "                burns your leg                  ";
				}
			} else {
			$info = "  You detonate a bomb, it singes the carpet and ";
			$info2 = "                burns your leg                  ";
			}
		$health = $health - 11;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
$rsaroom_lav2 = $rsaroom_lav2 + 1;
nothing1wall(); print"\n";
nothing2wall(); print"\n"; lavishwall6(); print"\n"; lavishtrim4(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
lavishtrim4(); print"\n"; lavishwall3(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 
}
#ROOM lav2 END

#ROOM lav3 (lavishhall1)
sub room_lav3 {
$roomauthor = "$name_mikeeusa";
$room = lav3;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lav3 == 1) {
		$info = "         To the south are two oak doors         ";
		$info2 = "    A plaque above them reads: Study Lounge     ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
 	if ($bombdetonate == 1) {
			if ($ancientredbook == 1) {
				$burnredbook = int(rand(3));
				if ($burnredbook == 3) {
					$info = " You detonate a bomb,the carpet caches fire and ";
					$info2 = "burns your leg. Your red book has been destroyed";
					$ancientredbook = 0;
				} else {
					$info = "  You detonate a bomb, it singes the carpet and ";
					$info2 = "                burns your leg                  ";
				}
			} else {
			$info = "  You detonate a bomb, it singes the carpet and ";
			$info2 = "                burns your leg                  ";
			}
		$health = $health - 11;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
$rsaroom_lav3 = $rsaroom_lav3 + 1;
nothing1wall(); print"\n";
nothing2wall(); print"\n"; lavishwall3(); print"\n"; lavishtrim4(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
lavishtrim6(); print"\n"; lavishwall5(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}
#ROOM lav3 END

#ROOM lbv3 (lavishstudy)
sub room_lbv3 {
$roomauthor = "$name_mikeeusa";
$room = lbv3;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "roomlbvtrg";

	if ($rsaroom_lbv3 == 1) {
		$info = "      There is a bookshelf to the south...      ";
		$info2 = "                                                ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
 	if ($bombdetonate == 1) {
		$health = $health - 3;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
$rsaroom_lbv3 = $rsaroom_lbv3 + 1;
nothing1wall(); print"\n";
nothing2wall(); print"\n"; lavishwall7(); print"\n"; lavishstdy2(); print"\n"; lavishstdy1(); print"\n"; 
lavishstdy2(); print"\n"; lavishstdy1(); print"\n"; lavishstdy2(); print"\n"; lavishstdy1(); print"\n"; 
lavishstdy2(); print"\n"; lavishstdy1(); print"\n"; lavishstdy4(); print"\n"; lavishwall9(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
}
#ROOM lbv3 END

#ROOM lavm1 (lavishhall1)
sub room_lavm1 {
$roomauthor = "$name_mikeeusa";
$room = lavm1;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lavm1 == 1) {
		$info = " The faint sound of classical music captivates  ";
		$info2 = "      your being for a fleeting second...       ";
	} elsif ($rsaroom_lavm1 == 2) {
		$info = " You hear naught a sound sans your footsteps and";
		$info2 = "                   the music                    ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
 	if ($bombdetonate == 1) {
			if ($ancientredbook == 1) {
				$burnredbook = int(rand(3));
				if ($burnredbook == 3) {
					$info = "You detonate a bomb, it singes the carpet, burns";
					$info2 = "your leg and turns your ancient red book to dust";
					$ancientredbook = 0;
				} else {
					$info = "  You detonate a bomb, it singes the carpet and ";
					$info2 = "                burns your leg                  ";
				}
			} else {
			$info = "  You detonate a bomb, it singes the carpet and ";
			$info2 = "                burns your leg                  ";
			}
		$health = $health - 11;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
$rsaroom_lavm1 = $rsaroom_lavm1 + 1;
nothing1wall(); print"\n";
nothing2wall(); print"\n"; lavishwall3(); print"\n"; lavishtrim4(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
carpetred2(); print"\n"; carpetred1(); print"\n"; carpetred2(); print"\n"; carpetred1(); print"\n"; 
lavishtrim4(); print"\n"; lavishwall3(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 
}
#ROOM lavm1 END


#ROOM lavm2 (lavishhallend)
sub room_lavm2 {
$roomauthor = "$name_mikeeusa";
$room = lavm2;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lavm2 == 1) {
		$info = "You come to the end of the hall, there are doors";
		$info2 = " to the north and south, the floor is marble... ";
	} elsif ($rsaroom_lavm2 == 2) {
		$info = " The marble is polished and reflects your image ";
		$info2 = "  as you gaze at it, hmm your hair is a mess    ";
	} elsif ($rsaroom_lavm2 == 3) {
		$info = "   The music you heard seems to be coming from  ";
		$info2 = "      behind the massive northern oak door      ";					
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it shatters some of the  ";
		$info2 = "       marble floor but you escape unscaved     ";
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}	
 	
 	
$rsaroom_lavm2 = $rsaroom_lavm2 + 1;
endlavwall1(); print"\n";
endlavtrim2(); print"\n"; endlavmid1(); print"\n"; endlavmid2(); print"\n"; endlavmid1b(); print"\n"; 
endlavmid2b(); print"\n"; endlavmid1c(); print"\n"; endlavmid2c(); print"\n"; endlavmid1b(); print"\n"; 
endlavmid2d(); print"\n"; endlavmid1d(); print"\n"; endlavmid2b(); print"\n"; endlavmid1x(); print"\n"; 
endlavmid2x(); print"\n"; endlavmid1y(); print"\n"; endlavtrim2(); print"\n"; 
endlavwall1(); print"\n"; 
}
#ROOM lavm2 END

#ROOM lzvm2
sub room_lzvm2 {
$roomauthor = "$name_mikeeusa";
$room = lzvm2;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lzvm2 == 1) {
		$info = "   You enter a small hall with a large mirror   ";
		$info2 = "  to the west... The music seems a bit louder   ";	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}

 	if ($bombdetonate == 1) {
			if ($ancientredbook == 1) {
				$burnredbook = int(rand(3));
				if ($burnredbook == 2) {
					$info = "You detonate a bomb, it singes the carpet, burns";
					$info2 = "   you and turns your ancient red book to dust  ";
					$ancientredbook = 0;
				} else {
					$info = "  You detonate a bomb, it singes the carpet and ";
					$info2 = "                  burns you                     ";
				}
			} else {
			$info = "  You detonate a bomb, it singes the carpet and ";
			$info2 = "                  burns you                     ";
			}
		$health = $health - 20;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}

nothing1wall(); print"\n";
nothing2wall(); print"\n"; lvforwall1b(); print"\n"; lvforwall2a(); print"\n"; lvforwall1(); print"\n"; 
lvforwall2(); print"\n"; lvforwall1c(); print"\n"; lvforwall2c(); print"\n"; lvforwall1c(); print"\n"; 
lvforwall2c(); print"\n"; lvforwall1(); print"\n"; lvforwall2(); print"\n"; lvforwall1a(); print"\n"; 
lvforwall2b(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";		
$rsaroom_lzvm2 = $rsaroom_lzvm2 + 1;
}

#ROOM lzv1
sub room_lzv1 {
$roomauthor = "$name_mikeeusa";
$room = lzv1;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_lzv1 == 1) {
		$info = "Ah! You know these well. Slot machines scavenged";
		$info2 = "from the ruins of yore preside in many a tavern.";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You detonate a bomb, and suffer great injurys...";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30000;
	} else {
	}

	if ($spjackpot == 1) {
		$info = "           SUPERJACKPOT!!! WOOT!!!              ";
		$info2 = "            You won 100,000GP!                  ";		
		$spjackpot = 0;
	} elsif ($spjackpot == 2) {
		$info = "             You won 25,000GP!                  ";
		$info2 = "                                                ";		
		$spjackpot = 0;
	} elsif ($spjackpot == 3) {
		$info = "              You won 3,000GP!                  ";
		$info2 = "                                                ";		
		$spjackpot = 0;
	} elsif ($spjackpot == 4) {
		$info = "               You won 600GP!                   ";
		$info2 = "                                                ";		
		$spjackpot = 0;						
	} elsif ($jackpot == 1) {
		$info = "              JACKPOT!!! WOOT!!!                ";
		$info2 = "             You won 10,000GP!                  ";
		$jackpot = 0;
	} elsif ($jackpot2 == 1) {
		$info = "          Triple BAR! You won 1000GP!           ";
		$info2 = "                                                ";
		$jackpot2 = 0;
	} elsif ($jackpot3 == 1) {
		$info = '            Triple $ You won 300GP              ';
		$info2 = "                                                ";
		$jackpot3 = 0;
	} elsif ($jackpot4 == 1) {
		$info = "                 You won 80GP                   ";
		$info2 = "                                                ";
		$jackpot4 = 0;
	} elsif ($jackpot5 == 1) {
		$info = "                 You won 10GP                   ";
		$info2 = "                                                ";
		$jackpot5 = 0;							
	} elsif ($jackpot6 == 1) {
		$info = "                  You won 5GP                   ";
		$info2 = "                                                ";
		$jackpot6 = 0;
	} elsif ($jackpot7 == 1) {
		$info = "                 You won 20GP                   ";
		$info2 = "                                                ";
		$jackpot7 = 0;
	} elsif ($jackpot8 == 1) {
		$info = "                 You won 15GP                   ";
		$info2 = "                                                ";
		$jackpot8 = 0;							
	} elsif ($jackpot9 == 1) {
		$info = "                  You won 7GP                   ";
		$info2 = "                                                ";
		$jackpot9 = 0;												
	} else {
	}	
	
slotprint();	
$rsaroom_lzv1 = $rsaroom_lzv1 + 1;
}

#ROOM lzv2
sub room_lzv2 {
$roomauthor = "$name_mikeeusa";
$room = lzv2;
$n = 1;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Utility SRP-6";

	if ($rsaroom_lzv2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "    You detonate a bomb. It explodes causing    ";
		$info2 = "        moderate damage to your figure...       ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 35;
	} else {
	}
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; longhall1door(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1(); print"\n"; longhall2(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1c(); print"\n"; longhall2c(); print"\n"; longhall1(); print"\n"; 
longhall2(); print"\n"; longhall1door(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";	
$rsaroom_lzv2 = $rsaroom_lzv2 + 1;
}

#ROOM lzv3 (stairwell)
sub room_lzv3 {
$roomauthor = "$name_mikeeusa";
$room = lzv3;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - North   Down - East";

	if ($rsaroom_lzv3 == 1) {
		$info = "             Hrmm, a stairwell                  ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_lzv3_2(); print"\n"; stairwellq_lzv3_1(); print"\n"; stairwellq_lzv3_2(); print"\n"; stairwellu_lzv3_3(); print"\n"; 
stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; 
stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_3(); print"\n"; 
stairwelld_lzv3_4(); print"\n"; stairwelld_lzv3_1(); print"\n"; stairwelld_lzv3_2(); print"\n"; 
wallunoa1(); print"\n";	
$rsaroom_lzv3 = $rsaroom_lzv3 + 1;
}

#ROOM kzv3 (stairwell)
sub room_kzv3 {
$roomauthor = "$name_mikeeusa";
$room = kzv3;
$n = 1;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - West   Down - North";

	if ($rsaroom_kzv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_kzv3_2(); print"\n"; stairwellq_kzv3_1(); print"\n"; stairwellq_kzv3_2(); print"\n"; stairwellu_kzv3_3(); print"\n"; 
stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; 
stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_3(); print"\n"; 
stairwelld_kzv3_4(); print"\n"; stairwelld_kzv3_1(); print"\n"; stairwelld_kzv3_2(); print"\n"; 
wallunoa1(); print"\n";	
$rsaroom_kzv3 = $rsaroom_kzv3 + 1;
}

#ROOM jzv3 (stairwell)
sub room_jzv3 {
$roomauthor = "$name_mikeeusa";
$room = jzv3;
$n = 0;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - South   Down - West";

	if ($rsaroom_jzv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_jzv3_2(); print"\n"; stairwellq_jzv3_1(); print"\n"; stairwellq_jzv3_2(); print"\n"; stairwellu_jzv3_3(); print"\n"; 
stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_1(); print"\n"; stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_1(); print"\n"; 
stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_1(); print"\n"; stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_3(); print"\n"; 
stairwelld_jzv3_4(); print"\n"; stairwelld_jzv3_1(); print"\n"; stairwelld_jzv3_2(); print"\n"; 
wallunoa1(); print"\n";	
$rsaroom_jzv3 = $rsaroom_jzv3 + 1;
}

#ROOM izv3 (stairwell)
sub room_izv3 {
$roomauthor = "$name_mikeeusa";
$room = izv3;
$n = 0;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - East   Down - South";

	if ($rsaroom_izv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_izv3_2(); print"\n"; stairwellq_izv3_1(); print"\n"; stairwellq_izv3_2(); print"\n"; stairwellu_izv3_3(); print"\n"; 
stairwellu_izv3_2(); print"\n"; stairwellu_izv3_1(); print"\n"; stairwellu_izv3_2(); print"\n"; stairwellu_izv3_1(); print"\n"; 
stairwellu_izv3_2(); print"\n"; stairwellu_izv3_1(); print"\n"; stairwellu_izv3_2(); print"\n"; stairwellu_izv3_3(); print"\n"; 
stairwelld_izv3_2(); print"\n"; stairwelld_izv3_1(); print"\n"; stairwelld_izv3_2(); print"\n"; 
wallunoa1(); print"\n";	
$rsaroom_izv3 = $rsaroom_izv3 + 1;
}

#ROOM hzv3 (stairwell)
sub room_hzv3 {
$roomauthor = "$name_mikeeusa";
$room = hzv3;
$n = 1;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - North   Down - East";

	if ($rsaroom_hzv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_lzv3_2(); print"\n"; stairwellq_lzv3_1(); print"\n"; stairwellq_lzv3_2(); print"\n"; stairwellu_lzv3_3(); print"\n"; 
stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; 
stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_3(); print"\n"; 
stairwelld_lzv3_4(); print"\n"; stairwelld_hzv3_1(); print"\n"; stairwelld_lzv3_4(); print"\n"; 
stairwdoor1(); print"\n";	
$rsaroom_hzv3 = $rsaroom_hzv3 + 1;
}

#ROOM gzv3 (stairwell)
sub room_gzv3 {
$roomauthor = "$name_mikeeusa";
$room = gzv3;
$n = 1;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - West   Down - North";

	if ($rsaroom_gzv3 == 1) {
		$info = " Your mind calculates the presance of a door to ";
		$info2 = "                the south                       ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_kzv3_2(); print"\n"; stairwellq_kzv3_1(); print"\n"; stairwellq_kzv3_2(); print"\n"; stairwellu_kzv3_3(); print"\n"; 
stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; 
stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_3(); print"\n"; 
stairwelld_kzv3_4(); print"\n"; stairwelld_gzv3_1(); print"\n"; stairwelld_kzv3_4(); print"\n"; 
stairwdoor1(); print"\n";	
$rsaroom_gzv3 = $rsaroom_gzv3 + 1;
}

#ROOM fzv3 (stairwell)
sub room_fzv3 {
$roomauthor = "$name_mikeeusa";
$room = fzv3;
$n = 0;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - South   Down - West";

	if ($rsaroom_fzv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_jzv3_2(); print"\n"; stairwellq_jzv3_1(); print"\n"; stairwellq_jzv3_2(); print"\n"; stairwellu_jzv3_3(); print"\n"; 
stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_1(); print"\n"; stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_1(); print"\n"; 
stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_1(); print"\n"; stairwellu_jzv3_2(); print"\n"; stairwellu_jzv3_3(); print"\n"; 
stairwelld_jzv3_4(); print"\n"; stairwelld_fzv3_1(); print"\n"; stairwelld_jzv3_4(); print"\n"; 
stairwdoor3(); print"\n";	
$rsaroom_fzv3 = $rsaroom_fzv3 + 1;
}

#ROOM ezv3 (stairwell)
sub room_ezv3 {
$roomauthor = "$name_mikeeusa";
$room = ezv3;
$n = 0;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - East   Down - South";

	if ($rsaroom_ezv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} elsif ($rsaroom_ezv3 == 3) {
		if ($spellbookragepresent == 2) {
		$info = "You notice a book perched precariously on a step";
		$info2 = "              you pick it up...                 ";
		$spellbookrage = 1;
		} else {
		$info = "                                                ";
		$info2 = "                                                ";		
		}			
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_izv3_2(); print"\n"; stairwellq_izv3_1(); print"\n"; stairwellq_izv3_2(); print"\n"; stairwellu_izv3_3(); print"\n"; 
stairwellu_izv3_2(); print"\n"; stairwellu_izv3_1(); print"\n"; stairwellu_izv3_2(); print"\n"; stairwellu_izv3_1(); print"\n"; 
stairwellu_izv3_2(); print"\n"; stairwellu_izv3_1(); print"\n"; stairwellu_izv3_2(); print"\n"; stairwellu_izv3_3(); print"\n"; 
stairwelld_izv3_2(); print"\n"; stairwelld_izv3_1(); print"\n"; stairwelld_izv3_2(); print"\n"; 
stairwdoor3(); print"\n";	
$rsaroom_ezv3 = $rsaroom_ezv3 + 1;
}

#ROOM hzv3 (stairwell)
sub room_dzv3 {
$roomauthor = "$name_mikeeusa";
$room = dzv3;
$n = 1;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - North   Down - East";

	if ($rsaroom_dzv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
		$catbeing1_dzv3 = 0;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_lzv3_2(); print"\n"; stairwellq_lzv3_1(); print"\n"; stairwellq_lzv3_2(); print"\n"; stairwellu_lzv3_3(); print"\n"; 
stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; 
stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_1(); print"\n"; stairwellu_lzv3_2(); print"\n"; stairwellu_lzv3_3(); print"\n"; 
stairwelld_lzv3_4(); print"\n"; stairwelld_hzv3_1(); print"\n"; stairwelld_lzv3_4(); print"\n"; 
stairwdoor1(); print"\n";	

	if ($catbeing1rand == 0) {
		$catbeing1_dzv3 = $catbeing1_dzv3 + 1;
		if ($catbeing1_dzv3 == 1) {			
			$info = "              You are attacked!                 ";
			$info2 = "                                                ";
			catbeing1_define();
			catbeing1_exe();	
		} elsif ($catbeing1_dzv3 >= 2) {
			catbeing1_exe();
		} else {
		}
	} else {
	}
	
$rsaroom_dzv3 = $rsaroom_dzv3 + 1;
}

#ROOM czv3 (stairwell)
sub room_czv3 {
$roomauthor = "$name_mikeeusa";
$room = czv3;
$n = 1;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Up - West   Down - North";

	if ($rsaroom_gzv3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It tumbles down the stairs";
		$info2 = "               before exploding...              ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
	
wallunoa1(); print"\n";
stairwellq_kzv3_2(); print"\n"; stairwellq_kzv3_1(); print"\n"; stairwellq_kzv3_2(); print"\n"; stairwellu_kzv3_3(); print"\n"; 
stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; 
stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_1(); print"\n"; stairwellu_kzv3_2(); print"\n"; stairwellu_kzv3_3(); print"\n"; 
stairwelld_kzv3_4(); print"\n"; stairwelld_gzv3_1(); print"\n"; stairwelld_kzv3_4(); print"\n"; 
stairwdoor1(); print"\n";	
$rsaroom_czv3 = $rsaroom_czv3 + 1;
}

sub room_caa3 {
$roomauthor = "$name_mikeeusa";
$room = caa3;
$n = 1;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Cell Block B";

	if ($rsaroom_caa3 == 1) {
		$info = "        Hrmm, the walls are blue here           ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
		
bcellblock1d(); print"\n";
bcellblock2d(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockhallw2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; 
bcellblockhall1(); print"\n";
	
$rsaroom_caa3 = $rsaroom_caa3 + 1;
}

sub room_cab2 {
$roomauthor = "$name_mikeeusa";
$room = cab2;

$read = "Cell Block B";

	if ($rsaroom_cab2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 25;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; wallblueunoa2e(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_cab2 = $rsaroom_cab2 + 1;
}

sub room_cab1 {
$roomauthor = "$name_mikeeusa";
$room = cab1;

$n = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Cell Block B";

	if ($rsaroom_cab1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
		$droidbeing2_cab1 = 1;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockhallw2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; 
bcellblockhall1(); print"\n";
	if ($droidbeing2_cab1 == 1) {
		droidbeing2_define();
		droidbeing2_exe();
	} elsif ($droidbeing2_cab1 >= 2) {
		droidbeing2_exe();
	}
	
	if ($beinginroom == 1) {
	$s = 0;
	} else {
	$s = 1;
	}
	
$droidbeing2_cab1 = $droidbeing2_cab1 + 1;		
$rsaroom_cab1 = $rsaroom_cab1 + 1;
}

sub room_cbb1 {
$roomauthor = "$name_mikeeusa";
$room = cbb1;

$read = "Cell Block B";

	if ($rsaroom_cbb1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 25;
	} else {
	}

$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
bcellblockhall1(); print"\n";
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; 
bcellblockhall1(); print"\n";
$rsaroom_cbb1 = $rsaroom_cbb1 + 1;
}

sub room_cab0 {
$roomauthor = "$name_mikeeusa";
$room = cab0;

$read = "Cell Block B";

	if ($rsaroom_cab0 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 25;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; wallblueunoa2e(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_cab0 = $rsaroom_cab0 + 1;
}

sub room_cabm1 {
$roomauthor = "$name_mikeeusa";
$room = cabm1;

$read = "Cell Block B";

	if ($rsaroom_cabm1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 25;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; wallblueunoa2e(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_cabm1 = $rsaroom_cabm1 + 1;
}

sub room_cabm2 {
$roomauthor = "$name_mikeeusa";
$room = cabm2;

$read = "Cell Block B";

	if ($rsaroom_cabm2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 32;
	} else {
	}

$n = 1;
$s = 0;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
bcellblockhall1(); print"\n";
bcellblockhallw22l(); print"\n"; cellblockhall33l(); print"\n"; cellblockhall44l(); print"\n"; cellblockhall33l(); print"\n"; 
cellblockhall44l(); print"\n"; cellblockhall33l(); print"\n"; bcellblockhallw22lf(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_cabm2 = $rsaroom_cabm2 + 1;
}

sub room_cab3 {
$roomauthor = "$name_mikeeusa";
$room = cab3;
$n = 1;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Cell Block B";

	if ($rsaroom_cab3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
		
bcellblockhall1(); print"\n";
bcellblockhallw2(); print"\n"; cellblockhall3l(); print"\n"; cellblockhall4l(); print"\n"; cellblockhall3l(); print"\n"; 
cellblockhall4l(); print"\n"; cellblockhall3l(); print"\n"; cellblockhall4x(); print"\n"; cellblockhall3x(); print"\n"; 
cellblockhall4x(); print"\n"; cellblockhall3x(); print"\n"; cellblockhall4x(); print"\n"; cellblockhall3x(); print"\n"; 
cellblockhall4x(); print"\n"; cellblockhall3x(); print"\n"; cellblockhall4x(); print"\n"; 
cellblockwall3x(); print"\n";	
$rsaroom_cab3 = $rsaroom_cab3 + 1;
}

#ROOM cac3 (Indust Elevator)
sub room_cac3 {
$roomauthor = "$name_mikeeusa";
$room = cac3;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";


	if ($cac3levelin == 1) {
		$info = "              The room decends                  ";
		$info2 = "                                                ";
		$cac3levelin = 0;
	} elsif ($cac3levelin == 0) {
		$info = "         The room accelerates upwards           ";
		$info2 = "                                                ";
		$cac3levelin = 1;
	} else {
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it blows up the elevator ";
		$info2 = "            along with you...idiot              ";
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$bodypart_armR = 0;
		$bodypart_armL = 0;
		$bodypart_chest = 0;
		$bodypart_torso = 0;
		$bodypart_legR = 0;
		$bodypart_legL = 0;
		$health = $health - 30000;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
 	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; elevator1(); print"\n"; floorele1(); print"\n"; floorele2(); print"\n"; 
floorele1(); print"\n"; floorele2(); print"\n"; floorele1(); print"\n"; floorele2(); print"\n"; 
floorele1(); print"\n"; floorele2(); print"\n"; floorele1(); print"\n"; 
elevator2(); print"\n"; 
$rsaroom_cac3 = $rsaroom_cac3 + 1;
}

sub room_caa2 {
$roomauthor = "$name_mikeeusa";
$room = caa2;

$read = "Cell Block B :: Cell A1";

	if ($rsaroom_caa2 == 1) {
		$info = "        There is a cell door to the south       ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
bcellblockhall1(); print"\n";
bcellblockhallw2(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
	
$rsaroom_caa2 = $rsaroom_caa2 + 1;
}

sub room_caa1 {
$roomauthor = "$name_mikeeusa";
$room = caa1;

$read = "Cell Block B :: Cell A2";

	if ($rsaroom_caa1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
$rsaroom_caa1 = $rsaroom_caa1 + 1;
}

sub room_caa0 {
$roomauthor = "$name_mikeeusa";
$room = caa0;

$read = "Cell Block B :: Cell A3";

	if ($rsaroom_caa0 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
$rsaroom_caa0 = $rsaroom_caa0 + 1;
}

sub room_caam1 {
$roomauthor = "$name_mikeeusa";
$room = caam1;

$read = "Cell Block B :: Cell A4";

	if ($rsaroom_caam1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
$rsaroom_caam1 = $rsaroom_caam1 + 1;
}

sub room_caam2 {
$roomauthor = "$name_mikeeusa";
$room = caam2;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Cell Block B";

	if ($rsaroom_caam2 == 1) {
		$info = "You see graffiti scralled upon the western wall:";
		$info2 = "Silence is golden, Fortunately it can be stolen.";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
		
bcellblockhall1(); print"\n";
bcellblockhallw22l(); print"\n"; cellblockhall33l(); print"\n"; cellblockhall44l(); print"\n"; cellblockhall33l(); print"\n"; 
cellblockhall44l(); print"\n"; cellblockhall33l(); print"\n"; bcellblockhallw22l(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; 
bcellblockhall1(); print"\n";
	
$rsaroom_caam2 = $rsaroom_caam2 + 1;
}

sub room_czzm2 {
$roomauthor = "$name_mikeeusa";
$room = czzm2;
$n = 1;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Cell Block B";

	if ($rsaroom_czzm2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}
		
bcellblockhall1(); print"\n";
bcellblockhallw22l(); print"\n"; cellblockhall33l(); print"\n"; cellblockhall44l(); print"\n"; cellblockhall33l(); print"\n"; 
cellblockhall44l(); print"\n"; cellblockhall33l(); print"\n"; bcellblockhallw22l(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; 
bcellblockhall1(); print"\n";
	
$rsaroom_czzm2 = $rsaroom_czzm2 + 1;
}

sub room_czzm1 {
$roomauthor = "$name_mikeeusa";
$room = czzm1;

$read = "Cell Block B :: Cell B3";

	if ($rsaroom_czzm1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
$rsaroom_czzm1 = $rsaroom_czzm1 + 1;
}

sub room_czz0 {
$roomauthor = "$name_mikeeusa";
$room = czz0;

$read = "Cell Block B :: Cell B2";

	if ($rsaroom_czz0 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
$rsaroom_czz0 = $rsaroom_czz0 + 1;
}

sub room_czz1 {
$roomauthor = "$name_mikeeusa";
$room = czz1;

$read = "Cell Block B :: Cell B1";

	if ($rsaroom_czz0 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
nothing1wall(); print"\n";
wallblueunoa2e(); print"\n"; cellblockhall333r(); print"\n"; cellblockhall444r(); print"\n"; cellblockhall333r(); print"\n"; 
cellblockhall444r(); print"\n"; cellblockhall333rw(); print"\n"; bcellblockcove2(); print"\n"; bcellblockcove1(); print"\n"; 
bcellblockcove2b(); print"\n"; bcellblockcove1b(); print"\n"; bcellblockcove2c(); print"\n"; bcellblockcove1c(); print"\n"; 
bcellblockcove2d(); print"\n"; bcellblockcove1d(); print"\n"; bcellblockcove2e(); print"\n"; 
bcellblockcove1e(); print"\n";
$rsaroom_czz1 = $rsaroom_czz1 + 1;
}

sub room_caa4 {
$roomauthor = "$name_mikeeusa";
$room = caa4;

$read = "Cell Block B";

	if ($rsaroom_caa4 == 1) {
		$info = "  You enter a hall with a window to the north   ";
		$info2 = "overlooking a stairway headed downwards (N to S)";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		if ($caa4bombw == 0) {
			$info = "  You activate a bomb. It explodes shattering   ";
			$info2 = "                  the window                    ";
			$caa4bombw = 1;		
		} else {
			$info = "         You activate a bomb. It explodes.      ";
			$info2 = "                                                ";
		}	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

if ($caa4bombw == 0) {
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
} else {
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
}
	
bstairdown1(); print"\n"; bstairdown2(); print"\n";bstairdown1(); print"\n";
if ($caa4bombw == 0) { bcellblockwindow2(); } else { bcellblockwindow2b(); }
print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; wallblueunoa2e(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n";
$rsaroom_caa4 = $rsaroom_caa4 + 1;
}

sub room_caa5 {
$roomauthor = "$name_mikeeusa";
$room = caa5;

$read = "Cell Block B";

	if ($rsaroom_caa5 == 1) {
		$info = "  To the south is a wooden door that displays   ";
		$info2 = "     'Janatorial Closet' on it's exterior       ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

	
nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
wallblueunoa2e(); print"\n"; cellblockhall3(); print"\n"; cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; 
cellblockhall4(); print"\n"; cellblockhall3(); print"\n"; wallblueunoa2ejadr(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n";
$rsaroom_caa5 = $rsaroom_caa5 + 1;
}

sub room_cab5 {
$roomauthor = "$name_mikeeusa";
$room = cab5;

$read = " ";

	if ($rsaroom_cab5 == 1) {
		$info = "  You enter the janatorial closet and trip over ";
		$info2 = "               a water bucket...                ";
		$immobile = 4;
	} elsif ($rsaroom_cab5 == 2) {
		$info = " As you look forward from your vantage point on ";
		$info2 = "  the floor you see a skeleton. The janitor?    ";
	} elsif ($rsaroom_cab5 == 3) {
		$info = "   You plunder the deceased humanoid figure for ";
		$info2 = "      the short sleeve shirt it was wearing     ";
		$redtshirtarmor = 1;
	} elsif ($rsaroom_cab5 == 4) {
		$info = "   You right yourself and see to the east and   ";
		$info2 = "  south a wrap-around shelf and a green locker  ";
	} elsif ($rsaroom_cab5 == 6) {
		$info = "  You plunder a ballpoint pen from the janitor  ";
		$info2 = "                  skeleton                      ";
		$blackbppen = 1;
		$bbpink = $bbpink + 100;						
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                You become hurt                 ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 40;
	} else {
	}

$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; jandoor1(); print"\n"; janfloor2(); print"\n"; janfloor1(); print"\n"; 
janfloor2a(); print"\n"; janfloor1a(); print"\n"; janwall2(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_cab5 = $rsaroom_cab5 + 1;
}

sub room_czv2 {
$roomauthor = "$name_mikeeusa";
$room = czv2;
$n = 0;
$s = 1;
$e = 1;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B";

	if ($rsaroom_czv2 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 20;
	} else {
	}

		
bcellblockwall1rb(); print"\n";
bcellblockhall2r(); print"\n"; bcellblockhall1rw(); print"\n"; bcellblockhall2r(); print"\n"; bcellblockhall1r(); print"\n"; 
bcellblockhall2r(); print"\n"; bcellblockwall1r(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; 
bcellblockhall2(); print"\n"; bcellblockhall1(); print"\n"; bcellblockhall2(); print"\n"; 
bcellblockhall1(); print"\n"; 
$rsaroom_czv2 = $rsaroom_czv2 + 1;
}

sub room_czv3xxd {
$roomauthor = "$name_mikeeusa";
$room = czv3xxd;
$n = 0;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B :: East - Down";

	if ($rsaroom_czv3xxd == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You activate a bomb. It tumbles down the stairs ";
		$info2 = "            before exploding                    ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}

		
wallunoa1(); print"\n";
bcellstairway2d(); print"\n"; bcellstairway1d(); print"\n"; bcellstairway2d(); print"\n"; bcellstairway1d(); print"\n"; 
bcellstairway2d(); print"\n"; bcellstairway1wq(); print"\n"; bcellstairway2q2(); print"\n"; bcellstairway1q2(); print"\n"; 
bcellstairway2q2(); print"\n"; bcellstairway1q2(); print"\n"; bcellstairway2q2(); print"\n"; bcellstairway1q2(); print"\n"; 
bcellstairway2q2(); print"\n"; bcellstairway1q2(); print"\n"; bcellstairway2q2(); print"\n";
bcellstairway1q2(); print"\n";
$rsaroom_czv3xxd = $rsaroom_czv3xxd + 1;
}

sub room_czv3xxu {
$roomauthor = "$name_mikeeusa";
$room = czv3xxu;
$n = 0;
$s = 1;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B :: West - Up :: South - Down";

	if ($rsaroom_czv3xxu == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "You activate a bomb. It tumbles down the stairs ";
		$info2 = "            before exploding                    ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}

		
wallunoa1(); print"\n";
bcellstairway2u(); print"\n"; bcellstairway1u(); print"\n"; bcellstairway2u(); print"\n"; bcellstairway1u(); print"\n"; 
bcellstairway2u(); print"\n"; bcellstairway1wk(); print"\n"; bcellstairway2k2d(); print"\n"; bcellstairway1k2d(); print"\n"; 
bcellstairway2k2d(); print"\n"; bcellstairway1k2d(); print"\n"; bcellstairway2k2d(); print"\n"; bcellstairway1k2d(); print"\n"; 
bcellstairway2k2d(); print"\n"; bcellstairway1k2(); print"\n"; bcellstairway2k2(); print"\n";
bcellstairway1k2(); print"\n";
$rsaroom_czv3xxu = $rsaroom_czv3xxu + 1;
}

sub room_czv3xxq {
$roomauthor = "$name_mikeeusa";
$room = czv3xxq;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B :: North - Up";

	if ($rsaroom_czv3xxq == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You activate a bomb. It explodes and hurts you ";
		$info2 = "                  badly...                      ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 60;
	} else {
	}

		
wallunoa1(); print"\n";
bcellstairway2q(); print"\n"; bcellstairway1q(); print"\n"; bcellstairway2q(); print"\n"; bcellstairway1q(); print"\n"; 
bcellstairway2q(); print"\n"; bcellstairway1wq(); print"\n"; bcellstairway2k2u(); print"\n"; bcellstairway1k2u(); print"\n"; 
bcellstairway2k2u(); print"\n"; bcellstairway1k2u(); print"\n"; bcellstairway2k2u(); print"\n"; bcellstairway1k2u(); print"\n"; 
bcellstairway2k2u(); print"\n"; bcellstairway1k2(); print"\n"; bcellstairway2k2(); print"\n";
bcellstairway1k2(); print"\n";
$rsaroom_czv3xxq = $rsaroom_czv3xxq + 1;
}

sub room_dzv4 {
$roomauthor = "$name_mikeeusa";
$room = dzv4;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B :: Control Lobby";

	if ($rsaroom_dzv4 == 1) {
		$info = "   There are doors to the south and west...     ";
		$info2 = "                                                ";
	} elsif ($rsaroom_dzv4 == 2) {
		$info = "      The western door seems to be locked       ";
		$info2 = "                                                ";		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {	
		$info = "  You activate a bomb. It explodes hurting you  ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 45;
	} else {
	}

		
cbcellblockhall1(); print"\n";
cbcellblockhall2(); print"\n"; cbcellblockhall1f(); print"\n"; cbcellblockhall2e(); print"\n"; cbcellblockhall1e(); print"\n"; 
cbcellblockhall2f(); print"\n"; cbcellblockhall1(); print"\n"; cbcellblockhall2d(); print"\n"; cbcellblockhall1d(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_dzv4 = $rsaroom_dzv4 + 1;
}

sub room_daa4 {
$roomauthor = "$name_mikeeusa";
$room = daa4;
$n = 1;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B";

	if ($rsaroom_daa4 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {	
		$info = "  You activate a bomb. It explodes hurting you  ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 30;
	} else {
	}

		
cbcellblockhall1d(); print"\n";
cbcellblockhall2d2(); print"\n"; cbcellblockhall1(); print"\n"; cbcellblockhall2(); print"\n"; cbcellblockhall1c(); print"\n"; 
cbcellblockhall2c(); print"\n"; cbcellblockhall1(); print"\n"; cbcellblockhall2g(); print"\n"; cbcellblockhall1g(); print"\n"; 
cbcellblockhall2(); print"\n"; cbcellblockhall1(); print"\n"; cbcellblockhall2(); print"\n"; cbcellblockhall1(); print"\n"; 
cbcellblockhall2(); print"\n"; cbcellblockhall1(); print"\n"; cbcellblockhall2(); print"\n"; 
cbcellblockhall1(); print"\n";
$rsaroom_daa4 = $rsaroom_daa4 + 1;
}

sub room_daa5 {
$roomauthor = "$name_mikeeusa";
$room = daa5;
$n = 0;
$s = 0;
$e = 0;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B :: Confiscated Materials";

	if ($rsaroom_daa5 == 1) {
		$info = "   You enter a room that holds the contraband   ";
		$info2 = " belongings of prisoners and collect some of it ";
		$spellbookburn = 1;
		$bombamount = $bombamount + 3;
		$spflashlight = 1;
		$bookpr0n = 1;
		$bflyknife = 1;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {	
		$info = "  You activate a bomb. It explodes hurting you  ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 35;
	} else {
	}

		
contrabwall1(); print"\n";
contrabshelf2a(); print"\n"; contrabfloor1a(); print"\n"; contrabdoor2(); print"\n"; contrabdoor1(); print"\n"; 
contrabfloor2(); print"\n"; contrabfloor1(); print"\n"; contrabfloor2(); print"\n"; contrabfloor1(); print"\n"; 
contrabfloor2(); print"\n"; contrabfloor1b(); print"\n"; contrabshelf2b(); print"\n"; contrabwall1(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_daa5 = $rsaroom_daa5 + 1;
}

sub room_dab4 {
$roomauthor = "$name_mikeeusa";
$room = dab4;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = "Cell Block B";

	if ($rsaroom_dab4 == 1) {
		$info = " To the south are double metallic sliding doors ";
		$info2 = "        The door to the west is locked          ";		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {	
		$info = "            You detonate a bomb                 ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}

		
bcellstairway1wk(); print"\n";
bcellwwall2(); print"\n"; bcellwwall1d(); print"\n"; bcellwwall2d(); print"\n"; bcellwwall1(); print"\n"; 
bcellwwall2(); print"\n"; bcellwwall1d2(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_dab4 = $rsaroom_dab4 + 1;
}

sub room_daa3 {
$roomauthor = "$name_mikeeusa";
$room = daa3;
$read = "Cell Block B :: Cell A1 Observation";

	if ($rsaroom_daa3 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {	
		$info = "        You activate a bomb. It explodes        ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		
		if ($zug1winbtrig <= 4) {
			$zug1winbtrig = $zug1winbtrig + 1;
		} else {
		}
		
		if ($zug1winbtrig == 4) {
		$info = "     You detonate a bomb. The glass shatters    ";
		$info2 = "                                                ";					
		} else {
		}
			
		if ($zug1winbtrig >= 4) {
			$zug1winb = 1;
		} else {
		}
		
	} else {
	}

$n = 0;
$s = 0;
if ($zug1winb == 0) {
$w = 0;
} else {
$w = 1;
}
$e = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
		
daa3wallunoa1(); print"\n";
daa32abm(); print"\n";
if ($zug1winb == 0) {
	daa31(); print"\n"; daa32(); print"\n"; daa31(); print"\n"; 
	daa32(); print"\n";daa31d(); print"\n"; daa32d(); print"\n"; daa31(); print"\n"; 
	daa32(); print"\n"; daa31(); print"\n"; daa32(); print"\n";
} else {
	daa31bm(); print"\n"; daa32bm(); print"\n"; daa31bm(); print"\n"; 
	daa32bm(); print"\n";daa31dbm(); print"\n"; daa32dbm(); print"\n"; daa31bm(); print"\n"; 
	daa32bm(); print"\n"; daa31bm(); print"\n"; daa32bm(); print"\n";
}
daa31abm(); print"\n";
daa3blueunoa2e(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 
$rsaroom_daa3 = $rsaroom_daa3 + 1;
}

sub room_gaa3 {
$roomauthor = "$name_mikeeusa";
$room = gaa3;
$n = 1;
$s = 0;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 1;
$sw = 1;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_gaa3 == 1) {
		$info = "  You observe that there are blue doors to the  ";
		$info2 = "          Southeast and Southwest               ";
		$catbeing1_gaa3 = 0;		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "         You activate a bomb. It explodes.      ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
		
wallaltdoor1(); print"\n";
corridalt2(); print"\n"; corridalt1(); print"\n"; corridalt2(); print"\n"; corridalt1(); print"\n"; 
corridalt2(); print"\n"; greetwallalt1(); print"\n"; greetroomalt2(); print"\n"; greetroomalt1(); print"\n"; 
greetroomalt2(); print"\n"; greetroomalt3(); print"\n"; greetroomalt4(); print"\n"; greetroomalt5(); print"\n"; 
greetroomalt6(); print"\n"; greetroomalt7(); print"\n"; greetroomalt8(); print"\n"; 
wallaltdoor3(); print"\n";

	if ($catbeing1rand == 1) {
		$catbeing1_gaa3 = $catbeing1_gaa3 + 1;
		if ($catbeing1_gaa3 == 2) {			
			$info = "              You are attacked!                 ";
			$info2 = "                                                ";
			catbeing1_define();
			catbeing1_exe();	
		} elsif ($catbeing1_gaa3 >= 3) {
			catbeing1_exe();
		} else {
		}
	} else {
	}
	
$rsaroom_gaa3 = $rsaroom_gaa3 + 1;
}

sub room_gab4 {
$roomauthor = "$name_mikeeusa";
$room = gab4;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 1;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Brass Quarters - Men";

	if ($rsaroom_gab4 == 1) {
		$info = "    To the Northwest is a blue door and to the  ";
		$info2 = "           South is a wooden door               ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "   You detonate a bomb and are slightly shaken  ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 7;
	} else {
	}
		
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
wallaltoqw2(); print"\n"; greetroomalt9(); print"\n"; greetroomalt10(); print"\n"; corridalt3(); print"\n"; 
corridalt2(); print"\n"; corridalt1(); print"\n"; corridalt2(); print"\n"; corridalt1(); print"\n"; 
wallaltdoor2(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_gab4 = $rsaroom_gab4 + 1;
}

sub room_gac4 {
$roomauthor = "$name_mikeeusa";
$room = gac4;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;



	if ($rsaroom_gac4 == 1) {
		$info = " You enter a cabin. To the east is a bed while  ";
		$info2 = "       southeast sports a corner desk           ";
		$read = " ";
	} elsif ($rsaroom_gac4 == 2) {
		$info = "     Hrmm there is a poster above the bed...    ";
		$info2 = "                                                ";
		$read = gac4read;
	} elsif ($rsaroom_gac4 == 3) {
		$info = "     You notice some moldy bread on the desk    ";
		$info2 = "                                                ";
		$read = gac4read;
		$f_tripebread = $f_tripebread + 1;	
	} elsif ($rsaroom_gac4 == 7) {
		$info = "       On a hunch you look under the bed...     ";
		$info2 = "                                                ";
		$read = gac4read;
	} elsif ($rsaroom_gac4 == 8) {
		$info = "            A mace you have found!              ";
		$info2 = "                                                ";
		$read = gac4read;				
		$mace = 1;		
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
		$read = gac4read;
	}
	
	if ($bombdetonate == 1) {
		$info = "   You detonate a bomb and are feeling swell!   ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
		
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
wallaltdorm1(); print"\n"; sidealtdorm2(); print"\n"; sidealtdorm3(); print"\n"; sidealtdorm4(); print"\n"; 
sidealtdorm3(); print"\n"; sidealtdorm4(); print"\n"; sidealtdorm5(); print"\n"; 
sidealtdorm6(); print"\n"; sidealtdorm7(); print"\n"; sidealtdorm8(); print"\n"; 
wallaltdorm3(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
$rsaroom_gac4 = $rsaroom_gac4 + 1;
}

sub room_gad4 {
$roomauthor = "$name_mikeeusa";
$room = gad4;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";


	if ($rsaroom_gad4 == 1) {
		$info = "     You enter what appears to be a bathroom    ";
		$info2 = "                                                ";		
		$spiderbeing1_gad4 = 1;
		$spiderbeinginroom_1 = 0;	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb and this isn't the best   ";
		$info2 = "                to do so...                     ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 21;
	} else {
	}
		
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
bathroomdorm1(); print"\n"; bathroomdorm2(); print"\n"; bathroomdorm3(); print"\n"; bathroomdorm4(); print"\n"; 
bathroomdorm5(); print"\n"; bathroomdorm6(); print"\n"; bathroomdorm7(); print"\n"; 
bathroomdorm8(); print"\n"; bathroomdorm9(); print"\n"; bathroomdorm10(); print"\n"; 
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
$spiderbeing1_gad4 = $spiderbeing1_gad4 + 1;

	if ($spiderbeing1_gad4 == 3) {			
		$info = "   A spider surveys the area, sees you, and     ";
		$info2 = "    immediatly launches a vicious attack!       ";
		spiderbeing1_define();
		spiderbeing1_exe();	
	} elsif ($spiderbeing1_gad4 >= 4) {
		spiderbeing1_exe();
	} else {
	}
	
$rsaroom_gad4 = $rsaroom_gad4 + 1;
}

sub room_gab5 {
$roomauthor = "$name_mikeeusa";
$room = gab5;
$n = 0;
$s = 1;
$e = 1;
$w = 1;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = "Brass Quarters - Men";

	if ($rsaroom_gab5 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "   You detonate a bomb and are burned a bit     ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 7;
	} else {
	}
		
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; wallunoa2e(); print"\n"; corridalt1(); print"\n"; 
corridalt2(); print"\n"; corridalt1(); print"\n"; corridalt2(); print"\n"; corridalt1(); print"\n"; 
wallaltdoor2(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n";
$rsaroom_gab5 = $rsaroom_gab5 + 1;
}

sub room_gac5 {
$roomauthor = "$name_mikeeusa";
$room = gac5;
$n = 1;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";


	if ($rsaroom_gac5 == 1) {
		$info = "         This cabin appears a bit sparce        ";
		$info2 = "                                                ";
	} elsif ($rsaroom_gac5 == 3) {
		$info = "You locate a book in this vacuum of personality ";
		$info2 = "    It is a journal... devoid of markings       ";
		$bookjournal = 1;	
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = "   You detonate a bomb and are feeling swell!   ";
		$info2 = "                                                ";	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
	} else {
	}
		
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
wallaltdorm1(); print"\n"; sidealtdorm2(); print"\n"; sidealtdorm3(); print"\n"; sidealtdorm4(); print"\n"; 
sidealtdorm3(); print"\n"; sidealtdorm4(); print"\n"; sidealtdorm5(); print"\n"; 
sidealtdorm6(); print"\n"; sidealtdorm5(); print"\n"; sidealtdorm6(); print"\n"; 
wallaltdorm3(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
$rsaroom_gac5 = $rsaroom_gac5 + 1;
}

sub room_gad5 {
$roomauthor = "$name_mikeeusa";
$room = gad5;
$n = 1;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;
$read = " ";


	if ($rsaroom_gad5 == 1) {
		$info = '              You enter a bathroom              ';
		$info2 = '                                                ';			
	} elsif ($rsaroom_gad5 == 2) {
		$info = '     In the sink you find an item not unlike    ';
		$info2 = '                 a sugar cube                   ';
		$f_lsd = $f_lsd + 1;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";	
	}
	
	if ($bombdetonate == 1) {
		$info = '          You detonate a bomb... b00m!          ';
		$info2 = '                                                ';	
		$bombdetonate = 0;
		$bombamount = $bombamount - 1;
		$health = $health - 22;
	} else {
	}
		
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
bathroomdorm1(); print"\n"; bathroomdorm2(); print"\n"; bathroomdorm3(); print"\n"; bathroomdorm4(); print"\n"; 
bathroomdorm5(); print"\n"; bathroomdorm6(); print"\n"; bathroomdorm7(); print"\n"; 
bathroomdorm8(); print"\n"; bathroomdorm9(); print"\n"; bathroomdorm10(); print"\n"; 
nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 

	
$rsaroom_gad5 = $rsaroom_gad5 + 1;
}

#ROOM REACTORMON1 (Computer)
sub room_reactormon1 {
$roomauthor = "$name_mikeeusa";
$room = reactormon1;
$n = 0;
$s = 1;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

	if ($rsaroom_reactormon1 == 1) {
		$info = "                                                ";
		$info2 = "                                                ";
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
	}
	
	if ($bombdetonate == 1) {
		$info = " You detonate a bomb, it destroys the monitoring";
		$info2 = " station CRT and rockets glass through your head";
		$termnboom2 = 1;
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
		$bodypart_head = 0;
		$health = $health - 30000;
	} else {
	}

if ($termnboom2	== 1) {
t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIII','yellow on_white'); print color 'reset';
print colored('SYBAN SYSMON 4(TM)','black on_white'); print color 'reset';
print colored('IIIII','yellow on_white'); t5(); print"\n";
t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'bold black on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'bold black on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t5(); print"\n";

t5(); print colored('II','yellow on_white'); 
print colored("                                            ",'green on_black');
print colored('II','yellow on_white'); t6(); print"\n";

t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','yellow on_white'); t5(); print"\n";

t5(); print colored('     [1] [^] [3] [4] [x] [6] [7] [8] [9] [0]    ','bold black on_black'); t6(); print"\n";

t6(); print colored(' [TxX] [Q] [W] [!] [R] [T] [Y] [U] [>] [O] [P]  ','bold black on_black'); t5(); print"\n";

t5(); print colored('[Caps L^*c)] [A] [:] [D] [F] [<] [H] [J] [K] [L]','bold black on_black'); t6(); print"\n";

t6(); print colored('  [Sv&<t] [Z] [%] [C] [v] [B] [N] [M] [E^(ER]   ','bold black on_black'); t5(); print"\n";
} else {
t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIII','bold white on_white'); print color 'reset';
print colored('SYBAN SYSMON 4','red on_white'); print color 'reset';
print colored('(TM)','black on_white'); print color 'reset';
print colored('IIIII','bold white on_white'); t5(); print"\n";
if ($mainframe3b < 5) {
reactormon();
} else {
t5(); print colored('II','bold white on_white'); 
print colored('* NO SIGNAL                               **','bold blue on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('**** NO SIGNAL                         *****','blue on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('******* NO SIGNAL                   ********','bold blue on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('********** NO SIGNAL             ***********','blue on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('************* NO SIGNAL       **************','bold blue on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('**************** NO SIGNAL *****************','blue on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('*************       NO SIGNAL **************','bold blue on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('**********             NO SIGNAL ***********','blue on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('*******                   NO SIGNAL ********','bold blue on_black');
print colored('II','bold white on_white'); t6(); print"\n";

t6(); print colored('II','bold white on_white'); 
print colored('****                         NO SIGNAL *****','blue on_black');
print colored('II','bold white on_white'); t5(); print"\n";

t5(); print colored('II','bold white on_white'); 
print colored('*                               NO SIGNAL **','bold blue on_black');
print colored('II','bold white on_white'); t6(); print"\n";
}
t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','bold white on_white'); t5(); print"\n";
t5(); print colored("     [1] [2] [3] [4] [5] [6] [7] [8] [9] [0]    ",'white on_black'); t6(); print"\n";

t6(); print colored(" [Tab] [Q] [W] [E] [R] [T] [Y] [U] [I] [O] [P]  ",'white on_black'); t5(); print"\n";

t5(); print colored("[Caps Lock] [A] [S] [D] [F] [G] [H] [J] [K] [L] ",'white on_black'); t6(); print"\n";

t6(); print colored("  [Shift] [Z] [X] [C] [V] [B] [N] [M] [ENTER]   ",'white on_black'); t5(); print"\n";
}
$rsaroom_reactormon1 = $rsaroom_reactormon1 + 1;
}
#ROOM REACTORMON1 END

#You blew everything up... k00l!!! r4d l33t
sub room_x10mtnw {
$roomauthor = "$name_mikeeusa";
$room = x10mtnw;
$n = 0;
$s = 0;
$e = 0;
$w = 0;
$ne = 0;
$nw = 0;
$se = 0;
$sw = 0;
$up = 0;
$down = 0;

$read = " ";

	if ($rsaroom_x10mtnw == 1) {
		$info = "   You detonate a 10 megaton nuclear warhead    ";
		$info2 = "            and blow everything up              ";
		$health = $health - 100000000000000000;
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$bodypart_armR = 0;
		$bodypart_armL = 0;
		$bodypart_chest = 0;
		$bodypart_torso = 0;
		$bodypart_legR = 0;
		$bodypart_legL = 0;
	} elsif ($rsaroom_x10mtnw == 2) {
		$info = "  Since you blew everything up you have nothing ";
		$info2 = "     stand on, hence you fall to your death     ";
		$health = $health - 3000;
	} else {
		$info = "                                                ";
		$info2 = "                                                ";
		$health = $health - 3000;
	}
	
	
	if ($bombdetonate == 1) {
		$info = "  You detonate a bomb, it fails to matter tho   ";
		$info2 = "                                                ";
		$bombdetonate = 0;	
		$bombamount = $bombamount - 1;
	} else {
	}
	
	
nothing1wall(); print"\n";
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; nothing1wall(); print"\n"; 
nothing2wall(); print"\n"; nothing1wall(); print"\n"; nothing2wall(); print"\n"; 
nothing1wall(); print"\n"; 	
$rsaroom_x10mtnw = $rsaroom_x10mtnw + 1;
}

##ROOM#REGISTRY#######
sub room_registry {
$rsaroom_ua1 = 1;
$rsaroom_ua2 = 1;
$rsaroom_la2 = 1;
$rsaroom_sa2 = 1;
$rsaroom_sa1 = 1;
$rsaroom_sa0 = 1;
$rsaroom_sa3 = 1;
$rsaroom_sa4 = 1;
$rsaroom_szz3 = 1;
$rsaroom_szy3 = 1;
$rsaroom_szz0 = 1;
$rsaroom_lav0 = 1;
$rsaroom_lavm1 = 1;
$rsaroom_szx3 = 1;
$rsaroom_sam1 = 1;
$rsaroom_uzx4 = 1;
$rsaroom_uzw4 = 1;
$rsaroom_lavm2 = 1;
$rsaroom_uzy4 = 1;
$rsaroom_uzz4 = 1;
$rsaroom_keyuzw4 = 1;
$rsaroom_ua4 = 1;
$rsaroom_uzz5 = 1;
$rsaroom_uzz6 = 1;
$rsaroom_uzy6 = 1;
$rsaroom_uzx6 = 1;
$rsaroom_uzx7 = 1;
$rsaroom_uzw6 = 1;
$rsaroom_uzv6 = 1;
$rsaroom_uzv5 = 1;
$rsaroom_uzv4 = 1;
$rsaroom_uzv7 = 1;
$rsaroom_uzv3 = 1;
$rsaroom_sam2 = 1;
$rsaroom_sbm2 = 1;
$rsaroom_lav1 = 1;
$rsaroom_lzv1 = 1;
$rsaroom_lav2 = 1;
$rsaroom_lzv2 = 1;
$rsaroom_lzv3 = 1;
$rsaroom_kzv3 = 1;
$rsaroom_jzv3 = 1;
$rsaroom_izv3 = 1;
$rsaroom_hzv3 = 1;
$rsaroom_gzv3 = 1;
$rsaroom_fzv3 = 1;
$rsaroom_ezv3 = 1;
$rsaroom_dzv3 = 1;
$rsaroom_czv3 = 1;
$rsaroom_gaa3 = 1;
$rsaroom_gab4 = 1;
$rsaroom_gac4 = 1;
$rsaroom_gad4 = 1;
$rsaroom_gab5 = 1;
$rsaroom_usfa4 = 1;
if ($room2startin == 1) {
} else {
$zug1ltrig = 1;
}
$rsaroom_zug1 = 1;
$rsaroom_yug1 = 1;
$rsaroom_caa3 = 1;
$rsaroom_caa2 = 1;
$rsaroom_caa1 = 1;
$rsaroom_caa0 = 1;
$rsaroom_caa4 = 1;
$rsaroom_czv2 = 1;
$rsaroom_czv3xxd = 1;
$rsaroom_czv3xxu = 1;
$rsaroom_czv3xxq = 1;
$rsaroom_dzv4 = 1;
$rsaroom_daa4 = 1;
$rsaroom_daa3 = 1;
$rsaroom_cab3 = 1;
$rsaroom_dab4 = 1;
$rsaroom_cac3 = 1;
$rsaroom_daa5 = 1;
$rsaroom_lzvm2 = 1;
$rsaroom_x10mtnw = 1;
$rsaroom_caa5 = 1;
$rsaroom_cab5 = 1;
$rsaroom_szzm2 = 1;
$rsaroom_szym2 = 1;
$rsaroom_szxm2 = 1;
$rsaroom_szxm3 = 1;
$rsaroom_szxm4 = 1;
$rsaroom_szxm5 = 1;
$rsaroom_szxm6 = 1;
$rsaroom_szxm7 = 1;
$rsaroom_szym7 = 1;
$rsaroom_caam1 = 1;
$rsaroom_caam2 = 1;
$rsaroom_czzm2 = 1;
$rsaroom_czzm1 = 1;
$rsaroom_czz0 = 1;
$rsaroom_czz1 = 1;
$rsaroom_cab2 = 1;
$rsaroom_cab1 = 1;
$rsaroom_cab0 = 1;
$rsaroom_cabm1 = 1;
$rsaroom_cabm2 = 1;
$rsaroom_gac5 = 1;
$rsaroom_gad5 = 1;
$rsaroom_lav3 = 1;
$rsaroom_lbv3 = 1;
$rsaroom_cbb1 = 1;
$rsaroom_szzm7 = 1;
$rsaroom_sam7 = 1;
$rsaroom_sbm7 = 1;
$rsaroom_sam8 = 1;
$rsaroom_sam9 = 1;
$rsaroom_sam10 = 1;
$rsaroom_sam11 = 1;
$rsaroom_sbm11 = 1;
$rsaroom_szzm11 = 1;
$rsaroom_szym11 = 1;
$rsaroom_szxm10 = 1;
$rsaroom_szwm9 = 1;
$rsaroom_szwm8 = 1;
$rsaroom_szxm8 = 1;
$rsaroom_szwm7 = 1;
$rsaroom_szvm8 = 1;
$rsaroom_szwm6 = 1; 
$rsaroom_szvm6 = 1;
$rsaroom_kewsszum6 = 1;
$rsaroom_szum6 = 1;
$rsaroom_switchswrszum5 = 1;
$rsaroom_szum5 = 1;
$rsaroom_uzw3 = 1;
$rsaroom_conzw3 = 1;
$rsaroom_conzv3 = 1;
$rsaroom_conzu3 = 1;
$rsaroom_uzu3 = 1;
$rsaroom_padduzu3 = 1;
$rsaroom_uzt3 = 1;
$rsaroom_reactormon1 = 1;
$rsaroom_uzt4 = 1;
$rsaroom_uzt4term = 1;
$rsaroom_conzt3 = 1;
$rsaroom_conzs3 = 1;
$rsaroom_keyuzs4 = 1;
$rsaroom_uzs4 = 1;
$rsaroom_uzs3 = 1;
$rsaroom_uzs2 = 1;
$rsaroom_uzs1 = 1;
$rsaroom_conzs2 = 1;
$rsaroom_conzs1 = 1;
$rsaroom_uzv2 = 1;
$rsaroom_u2zv1 = 1;
$rsaroom_u2zv0 = 1;
$rsaroom_uzv1 = 1;
$rsaroom_uzu1 = 1;
$rsaroom_uzt1 = 1;
$rsaroom_uzw1 = 1;
}
##ROOM#REGISTRY#######




##Infinite Newlines##
##Infinite Newlines##
sub infinitenewlines {
#60
print"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
}
##Infinite Newlines##
##Infinite Newlines##



##BIGGASSFUCKINGNUKE!!!!RUNNNNN!!!!!!!!!!!!!!!!!!!##
##BIGGASSFUCKINGNUKE!!!!RUNNNNN!!!!!!!!!!!!!!!!!!!##
sub bigassfuckingnuke_run {
	print color 'reset';
		#before we jet let us reset the color, people don't like their shells fucked with... atleast I dont :P

	if ($unix == 1) {
		system("clear");
	} else {
		#we don't know if this platform has the clear command so fsck it...
	}
	
	
	if ($die == 1){
		print"\nYou have died.... bawhawhawhahwha!!!\n";
	} else {
		if ($explevel <= 5) {
			print"\nFarewell young adventurer...\n";
		} elsif ($explevel <= 10) {
			print"\nFarewell traveled apprentice...\n";
		} else {
			print"\nFarewell...\n";
		}
	}
	
	#we run now...
	if ($ogg123 == 1) {
		system("killall -9 ogg123 -q -z -p 10 ap3b2.ogg  ap3b3.ogg  ap3b4.ogg  ap3b5.ogg");
	}
	die
}
##BIGGASSFUCKINGNUKE!!!!RUNNNNN!!!!!!!!!!!!!!!!!!!##
##BIGGASSFUCKINGNUKE!!!!RUNNNNN!!!!!!!!!!!!!!!!!!!##


sub randomstuffstart {
	
	$colorelixirRAND = int(rand(4));
	$snakeroomrand = int(rand(5));
	$la2randpurge = int(rand(7));
	$bookragerand = int(rand(3));
	$catbeing1rand = int(rand(3));
	$kill9a = int(rand(9));
	$kill9b = int(rand(9));
	$kill9c = int(rand(9));
	$kill9d = int(rand(9));
	$kill9pid = '3'."$kill9a"."$kill9b"."$kill9c"."$kill9d";
		
		if ($colorelixirRAND == 1) {
			$colorelixirH100 = 'red';
			$colorelixirP10 = 'green';
		} elsif ($colorelixirRAND == 2) { 
			$colorelixirH100 = 'blue';
			$colorelixirP10 = 'yellow';
		} elsif ($colorelixirRAND == 3) { 
			$colorelixirH100 = 'pink';
			$colorelixirP10 = 'black';		
		} else { 
			$colorelixirH100 = 'purple';
			$colorelixirP10 = 'cyan';
		}
	
		if ($la2randpurge == 1) { 
			$purgenamela2 = "initpurge";
		} elsif ($la2randpurge == 2) { 
			$purgenamela2 = "waterpurge";
		} elsif ($la2randpurge == 3) { 
			$purgenamela2 = "killwater";
		} elsif ($la2randpurge == 4) { 
			$purgenamela2 = "purgewater";		
		} elsif ($la2randpurge == 5) { 
			$purgenamela2 = "drainwater";
		} elsif ($la2randpurge == 6) { 
			$purgenamela2 = "pumpwater";			
		} else {
			$purgenamela2 = "initpump";
		}
		
		if ($bookragerand == 1) {
			$spellbookragepresent = 1;
		} elsif ($bookragerand == 2) {
			$spellbookragepresent = 2;
		} else {
			$spellbookragepresent = 1;
		}

					
		$keyuzw4padnumber = int(rand(99999));
		$keykewsszum6 = int(rand(99999));
		$keyuzs4padnumber = (int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10))).(int(rand(10)));
		while ($keykewsszum6 == $keyuzw4padnumber) {
			$keykewsszum6 = int(rand(99999));
		}
		$uzw4computerlogin = 12345;
} 

sub deathdestructiondecay {
infinitenewlines();
statusonlyinfo();
infinitenewlines();
#virtical grate
print color 'reset';
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
if ($starvedie == 1) {
print colored('         YOU HAVE STARVED TO DEATH!!!!!!          ','black on_red'); print"\n";
} else {
print colored('                YOU HAVE DIED!!!!!!               ','black on_red'); print"\n";
}
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
if ($statkills >= 1000) {
print colored("  Beings Killed By Your Hand: $statkills                ",'black on_red'); print"\n";
} elsif ($statkills >= 100) {
print colored("  Beings Killed By Your Hand: $statkills                 ",'black on_red'); print"\n";
} elsif ($statkills >= 10) {
print colored("  Beings Killed By Your Hand: $statkills                  ",'black on_red'); print"\n";
} elsif ($statkills >= 0) {
print colored("  Beings Killed By Your Hand: $statkills                   ",'black on_red'); print"\n";
} else {
print colored("  Beings Killed By Your Hand: $statkills                   ",'black on_red'); print"\n";
}

if ($statmurders >= 1000) {
print colored("  |-----Beings Murdered By You: $statmurders              ",'black on_red'); print"\n";
} elsif ($statmurders >= 100) {
print colored("  |-----Beings Murdered By You: $statmurders               ",'black on_red'); print"\n";
} elsif ($statmurders >= 10) {
print colored("  |-----Beings Murdered By You: $statmurders                ",'black on_red'); print"\n";
} elsif ($statmurders >= 0) {
print colored("  |-----Beings Murdered By You: $statmurders                 ",'black on_red'); print"\n";
} else {
print colored("  |-----Beings Murdered By You: $statmurders                 ",'black on_red'); print"\n";
}

if ($wickedness >= 1000) {
print colored("  Your Wickedness: $wickedness                           ",'black on_red'); print"\n";
} elsif ($wickedness >= 100) {
print colored("  Your Wickedness: $wickedness                            ",'black on_red'); print"\n";
} elsif ($wickedness >= 10) {
print colored("  Your Wickedness: $wickedness                             ",'black on_red'); print"\n";
} elsif ($wickedness >= 0) {
print colored("  Your Wickedness: $wickedness                              ",'black on_red'); print"\n";
} else {
print colored("  Your Wickedness: $wickedness                              ",'black on_red'); print"\n";
}


if ($clock >= 100000000) {
print colored("  Time Spent In Game (TURNS): $clock          ",'black on_red'); print"\n";
} elsif ($clock >= 100000000) {
print colored("  Time Spent In Game (TURNS): $clock           ",'black on_red'); print"\n";
} elsif ($clock >= 10000000) {
print colored("  Time Spent In Game (TURNS): $clock            ",'black on_red'); print"\n";
} elsif ($clock >= 1000000) {
print colored("  Time Spent In Game (TURNS): $clock             ",'black on_red'); print"\n";
} elsif ($clock >= 100000) {
print colored("  Time Spent In Game (TURNS): $clock              ",'black on_red'); print"\n";
} elsif ($clock >= 10000) {
print colored("  Time Spent In Game (TURNS): $clock               ",'black on_red'); print"\n";
} elsif ($clock >= 1000) {
print colored("  Time Spent In Game (TURNS): $clock                ",'black on_red'); print"\n";
} elsif ($clock >= 100) {
print colored("  Time Spent In Game (TURNS): $clock                 ",'black on_red'); print"\n";
} elsif ($clock >= 10) {
print colored("  Time Spent In Game (TURNS): $clock                  ",'black on_red'); print"\n";
} elsif ($clock >= 0) {
print colored("  Time Spent In Game (TURNS): $clock                   ",'black on_red'); print"\n";
} else {
print colored("  Time Spent In Game (TURNS): $clock                   ",'black on_red'); print"\n";
}

print colored('                                                  ','black on_red'); print"\n";
print colored('                                                  ','black on_red'); print"\n";
print color 'reset';
print'Save Log of Your Exploits as HTML File? [y|N]:';	

	$saverpg1exploits = <STDIN>;
	chomp($saverpg1exploits);
	
	if(($saverpg1exploits eq 'y') or ($saverpg1exploits eq 'Y') or ($saverpg1exploits eq 'yes')  or ($saverpg1exploits eq 'YES') or ($saverpg1exploits == 1) or ($saverpg1exploits eq 'yEs') or ($saverpg1exploits eq 'YeS') or ($saverpg1exploits eq 'Yes') or ($saverpg1exploits eq 'yeS') or ($saverpg1exploits eq 'yES')  or ($saverpg1exploits eq 'YEs')) {
		print"\n"; print'What Shall The Filename Be? [rpg1-ex.html]: ';	

		$saverpg1exploits2 = <STDIN>;
		chomp($saverpg1exploits2);
		if ($saverpg1exploits2 eq "") {
			$htmldumpfile = 'rpg1-ex.html';
		} else {
			$htmldumpfile = $saverpg1exploits2;
		}
		
		printhtml();
	} else {
	}
	
bigassfuckingnuke_run();
}
#starting sub


sub rpg1history {
print color 'reset';
print color 'bold yellow'; 
infinitenewlines();
#<><><><><><><><><><><><><><><><><><><><><><><><#
print"
 After the United States and many of the western
  democracies went the way of the Roman Republic, 
     with help from many Intellectual Property 
  concerned multinational corporations, and the 
constitutions as well as the elected legislative 
bodies of these former democracies became nothing
 more than a way to weakly shield the population 
from the reality in which they lived there were 
a series of wars and famines that resulted in the 
 destruction of the automated processes which the 
  masses had relied upon for nearly all of their 
daily needs. With the wars came the destruction of
the multi-nationals, the massive incorporated farm 
system, and all the so called Intellectual Property 
 these groups had locked away from the rest of the 
 earth. Gone was any hope of growing the crops to 
support the billions of people living world wide or
the hundreds of millions that dwelled in the United 
States alone. The information on what to fertilize 
the genetically engineered corn, cabbage, potatoes,
 and the grasses that fed the livestock with had 
    disappeared as the company that owned that
           information was eliminated.\n\n\n";
print color 'reset'; print color 'black';
	$placeholder = <STDIN>;
	chomp($placeholder);
infinitenewlines();
print color 'reset';
print color 'bold yellow'; 
#<><><><><><><><><><><><><><><><><><><><><><><><#
print"
  The famines severely weakened the once strong 
  central governments of the former democracies. 
 Their economies were gone, there was no longer
world trade, and they could not feed their people. 
  Riots broke out and the response was not with 
 rubber bullets or tear gas but deadly force... 
one rioter dead equaled one less mouth. Within a
decade the former democracies were manifest only
in history. Warlords had become the new governing
authorities, they raided the armament supplies of 
the countries which once occupied the land which
they now competed for. An age of constant warfare
   emerged from the ruins of the past. Within a 
century, give or take a decade or two, all known
nuclear and most conventional arms were expended.
An ice age ensued. When the sky shed the dark and
the sun was able to reach the ground for most of 
the day the ice retreated. Eventually a system of
 feudalism developed in some areas and in others 
  democracy, monarchs, tribal council, or local
         merchant guilds ruled the land.\n\n\n";
print color 'reset'; print color 'black';
	$placeholder = <STDIN>;
	chomp($placeholder);
infinitenewlines();
print color 'reset';
titlescreenrpg1();
}


sub infoboutselfstart {
print color 'reset';
print color 'bold yellow'; 
infinitenewlines();

#<><><><><><><><><><><><><><><><><><><><><><><><#
print'
        The date is reputed to be near 
 1230 moon rise. You have, all your life, lived
 in this very village with your family who love
  you dearly. It is time, as your late brother
   would say, to journy into deeper waters,
          how you miss your brother...';
print"\n\n\n\n\n\n\n\n";
print color 'reset'; print color 'black';
	$placeholder = <STDIN>;
	chomp($placeholder);
infinitenewlines();
print color 'reset';
print color 'bold yellow'; 
#<><><><><><><><><><><><><><><><><><><><><><><><#
print'
        You bid farewell to your family,
 they are nearly heartbroken as you dissappear
   into the world as your brother once did.
 On your oddessy you take a couple of rations,
  some water, and an ancient red fantasy book
 that your great grandfather passed on to you. ';
print"\n\n\n\n\n\n\n\n";
print color 'reset'; print color 'black';
	$placeholder = <STDIN>;
	chomp($placeholder);
infinitenewlines();
print color 'reset';
print color 'bold yellow'; 
#<><><><><><><><><><><><><><><><><><><><><><><><#
print'
      You wander several weeks, even months, 
  throughout the wilderness. At several taverns,
    in towns you stumbled onto, you have heard
 stories that parell the fantastic tales of your
               ancient red book...';
print"\n\n\n\n\n\n\n\n\n";
print color 'reset'; print color 'black';
	$placeholder = <STDIN>;
	chomp($placeholder);
infinitenewlines();
print color 'reset';
print color 'bold yellow'; 
#<><><><><><><><><><><><><><><><><><><><><><><><#
print'
   One day you suddenly enter into a frightfull
                lack of energy...';
print"\n\n\n\n\n\n\n\n\n\n\n\n";
print color 'reset'; print color 'black';
	$placeholder = <STDIN>;
	chomp($placeholder);
print color 'reset';
infinitenewlines();
}

sub infomenu {
infinitenewlines();
sbluebar();
t6(); print colored('                    InfoMenu                    ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored("   Present Room By: $roomauthor","bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('   R',"bold $screen2color1 on_$screen2color1");
print colored('PG1 Ver',"bold $screen2color2 on_$screen2color2");
print colored('sion:',"bold $screen2color1 on_$screen2color1");
print colored(" $version ","bold $screen2color2 on_$screen2color2");
print colored('     ',"bold $screen2color1 on_$screen2color1");
print colored('     ',"bold $screen2color2 on_$screen2color2");
print colored('    ',"bold $screen2color1 on_$screen2color1");
print colored('     ',"bold $screen2color2 on_$screen2color2");
print colored('      ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored('   L',"bold $screen2color1 on_$screen2color1");
print colored('icense: ',"bold $screen2color2 on_$screen2color2");
print colored('GNU ',"bold $screen2color1 on_$screen2color1");
print colored('Public L',"bold $screen2color2 on_$screen2color2");
print colored('ice',"bold $screen2color1 on_$screen2color1");
print colored('nse (ve',"bold $screen2color2 on_$screen2color2");
print colored('rsion ',"bold $screen2color1 on_$screen2color1");
print colored('tw',"bold $screen2color2 on_$screen2color2");
print colored('o)    ',"bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('   D',"bold $screen2color1 on_$screen2color1");
print colored('ev',"bold $screen2color2 on_$screen2color2");
print colored('oper',"bold $screen2color1 on_$screen2color1");
print colored('s:',"bold $screen2color2 on_$screen2color2");
print colored(' Mik',"bold $screen2color1 on_$screen2color1");
print colored('ee',"bold $screen2color2 on_$screen2color2");
print colored('USA ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('   ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('           ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('      ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored('   P',"bold $screen2color1 on_$screen2color1");
print colored('ro',"bold $screen2color2 on_$screen2color2");
print colored('ject',"bold $screen2color1 on_$screen2color1");
print colored(' I',"bold $screen2color2 on_$screen2color2");
print colored('ncep',"bold $screen2color1 on_$screen2color1");
print colored('ti',"bold $screen2color2 on_$screen2color2");
print colored('on:',"bold $screen2color1 on_$screen2color1");
print colored(' A',"bold $screen2color2 on_$screen2color2");
print colored('pril',"bold $screen2color1 on_$screen2color1");
print colored(' 2',"bold $screen2color2 on_$screen2color2");
print colored('002 AD     ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('      ',"bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('   C',"bold $screen2color1 on_$screen2color1");
print colored('ommand ',"bold $screen2color2 on_$screen2color2");
print colored('Line ',"bold $screen2color1 on_$screen2color1");
print colored('Argume',"bold $screen2color2 on_$screen2color2");
print colored('nts: ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('   ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('      ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('      ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored('    ',"bold $screen2color1 on_$screen2color1");
print colored(' -',"bold $screen2color2 on_$screen2color2");
print colored('h, ',"bold $screen2color1 on_$screen2color1");
print colored('--h',"bold $screen2color2 on_$screen2color2");
print colored('elp ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('         ',"bold $screen2color1 on_$screen2color1");
print colored('  ',"bold $screen2color2 on_$screen2color2");
print colored('Dis',"bold $screen2color1 on_$screen2color1");
print colored('pl',"bold $screen2color2 on_$screen2color2");
print colored('ay Hel',"bold $screen2color1 on_$screen2color1");
print colored('p ',"bold $screen2color2 on_$screen2color2");
print colored('Screen',"bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('    ',"bold $screen2color1 on_$screen2color1");
print colored(' -',"bold $screen2color2 on_$screen2color2");
print colored('d, -',"bold $screen2color1 on_$screen2color1");
print colored('-di',"bold $screen2color2 on_$screen2color2");
print colored('sab',"bold $screen2color1 on_$screen2color1");
print colored('le',"bold $screen2color2 on_$screen2color2");
print colored('buffers  ',"bold $screen2color1 on_$screen2color1");
print colored('  Disab',"bold $screen2color2 on_$screen2color2");
print colored('le All',"bold $screen2color1 on_$screen2color1");
print colored(' B',"bold $screen2color2 on_$screen2color2");
print colored('uffers',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored('    ',"bold $screen2color1 on_$screen2color1");
print colored(' +',"bold $screen2color2 on_$screen2color2");
print colored('b, --',"bold $screen2color1 on_$screen2color1");
print colored('ena',"bold $screen2color2 on_$screen2color2");
print colored('bl',"bold $screen2color1 on_$screen2color1");
print colored('eb',"bold $screen2color2 on_$screen2color2");
print colored('uffers    ',"bold $screen2color1 on_$screen2color1");
print colored(' Enab',"bold $screen2color2 on_$screen2color2");
print colored('le A',"bold $screen2color1 on_$screen2color1");
print colored('ll Buffe',"bold $screen2color2 on_$screen2color2");
print colored('rs ',"bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('   Beings Vanquished: ',"bold $screen2color1 on_$screen2color1"); 
if ($statkills >= 100000) {
print colored("$statkills                    ","bold $screen2color1 on_$screen2color1");
} elsif ($statkills >= 10000) {
print colored("$statkills                     ","bold $screen2color1 on_$screen2color1");
} elsif ($statkills >= 1000) {
print colored("$statkills                      ","bold $screen2color1 on_$screen2color1");
} elsif ($statkills >= 100) {
print colored("$statkills                       ","bold $screen2color1 on_$screen2color1");
} elsif ($statkills >= 10) {
print colored("$statkills                        ","bold $screen2color1 on_$screen2color1");
} elsif ($statkills >= 0) {
print colored("$statkills                         ","bold $screen2color1 on_$screen2color1");
} else {
print colored("$statkills                         ","bold $screen2color1 on_$screen2color1");
}
t5(); print"\n";

t5(); print colored('   Beings Murdered: ',"bold $screen2color1 on_$screen2color1");
if ($statmurders >= 100000) {
print colored("$statmurders                      ","bold $screen2color1 on_$screen2color1");
} elsif ($statmurders >= 10000) {
print colored("$statmurders                       ","bold $screen2color1 on_$screen2color1");
} elsif ($statmurders >= 1000) {
print colored("$statmurders                        ","bold $screen2color1 on_$screen2color1");
} elsif ($statmurders >= 100) {
print colored("$statmurders                         ","bold $screen2color1 on_$screen2color1");
} elsif ($statmurders >= 10) {
print colored("$statmurders                          ","bold $screen2color1 on_$screen2color1");
} elsif ($statmurders >= 0) {
print colored("$statmurders                           ","bold $screen2color1 on_$screen2color1");
} else {
print colored("$statmurders                           ","bold $screen2color1 on_$screen2color1");
}
t6(); print"\n";

t6();
if ($clock >= 100000000) {
print colored("    Turns Spent In Game:$clock              ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 100000000) {
print colored("   Turns Spent In Game: $clock               ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 10000000) {
print colored("   Turns Spent In Game: $clock                ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 1000000) {
print colored("   Turns Spent In Game: $clock                 ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 100000) {
print colored("   Turns Spent In Game: $clock                  ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 10000) {
print colored("   Turns Spent In Game: $clock                   ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 1000) {
print colored("   Turns Spent In Game: $clock                    ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 100) {
print colored("   Turns Spent In Game: $clock                     ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 10) {
print colored("   Turns Spent In Game: $clock                      ","bold $screen2color1 on_$screen2color1");
} elsif ($clock >= 0) {
print colored("   Turns Spent In Game: $clock                       ","bold $screen2color1 on_$screen2color1");
} else {
print colored("   Turns Spent In Game: $clock                       ","bold $screen2color1 on_$screen2color1");
}
t5(); print"\n";

t5();
if ($wickedness >= 10000) {
print colored("   Your Wickedness: $wickedness                       ","bold $screen2color1 on_$screen2color1");
} elsif ($wickedness >= 1000) {
print colored("   Your Wickedness: $wickedness                        ","bold $screen2color1 on_$screen2color1");
} elsif ($wickedness >= 100) {
print colored("   Your Wickedness: $wickedness                         ","bold $screen2color1 on_$screen2color1");
} elsif ($wickedness >= 10) {
print colored("   Your Wickedness: $wickedness                          ","bold $screen2color1 on_$screen2color1");
} elsif ($wickedness >= 0) {
print colored("   Your Wickedness: $wickedness                           ","bold $screen2color1 on_$screen2color1");
} else {
print colored("   Your Wickedness: $wickedness                           ","bold $screen2color1 on_$screen2color1");
}
t6(); print"\n"; 

t6(); print colored('   Themes: 0-Default 1-GreenWhite 2-Christmas   ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored('           3-BlueRed 4-IceFrost   5-Combat      ',"bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('           6-BForest 7-BlackMagic 8-MageMagik   ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
t5(); print colored('   To change theme enter  theme #  (eg: theme 1)',"bold $screen2color1 on_$screen2color1"); t6(); print"\n";
t6(); print colored('   To restart game enter  reset                 ',"bold $screen2color1 on_$screen2color1"); t5(); print"\n";
sbluebar();
	$startinfomenu = <STDIN>;
	chomp($startinfomenu);
	if ($startinfomenu eq 'reset' or $startinfomenu eq 'RESET') {
		svars();
		$info = "                 Game Reset                     ";
		$info2 = "                                                ";
		infotrack();
		startingrpg();
	} elsif ($startinfomenu eq 'exit' or $startinfomenu eq 'EXIT') {	
		bigassfuckingnuke_run();		
	} elsif ($startinfomenu eq 'quit' or $startinfomenu eq 'QUIT') {	
		bigassfuckingnuke_run();	
	} else {
		themes();
	}
}

sub titlescreenrpg1 {
infinitenewlines();
sbluebar();
#22
############<><><><><><><><><><><><><><><><><><><><><><><><>
t6(); print"                                                "; t5(); print"\n";
t5(); print"                                                "; t6(); print"\n";
t6(); print color "$splashscrncolor"; print"    RRRRRRR     PPPPPPP     GGGGG    11111      "; t5(); print"\n";
t5(); print color "$splashscrncolor"; print"    RRRRRRRR    PPPPPPPP   GGGGGGG      11      "; t6(); print"\n";
t6(); print color "$splashscrncolor"; print"    RR    RR    PP    PP   GG           11      "; t5(); print"\n";
t5(); print color "$splashscrncolor"; print"    RR    RR    PP   PP    GG           11      "; t6(); print"\n";
t6(); print color "$splashscrncolor"; print"    RRRRRRR     PPPPPP     GG   GG      11      "; t5(); print"\n";
t5(); print color "$splashscrncolor"; print"    RR   RRR    PP         GG   GG      11      "; t6(); print"\n";
t6(); print color "$splashscrncolor"; print"    RR    RRR   PP         GGGGGGG      11      "; t5(); print"\n";
t5(); print color "$splashscrncolor"; print"    RR     RRR  PP          GGGGG    11111111   "; t6(); print"\n";
t6(); print color 'bold black'; print"                              version $version     "; t5(); print"\n";
t5(); print"                                                "; t6(); print"\n";
t6(); print"   This Program, RPG1, Is Protected Under The   "; t5(); print"\n";
t5(); print'   Terms And Conditions of Version Two (2) Of   '; t6(); print"\n";
t6(); print'     The GNU GENERAL PUBLIC LICENSE (GPL)       '; t5(); print"\n";
t5(); print"       By The Entity Known As MikeeUSA          "; t6(); print"\n";
t6(); print"                                                "; t5(); print"\n";
t5(); print"   To read the history of the world enter  h    "; t6(); print"\n";
t6(); print" To skip intro enter  s  otherwise Press ENTER  "; t5(); print"\n";
sbluebar();

	$startghettoness = <STDIN>;
	chomp($startghettoness);
	if ($startghettoness eq "s") {
		#skip intro
	} elsif ($startghettoness eq "S") {
		#skip intro
	} elsif ($startghettoness eq "h") {
		rpg1history();
	} elsif ($startghettoness eq "H") {
		rpg1history();						
	} else { 
		infoboutselfstart()
	}
	
infinitenewlines();
}

##SLOTS##STUFFF#####################################################################################################

sub slot1a {
	if ($slot1 == 1) {
		print colored('    xX ','bold green on_white');
	} elsif ($slot1 == 2) {
		print colored('  $$$$ ','green on_white');
	} elsif ($slot1 == 3) {
		print colored('   x   ','bold yellow on_white');
	} elsif ($slot1 == 4) {	
		print colored('  ooo  ','magenta on_white');
	} elsif ($slot1 == 5) {
		print colored(' 77777 ','red on_white');	
	} elsif ($slot1 == 12) {
		print colored('  BAR  ','bold white on_black');
	} elsif ($slot1 == 13) {
		print colored('   H','bold green on_white'); print colored(' $ ','green on_white');	
	} elsif ($slot1 == 16) {
		print colored(' CCCCC ','bold red on_white');
	} elsif ($slot1 == 18) {
		print colored('  GNU  ','bold blue on_white');															 
	} else {
		print colored('       ','bold green on_white');
	}
}


sub slot2a {
	if ($slot1 == 1) {
		print colored('   xX  ','bold green on_white');
	} elsif ($slot1 == 2) {
		print colored(' $ ','green on_white'); print colored('H   ','bold green on_white');
	} elsif ($slot1 == 3) {
		print colored('  XXX  ','bold yellow on_white');
	} elsif ($slot1 == 4) {	
		print colored(' OOO','magenta on_white');
		print colored('O','green on_white');
		print colored('O ','magenta on_white');
	} elsif ($slot1 == 5) {
		print colored('    77 ','red on_white');
	} elsif ($slot1 == 6) {	
		print colored('__','white on_black');
		print colored('BAR','bold white on_black');
		print colored('__','white on_black');
	} elsif ($slot1 == 13) {
		print colored(' $$$$  ','green on_white');
	} elsif ($slot1 == 16) {	
		print colored('  CCC  ','bold red on_white');
	} elsif ($slot1 == 17) {
		print colored('*******','bold blue on_blue');
	} elsif ($slot1 == 18) {
		print colored('*******','bold blue on_blue');															 	
	} else {
		print colored('       ','bold green on_white');
	}
}


	
sub slot3a {
	if ($slot1 == 1) {
		print colored('  CCC  ','bold red on_white');
	} elsif ($slot1 == 2) {
		print colored('  $$$  ','green on_white');
	} elsif ($slot1 == 3) {
		print colored(' XXXXX ','bold yellow on_white');
	} elsif ($slot1 == 4) {	
		print colored(' OOOOO ','magenta on_white');
	} elsif ($slot1 == 5) {
		print colored('   77  ','red on_white');
	} elsif ($slot1 == 6) {
		print colored('__','white on_black');
		print colored('BAR','bold white on_black');
		print colored('__','white on_black');	
	} elsif ($slot1 == 17) {
		print colored('  GNU  ','bold blue on_white');											
	} else {
		print colored('       ','bold green on_white');
	}
}

	
sub slot4a {
	if ($slot1 == 1) {
		print colored(' CCCCC ','bold red on_white');
	} elsif ($slot1 == 2) {
		print colored('   H','bold green on_white'); print colored(' $ ','green on_white');
	} elsif ($slot1 == 3) {		
		print colored(' XXXXX ','bold yellow on_white');
	} elsif ($slot1 == 4) {	
		print colored(' OOOOO ','magenta on_white');
	} elsif ($slot1 == 5) {
		print colored('  777  ','red on_white');	
	} elsif ($slot1 == 6) {		
		print colored('  BAR  ','bold white on_black')
	} elsif ($slot1 == 11) {		
		print colored(' 77777 ','red on_white');
	} elsif ($slot1 == 14) {
		print colored('  ooo  ','magenta on_white');
	} elsif ($slot1 == 15) {
		print colored('   x   ','bold yellow on_white');
	} elsif ($slot1 == 17) {
		print colored('*******','bold blue on_blue');
	} elsif ($slot1 == 19) {
		print colored('*******','bold blue on_blue');																	
	} else {
		print colored('       ','bold green on_white');
	}
}

	
sub slot5a {
	
	if ($slot1 == 1) {
		print colored('  CCC  ','bold red on_white');
	} elsif ($slot1 == 2) {
		print colored(' $$$$  ','green on_white');
	} elsif ($slot1 == 3) {
		print colored('   O   ','yellow on_white');
	} elsif ($slot1 == 4) {	
		print colored('  OOO  ','magenta on_white');
	} elsif ($slot1 == 5) {
		print colored('  777  ','red on_white');
	} elsif ($slot1 == 11) {
		print colored('    77 ','red on_white');
	} elsif ($slot1 == 14) {
		print colored(' OOO','magenta on_white');
		print colored('O','green on_white');
		print colored('O ','magenta on_white');
	} elsif ($slot1 == 15) {
		print colored('  XXX  ','bold yellow on_white');
	} elsif ($slot1 == 19) {
		print colored('  GNU  ','bold blue on_white');																		
	} else {
		print colored('       ','bold green on_white');
	}
}

#2 (7 0-1)
#5
#8
#13
#18
#25
#1 (GNU)

sub findslot {
	$slotrand1 = int(rand(67));
	$slotrand2 = int(rand(67));
	$slotrand3 = int(rand(67));
	
	if ($slotrand1 <= 1) {
		$uzslot1 = 5;
		$uzs1 = 100000;
	} elsif ($slotrand1 <= 5) {
		$uzslot1 = 6;
		$uzs1 = 10000;
	} elsif ($slotrand1 <= 13) {
		$uzslot1 = 2;
		$uzs1 = 1000;
	} elsif ($slotrand1 <= 24) {
		$uzslot1 = 4;
		$uzs1 = 100;
	} elsif ($slotrand1 <= 39) {
		$uzslot1 = 3;
		$uzs1 = 10;
	} elsif ($slotrand1 <= 56) {
		$uzslot1 = 1;
		$uzs1 = 1;
	} elsif ($slotrand1 <= 58) {
		$uzslot1 = 11;
		$uzs1 = 0;
	} elsif ($slotrand1 <= 59) {
		$uzslot1 = 12;
		$uzs1 = 0;		
	} elsif ($slotrand1 <= 60) {
		$uzslot1 = 13;
		$uzs1 = 0;		
	} elsif ($slotrand1 <= 61) {
		$uzslot1 = 14;
		$uzs1 = 0;		
	} elsif ($slotrand1 <= 62) {
		$uzslot1 = 15;
		$uzs1 = 0;
	} elsif ($slotrand1 <= 63) {
		$uzslot1 = 16;
		$uzs1 = 0;
	} elsif ($slotrand1 == 64) {
		$uzslot1 = 17;
		$uzs1 = 1000000;
	} elsif ($slotrand1 == 65) {
		$uzslot1 = 18;
		$uzs1 = 0;
	} elsif ($slotrand1 == 66) {
		$uzslot1 = 19;
		$uzs1 = 0;								
	} else {
		$uzslot1 = 20;
		$uzs1 = 0;
	}
	
	if ($debugmode == 1) {
	print"$slotrand1 ";
	} else {
	}
		
	if ($slotrand2 <= 1) {
		$uzslot2 = 5;
		$uzs2 = 100000;
	} elsif ($slotrand2 <= 5) {
		$uzslot2 = 6;
		$uzs2 = 10000;
	} elsif ($slotrand2 <= 13) {
		$uzslot2 = 2;
		$uzs2 = 1000;
	} elsif ($slotrand2 <= 24) {
		$uzslot2 = 4;
		$uzs2 = 100;
	} elsif ($slotrand2 <= 39) {
		$uzslot2 = 3;
		$uzs2 = 10;
	} elsif ($slotrand2 <= 56) {
		$uzslot2 = 1;
		$uzs2 = 1;
	} elsif ($slotrand2 <= 58) {
		$uzslot2 = 11;
		$uzs2 = 0;
	} elsif ($slotrand2 <= 59) {
		$uzslot2 = 12;
		$uzs2 = 0;		
	} elsif ($slotrand2 <= 60) {
		$uzslot2 = 13;
		$uzs2 = 0;		
	} elsif ($slotrand2 <= 61) {
		$uzslot2 = 14;
		$uzs2 = 0;		
	} elsif ($slotrand2 <= 62) {
		$uzslot2 = 15;
		$uzs2 = 0;
	} elsif ($slotrand2 <= 63) {
		$uzslot2 = 16;
		$uzs2 = 0;
	} elsif ($slotrand2 == 64) {
		$uzslot2 = 17;
		$uzs2 = 1000000;
	} elsif ($slotrand2 == 65) {
		$uzslot2 = 18;
		$uzs2 = 0;
	} elsif ($slotrand2 == 66) {
		$uzslot2 = 19;
		$uzs2 = 0;									
	} else {
		$uzslot2 = 20;
		$uzs2 = 0;
	}
	
	if ($debugmode == 1) {
	print"$slotrand2 ";
	} else {
	}
	
	if ($slotrand3 <= 1) {
		$uzslot3 = 5;
		$uzs3 = 100000;
	} elsif ($slotrand3 <= 5) {
		$uzslot3 = 6;
		$uzs3 = 10000;
	} elsif ($slotrand3 <= 13) {
		$uzslot3 = 2;
		$uzs3 = 1000;
	} elsif ($slotrand3 <= 24) {
		$uzslot3 = 4;
		$uzs3 = 100;
	} elsif ($slotrand3 <= 39) {
		$uzslot3 = 3;
		$uzs3 = 10;
	} elsif ($slotrand3 <= 56) {
		$uzslot3 = 1;
		$uzs3 = 1;
	} elsif ($slotrand3 <= 58) {
		$uzslot3 = 11;
		$uzs3 = 0;
	} elsif ($slotrand3 <= 59) {
		$uzslot3 = 12;
		$uzs3 = 0;		
	} elsif ($slotrand3 <= 60) {
		$uzslot3 = 13;
		$uzs3 = 0;		
	} elsif ($slotrand3 <= 61) {
		$uzslot3 = 14;
		$uzs3 = 0;		
	} elsif ($slotrand3 <= 62) {
		$uzslot3 = 15;
		$uzs3 = 0;
	} elsif ($slotrand3 <= 63) {
		$uzslot3 = 16;
		$uzs3 = 0;
	} elsif ($slotrand3 == 64) {
		$uzslot3 = 17;
		$uzs3 = 1000000;	
	} elsif ($slotrand3 == 65) {
		$uzslot3 = 18;
		$uzs3 = 0;
	} elsif ($slotrand3 == 66) {
		$uzslot3 = 19;
		$uzs3 = 0;				
	} else {
		$uzslot3 = 20;
		$uzs3 = 0;
	}
	
	if ($debugmode == 1) {
	print"$slotrand3 ";
	} else {
	}		
								
}

sub slotadd {
	$addedslots = $uzs1 + $uzs2 + $uzs3;
	if ($addedslots == 3000000) {
		$addtogp = 100000;
		$spjackpot = 1;
	} elsif ($addedslots == 2100000) {
		$addtogp = 25000;
		$spjackpot = 2;
	} elsif ($addedslots == 2010000) {
		$addtogp = 3000;
		$spjackpot = 3;	
	} elsif ($addedslots == 2001000) {
		$addtogp = 600;
		$spjackpot = 4;					
	} elsif ($addedslots == 300000) {
		$addtogp = 10000;
		$jackpot = 1;
	} elsif ($addedslots == 30000) {
		$addtogp = 1000;
		$jackpot2 = 1;
	} elsif ($addedslots == 3000) {
		$addtogp = 300;
		$jackpot3 = 1;
	} elsif ($addedslots == 300) {
		$addtogp = 80;
		$jackpot4 = 1;
	} elsif ($addedslots == 30) {
		$addtogp = 10;
		$jackpot5 = 1;
	} elsif ($addedslots == 3) {
		$addtogp = 5;
		$jackpot6 = 1;
	} elsif ($addedslots == 120000) {
		$addtogp = 20;
		$jackpot7 = 1;
	} elsif ($addedslots == 12000) {
		$addtogp = 15;
		$jackpot8 = 1;
	} elsif ($addedslots == 10200) {
		$addtogp = 7;
		$jackpot9 = 1;						
	} else {
		$addtogp = 0;						
	}
	
	$gp = $gp + $addtogp;	
}

sub slotch1 {
$slot1 = $uzslot1;
}

sub slotch2 {
$slot1 = $uzslot2;
}

sub slotch3 {
$slot1 = $uzslot3;
}

sub slotprint {
t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','bold yellow on_blue'); t5(); print"\n";

t5(); print colored('I  ','bold yellow on_blue');  print colored('777','red on_blue'); 
print colored(' = 10,000GP   ','bold white on_blue'); 
print colored('GNU GNU GNU','bold blue on_blue'); print colored(' = 100,000GP','bold white on_blue'); 
print colored('    I','bold yellow on_blue'); t6(); print"\n";

t6(); print colored('I  ','bold yellow on_blue');  print colored('BAR','black on_blue'); 
print colored(' = 1,000GP    ','bold white on_blue');
print colored('GNU GNU','bold blue on_blue');  print colored('  7 ','red on_blue');
print colored(' = 25,000GP ','bold white on_blue');
print colored('    I','bold yellow on_blue'); t5(); print"\n";

t5(); print colored('I  ','bold yellow on_blue');  print colored('$$$','green on_blue'); 
print colored(' = 300GP      ','bold white on_blue'); 
print colored('GNU GNU','bold blue on_blue');  print colored(' BAR','black on_blue');
print colored(' = 3,000GP  ','bold white on_blue');
print colored('    I','bold yellow on_blue'); t6(); print"\n";


t6(); print colored('I  ','bold yellow on_blue');  print colored('OOO','magenta on_blue'); 
print colored(' = 80GP       ','bold white on_blue'); 
print colored('GNU GNU','bold blue on_blue'); print colored('  $ ','green on_blue');
print colored(' = 600GP    ','bold white on_blue');
print colored('    I','bold yellow on_blue'); t5(); print"\n";


t5(); print colored('I  ','bold yellow on_blue');  print colored('BBB','bold yellow on_blue'); 
print colored(' = 10GP','bold white on_blue'); print colored('                                  I','bold yellow on_blue'); t6(); print"\n";

t6(); print colored('I  ','bold yellow on_blue');  print colored('CCC','bold red on_blue'); 
print colored(' = 5GP','bold white on_blue'); print colored('                                   I','bold yellow on_blue'); t5(); print"\n";

t5(); t90(); print colored(' 77BAR = 20GP <> $$BAR = 15GP <> 00BAR = 7GP  ','bold black on_blue'); t90(); t6(); print"\n";

t6(); print colored('I          IIIIIIIIIIIIIIIIIIIIIIIII           I','bold yellow on_blue'); t5(); print"\n";

t5(); t90(); print colored('          ','bold white on_blue');
t90(); slotch1(); slot1a(); t90(); slotch2(); slot1a(); t90(); slotch3(); slot1a(); t90();
print colored('           ','bold white on_blue'); t90(); t6(); print"\n";

t6(); t90(); print colored('INSERT 1GP','bold white on_blue');
t90(); slotch1(); slot2a(); t90(); slotch2(); slot2a(); t90(); slotch3(); slot2a(); t90();
print colored('           ','bold white on_blue'); t90(); t5(); print"\n";

t5(); t90(); print colored('  TO PLAY ','bold white on_blue');
t90(); slotch1(); slot3a(); t90(); slotch2(); slot3a(); t90(); slotch3(); slot3a(); t90();
print colored('           ','bold white on_blue'); t90(); t6(); print"\n";

t6(); t90(); print colored('          ','bold white on_blue');
t90(); slotch1(); slot4a(); t90(); slotch2(); slot4a(); t90(); slotch3(); slot4a(); t90();
print colored('           ','bold white on_blue'); t90(); t5(); print"\n";

t5(); t90(); print colored('          ','bold white on_blue');
t90(); slotch1(); slot5a(); t90(); slotch2(); slot5a(); t90(); slotch3(); slot5a(); t90();
print colored('           ','bold white on_blue'); t90(); t6(); print"\n";

t6(); print colored('I          IIIIIIIIIIIIIIIIIIIIIIIII           I','bold yellow on_blue'); t5(); print"\n";

t5(); print colored('I                                              I','bold yellow on_blue'); t6(); print"\n";

t6(); print colored('IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII','bold yellow on_blue'); t5(); print"\n";
}
##BEING TEMPLATES##############################################################################################
##BEING TEMPLATES##############################################################################################
sub spiderbeing_temp {
	$spiderbeinginroom = 1;
	$spiderbeinghealth = 310;
	$spiderbeingattack = 4.5;
	$spiderbeingdefend = 0;
	$spiderbeingphase = 0;
	$spiderbeingweapon = 15;
	$spiderbeingarmor = 0; #armor class
	$spiderbeingluck = 0;
	$spiderbeingname = "generic spider";
	$spiderbeinghandle = "generic spider                          ";
}

sub spiderbeing1_define { 
	spiderbeing_temp(); 
	spiderbeing1_cust();
	spiderbeing1_trig();
} sub spiderbeing1_cust {
	$spiderbeinginroom_1 = $spiderbeinginroom; 
	$spiderbeinghealth_1 = $spiderbeinghealth;
	$spiderbeingattack_1 = $spiderbeingattack;
	$spiderbeingdefend_1 = $spiderbeingdefend;
	$spiderbeingphase_1 = $spiderbeingphase;
	$spiderbeingweapon_1 = $spiderbeingweapon;
	$spiderbeingarmor_1 = $spiderbeingarmor;
	$spiderbeingluck_1 = $spiderbeingluck;	
	$spiderbeingname_1 = "spider1";
	$spiderbeinghandle_1 = $spiderbeinghandle;
	$spiderbeinglife_1 = $spiderbeinghealth;	
} sub spiderbeing1_trig {
	$spiderbeinglife_trig_1 = 1;
	$spiderbeingmsg_trig_1 = 0;
} sub spiderbeing1_push {
	$beinginroom = $spiderbeinginroom_1; 
	$beinghealth = $spiderbeinghealth_1;
	$beingattack = $spiderbeingattack_1;
	$beingdefend = $spiderbeingdefend_1;
	$beingphase = $spiderbeingphase_1;
	$beingweapon = $spiderbeingweapon_1;
	$beingarmor = $spiderbeingarmor_1;
	$beingluck = $spiderbeingluck_1;
	$beingname = $spiderbeingname_1;
	$beinghandle = $spiderbeinghandle_1;
	$beinglife = $spiderbeinglife_1;	
} sub spiderbeing1_pull {
	$spiderbeinginroom_1 = $beinginroom;
	$spiderbeinghealth_1 = $beinghealth; 
	$spiderbeingattack_1 = $beingattack;
	$spiderbeingdefend_1 = $beingdefend;
	$spiderbeingphase_1 = $beingphase;
	$spiderbeingweapon_1 = $beingweapon;
	$spiderbeingarmor_1 = $beingarmor;
	$spiderbeingluck_1 = $beingluck;
	$spiderbeingname_1 = "spider1";
	$spiderbeinghandle_1 = $beinghandle;
	$spiderbeinglife_1 = $beinglife;
} sub spiderbeing1_exe {	
	if ($spiderbeinginroom_1 == 1) {
			spiderbeing1_push();
			spiderbeing1_status();
			spiderbeing1_infoa();
	} else {
		if ($spiderbeingmsg_trig_1 == 0) {
			spiderbeing1_status();
			spiderbeing1_infoa();
		} else {
		}		
	}
} sub spiderbeing1_infoa {
	if ($spiderbeinglife_trig_1 == 0) {
		if ($fired9mm == 1) {
		$info = '                *POP* *SPLAT*                   ';
		$info2 = '                                                ';
		} elsif ($fired45cal == 1) {
		$info = '                *POP* *SPLAT*                   ';
		$info2 = '                                                ';
		} elsif ($fired12ga == 1) {
		$info = '               *BOOM* *SPLAT*                   ';
		$info2 = '                                                ';				
		} else {
		$info = '            The spider has died!                ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$spiderbeinglife_trig_1 = 1;
		$spiderbeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.01;
	} else {
	}
} sub spiderbeing1_status {
	if ($spiderbeinghealth_1 <= 0) {
		$spiderbeinginroom_1 = 0;
		$spiderbeinglife_trig_1 = 0;
	} else {
	}
} 


########################################
########################################

sub ratbeing_temp {
	$ratbeinginroom = 1;
	$ratbeinghealth = 510;
	$ratbeingattack = 7;
	$ratbeingdefend = 0;
	$ratbeingphase = 0;
	$ratbeingweapon = 15;
	$ratbeingarmor = 0;
	$ratbeingluck = 0;
	$ratbeingname = "generic rat";
	$ratbeinghandle = "generic rat                             ";
}
#Si, that is ghetto and stupid...

sub ratbeing1_define { 
	ratbeing_temp(); 
	ratbeing1_cust();
	ratbeing1_trig();
} sub ratbeing1_cust {
	$ratbeinginroom_1 = $ratbeinginroom; 
	$ratbeinghealth_1 = $ratbeinghealth;
	$ratbeingattack_1 = $ratbeingattack;
	$ratbeingdefend_1 = $ratbeingdefend;
	$ratbeingphase_1 = $ratbeingphase;
	$ratbeingweapon_1 = $ratbeingweapon;
	$ratbeingarmor_1 = $ratbeingarmor;
	$ratbeingluck_1 = $ratbeingluck;
	$ratbeingname_1 = "rat1";
	$ratbeinghandle_1 = $ratbeinghandle;
	$ratbeinglife_1 = $ratbeinghealth;
} sub ratbeing1_trig {
	$ratbeinglife_trig_1 = 1;
	$ratbeingmsg_trig_1 = 0;
} sub ratbeing1_push {
	$beinginroom = $ratbeinginroom_1; 
	$beinghealth = $ratbeinghealth_1;
	$beingattack = $ratbeingattack_1;
	$beingdefend = $ratbeingdefend_1;
	$beingphase = $ratbeingphase_1;
	$beingweapon = $ratbeingweapon_1;
	$beingarmor = $ratbeingarmor_1;
	$beingluck = $ratbeingluck_1;
	$beingname = $ratbeingname_1;
	$beinghandle = $ratbeinghandle_1;
	$beinglife = $ratbeinglife_1;
} sub ratbeing1_pull {
	$ratbeinginroom_1 = $beinginroom;
	$ratbeinghealth_1 = $beinghealth; 
	$ratbeingattack_1 = $beingattack;	
	$ratbeingdefend_1 = $beingdefend;
	$ratbeingphase_1 = $beingphase;
	$ratbeingweapon_1 = $beingweapon;
	$ratbeingarmor_1 = $beingarmor;
	$ratbeingluck_1 = $beingluck;
	$ratbeingname_1 = "rat1";
	$ratbeinghandle_1 = $beinghandle;
	$ratbeinglife_1 = $beinglife;
} sub ratbeing1_exe {	
	if ($ratbeinginroom_1 == 1) {
			ratbeing1_push();
			ratbeing1_status();
			ratbeing1_infoa();
	} else {
		if ($ratbeingmsg_trig_1 == 0) {
			ratbeing1_status();
			ratbeing1_infoa();
		} else {
		}		
	}
} sub ratbeing1_infoa {
	if ($ratbeinglife_trig_1 == 0) {
		if ($fired9mm == 1) {
		$info = '  The rat has died (and by your gat no doubt)   ';
		$info2 = '                                                ';		
		} elsif ($fired45cal == 1) {
		$info = ' The rat has died (and by your fo-five no doubt)';
		$info2 = '                                                ';
		} elsif ($fired12ga == 1) {
		$info = '  The rat has died (and by your shotty no doubt)';
		$info2 = '                                                ';			
		} else {
		$info = '  The rat has died (and by your hand no doubt)  ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$ratbeinglife_trig_1 = 1;
		$ratbeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.03;
	} else {
	}
} sub ratbeing1_status {
	if ($ratbeinghealth_1 <= 0) {
		$ratbeinginroom_1 = 0;
		$ratbeinglife_trig_1 = 0;
	} else {
	}
} 

########################################
########################################
sub ratbeing2_define { 
	ratbeing_temp(); 
	ratbeing2_cust();
	ratbeing2_trig();
} sub ratbeing2_cust {
	$ratbeinginroom_2 = $ratbeinginroom; 
	$ratbeinghealth_2 = $ratbeinghealth + 155;
	$ratbeingattack_2 = $ratbeingattack + 1;
	$ratbeingdefend_2 = $ratbeingdefend;
	$ratbeingphase_2 = $ratbeingphase;
	$ratbeingweapon_2 = $ratbeingweapon;
	$ratbeingarmor_2 = $ratbeingarmor;
	$ratbeingluck_2 = $ratbeingluck + 1;
	$ratbeingname_2 = "rat2";
	$ratbeinghandle_2 = "large rat                               ";
	$ratbeinglife_2 = $ratbeinghealth + 155;
} sub ratbeing2_trig {
	$ratbeinglife_trig_2 = 1;
	$ratbeingmsg_trig_2 = 0;
} sub ratbeing2_push {
	$beinginroom = $ratbeinginroom_2; 
	$beinghealth = $ratbeinghealth_2;
	$beingattack = $ratbeingattack_2;
	$beingdefend = $ratbeingdefend_2;
	$beingphase = $ratbeingphase_2;
	$beingweapon = $ratbeingweapon_2;
	$beingarmor = $ratbeingarmor_2;
	$beingluck = $ratbeingluck_2;
	$beingname = $ratbeingname_2;
	$beinghandle = $ratbeinghandle_2;
	$beinglife = $ratbeinglife_2;
} sub ratbeing2_pull {
	$ratbeinginroom_2 = $beinginroom;
	$ratbeinghealth_2 = $beinghealth; 
	$ratbeingattack_2 = $beingattack;
	$ratbeingdefend_2 = $beingdefend;
	$ratbeingphase_2 = $beingphase;
	$ratbeingweapon_2 = $beingweapon;
	$ratbeingarmor_2 = $beingarmor;
	$ratbeingluck_2 = $beingluck;
	$ratbeingname_2 = "rat2";
	$ratbeinghandle_2 = $beinghandle;
	$ratbeinglife_2 = $beinglife;
} sub ratbeing2_exe {	
	if ($ratbeinginroom_2 == 1) {
			ratbeing2_push();
			ratbeing2_status();
			ratbeing2_infoa();
	} else {
		if ($ratbeingmsg_trig_2 == 0) {
			ratbeing2_status();
			ratbeing2_infoa();
		} else {
		}		
	}
} sub ratbeing2_infoa {
	if ($ratbeinglife_trig_2 == 0) {
		if ($fired9mm == 1) {
		$info = '      You give the rat a taste of yo strap      ';
		$info2 = "           It dosen't move anymore              ";
		} elsif ($fired45cal == 1) {
		$info = '   You give the rat a taste of yo hand cannon   ';
		$info2 = "      It dosen't do anything anymore            ";
		} elsif ($fired12ga == 1) {
		$info = '      You give the rat a taste of yo shotty     ';
		$info2 = "            It isn't there anymore              ";				
		} else {
		$info = ' The rat has died, a tremor passes through you  ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$ratbeinglife_trig_2 = 1;
		$ratbeingmsg_trig_2 = 1;
		$psphysexp = $psphysexp + 0.03;
	} else {
	}
} sub ratbeing2_status {
	if ($ratbeinghealth_2 <= 0) {
		$ratbeinginroom_2 = 0;
		$ratbeinglife_trig_2 = 0;
	} else {
	}
} 

########################################
########################################
sub pincerbeing_temp {
	$pincerbeinginroom = 1;
	$pincerbeinghealth = 4100;
	$pincerbeingattack = 17.5;
	$pincerbeingdefend = 0;
	$pincerbeingphase = 0;
	$pincerbeingweapon = 15;
	$pincerbeingarmor = 0;
	$pincerbeingluck = 2;
	$pincerbeingname = "mangrel dog";
	$pincerbeinghandle = "mangrel dog                             ";
}

sub pincerbeing1_define { 
	pincerbeing_temp(); 
	pincerbeing1_cust();
	pincerbeing1_trig();
} sub pincerbeing1_cust {
	$pincerbeinginroom_1 = $pincerbeinginroom; 
	$pincerbeinghealth_1 = $pincerbeinghealth;
	$pincerbeingattack_1 = $pincerbeingattack;
	$pincerbeingdefend_1 = $pincerbeingdefend;
	$pincerbeingphase_1 = $pincerbeingphase;
	$pincerbeingweapon_1 = $pincerbeingweapon;
	$pincerbeingarmor_1 = $pincerbeingarmor;
	$pincerbeingluck_1 = $pincerbeingluck;
	$pincerbeingname_1 = "pincer1";
	$pincerbeinghandle_1 = $pincerbeinghandle;
	$pincerbeinglife_1 = $pincerbeinghealth;
} sub pincerbeing1_trig {
	$pincerbeinglife_trig_1 = 1;
	$pincerbeingmsg_trig_1 = 0;
} sub pincerbeing1_push {
	$beinginroom = $pincerbeinginroom_1; 
	$beinghealth = $pincerbeinghealth_1;
	$beingattack = $pincerbeingattack_1;
	$beingdefend = $pincerbeingdefend_1;
	$beingphase = $pincerbeingphase_1;
	$beingweapon = $pincerbeingweapon_1;
	$beingarmor = $pincerbeingarmor_1;
	$beingluck = $pincerbeingluck_1;
	$beingname = $pincerbeingname_1;
	$beinghandle = $pincerbeinghandle_1;
	$beinglife = $pincerbeinglife_1;
} sub pincerbeing1_pull {
	$pincerbeinginroom_1 = $beinginroom;
	$pincerbeinghealth_1 = $beinghealth; 
	$pincerbeingattack_1 = $beingattack;
	$pincerbeingdefend_1 = $beingdefend;
	$pincerbeingphase_1 = $beingphase;
	$pincerbeingweapon_1 = $beingweapon;
	$pincerbeingarmor_1 = $beingarmor;
	$pincerbeingluck_1 = $beingluck;
	$pincerbeingname_1 = "pincer1";
	$pincerbeinghandle_1 = $beinghandle;
	$pincerbeinglife_1 = $beinglife;
} sub pincerbeing1_exe {	
	if ($pincerbeinginroom_1 == 1) {
			pincerbeing1_push();
			pincerbeing1_status();
			pincerbeing1_infoa();
	} else {
		if ($pincerbeingmsg_trig_1 == 0) {
			pincerbeing1_status();
			pincerbeing1_infoa();
		} else {
		}		
	}
} sub pincerbeing1_infoa {
	if ($pincerbeinglife_trig_1 == 0) {
		if ($brstfired == 1) {
		$info = '   A quick burst of lead leaves the dog dead    ';
		$info2 = '                                                ';
		} elsif ($smgfired == 1) {
		$info = " Automatic weapon's fire echos around the room  ";
		$info2 = 'A lifeless body of a dog drops to the cold tiles';	
		} elsif ($fired9mm == 1) {
		$info = "    You blow a hole through the dog's brain     ";
		$info2 = '               so sad, so sad...                ';
		} elsif ($brst45calfired == 1) {
		$info = '  You wonder if burst was too little to early   ';
		$info2 = '                                                ';
		} elsif ($smg45calfired == 1) {
		$info = '     The dog owes you its weight in .45 ACP     ';
		$info2 = '                                                ';	
		} elsif ($fired45cal == 1) {
		$info = "    You blow a hole through the dog's brain     ";
		$info2 = '     You can fit your fingers through it        ';
		} elsif ($fired12ga == 1) {
		$info = "          You blow off the dog's head           ";
		$info2 = '               so sad, so sad...                ';
		} elsif ($firedRPGX14 == 1) {
		$info = '             You blow up the dog                ';
		$info2 = '               so sad, so sad...                ';
		} elsif ($attackedaxe == 1) {
		$info = " You lower your axe through the dog's skull, it ";
		$info2 = ' fails to survive the loss of cerebral function ';
		} elsif ($attackedblunt == 1) {
		$info = '   You beat the dog untill it moves no longer   ';
		$info2 = '                                                ';
		} elsif ($attackedsword == 1) {
		$info = '        You cleave the dog in many ways         ';
		$info2 = '        The sword, anew, with you stays         ';										
		} else {
		$info = '           The dog has died rejoice!            ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$pincerbeinglife_trig_1 = 1;
		$pincerbeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.25;
	} else {
	}
} sub pincerbeing1_status {
	if ($pincerbeinghealth_1 <= 0) {
		$pincerbeinginroom_1 = 0;
		$pincerbeinglife_trig_1 = 0;
	} else {
	}
}

########################################
########################################

sub pincerbeing2_define { 
	pincerbeing_temp(); 
	pincerbeing2_cust();
	pincerbeing2_trig();
} sub pincerbeing2_cust {
	$pincerbeinginroom_2 = $pincerbeinginroom; 
	$pincerbeinghealth_2 = $pincerbeinghealth;
	$pincerbeingattack_2 = $pincerbeingattack;
	$pincerbeingdefend_2 = $pincerbeingdefend;
	$pincerbeingphase_2 = $pincerbeingphase;
	$pincerbeingweapon_2 = $pincerbeingweapon;
	$pincerbeingarmor_2 = $pincerbeingarmor;
	$pincerbeingluck_2 = $pincerbeingluck;
	$pincerbeingname_2 = 'pincer2';
	$pincerbeinghandle_2 = $pincerbeinghandle;
	$pincerbeinglife_2 = $pincerbeinghealth;
} sub pincerbeing2_trig {
	$pincerbeinglife_trig_2 = 1;
	$pincerbeingmsg_trig_2 = 0;
} sub pincerbeing2_push {
	$beinginroom = $pincerbeinginroom_2; 
	$beinghealth = $pincerbeinghealth_2;
	$beingattack = $pincerbeingattack_2;
	$beingdefend = $pincerbeingdefend_2;
	$beingphase = $pincerbeingphase_2;
	$beingweapon = $pincerbeingweapon_2;
	$beingarmor = $pincerbeingarmor_2;
	$beingluck = $pincerbeingluck_2;
	$beingname = $pincerbeingname_2;
	$beinghandle = $pincerbeinghandle_2;
	$beinglife = $pincerbeinglife_2;
} sub pincerbeing2_pull {
	$pincerbeinginroom_2 = $beinginroom;
	$pincerbeinghealth_2 = $beinghealth; 
	$pincerbeingattack_2 = $beingattack;
	$pincerbeingdefend_2 = $beingdefend;
	$pincerbeingphase_2 = $beingphase;
	$pincerbeingweapon_2 = $beingweapon;
	$pincerbeingarmor_2 = $beingarmor;
	$pincerbeingluck_2 = $beingluck;
	$pincerbeingname_2 = 'pincer2';
	$pincerbeinghandle_2 = $beinghandle;
	$pincerbeinglife_2 = $beinglife;
} sub pincerbeing2_exe {	
	if ($pincerbeinginroom_2 == 1) {
			pincerbeing2_push();
			pincerbeing2_status();
			pincerbeing2_infoa();
	} else {
		if ($pincerbeingmsg_trig_2 == 0) {
			pincerbeing2_status();
			pincerbeing2_infoa();
		} else {
		}		
	}
} sub pincerbeing2_infoa {
	if ($pincerbeinglife_trig_2 == 0) {
		if ($brstfired == 1) {
		$info = '   A quick burst of lead leaves the dog dead    ';
		$info2 = '                                                ';
		} elsif ($smgfired == 1) {
		$info = " Automatic weapon's fire echos around the room  ";
		$info2 = 'A lifeless body of a dog drops to the cold tiles';	
		} elsif ($fired9mm == 1) {
		$info = "    You blow a hole through the dog's brain     ";
		$info2 = '               so sad, so sad...                ';
		} elsif ($brst45calfired == 1) {
		$info = '  You wonder if burst was too little to early   ';
		$info2 = '                                                ';
		} elsif ($smg45calfired == 1) {
		$info = '     The dog owes you its weight in .45 ACP     ';
		$info2 = '                                                ';	
		} elsif ($fired45cal == 1) {
		$info = "    You blow a hole through the dog's brain     ";
		$info2 = '     You can fit your fingers through it        ';
		} elsif ($fired12ga == 1) {
		$info = "          You blow off the dog's head           ";
		$info2 = '               so sad, so sad...                ';
		} elsif ($firedRPGX14 == 1) {
		$info = '            You detonate the dog                ';
		$info2 = '               so sad, so sad...                ';
		} elsif ($attackedaxe == 1) {
		$info = " You crush the dog's bones with a blow from your";
		$info2 = '    axe... No longer does the beast move        ';
		} elsif ($attackedblunt == 1) {
		$info = '     To death the beast submits to your will    ';
		$info2 = '                                                ';
		} elsif ($attackedsword == 1) {
		$info = '    Your sword cuts the dog down at your feet   ';
		$info2 = '                                                ';										
		} else {
		$info = '       The mangrel has been butchered           ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$pincerbeinglife_trig_2 = 1;
		$pincerbeingmsg_trig_2 = 1;
		$psphysexp = $psphysexp + 0.25;
	} else {
	}
} sub pincerbeing2_status {
	if ($pincerbeinghealth_2 <= 0) {
		$pincerbeinginroom_2 = 0;
		$pincerbeinglife_trig_2 = 0;
	} else {
	}
}

########################################
########################################

sub catbeing_temp {
	$catbeinginroom = 1;
	$catbeinghealth = 2111;
	$catbeingattack = 11;
	$catbeingdefend = 0;
	$catbeingphase = 0;
	$catbeingweapon = 15;
	$catbeingarmor = 0;
	$catbeingluck = 3;
	$catbeingname = "house cat";
	$catbeinghandle = "house cat                               ";
}
#Si, that is ghetto and stupid...

sub catbeing1_define { 
	catbeing_temp(); 
	catbeing1_cust();
	catbeing1_trig();
} sub catbeing1_cust {
	$catbeinginroom_1 = $catbeinginroom; 
	$catbeinghealth_1 = $catbeinghealth;
	$catbeingattack_1 = $catbeingattack;
	$catbeingdefend_1 = $catbeingdefend;
	$catbeingphase_1 = $catbeingphase;
	$catbeingweapon_1 = $catbeingweapon;
	$catbeingarmor_1 = $catbeingarmor;
	$catbeingluck_1 = $catbeingluck;
	$catbeingname_1 = "cat1";
	$catbeinghandle_1 = $catbeinghandle;
	$catbeinglife_1 = $catbeinghealth;
} sub catbeing1_trig {
	$catbeinglife_trig_1 = 1;
	$catbeingmsg_trig_1 = 0;
} sub catbeing1_push {
	$beinginroom = $catbeinginroom_1; 
	$beinghealth = $catbeinghealth_1;
	$beingattack = $catbeingattack_1;
	$beingdefend = $catbeingdefend_1;
	$beingphase = $catbeingphase_1;
	$beingweapon = $catbeingweapon_1;
	$beingarmor = $catbeingarmor_1;
	$beingluck = $catbeingluck_1;
	$beingname = $catbeingname_1;
	$beinghandle = $catbeinghandle_1;
	$beinglife = $catbeinglife_1;
} sub catbeing1_pull {
	$catbeinginroom_1 = $beinginroom;
	$catbeinghealth_1 = $beinghealth; 
	$catbeingattack_1 = $beingattack;
	$catbeingdefend_1 = $beingdefend;
	$catbeingphase_1 = $beingphase;
	$catbeingweapon_1 = $beingweapon;
	$catbeingarmor_1 = $beingarmor;
	$catbeingluck_1 = $beingluck;
	$catbeingname_1 = "cat1";
	$catbeinghandle_1 = $beinghandle;
	$catbeinglife_1 = $beinglife;
} sub catbeing1_exe {	
	if ($catbeinginroom_1 == 1) {
			catbeing1_push();
			catbeing1_status();
			catbeing1_infoa();
	} else {
		if ($catbeingmsg_trig_1 == 0) {
			catbeing1_status();
			catbeing1_infoa();
		} else {
		}		
	}
} sub catbeing1_infoa {
	if ($catbeinglife_trig_1 == 0) {
		if ($fired9mm == 1) {
		$info = '    The feline has been capped off, huzzah!     ';
		$info2 = '                                                ';
		} elsif ($fired12ga == 1) {
		$info = ' The feline has been blown to bits via your 12GA';
		$info2 = '                    HUZZAH!                     ';
		} elsif ($firedRPGX14 == 1) {
		$info = ' The feline has been blown to less than bits via';
		$info2 = '            your RPG-X14 ... HUZZAH!            ';
		} elsif ($brst45calfired == 1) {
		$info = '        BOOM BOOM BOOM / RAT-A-TAT-TAT          ';
		$info2 = '      A mutha fuckin gat, killed the cat        ';	
		} elsif ($smg45calfired == 1) {
		$info = '    .45 .45 .45 .45 .45 .45 .45 ... click       ';
		$info2 = '               No more pet hair                 ';
		} elsif ($fired45cal == 1) {
		$info = '          The feline has been capped            ';
		$info2 = '                                                ';
		} elsif ($attackedblunt == 1) {
		$info = ' The feline has been beaten to the grave huzzah!';
		$info2 = '                                                ';
		} elsif ($attackedsword == 1) {
		$info = ' The feline has been run through via your sword ';
		$info2 = '                    huzzah!                     ';								
		} else {
		$info = '         The feline has died huzzah!            ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$catbeinglife_trig_1 = 1;
		$catbeingmsg_trig_1 = 1;
	} else {
	}
} sub catbeing1_status {
	if ($catbeinghealth_1 <= 0) {
		$catbeinginroom_1 = 0;
		$catbeinglife_trig_1 = 0;
		$psphysexp = $psphysexp + 0.05;
	} else {
	}
} 

########################################
########################################

sub droidbeing_temp {
	$droidbeinginroom = 1;
	$droidbeinghealth = 12000;
	$droidbeingattack = 0;
	$droidbeingdefend = 0;
	$droidbeingphase = 0;
	$droidbeingweapon = 16;
	$droidbeingarmor = 0;
	$droidbeingluck = 0;
	$droidbeingname = "passive gaurd droid";
	$droidbeinghandle = "passive gaurd droid                     ";
}

sub droidbeing_fire {
	soundFX_play_laser();
	
	$bodyparthit = int(rand(24));
	if ($bodyparthit == 9) {
		if ($bodypart_head == 0) {
			#N/A
		} else {
			$info = '       The droid blows your head to bits        ';
			$info2 = '                                                ';
		}
		$bodypart_head = 0;
	} elsif ($bodyparthit == 19) {
		if ($bodypart_kneck == 0) {
			#N/A
		} else {
			$info = '         The droid atomizes your kneck          ';
			$info2 = '                                                ';
		}
		$bodypart_kneck = 0;
	} elsif ($bodyparthit == 5) {
		if ($bodypart_armR == 0) {
			#N/A
		} else {
			$info = '       The droid destroys your right arm        ';
			$info2 = '                                                ';
		}
		$bodypart_armR = 0;
	} elsif ($bodyparthit == 15) {
		if ($bodypart_armL == 0) {
			#N/A
		} else {
			$info = '       The droid shoots off your left arm       ';
			$info2 = '                                                ';
		}
		$bodypart_armL = 0;		
	} else {
		#N/A
	}
}

sub droidbeing1_define { 
	droidbeing_temp(); 
	droidbeing1_cust();
	droidbeing1_trig();
} sub droidbeing1_cust {
	$droidbeinginroom_1 = $droidbeinginroom; 
	$droidbeinghealth_1 = $droidbeinghealth;
	$droidbeingattack_1 = $droidbeingattack;
	$droidbeingdefend_1 = $droidbeingdefend;
	$droidbeingphase_1 = $droidbeingphase;
	$droidbeingweapon_1 = $droidbeingweapon;
	$droidbeingarmor_1 = $droidbeingarmor;
	$droidbeingluck_1 = $droidbeingluck;
	$droidbeingname_1 = "droid1";
	$droidbeinghandle_1 = $droidbeinghandle;
	$droidbeinglife_1 = $droidbeinghealth;
} sub droidbeing1_trig {
	$droidbeinglife_trig_1 = 1;
	$droidbeingmsg_trig_1 = 0;
} sub droidbeing1_push {
	$beinginroom = $droidbeinginroom_1; 
	$beinghealth = $droidbeinghealth_1;
	$beingattack = $droidbeingattack_1;
	$beingdefend = $droidbeingdefend_1;
	$beingphase = $droidbeingphase_1;
	$beingweapon = $droidbeingweapon_1;
	$beingarmor = $droidbeingarmor_1;
	$beingluck = $droidbeingluck_1;
	$beingname = $droidbeingname_1;
	$beinghandle = $droidbeinghandle_1;
	$beinglife = $droidbeinglife_1;
} sub droidbeing1_pull {
	$droidbeinginroom_1 = $beinginroom;
	$droidbeinghealth_1 = $beinghealth; 
	$droidbeingattack_1 = $beingattack;
	$droidbeingdefend_1 = $beingdefend;
	$droidbeingphase_1 = $beingphase;
	$droidbeingweapon_1 = $beingweapon;
	$droidbeingarmor_1 = $beingarmor;
	$droidbeingluck_1 = $beingluck;
	$droidbeingname_1 = "droid1";
	$droidbeinghandle_1 = $beinghandle;
	$droidbeinglife_1 = $beinglife;
} sub droidbeing1_exe {	
	if ($droidbeinginroom_1 == 1) {
			droidbeing1_push();
			droidbeing1_status();
			droidbeing1_infoa();
	} else {
		if ($droidbeingmsg_trig_1 == 0) {
			droidbeing1_status();
			droidbeing1_infoa();
		} else {
		}		
	}
} sub droidbeing1_infoa {
	if ($droidbeinglife_trig_1 == 0) {
		if ($brstfired == 1) {
		$info = '  You fire a burst of bullets at the droid and  ';
		$info2 = "              destroy it's CPU                  ";	
		} elsif ($smgfired == 1) {
		$info = '   You spray the droid with bullets and manage  ';
		$info2 = "          to obliterate it's CPU                ";		
		} elsif ($fired9mm == 1) {
		$info = '   You fire a bullet at the droid and destroy   ';
		$info2 = "                  it's CPU                      ";
		} elsif ($brst45calfired == 1) {
		$info = 'You fire a burst of .45 cal bullets at the droid';
		$info2 = '     and thus assist it in catching a case      ';	
		} elsif ($smg45calfired == 1) {
		$info = '   You spray the droid with bullets and manage  ';
		$info2 = "        to put a .45 through it's CPU           ";		
		} elsif ($fired45cal == 1) {
		$info = 'You fire one single .45 at the droid and destroy';
		$info2 = "                  it's CPU                      ";
		} elsif ($fired12ga == 1) {
		$info = '  You pepper the droid full of holes with your  ';
		$info2 = "         shotgun and destroy it's CPU           ";
		} elsif ($firedRPGX14 == 1) {
		$info = '  Shrapnel rips apart the droid as your RPG-X14 ';
		$info2 = '  detonates in close proximity to the machine   ';
		} elsif ($attackedblunt == 1) {
		$info = '  You beat the droid until it no longer works   ';
		$info2 = "                                                ";						
		} else {
		$info = '         The droid has been destroyed           ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$statmurders = $statmurders + 1;
		$droidbeinglife_trig_1 = 1;
		$droidbeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.35;
	} else {
	}
} sub droidbeing1_status {
	if ($droidbeinghealth_1 <= 0) {
		$droidbeinginroom_1 = 0;
		$droidbeinglife_trig_1 = 0;
	} else {
		if (($droid1attacktrig2 == 1) or ($droid1attacktrig == 1)) {
			droidbeing_fire();
		} else {
		}
	}
} 

########################################
########################################

sub droidbeing2_define { 
	droidbeing_temp(); 
	droidbeing2_cust();
	droidbeing2_trig();
} sub droidbeing2_cust {
	$droidbeinginroom_2 = $droidbeinginroom; 
	$droidbeinghealth_2 = $droidbeinghealth;
	$droidbeingattack_2 = $droidbeingattack;
	$droidbeingdefend_2 = $droidbeingdefend;
	$droidbeingphase_2 = $droidbeingphase;
	$droidbeingweapon_2 = $droidbeingweapon;
	$droidbeingarmor_2 = $droidbeingarmor;
	$droidbeingluck_2 = $droidbeingluck;
	$droidbeingname_2 = "droid2";
	$droidbeinghandle_2 = $droidbeinghandle;
	$droidbeinglife_2 = $droidbeinghealth;
} sub droidbeing2_trig {
	$droidbeinglife_trig_2 = 1;
	$droidbeingmsg_trig_2 = 0;
} sub droidbeing2_push {
	$beinginroom = $droidbeinginroom_2; 
	$beinghealth = $droidbeinghealth_2;
	$beingattack = $droidbeingattack_2;
	$beingdefend = $droidbeingdefend_2;
	$beingphase = $droidbeingphase_2;
	$beingweapon = $droidbeingweapon_2;
	$beingarmor = $droidbeingarmor_2;
	$beingluck = $droidbeingluck_2;
	$beingname = $droidbeingname_2;
	$beinghandle = $droidbeinghandle_2;
	$beinglife = $droidbeinglife_2;
} sub droidbeing2_pull {
	$droidbeinginroom_2 = $beinginroom;
	$droidbeinghealth_2 = $beinghealth; 
	$droidbeingattack_2 = $beingattack;
	$droidbeingdefend_2 = $beingdefend;
	$droidbeingphase_2 = $beingphase;
	$droidbeingweapon_2 = $beingweapon;
	$droidbeingarmor_2 = $beingarmor;
	$droidbeingluck_2 = $beingluck;
	$droidbeingname_2 = "droid2";
	$droidbeinghandle_2 = $beinghandle;
	$droidbeinglife_2 = $beinglife;
} sub droidbeing2_exe {	
	if ($droidbeinginroom_2 == 1) {
			droidbeing2_push();
			droidbeing2_status();
			droidbeing2_infoa();
	} else {
		if ($droidbeingmsg_trig_2 == 0) {
			droidbeing2_status();
			droidbeing2_infoa();
		} else {
		}		
	}
} sub droidbeing2_infoa {
	if ($droidbeinglife_trig_2 == 0) {
		if ($brstfired == 1) {
		$info = '  You fire a burst of bullets at the droid and  ';
		$info2 = "              destroy it's CPU                  ";	
		} elsif ($smgfired == 1) {
		$info = '   You spray the droid with bullets and manage  ';
		$info2 = "          to obliterate it's CPU                ";		
		} elsif ($fired9mm == 1) {
		$info = '   You fire a bullet at the droid and destroy   ';
		$info2 = "                  it's CPU                      ";
		} elsif ($brst45calfired == 1) {
		$info = 'You fire a burst of .45 cal bullets at the droid';
		$info2 = '     and thus assist it in catching a case      ';	
		} elsif ($smg45calfired == 1) {
		$info = '   You spray the droid with bullets and manage  ';
		$info2 = "        to put a .45 through it's CPU           ";		
		} elsif ($fired45cal == 1) {
		$info = 'You fire one single .45 at the droid and destroy';
		$info2 = "                  it's CPU                      ";
		} elsif ($fired12ga == 1) {
		$info = '  You pepper the droid full of holes with your  ';
		$info2 = "         shotgun and destroy it's CPU           ";
		} elsif ($firedRPGX14 == 1) {
		$info = '  Shrapnel rips apart the droid as your RPG-X14 ';
		$info2 = '  detonates in close proximity to the machine   ';
		} elsif ($attackedblunt == 1) {
		$info = '  You beat the droid until it no longer works   ';
		$info2 = "                                                ";						
		} else {
		$info = '         The droid has been destroyed           ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$statmurders = $statmurders + 1;
		$droidbeinglife_trig_2 = 1;
		$droidbeingmsg_trig_2 = 1;
		$psphysexp = $psphysexp + 0.35;
	} else {
	}
} sub droidbeing2_status {
	if ($droidbeinghealth_2 <= 0) {
		$droidbeinginroom_2 = 0;
		$droidbeinglife_trig_2 = 0;
	} else {
		if (($droid2attacktrig2 == 1) or ($droid2attacktrig == 1)) {
			droidbeing_fire();
		} else {
		}
	}
} 

########################################
########################################

sub thuggbeing_temp {
	$thuggbeinginroom = 1;
	$thuggbeinghealth = 9500;
	$thuggbeingattack = 15;
	$thuggbeingdefend = 10;
	$thuggbeingphase = 0;
	$thuggbeingweapon = 4;
	$thuggbeingarmor = 1;
	$thuggbeingluck = 5;
	$thuggbeingname = "thugg";
	$thuggbeinghandle = "hostile prisoner                        ";
}

sub thuggbeing1_define { 
	thuggbeing_temp(); 
	thuggbeing1_cust();
	thuggbeing1_trig();
} sub thuggbeing1_cust {
	$thuggbeinginroom_1 = $thuggbeinginroom; 
	$thuggbeinghealth_1 = $thuggbeinghealth;
	$thuggbeingattack_1 = $thuggbeingattack;
	$thuggbeingdefend_1 = $thuggbeingdefend;
	$thuggbeingphase_1 = $thuggbeingphase;
	$thuggbeingweapon_1 = $thuggbeingweapon;
	$thuggbeingarmor_1 = $thuggbeingarmor;
	$thuggbeingluck_1 = $thuggbeingluck;
	$thuggbeingname_1 = "thugg1";
	$thuggbeinghandle_1 = $thuggbeinghandle;
	$thuggbeinglife_1 = $thuggbeinghealth;
} sub thuggbeing1_trig {
	$thuggbeinglife_trig_1 = 1;
	$thuggbeingmsg_trig_1 = 0;
} sub thuggbeing1_push {
	$beinginroom = $thuggbeinginroom_1; 
	$beinghealth = $thuggbeinghealth_1;
	$beingattack = $thuggbeingattack_1;
	$beingdefend = $thuggbeingdefend_1;
	$beingphase = $thuggbeingphase_1;
	$beingweapon = $thuggbeingweapon_1;
	$beingarmor = $thuggbeingarmor_1;
	$beingluck = $thuggbeingluck_1;
	$beingname = $thuggbeingname_1;
	$beinghandle = $thuggbeinghandle_1;
	$beinglife = $thuggbeinglife_1;
} sub thuggbeing1_pull {
	$thuggbeinginroom_1 = $beinginroom;
	$thuggbeinghealth_1 = $beinghealth; 
	$thuggbeingattack_1 = $beingattack;
	$thuggbeingdefend_1 = $beingdefend;
	$thuggbeingphase_1 = $beingphase;
	$thuggbeingweapon_1 = $beingweapon;
	$thuggbeingarmor_1 = $beingarmor;
	$thuggbeingluck_1 = $beingluck;
	$thuggbeingname_1 = "thugg1";
	$thuggbeinghandle_1 = $beinghandle;
	$thuggbeinglife_1 = $beinglife;
} sub thuggbeing1_exe {	
	if ($thuggbeinginroom_1 == 1) {
			thuggbeing1_push();
			thuggbeing1_status();
			thuggbeing1_infoa();
	} else {
		if ($thuggbeingmsg_trig_1 == 0) {
			thuggbeing1_status();
			thuggbeing1_infoa();
		} else {
		}		
	}
} sub thuggbeing1_infoa {
	if ($thuggbeinglife_trig_1 == 0) {
		if ($brstfired == 1) {
		$info = '  A burst to the head leaves the prisoner dead  ';
		$info2 = 'You pick up the skive he was attacking you with ';
		} elsif ($smgfired == 1) {
		$info = 'You empty your clip into the prisoner in a hail ';
		$info2 = 'of fully automatic gunfire.You pick up his skive';	
		} elsif ($fired9mm == 1) {
		$info = '   You shot the prisoner in the head, he died   ';
		$info2 = 'You pick up the skive he was attacking you with ';
		} elsif ($brst45calfired == 1) {
		$info = ' Yo let looze some hot rockz from yo near half  ';
		$info2 = '   inch cannon into the foo-sho infront of yo   ';
		} elsif ($smg45calfired == 1) {
		$info = 'You pullout a whole clip of burning lead through';
		$info2 = '        some sucka-fool in front of you         ';	
		} elsif ($fired45cal == 1) {
		$info = '        Yo see some sorry ass mo-fuckah         ';
		$info2 = '     Yo fo-five finishes tha experience         ';
		} elsif ($fired12ga == 1) {
		$info = "You blow the prisoner's head off with your 12GA ";
		$info2 = 'You pick up the skive he was attacking you with ';
		} elsif ($firedRPGX14 == 1) {
		$info = ' The prisoner departs meatspace as your RPG-X14 ';
		$info2 = '        destroys his life support system        ';
		} elsif ($attackedaxe == 1) {
		$info = '    You deal a final blow to the prisoner...    ';
		$info2 = '        and bury your axe in his face           ';
		} elsif ($attackedblunt == 1) {
		$info = '  You succeed in beating the prisoner to death  ';
		$info2 = '        You take his skive as your trophy       ';								
		} else {
		$info = '           You killed the prisoner              ';
		$info2 = 'You pick up the skive he was attacking you with ';
		}
		$statkills = $statkills + 1;
		$skive = 1;
		$gp = $gp + 10;
		$thuggbeinglife_trig_1 = 1;
		$thuggbeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.3;
	} else {
	}
} sub thuggbeing1_status {
	if ($thuggbeinghealth_1 <= 0) {
		$thuggbeinginroom_1 = 0;
		$thuggbeinglife_trig_1 = 0;
	} else {
		$bodyparthit = int(rand(20));
		if ($bodyparthit == 4) {
			if ($bodypart_armR == 0) {
			#N/A
			} else {
				$info = '      The prisoner cuts off your right arm      ';
				$info2 = '                                                ';
			}
			$bodypart_armR = 0;
		} elsif ($bodyparthit == 14) {
			if ($bodypart_armL == 0) {
			#N/A
			} else {
				$info = '       The prisoner cuts off your left arm      ';
				$info2 = '                                                ';
			}
			$bodypart_armL = 0;			
		} else {
			#N/A
		}
	}
} sub thuggbeing1_comments {
	if ($thuggbeinginroom_1 == 1) {
	
		$thugg1randcomment = int(rand(3));

		if ($thuggbeinghealth_1 >= 8000) {
			if ($health <= 15) {			
				if ($thugg1randcomment == 1) {
				$info = ' Prisoner: Shiet nigga, ah CUT joo up!          ';
				$info2 = '                                                ';
				$voiceFXbuff = 'Shiet nigga, ah CUT joo up';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 2) {
				$info = ' Prisoner: Fo real n Fo shure you iz dead on tha';
				$info2 = '   floor. Heh n you thought you could take me...';			
				$voiceFXbuff = 'Fo real n Fo shure you iz dead on tha floor. Heh n you thought you could take me...';
				voiceFX_play_manA();
				} else {
				$info = ' Prisoner: Niggah you iz F-U-C-K-E-D up!        ';
				$info2 = '          Bettah thank me from heaven sucka     ';
				$voiceFXbuff = 'Niggah you iz F-U-C-K-E-D up! Bettah thank me from heaven sucka';
				voiceFX_play_manA();
				}								
			} else {
				$thugg1randcomment = int(rand(4));
				if ($thugg1randcomment == 1) {
				$info = ' Prisoner: Bettah bust yo strap out cracka!     ';
				$info2 = '                                                ';
				$voiceFXbuff = 'Bettah bust yo strap out cracka!';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 2) {
				$info = ' Prisoner: Yo mommaz mah hoe, bitch!            ';
				$info2 = '                                                ';
				$voiceFXbuff = 'Yo mommaz mah hoe, bitch!';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 3) {
				$info = ' Prisoner: Yo fuck head, suck ma shit encrusted ';
				$info2 = ' dick! Thas right, shit from yo skank ass bitch!';							
				$voiceFXbuff = 'Yo fuck head, suck ma shit encrusted dick! Thas right, shit from yo skank ass bitch!';
				voiceFX_play_manA();
				} else {
				$info = ' Prisoner: Bend over and lemme cum up yo ass, if';
				$info2 = '          you can take mah tool Ill let cha live';
				$voiceFXbuff = 'Bend over and lemme cum up yo ass, if you can take mah tool Ill let cha live';
				voiceFX_play_manA();
				}
			}														
		} elsif ($thuggbeinghealth_1 >= 2000) {
			if ($health <= 15) {			
				if ($thugg1randcomment == 1) {
				$info = ' Prisoner: Yea niggah now itz yo time to die!   ';
				$info2 = '                                                ';
				$voiceFXbuff = 'Prisoner: Yea niggah now itz yo time to die!';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 2) {
				$info = ' Prisoner: Fo real, you thought yo skinny punk  ';
				$info2 = '          motha fucking ass could kill me?      ';			
				$voiceFXbuff = 'Fo real, you thought yo skinny punk motha fucking ass could kill me?';
				voiceFX_play_manA();
				} else {
				$info = ' Prisoner: Check it bitch yo ass is mine fuckah!';
				$info2 = '                                                ';
				$voiceFXbuff = 'Check it bitch yo ass is mine fuckah!';
				voiceFX_play_manA();
				}								
			} else {
				$thugg1randcomment = int(rand(5));
				if ($thugg1randcomment == 1) {
				$info = ' Prisoner: When Im done wit you ima rape yo     ';
				$info2 = '  "wife" by sticking yo severed thumb up his ass';
				$voiceFXbuff = 'When Im done wit you ima rape yo wife by sticking yo severed thumb up his ass';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 2) {
				$info = ' Prisoner: Heh I aint gunna kill you till you   ';
				$info2 = '          see yo daughted raped by ME!          ';
				$voiceFXbuff = 'Heh I aint gunna kill you till you see yo daughted raped by ME!';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 3) {
				$info = ' Prisoner: Fuck! You iz dead hahaha I kutin u up';
				$info2 = " n when im done ima dine on yo daughter's pussy!";
				$voiceFXbuff = 'Fuck! You iz dead hahaha I kutin u up n when im done ima dine on yo daughters pussy!';
				voiceFX_play_manA();
				} elsif ($thugg1randcomment == 4) {
				$info = ' Prisoner: Shit, man you fuckin wit me seriously';
				$info2 = 'now! When I break out ima murder yo whole family';			
				$voiceFXbuff = 'Shit, man you fuckin wit me seriously now! When I break out ima murder yo whole family';
				voiceFX_play_manA();
				} else {
				$info = ' Prisoner: Fuck you cracka joe...               ';
				$info2 = '                                                ';
				$voiceFXbuff = 'Fuck you cracka joe...';
				voiceFX_play_manA();
				}			
			}	
		} elsif ($thuggbeinghealth_1 <= 200) {
			if ($thugg1randcomment == 1) {
			$info = ' Prisoner: Fuck you, I aint dead yet            ';
			$info2 = '                                                ';
			$voiceFXbuff = 'Fuck you, I aint dead yet';
			voiceFX_play_manA();
			} elsif ($thugg1randcomment == 2) {
			$info = ' Prisoner: Mah boyz are gunna FUCK you up, you  ';
			$info2 = '          aint gunna live muck past mah death!  ';			
			$voiceFXbuff = 'Mah boyz are gunna FUCK you up, you aint gunna live muck past mah death!';
			voiceFX_play_manA();
			} else {
			$info = ' Prisoner: (spits blood) fuckin busta ass...    ';
			$info2 = '                                                ';
			$voiceFXbuff = 'fuckin busta ass...';
			voiceFX_play_manA();
			}			
		} else {
		}
					
	} else {
	}
} 

########################################
########################################
sub alligatorbeing_temp {
	$alligatorbeinginroom = 1;
	$alligatorbeinghealth = 9100;
	$alligatorbeingattack = 20;
	$alligatorbeingdefend = 0;
	$alligatorbeingphase = 0;
	$alligatorbeingweapon = 15;
	$alligatorbeingarmor = 0;
	$alligatorbeingluck = 4;
	$alligatorbeingname = 'alligator';
	$alligatorbeinghandle = 'alligator                               ';
}

sub alligatorbeing1_define { 
	alligatorbeing_temp(); 
	alligatorbeing1_cust();
	alligatorbeing1_trig();
} sub alligatorbeing1_cust {
	$alligatorbeinginroom_1 = $alligatorbeinginroom; 
	$alligatorbeinghealth_1 = $alligatorbeinghealth;
	$alligatorbeingattack_1 = $alligatorbeingattack;
	$alligatorbeingdefend_1 = $alligatorbeingdefend;
	$alligatorbeingphase_1 = $alligatorbeingphase;
	$alligatorbeingweapon_1 = $alligatorbeingweapon;
	$alligatorbeingarmor_1 = $alligatorbeingarmor;
	$alligatorbeingluck_1 = $alligatorbeingluck;
	$alligatorbeingname_1 = 'alligator1';
	$alligatorbeinghandle_1 = $alligatorbeinghandle;
	$alligatorbeinglife_1 = $alligatorbeinghealth;
} sub alligatorbeing1_trig {
	$alligatorbeinglife_trig_1 = 1;
	$alligatorbeingmsg_trig_1 = 0;
} sub alligatorbeing1_push {
	$beinginroom = $alligatorbeinginroom_1; 
	$beinghealth = $alligatorbeinghealth_1;
	$beingattack = $alligatorbeingattack_1;
	$beingdefend = $alligatorbeingdefend_1;
	$beingphase = $alligatorbeingphase_1;
	$beingweapon = $alligatorbeingweapon_1;
	$beingarmor = $alligatorbeingarmor_1;
	$beingluck = $alligatorbeingluck_1;
	$beingname = $alligatorbeingname_1;
	$beinghandle = $alligatorbeinghandle_1;
	$beinglife = $alligatorbeinglife_1;
} sub alligatorbeing1_pull {
	$alligatorbeinginroom_1 = $beinginroom;
	$alligatorbeinghealth_1 = $beinghealth; 
	$alligatorbeingattack_1 = $beingattack;
	$alligatorbeingdefend_1 = $beingdefend;
	$alligatorbeingphase_1 = $beingphase;
	$alligatorbeingweapon_1 = $beingweapon;
	$alligatorbeingarmor_1 = $beingarmor;
	$alligatorbeingluck_1 = $beingluck;
	$alligatorbeingname_1 = 'alligator1';
	$alligatorbeinghandle_1 = $beinghandle;
	$alligatorbeinglife_1 = $beinglife;
} sub alligatorbeing1_exe {	
	if ($alligatorbeinginroom_1 == 1) {
			alligatorbeing1_push();
			alligatorbeing1_status();
			alligatorbeing1_infoa();
	} else {
		if ($alligatorbeingmsg_trig_1 == 0) {
			alligatorbeing1_status();
			alligatorbeing1_infoa();
		} else {
		}		
	}
} sub alligatorbeing1_infoa {
	if ($alligatorbeinglife_trig_1 == 0) {
		if ($brstfired == 1) {
		$info = '      Burst fire into the alligator removes     ';
		$info2 = '              the obstruction                   ';
		} elsif ($smgfired == 1) {
		$info = ' Yo smoke tha alligator with yo automatic nine  ';
		$info2 = '                                                ';	
		} elsif ($fired9mm == 1) {
		$info = '       You make a hole in tha foo gator...      ';
		$info2 = '        It looks better than yo bitch           ';
		} elsif ($brst45calfired == 1) {
		$info = ' You fire a few ACP rounds through tha alligator';
		$info2 = "            'Cuz iz like dat yo                 ";
		} elsif ($smg45calfired == 1) {
		$info = ' Yo spray a foo ton through that dumb ass nizzo ';
		$info2 = '    Alligator almost as dumb as yo hizzoh       ';	
		} elsif ($fired45cal == 1) {
		$info = "    You blow a hole through the dog's brain     ";
		$info2 = '     You can fit your fingers through it        ';
		} elsif ($fired12ga == 1) {
		$info = " Yo bust out yo gauge and do wha'cha always do  ";
		$info2 = '        This tyme itz an alligator tho          ';
		} elsif ($firedRPGX14 == 1) {
		$info = '           You pop that gator loud              ';
		$info2 = '                 BOOM Yo!                       ';
		} elsif ($attackedaxe == 1) {
		$info = '  You cordially invite the alligator to reattach';
		$info2 = '                 its head                       ';
		} elsif ($attackedblunt == 1) {
		$info = 'You beat the alligator to death cuz you fo reahl';
		$info2 = '                                                ';
		} elsif ($attackedsword == 1) {
		$info = '           You cut that bitch up yo!            ';
		$info2 = '   Alligator thought it could mess with you?!   ';										
		} else {
		$info = '       You kill the alligator... becuz          ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$alligatorbeinglife_trig_1 = 1;
		$alligatorbeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.25;
	} else {
	}
} sub alligatorbeing1_status {
	if ($alligatorbeinghealth_1 <= 0) {
		$alligatorbeinginroom_1 = 0;
		$alligatorbeinglife_trig_1 = 0;
	} else {
		$bodyparthit = int(rand(9));
		if ($bodyparthit == 3) {
			if ($bodypart_legR == 0) {
				#N/A
			} else {
				$info = '     The alligator rips off your right leg      ';
				$info2 = '                                                ';
				infotrack();
			}
			$bodypart_legR = 0;
		} elsif ($bodyparthit == 5) {
			if ($bodypart_legL == 0) {
				#N/A
			} else {
				$info = '      The alligator rips off your left leg      ';
				$info2 = '                                                ';
				infotrack();
			}
			$bodypart_legL = 0;		
		} else {
			#N/A
		}
	}
}
 
########################################
########################################

sub snakebeing_temp {
	$snakebeinginroom = 1;
	$snakebeinghealth = 2253;
	$snakebeingattack = 15;
	$snakebeingdefend = 0;
	$snakebeingphase = 0;
	$snakebeingweapon = 15;
	$snakebeingarmor = 0;
	$snakebeingluck = 6;
	$snakebeingname = "water moccasin";
	$snakebeinghandle = "water moccasin                          ";
}


sub snakebeing1_define { 
	snakebeing_temp(); 
	snakebeing1_cust();
	snakebeing1_trig();
} sub snakebeing1_cust {
	$snakebeinginroom_1 = $snakebeinginroom; 
	$snakebeinghealth_1 = $snakebeinghealth;
	$snakebeingattack_1 = $snakebeingattack;
	$snakebeingdefend_1 = $snakebeingdefend;
	$snakebeingphase_1 = $snakebeingphase;
	$snakebeingweapon_1 = $snakebeingweapon;
	$snakebeingarmor_1 = $snakebeingarmor;
	$snakebeingluck_1 = $snakebeingluck;
	$snakebeingname_1 = "snake1";
	$snakebeinghandle_1 = $snakebeinghandle;
	$snakebeinglife_1 = $snakebeinghealth;
} sub snakebeing1_trig {
	$snakebeinglife_trig_1 = 1;
	$snakebeingmsg_trig_1 = 0;
} sub snakebeing1_push {
	$beinginroom = $snakebeinginroom_1; 
	$beinghealth = $snakebeinghealth_1;
	$beingattack = $snakebeingattack_1;
	$beingdefend = $snakebeingdefend_1;
	$beingphase = $snakebeingphase_1;
	$beingweapon = $snakebeingweapon_1;
	$beingarmor = $snakebeingarmor_1;
	$beingluck = $snakebeingluck_1;
	$beingname = $snakebeingname_1;
	$beinghandle = $snakebeinghandle_1;
	$beinglife = $snakebeinglife_1;
} sub snakebeing1_pull {
	$snakebeinginroom_1 = $beinginroom;
	$snakebeinghealth_1 = $beinghealth; 
	$snakebeingattack_1 = $beingattack;	
	$snakebeingdefend_1 = $beingdefend;
	$snakebeingphase_1 = $beingphase;
	$snakebeingweapon_1 = $beingweapon;
	$snakebeingarmor_1 = $beingarmor;
	$snakebeingluck_1 = $beingluck;
	$snakebeingname_1 = "snake1";
	$snakebeinghandle_1 = $beinghandle;
	$snakebeinglife_1 = $beinglife;
} sub snakebeing1_exe {	
	if ($snakebeinginroom_1 == 1) {
			snakebeing1_push();
			snakebeing1_status();
			snakebeing1_infoa();
	} else {
		if ($snakebeingmsg_trig_1 == 0) {
			snakebeing1_status();
			snakebeing1_infoa();
		} else {
		}		
	}
} sub snakebeing1_infoa {
	if ($snakebeinglife_trig_1 == 0) {
		if ($fired9mm == 1) {
		$info = '  The snake has died by the gunfire of you nine ';
		$info2 = '                                                ';
		} elsif ($fired45cal == 1) {
		$info = '  The snake has died by the gunfire of you .45  ';
		$info2 = '                                                ';
		} elsif ($fired12ga == 1) {
		$info = 'The has been blown out of the water by your 12GA';
		$info2 = '                                                ';
		} elsif ($firedRPGX14 == 1) {
		$info = ' The snake fails to escape pressure damage from ';
		$info2 = '                  your RPG-X14                  ';			
		} else {
		$info = '               The snake is dead...             ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$snakebeinglife_trig_1 = 1;
		$snakebeingmsg_trig_1 = 1;
		$psphysexp = $psphysexp + 0.1;
	} else {
	}
} sub snakebeing1_status {
	if ($snakebeinghealth_1 <= 0) {
		$snakebeinginroom_1 = 0;
		$snakebeinglife_trig_1 = 0;
	} else {
		$snakepoisonrand = int(rand(4));
		if ($snakebeingphase_1 >= 1) {
			#do nothing
		} else {
			snakepoison();
		}		
	}
} 

########################################
sub bsnake1ataxor {
		$snakeroomrand = int(rand(5));
		if ($randrommsnake1 == 1) {
			$randrommsnake1 = $randrommsnake1 + 1;			
			$info = "       There is something in the water...       ";
			$info2 = "              You are attacked!!!               ";
			snakebeing1_define();
			snakebeing1_exe();	
		} elsif ($randrommsnake1 >= 2) {
			$randrommsnake1 = $randrommsnake1 + 1;
			snakebeing1_exe();
		} else {
		}
}
########################################
sub snakebeing2_define { 
	snakebeing_temp(); 
	snakebeing2_cust();
	snakebeing2_trig();
} sub snakebeing2_cust {
	$snakebeinginroom_2 = $snakebeinginroom; 
	$snakebeinghealth_2 = $snakebeinghealth + 102;
	$snakebeingattack_2 = $snakebeingattack + 2;
	$snakebeingdefend_2 = $snakebeingdefend;
	$snakebeingphase_2 = $snakebeingphase;
	$snakebeingweapon_2 = $snakebeingweapon;
	$snakebeingarmor_2 = $snakebeingarmor;
	$snakebeingluck_2 = $snakebeingluck + 1;
	$snakebeingname_2 = "snake2";
	$snakebeinghandle_2 = $snakebeinghandle;
	$snakebeinglife_2 = $snakebeinghealth  + 102;
} sub snakebeing2_trig {
	$snakebeinglife_trig_2 = 1;
	$snakebeingmsg_trig_2 = 0;
} sub snakebeing2_push {
	$beinginroom = $snakebeinginroom_2; 
	$beinghealth = $snakebeinghealth_2;
	$beingattack = $snakebeingattack_2;
	$beingdefend = $snakebeingdefend_2;
	$beingphase = $snakebeingphase_2;
	$beingweapon = $snakebeingweapon_2;
	$beingarmor = $snakebeingarmor_2;
	$beingluck = $snakebeingluck_2;
	$beingname = $snakebeingname_2;
	$beinghandle = $snakebeinghandle_2;
	$beinglife = $snakebeinglife_2;
} sub snakebeing2_pull {
	$snakebeinginroom_2 = $beinginroom;
	$snakebeinghealth_2 = $beinghealth; 
	$snakebeingattack_2 = $beingattack;	
	$snakebeingdefend_2 = $beingdefend;
	$snakebeingphase_2 = $beingphase;
	$snakebeingweapon_2 = $beingweapon;
	$snakebeingarmor_2 = $beingarmor;
	$snakebeingluck_2 = $beingluck;
	$snakebeingname_2 = "snake2";
	$snakebeinghandle_2 = $beinghandle;
	$snakebeinglife_2 = $beinglife;
} sub snakebeing2_exe {
	if ($snakebeinginroom_2 == 1) {
			snakebeing2_push();
			snakebeing2_status();
			snakebeing2_infoa();
	} else {
		if ($snakebeingmsg_trig_2 == 0) {
			snakebeing2_status();
			snakebeing2_infoa();
		} else {
		}		
	}
} sub snakebeing2_infoa {
	if ($snakebeinglife_trig_2 == 0) {
		if ($fired9mm == 1) {
		$info = '      With a 9MM you have killed the snake      ';
		$info2 = '                                                ';
		} elsif ($fired45cal == 1) {
		$info = '      With a .45 you have killed the snake      ';
		$info2 = '                                                ';
		} elsif ($fired12ga == 1) {
		$info = '    You carved up the snake with your 12GA      ';
		$info2 = '                                                ';
		} elsif ($firedRPGX14 == 1) {
		$info = ' The snake fails to escape blast damage created ';
		$info2 = '               by your RPG-X14                  ';			
		} else {
		$info = '               You killed the snake             ';
		$info2 = '                                                ';
		}
		$statkills = $statkills + 1;
		$snakebeinglife_trig_2 = 1;
		$snakebeingmsg_trig_2 = 1;
		$psphysexp = $psphysexp + 0.1;
	} else {
	}
} sub snakebeing2_status {
	if ($snakebeinghealth_2 <= 0) {
		$snakebeinginroom_2 = 0;
		$snakebeinglife_trig_2 = 0;
	} else {
		$snakepoisonrand = int(rand(4));
		if ($snakebeingphase_2 >= 1) {
			#do nothing
		} else {
			snakepoison();
		}
	}
} 

########################################
########################################

sub sagebeing_temp {
	$sagebeinginroom = 1;
	$sagebeinghealth = 4000;
	$sagebeingattack = 0;
	$sagebeingdefend = 0;
	$sagebeingphase = 0;
	$sagebeingweapon = 0;
	$sagebeingarmor = 0;
	$sagebeingluck = 0;
	$sagebeingname = "lost sage";
	$sagebeinghandle = "lost sage                               ";
}

sub sagebeing1_define { 
	sagebeing_temp(); 
	sagebeing1_cust();
	sagebeing1_trig();
} sub sagebeing1_cust {
	$sagebeinginroom_1 = $sagebeinginroom; 
	$sagebeinghealth_1 = $sagebeinghealth;
	$sagebeingattack_1 = $sagebeingattack;
	$sagebeingdefend_1 = $sagebeingdefend;
	$sagebeingphase_1 = $sagebeingphase;
	$sagebeingweapon_1 = $sagebeingweapon;
	$sagebeingarmor_1 = $sagebeingarmor;
	$sagebeingluck_1 = $sagebeingluck;
	$sagebeingname_1 = "sage1";
	$sagebeinghandle_1 = $sagebeinghandle;
	$sagebeinglife_1 = $sagebeinghealth;
} sub sagebeing1_trig {
	$sagebeinglife_trig_1 = 1;
	$sagebeingmsg_trig_1 = 0;
} sub sagebeing1_push {
	$beinginroom = $sagebeinginroom_1; 
	$beinghealth = $sagebeinghealth_1;
	$beingattack = $sagebeingattack_1;
	$beingdefend = $sagebeingdefend_1;
	$beingphase = $sagebeingphase_1;
	$beingweapon = $sagebeingweapon_1;
	$beingarmor = $sagebeingarmor_1;
	$beingluck = $sagebeingluck_1;
	$beingname = $sagebeingname_1;
	$beinghandle = $sagebeinghandle_1;
	$beinglife = $sagebeinglife_1;
} sub sagebeing1_pull {
	$sagebeinginroom_1 = $beinginroom;
	$sagebeinghealth_1 = $beinghealth; 
	$sagebeingattack_1 = $beingattack;
	$sagebeingdefend_1 = $beingdefend;
	$sagebeingphase_1 = $beingphase;
	$sagebeingweapon_1 = $beingweapon;
	$sagebeingarmor_1 = $beingarmor;
	$sagebeingluck_1 = $beingluck;
	$sagebeingname_1 = "sage1";
	$sagebeinghandle_1 = $beinghandle;
	$sagebeinglife_1 = $beinglife;
} sub sagebeing1_exe {	
	if ($sagebeinginroom_1 == 1) {
			sagebeing1_push();
			sagebeing1_status();
			sagebeing1_infoa();
	} else {
		if ($sagebeingmsg_trig_1 == 0) {
			sagebeing1_status();
			sagebeing1_infoa();
		} else {
		}		
	}
} sub sagebeing1_infoa {
	if ($sagebeinglife_trig_1 == 0) {
		if ($brstfired == 1) {
		$info = '    You fire a burst of bullets into the sage   ';
		$info2 = '     he dies as you remove from him his robe    ';	
		} elsif ($smgfired == 1) {
		$info = '  You expend a magazine of 9mm rounds into the  ';
		$info2 = ' sage and riddle his corpse with steaming lead  ';		
		} elsif ($fired9mm == 1) {
		$info = '  You bust a cap in the sage and drop his hide  ';
		$info2 = '      then you take from it a white robe        ';
		} elsif ($brst45calfired == 1) {
		$info = '         You let loose a burst of lead          ';
		$info2 = '     Lett\'in it roam towards the sage\'s head    ';	
		} elsif ($smg45calfired == 1) {
		$info = '  In a flash you empty the magazine of your .45 ';
		$info2 = ' caliber SMG carbine and end the sage\'s lesson. ';		
		} elsif ($fired45cal == 1) {
		$info = '  You let loose a thick ass .45 rock enroute to ';
		$info2 = '             the sage\'s end of dayz             ';
		} elsif ($fired12ga == 1) {
		$info = 'You carve a hole into the sage with your shotty ';
		$info2 = '    and his life force drains to the floor      ';
		} elsif ($firedRPGX14 == 1) {
		$info = ' The sage is deprived his meatspace tenure when ';
		$info2 = ' he succumbs to pressure damage via the RPG-X14 ';
		} elsif ($attackedblunt == 1) {
		$info = '      You viciously beat the sage into a        ';
		$info2 = '    semi-liquified mass and take his robe       ';						
		} else {
		$info = '           The sage has been slain              ';
		$info2 = '    You take from his corpse a white robe       ';
		}
		$statkills = $statkills + 1;
		$statmurders = $statmurders + 1;
		$wickedness = $wickedness + 2;
		$sagebeinglife_trig_1 = 1;
		$sagebeingmsg_trig_1 = 1;
		$whiterobearmor = 1;
		$f_bread = $f_bread + 1;
		$gp = $gp + 2;
		$psphysexp = $psphysexp + 0.1;
		$bodyparthit = int(rand(2));
		if ($bodyparthit == 1) {
			$f_elixirpoison10 = $f_elixirpoison10 + 1;
		} else {
			$f_elixirhealth100 = $f_elixirhealth100 + 1;
		}
	} else {
	}
} sub sagebeing1_status {
	if ($sagebeinghealth_1 <= 0) {
		$sagebeinginroom_1 = 0;
		$sagebeinglife_trig_1 = 0;
	} else {
	}
}

sub sagebeing1_comments {
	if ($sagebeinginroom_1 == 1) {
		if ($sageharmtrig1 == 0) {
			if ($attacktrig == 1) {
				$info = 'Sage: Thou hast attacked me! To you, wretched   ';
				$info2 = '     fool, knowledge shall be given never.      ';
				$sageharmtrig1 = 1;
				$voiceFXbuff = 'Thou hast attacked me! To you, wretched fool, knowledge shall be given never.';
				voiceFX_play_manB();
			} else {
				if ($sagebeing1_sam7 == 3) {
					$info = 'Sage: Who art thou? What art thine mission? Tis ';
					$info2 = '   noble or sinister? Hast thou a tounge, speak!';		
					$voiceFXbuff = 'Who art thou? What art thine mission? Tis noble or sinister? Hast thou a tounge, speak!';
					voiceFX_play_manB();
				} elsif ($sagebeing1_sam7 == 4) {
					$info = 'Sage: I sense thou wishes to gain in knowledge  ';
					$info2 = '  Pay 80GP, I shall assist thee in this endeavor';
					$voiceFXbuff = 'I sense thou wishes to gain in knowledge  Pay 80GP, I shall assist thee in this endeavor';
					voiceFX_play_manB();
				} elsif ($sagebeing1_sam7 > 4) {
					if ($playpaytrig == 1) {
						if ($sageteachtrig == 0) {
							if ($gp >= 80) {
								$gp = $gp - 80;
								$pintellect = $pintellect + 1.3;
								$sageteachtrig = $sageteachtrig + 1;
							} else {
							}
						} else {
						}	
					} else {
					}
				} else {
				}
			}
		} else {
		}
	} else {
	}
}
########################################
sub bsnake2ataxor {
		$snakeroomrand = int(rand(5));
		if ($randrommsnake2 == 1) {
			$randrommsnake2 = $randrommsnake2 + 1;			
			$info = "       Something slithers beneath the water     ";
			$info2 = "              You are attacked!!!               ";
			snakebeing2_define();
			snakebeing2_exe();	
		} elsif ($randrommsnake2 >= 2) {
			$randrommsnake2 = $randrommsnake2 + 1;
			snakebeing2_exe();
		} else {
		}
}
########################################

sub snakepoison {
		if ($poisoned eq "perm") {
			#do nothing
		} elsif ($snakepoisonrand == 1) {
			if ($poisoned <= 0) {
				if ($poisoned == '-1') {
					$poisoned = '-1';
				} else {
					$poisoned = $poisoned + 3;
				}
				
				if ($visualblind == '-1') {
					$visualblind = -1;
				} elsif ($visualblind == 0) {
					$visualblind = 3;
				} else {
					$visualblind = $visualblind + 3;
				}
			} else {
				if ($poisoned == '-1') {
					$poisoned = '-1';
				} else {
					$poisoned = $poisoned + 3;
				}
				
				if ($visualblind == '-1') {
					$visualblind = -1;
				} elsif ($visualblind == 0) {
					$visualblind = 3;
				} else {
					$visualblind = $visualblind + 3;
				}
			}
		} else {
		}
}

##BEING TEMPLATES##############################################################################################
##BEING TEMPLATES##############################################################################################

####REACTOR START######################################################################
####REACTOR START######################################################################
sub reactormon {
t5(); print colored('II','bold white on_white'); 
print colored('    TEMP ',"bold $reactorC0 on_$reactorC0"); #44 24
$reactortemprnd = sprintf("%.0f", $reactortemp); 
if ($reactortemprnd >= 100) {
print colored("$reactortemprnd%","bold $reactorC0 on_$reactorC0");
} elsif ($reactortemprnd >= 10) {
print colored(" $reactortemprnd%","bold $reactorC0 on_$reactorC0");
} else {
print colored("  $reactortemprnd%","bold $reactorC0 on_$reactorC0");
}

print colored(' COOLANT ',"bold $reactorC0 on_$reactorC0");
$reactorcoolantrnd = sprintf("%.0f", $reactorcoolant); 
if ($reactorcoolantrnd >= 100) {
print colored("$reactorcoolantrnd%","bold $reactorC0 on_$reactorC0");
} elsif ($reactorcoolantrnd >= 10) {
print colored(" $reactorcoolantrnd%","bold $reactorC0 on_$reactorC0");
} else {
print colored("  $reactorcoolantrnd%","bold $reactorC0 on_$reactorC0");
}

print colored('  OUTPUT ',"bold $reactorC0 on_$reactorC0");
$reactorpowerrnd = sprintf("%.0f", $reactorpower); 
if ($reactorpowerrnd >= 100) {
print colored("$reactorpowerrnd%     ","bold $reactorC0 on_$reactorC0");
} elsif ($reactorpowerrnd >= 10) {
print colored(" $reactorpowerrnd%     ","bold $reactorC0 on_$reactorC0");
} else {
print colored("  $reactorpowerrnd%     ","bold $reactorC0 on_$reactorC0");
}
print colored('II','bold white on_white'); t6(); print"\n";

if ($reactortemp >= 100) {
$reactorC1 = 'red';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 100) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 100) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t6(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t5(); print"\n";

if ($reactortemp >= 90) {
$reactorC1 = 'red';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 90) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 90) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t5(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t6(); print"\n"; 

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 80) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 80) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t6(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t5(); print"\n";

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 70) {
$reactorC1 = 'yellow';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 70) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 70) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t5(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t6(); print"\n";  

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 60) {
$reactorC1 = 'yellow';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 60) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 60) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t6(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t5(); print"\n";  

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 60) {
$reactorC1 = 'yellow';
} elsif ($reactortemp >= 50) {
$reactorC1 = 'green';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 50) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 50) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t5(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t6(); print"\n";  

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 60) {
$reactorC1 = 'yellow';
} elsif ($reactortemp >= 40) {
$reactorC1 = 'green';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 40) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 40) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t6(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t5(); print"\n";  

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 60) {
$reactorC1 = 'yellow';
} elsif ($reactortemp >= 30) {
$reactorC1 = 'green';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 30) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 30) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t5(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t6(); print"\n";  

if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 60) {
$reactorC1 = 'yellow';
} elsif ($reactortemp >= 20) {
$reactorC1 = 'green';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 20) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 20) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t6(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t5(); print"\n";  


if ($reactortemp >= 80) {
$reactorC1 = 'red';
} elsif ($reactortemp >= 60) {
$reactorC1 = 'yellow';
} elsif ($reactortemp >= 10) {
$reactorC1 = 'green';
} else {
$reactorC1 = 'black';
}
if ($reactorcoolant >= 10) {
$reactorC2 = 'cyan';
} else {
$reactorC2 = 'black';
}
if ($reactorpower >= 10) {
$reactorC3 = 'white';
} else {
$reactorC3 = 'black';
}
t5(); print colored('II','bold white on_white'); 
reactorcolor();
print colored('II','bold white on_white'); t6(); print"\n"; 
}

sub reactorcolor {
print colored('     ',"$reactorC0 on_$reactorC0");
print colored('--------',"$reactorC1 on_$reactorC1");
print colored('     ',"$reactorC0 on_$reactorC0");
print colored('--------',"$reactorC2 on_$reactorC2");
print colored('     ',"$reactorC0 on_$reactorC0");
print colored('--------',"$reactorC3 on_$reactorC3");
print colored('     ',"$reactorC0 on_$reactorC0");
}
sub reactormeltdown {
	if ($reactorredline >= 110) {
		$health = $health - 110;
		$bodypart_head = 0;
		$bodypart_kneck = 0;
		$bodypart_armR = 0;
		$bodypart_armL = 0;
		$bodypart_chest = 0;
		$bodypart_torso = 0;
		$bodypart_legR = 0;
		$bodypart_legL = 0;
		$info = '                Reactor Meltdown                ';
		$info2 = '                                                ';
	} else {
	}
}
sub reactormeltdownsound {
	if ($reactorredline >= 110) {
		soundFX_play_nuke();
	} else {
	}
}
sub reactor {
	if ($reactorcoolant >= 100) {
		$reactorcoolant = 100;
	} elsif ($reactorcoolant <= 0) {
		$reactorcoolant = 0;
	} else {
		#nothang
	}
	
	$reactortempO = int(rand(121));
	while ($reactortempO < 100){ $reactortempO = int(rand(121));}

	if ($reactorcoolant <= 0) {
		$reactortemp = $reactortempO + $reactordegrd;
	} else {
		$reactortemp = ($reactortempO + $reactordegrd) - ($reactorcoolant / 1.5);
	}


	if ($reactortemp >= 104) {
		$reactordegrd = $reactordegrd + 0.8;
	} elsif ($reactortemp >= 103) {
		$reactordegrd = $reactordegrd + 0.7;
	} elsif ($reactortemp >= 102) {
		$reactordegrd = $reactordegrd + 0.6;
	} elsif ($reactortemp >= 100) {
		$reactordegrd = $reactordegrd + 0.5;
	} elsif ($reactortemp >= 99) {
		$reactordegrd = $reactordegrd + 0.4;
	} elsif ($reactortemp >= 95) {
		$reactordegrd = $reactordegrd + 0.3;
	} elsif ($reactortemp >= 93) {
		$reactordegrd = $reactordegrd + 0.2;
	} elsif ($reactortemp >= 90) {
		$reactordegrd = $reactordegrd + 0.1;
	} elsif ($reactortemp >= 85) {
		$reactordegrd = $reactordegrd + 0.05;
	} elsif ($reactortemp >= 84) {
		$reactordegrd = $reactordegrd + 0.03;
	} elsif ($reactortemp >= 83) {
		$reactordegrd = $reactordegrd + 0.02;
	} elsif ($reactortemp >= 82) {
		$reactordegrd = $reactordegrd + 0.01;
	} elsif ($reactortemp >= 81) {
		$reactordegrd = $reactordegrd + 0.004;												
	} else {
		#dn
	}
	
	if ($reactortemp >= 240) {
		$reactorredline = $reactorredline + 28;
	} elsif ($reactortemp >= 230) {
		$reactorredline = $reactorredline + 23;
	} elsif ($reactortemp >= 220) {
		$reactorredline = $reactorredline + 19;
	} elsif ($reactortemp >= 210) {
		$reactorredline = $reactorredline + 16;
	} elsif ($reactortemp >= 200) {
		$reactorredline = $reactorredline + 14;
	} elsif ($reactortemp >= 190) {
		$reactorredline = $reactorredline + 12;
	} elsif ($reactortemp >= 180) {
		$reactorredline = $reactorredline + 10;
	} elsif ($reactortemp >= 170) {
		$reactorredline = $reactorredline + 8;
	} elsif ($reactortemp >= 160) {
		$reactorredline = $reactorredline + 6;
	} elsif ($reactortemp >= 150) {
		$reactorredline = $reactorredline + 5;
	} elsif ($reactortemp >= 140) {
		$reactorredline = $reactorredline + 4;
	} elsif ($reactortemp >= 130) {
		$reactorredline = $reactorredline + 3;
	} elsif ($reactortemp >= 120) {
		$reactorredline = $reactorredline + 2;
	} elsif ($reactortemp >= 110) {
		$reactorredline = $reactorredline + 1;
	} elsif ($reactortemp >= 102) {
		$reactorredline = $reactorredline + 0.5;		
	} else {
	}							

	$reactorpower = ($reactortemp * 1.15) - $reactordegrd;
}
####REACTOR END######################################################################
####REACTOR END######################################################################

##HTML WEAPON START#############################################################################################
sub htmlweapon {


if ($gingertype eq "crook'd dagger") {
$htmlweapon = '
           /)
          (((             
           )))            
          (((             
           )))            
         ~~++~~             
           []             
           []             
';                          
} elsif ($gingertype eq 'capped staff') {
$htmlweapon = '
          (~)
          [|]
          |V|
          | |
          | |
          | |
          | |
          | |
          | |
          |-|
          |-|
          |-|
          | |
          | |
          | |
          | |
          | |
          | |
          |A|
          [|]
          (~)
';                          
} elsif ($gingertype eq 'long sword') {
$htmlweapon = '
          /|\
          |||
          |||
          |||             
          |||             
          |||             
          |||
          |||             
          |||             
          |||        
          |||	               
        [[[|]]]          
          |/|             
          |/|             
          |/|             
          (/)
           V
';                          
} elsif ($gingertype eq 'red crowbar') {
$htmlweapon = '
          \\V\\
          | |
          | |              
          | |
	  | |              
          | |            
          |C|             
          |R|             
          |O|             
          | |
	  | |             
          | |            
          | |             
          | |             
          \\A\\
';                          
} elsif ($gingertype eq 'mace') {
$htmlweapon = '
          ___ 
         <[|]>
         <[|]>
         <[|]>             
         <[|]>             
          |V|               
          | |             
          | |             
          | |             
          | |             
          | |             
          | |
          | |             
          | |
          [_]
';                          
} elsif ($gingertype eq 'skive') {
$htmlweapon = '
           /|
           ||             
           ||             
           ||             
           ||             
           ||               
           []             
           []             
           []             
';                          
} elsif ($gingertype eq 'butterfly knife') {
$htmlweapon = '
            /|
           //|
           |||
           |||            
           |||            
           |||            
          (*|*)              
          |0|0|           
          |0|0|           
          |0|0|           
          |0|0|
          |0|0|
';                          
} elsif ($gingertype eq 'fire axe') {
$htmlweapon = '
    /|                   
   //\                    
  //  \_________
  ||     | |___/
  ||   __| |
  \\\\  /  |_|
   \\\\/   | |
    \\|   | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         | |
         |_|
';
} elsif ($gingertype eq 'double headed axe') {
$htmlweapon = '
       /\\    __    /\\
      // \\  /..\  / \\\\
     // /~\\_|--|_/~\\ \\\\
    ||  |~~ |..| ~~|  ||
    ||  |~~~|--|~~~|  ||
    ||  |~~~|..|~~~|  ||
    ||  |~~_|--|_~~|  ||
     \\\\ \~/ |..| \\~/ //
      \\\\ /  |__|  \\ //
       \\/   ||||   \\/
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            ||||
            \\__/
';
} elsif ($gingertype eq 'straight axe') {
$htmlweapon = '
  |\\    _
  ||\\  /|\\
  || \\ |_|
  || /\\|.|
  || |-|.|
  || |-|.|
  || |-|.|
  || |-|.|
  || \\/|.|
  || / |_|
  ||/  | |
  |/   | |
       | |
       | |
       | |
       | |
       | |
       | |
       | |
       | |
       | |
       | |
       | |
       | |
       |_|
';
} elsif ($gingertype eq 'english axe') {
$htmlweapon = '
     /|
    //\________
   //       |  |
  //     ___|  |
  ||    /   |  |
  ||   /    |__|
  \\\\  /     |  |
   \\\\ |     |  |
    \\\\|     |  |
     \\|     |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |  |
            |__|
';                   
} elsif ($gingertype eq 'semiautomatic pistol') {
$htmlweapon = '
   _ _________________ 
   \\| //// |___|    __|
   /_______________|__|   
   \      /\\ |\\______|----------------------
    | XX  \__/           
    / XXX /               
   / XXX /                 
  |_____/                    
  /___/
';                          
} elsif ($gingertype eq '12GA pump action shotgun') {
$htmlweapon = '
  _____________________________/|__
 /  |___| \\____________________||__|
 |_________|_||||||||||||______||_|
  \\ XXX |( | \||||||||||/
  /XXXX |_/
 /XXXXX/
 |XXXX/
';
} elsif ($gingertype eq 'SMG 9MM') { 
$htmlweapon = '
      __         __ 
    _/__\\_______/__\\_  
   |     |____|      |__      ___________
   | --------------- ||||----|           |
   |_________________||||----|___________|
         \\----|\\ |        
         /----|__/        
         |----|
         |----|
         \\____|
          || |
          || |
          ||_|
';    
} elsif ($gingertype eq 'broad tip spear') {
$htmlweapon = '
          /\\
         //\\\\
         \\||/
          ||
         <||>
          ||
          ||
          ||
          ||
          ||
          ||
          ||
          ||
          ||
          ||
          ||     
          ||
          ||
          ||
';
} elsif ($gingertype eq 'RPG-X14') {
$htmlweapon = '
    ___                         _     _______
   |   \\-----------------------| |___/-------\\_
   |   |  RPG-X14              | |-----------| \\
   |   |           |-____      | |___--------|_/
   |___/-----------|-|( |------|_|   \\_______/
                   |-|__|
                   |-|
                   |_|
';
} elsif ($gingertype eq '.45 SMG Carbine') {
$htmlweapon = '
            ___                     _
 __________|_|_|___________________/_|___________ 
| __ ____/      |____| |_______________O_o_O_o_O_|
|| //    |------__     |_|__|__|__/-----\'
||//     \\ooooo|( |_____|  
|_/      /oooo/\\_/ || |
        /oooo/     || |
        \\ooo/      || |
                   || |
                   || |
                   || |
                   || |
                   ||_|
';
} elsif ($gingertype eq '.45 automatic pistol') {
$htmlweapon = '
     _______________________________
  __/ \\\\\\\\  \\_____/           O O O |__
  \\/  ////                   O O O O|__|
   |____________..............______|
   \\ ><><><>< __|____________|_____|
   / <><><>< |(  |
  / <><><>< /____/
  | ><><><> |
  | ><><><> |
  | ><><><> |
  \\_________/
    | |   |
    |_|___|
';
} else {
$htmlweapon = ' ';
}

$htmlweapon = ("$htmlweapon"."\n\n\n\n\n");

if ($armorginger eq 'leather vest') {
$htmlweapon = ("$htmlweapon".'
   ____   ____
   \\---\\_/---/
   /---------\\
   |---------|
   |---------|
   |---------|
   |_________|
');
} elsif ($armorginger eq 'ring mail vest') {
$htmlweapon = ("$htmlweapon".'
   __/\\   /\\__
   \\oOo\\_/oOo/
   /OoOoOoOoO\\
   |oOoOoOoOo|
   |OoOoOoOoO|
   |oOoOoOoOo|
   |OoOoOoOoO|
   |oOoOoOoOo|
   \\OoOoOoOoO/
');
} elsif ($armorginger eq 'red t-shirt') {
$htmlweapon = ("$htmlweapon".'
   ____  ____
  /    \\/    \\
 /_/|------|\\_\\
    | BEER |
    |------|
    |______|
');
} elsif ($armorginger eq 'white robe') {
$htmlweapon = ("$htmlweapon".'
    ___  ___
   /   \\/   \\
  /          \\
  | |      | |
  |_|      |_|
    |      |
    |XXXXXX|
    |      |
    |      |
    |      |
    |      |
    |      |
    |/\\/\\/\\|
')
} else {
	#fo sheeezeh fo shizah!
}


}
##HTML WEAPON END###############################################################################################


sub printhtml {
	if ($themenbr == 1) {
		$htmlbkrndclr = 'WHITE';
		$htmltextclr = 'GREEN';
		$htmllinkclr = '#99ff00';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = 'grey';
		$htmlfooterclr = 'grey';
	} elsif ($themenbr == 2) {
		$htmlbkrndclr = 'green';
		$htmltextclr = 'red';
		$htmllinkclr = 'grey';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = 'darkred';
		$htmlfooterclr = 'darkred';
	} elsif ($themenbr == 3) {
		$htmlbkrndclr = 'black';
		$htmltextclr = 'red';
		$htmllinkclr = 'darkblue';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = 'darkred';
		$htmlfooterclr = 'blue';
	} elsif ($themenbr == 4) {	
		$htmlbkrndclr = '#99CCFF';
		$htmltextclr = '#6699CC';
		$htmllinkclr = '#999999';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = 'darkblue';
		$htmlfooterclr = '#0066CC';
	} elsif ($themenbr == 5) {
		$htmlbkrndclr = '#333333';
		$htmltextclr = '#990000';
		$htmllinkclr = '#ffffff';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = '660000';
		$htmlfooterclr = 'ff0000';									
	} elsif ($themenbr == 6) {
		$htmlbkrndclr = 'BLACK';
		$htmltextclr = '#33ff00';
		$htmllinkclr = '#003300';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = 'green';
		$htmlfooterclr = 'grey';
	} elsif ($themenbr == 7) {
		$htmlbkrndclr = 'BLACK';
		$htmltextclr = '#CCCCCC';
		$htmllinkclr = '#666666';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = '#FFFFFF';
		$htmlfooterclr = '#999999';
	} elsif ($themenbr == 8) {
		$htmlbkrndclr = '#330033';
		$htmltextclr = '#CC33CC';
		$htmllinkclr = '#FF0000';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = '#FF0033';
		$htmlfooterclr = '#FF00CC';			
	} else {
		$htmlbkrndclr = 'BLACK';
		$htmltextclr = 'BLUE';
		$htmllinkclr = 'CYAN';
		$htmltitle = 'RPG1-Exploits';
		$htmltitle2 = 'RPG1 Exploits';
		$htmlborderclr = 'darkblue';
		$htmlfooterclr = '#3B53B3';		
	}
	
	if ($allowinfotrack == 1) {
		$htmlbufferinfo = $bufferinfo;
	} else {
		$htmlbufferinfo = 'N/A';
	}
	
	if ($allowstarttrack == 1) {
		$htmlbufferstart = $bufferstart;
	} else {
		$htmlbufferstart = 'N/A';
	}
	
	if ($allowreadtrack == 1) {
		$htmlbufferread = $bufferread;
	} else {
		$htmlbufferread = 'N/A';
	}
		
	if ($bookjournal == 1) {
		$htmljournalread = $journalread;
		chomp($htmljournalread);
	} else {
		$htmljournalread = 'N/A';
	}	
	htmlweapon();
	$htmljournalread =~ s/</-\(/g;
	$htmljournalread =~ s/>/\)-/g;
	$htmljournalread =~ s/\[BR\]/-\(BR\)-/g;	
	$htmljournalread =~ s/ /&nbsp;/g;
	$htmljournalread =~ s/\n/<br>\n\[ENTRY\]/g;
	$htmljournalread = '<hr><table width="100%" border=1 bordercolor="'."$htmlborderclr".'"<br>[BR]<tbody>[BR]<tr>[BR]<td>Journal</td>[BR]</tr>[BR]<tr>[BR]<td>[BR]'."$htmljournalread".'<br>[BR]</td>[BR]</tr>[BR]</tbody>[BR]</table>[BR]';
	$htmljournalread =~ s/\[BR\]/\n/g;
	$htmlweapon =~ s/ /&nbsp;/g;
	$htmlweapon =~ s/\n/<br>\n/g;
	$htmlheader = '<br>[BR]::RPG1 Version:: '."$version".'<br>[BR]::Theme Number:: '."$themenbr".'<br>[BR]::Beings Vanquished:: '."$statkills".'<br>[BR]::Beings Murdered:: '."$statmurders".'<br>[BR]::Wickedness:: '."$wickedness".'<br>[BR]::Time (TURNS) Spent In Game:: '."$clock".'<br>[BR]::Last Room:: '."$room".'<br>[BR]::Last Room'."'".'s Author:: '."$lroomauthor".'<br>[BR]::Last Health Amount:: '."$health".'<br>[BR]::Last Mana Amount:: '."$mana".'<br>[BR]::Amount of Food:: '."$food".'<br>[BR]::Amount of Bombs:: '."$bombamount".'<br>[BR]::Amount of 10 Megaton Thermonuclear Warheads:: '."$nukeamount".'<br>[BR]::Amount of 9mm Ammunition:: '."$bullet9mmamount".'<br>[BR]::Amount of .45 Caliber Ammunition:: '."$bullet45calamount".'<br>[BR]::Amount of 12GA Ammunition:: '."$slug12gaamount".'<br>[BR]::Amount of X14 Ammunition:: '."$explosiveRPGX14amount".'<br>[BR]::Amount of 9mm Caps Popped:: '."$counter9mm".'<br>[BR]::Amount of .45 Caliber Rounds Expended:: '."$counter45cal".'<br>[BR]::Amount of 12GA Shells Busted:: '."$counter12ga".'<br>[BR]::Amount of X14 Rocket Propelled Grenades Lit Up:: '."$counterRPGX14".'<br>[BR]::General Experience Level:: '."$explevel".'<br>[BR]::Physical Experience Level:: '."$physexp".'<br>[BR]::Magic Experience Level:: '."$magicexp".'<br>[BR]::Level of Intellect:: '."$intellect".'<br>[BR]::Weapon Weilded:: '."$gingertype".'<br>[BR]::Greatest Possible Force (by Weapon):: '."$force".'<br>[BR]::Armor Worn:: '."$armorginger".'<br>[BR]::Durability of Armor:: '."$armordur".'<br>[BR]::Greatest Possible Protection (by Armor):: '."$armordefend".'<br>[BR]::Spells Learned:: '."$spellsknown".'<br>[BR]::Reactor Coolant Level:: '."$reactorcoolant".'%'.'<br>[BR]::Reactor Temp:: '."$reactortemp".'%'.'<br>[BR]::Reactor Power:: '."$reactorpower".'%'.'<br>[BR]::Reactor Degradation:: '."$reactordegrd".'%'.'<br>[BR]::Amount of Gold Coins:: '."$gp".'<br>[BR]';
	$htmlfooter = '<br>[BR]<hr><br>[BR]<font SIZE="-1" COLOR='."$htmlfooterclr".'>::Generated&nbsp;By&nbsp;RPG1::&nbsp;-&nbsp;::WEB[<a HREF="https://cat2.ath.cx">CAEthaver2</a>]::&nbsp;-&nbsp;::IRC[<i>#linux</i>&nbsp;@&nbsp;<b>cat2.ath.cx</b>&nbsp;or&nbsp;<b>longhorn.ath.cx</b>]::&nbsp;-&nbsp;::FORUMS[<a HREF="https://cat2.ath.cx/bb/index.php">CAEthaver2&nbsp;General&nbsp;Forums</a>]::&nbsp;-&nbsp;::RPG1[written&nbsp;by&nbsp;MikeeUSA]::</font><br>[BR]</body>[BR]</html>[BR]';	
	$htmlheader =~ s/ /&nbsp;/g;
	$htmlheader = '<!DOCTYPE HTML PUBLIC "html.dtd">[BR]<html>[BR]<head>[BR]<title>'."$htmltitle".'</title>[BR]<style TYPE="text/css">[BR]</STYLE>[BR]</head>[BR]<body><body BGCOLOR="'."$htmlbkrndclr".'" TEXT="'."$htmltextclr".'" LINK='."$htmllinkclr".'>[BR]'.'<H1>'."$htmltitle2".'</H1><br>[BR]<hr>'.'<table width="100%" border=0>[BR]<tbody>[BR]<tr>[BR]<td width="75%">[BR]'."$htmlheader".'[BR]</td>[BR]<td width="25%">[BR]<tt>'."$htmlweapon".'</tt>[BR]</td>[BR]</tbody>[BR]</table>[BR]'.'<br>[BR]<hr><br>[BR]';
	$htmlheader =~ s/\[BR\]/\n/g;
	$htmlfooter =~ s/\[BR\]/\n/g;
		$htmlbufferread =~ s/sa0map/\[MAP OF SEWAGE SECTOR\]/g;
		$htmlbufferread =~ s/gac4read/\[ASCII PR0N\]/g;
		$htmlbufferread =~ s/roomlbvtrg/\[LIBRARY LISTING\]/g;
	$htmlbufferinfo =~ s/</-\(/g;
	$htmlbufferstart =~ s/</-\(/g;
	$htmlbufferread =~ s/</-\(/g;
	$htmlbufferinfo =~ s/>/\)-/g;
	$htmlbufferstart =~ s/>/\)-/g;
	$htmlbufferread =~ s/>/\)-/g;				
	$htmlbufferinfo =~ s/\n/<br>\n/g;
	$htmlbufferstart =~ s/\n/<br>\n/g;
	$htmlbufferread =~ s/\n/<br>\n/g;
	$htmlbufferinfo =~ s/ /&nbsp;/g;
	$htmlbufferstart =~ s/ /&nbsp;/g;
	$htmlbufferread =~ s/ /&nbsp;/g;
	$htmltables = '<table width="100%" border=1 bordercolor="'."$htmlborderclr".'"><tbody><tr><td>Messages</td><td>Commands</td><td>Read</td></tr><tr><td>'."$htmlbufferinfo".'</td><td>'."$htmlbufferstart".'</td><td>'."$htmlbufferread".'</td></tr></tbody></table><br>'."$htmljournalread";
	$htmlfile = "$htmlheader\n$htmltables\n$htmlfooter\n";
	open FILE,"> $htmldumpfile" 
		or print"\nWARNING: Could Not Open $htmldumpfile \n";
	print FILE "$htmlfile"
		or print"\nWARNING: Could Not Write To $htmldumpfile \n";	
	close FILE
		or print"\nWARNING: Could Not Even Close $htmldumpfile \n";
	$htmlbufferinfo = '';
	$htmlbufferstart = '';
	$htmlbufferread = '';
	$htmlheader = '';
	$htmlfooter = '';
	$htmltables = '';
	$htmlweapon = '';
	$htmljournalread = '';
}

sub saveashtml {
infinitenewlines();
sbluebar();
#this code is mangled, phj33r my l33t skillx0rz!
print color 'bold yellow'; print"\n     What Shall The HTML File Chronologging Your\n              RPG1 Exploits Be Called?\n\n"; print color 'reset';


sbluebar2();			
			print color "reset";
			print"enter filename ["; 
			print color 'green'; 
			print"rpg1-ex.html";
			print color 'reset'; 
			print"] ";
			
	$saverpg1exploits3 = <STDIN>;
	chomp($saverpg1exploits3);
	if ($saverpg1exploits3 eq "") {
		$htmldumpfile = 'rpg1-ex.html';
	} else {
		$htmldumpfile = $saverpg1exploits3;
	}
	printhtml();
	infinitenewlines();
}

#ending 
print"\n";

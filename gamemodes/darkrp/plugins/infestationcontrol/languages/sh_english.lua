--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


LANGUAGE = {
	infestationNew = "New Infestation Zone",
	infestationName = "Zone Name",
	infestationType = "Zone Type",
	infestationSpread = "Spread Rate",
	infestationSave = "Save Infestation Zone",
	infestationExists = "That Infestation Zone already exists!",
	invalidSpread = "That is not a valid Spread Rate!",
	notEnoughProps = "Not enough Infestation Props found!",
	missingCore = "No Infestation Zone Core found!",
	infestationTank = "Infestation Control Tank",
	infestationTankVolume = "Tank Volume: ",
	hoseAttached = "Hose attached",
	hoseDetached = "Hose detached",
	applicatorAttached = "Applicator attached",
	applicatorDetached = "Applicator detached",
	hoseDetachedSuccess = "You detach the hose from the tank.",
	hoseDetachedFailure = "You must detach the applicator before detaching the hose!",
	noHoseAttached = "There is no hose attached to the tank!",
	applicatorDetachedSuccess = "You detach the applicator from the tank.",
	noApplicatorAttached = "There is no applicator attached to the tank!",
	packUpFailureApplicator = "You must detach the applicator before packing up the tank!",
	packUpFailureHose = "You must detach the hose before packing up the tank!",
	packUpFailureInventory = "You do not have enough inventory space to carry this tank!",
	packUpSuccess = "You pack up and begin carrying the entire tank around. ...How?",
	mucusCollectSuccess = "You collect some Erebus Mucus from the growth and store it inside a Plastic Jar.",
	mucusCollectFailureLuck = "You fail to find anything to harvest from this part of the growth!",
	mucusCollectFailureJar = "You need an Empty Jar to harvest this growth!",
	thanatosCollectSuccess = "You cut out a small thick stack from the growth. It pulsates slightly.",
	thanatosCollectFailureLuck = "You fail to find anything to harvest from this part of the growth!",
	thanatosCollectFailureWrongTool = "You used a blunt melee tool and this part of the growth was destroyed!",
	thanarokCollectSuccess = "You cut out a small thick stack from the growth. It pulsates slightly.",
	thanarokCollectFailureLuck = "You fail to find anything to harvest from this part of the growth!",
	thanarokCollectFailureWrongTool = "You used a blunt melee tool and this part of the growth was destroyed!",
	xipeCollectSuccess = "You slice off a piece of Cluster-Hive from the growth.",
	xipeCollectFailureLuck = "You fail to find anything to harvest from this part of the growth!",
	tankFilled = "You fill the tank with the %s.",
	tankFull = "The tank is full!",
	tankDifferentChemical = "That tank has a different chemical loaded into it!",
	invalidTank = "You must be aiming at a valid tank!",
	applicatorAttachFailureAttached = "There is another applicator attached to this tank!",
	applicatorAttachFailureNoHose = "A hose must be attached to the tank before attaching the applicator!",
	applicatorAttachSuccess = "You attach the applicator to the tank.",
	applicatorEquipFailureNoHose = "You don't have a hose connected!",
	hoseAttachFailureAttached = "There is another hose attached to this tank!",
	hoseAttachSuccess = "You attach the orange hose to the tank.",
	hoseConnectFailureConnected = "There is another hose connected to this tank!",
	hoseConnectFailureMultipleHoses = "You can only carry one connected hose at once!",
	hoseConnectSuccess = "You connect the orange hose to the tank.",
	hoseDisconnectFailureApplicator = "You must unequip the applicator before disconnecting the hose!",
	hoseDisconnectSuccess = "You disconnect the orange hose from the tank.",
	hoseDisconnectForced = "The orange hose has disconnected from the tank because you moved too far!",
	tankDeploySuccess = "You place the tank down. That must've been exhausting.",
	tankDeployFailureDistance = "You cannot drop the Tank that far away!",
	none = "None",
	empty = "Empty",
	chemicalType = "Chemical Type: ",
	chemicalVolume = "Chemical Volume: ",
	reading = "Reading: ",
	menuMainTitle = "Infestation Edit Mode - Menu",
	menuMainEdit = "To edit an existing infestation zone, press CTRL + SHIFT + RIGHT CLICK",
	menuMainCreate = "To create a new infestation zone, press CTRL + SHIFT + LEFT CLICK",
	menuMainExit = "To exit the Infestation Edit Mode, press CTRL + SHIFT + ALT",
	menuCreateTitle = "Infestation Edit Mode - Create Infestation",
	menuCreateNotice = "Any props spawned will be considered infestation props",
	menuCreateSave = "To save changes and create a new infestation zone, press CTRL + SHIFT + LEFT CLICK",
	menuCreateCore = "To define the infestation core prop, press CTRL + SHIFT + RIGHT CLICK",
	menuCreateExit = "To exit and cancel all changes, press CTRL + SHIFT + ALT",
	menuEditTitle = "Infestation Edit Mode - Edit Infestation",
	menuEditRemove = "To completely remove the target infestation zone, press CTRL + SHIFT + RIGHT CLICK",
	menuEditExit = "To exit and cancel all changes, press CTRL + SHIFT + ALT",
	cmdInfestationEdit = "Enter the Infestation Edit mode.",
	noPetFlags = "The Infestation Edit mode requires the use of PET flags; which you don't have!",
	invalidZone = "That is not a valid infestation zone!",
	invalidInfestationProp = "That is not a valid infestation prop!",
	zoneRemoved = "Infestation zone removed.",
	zoneCreated = "\"%s\" Infestation Zone created successfully.",
	viviralItemName = "Anti-Xenian Viviral",
	viviralItemDesc = "A synthesized virus created specifically to target Xenian-cell structures. This is an extremely formidable tool against Xenian infestations but exposure to humans is near-fatal as total organ shutdown will occur within two minutes. In order to ensure an outbreak does not occur, the virus dies three minutes outside of its special storage.",
	thermoradioItemName = "Thermo-Radioactive Solution",
	thermoradioItemDesc = "The complete popular opposite of Cryogenic Solution using both a mixture of creating the effect of EXTREME heat and a touch of radioactive chemicals to create the ultimate but highly dangerous and deadly solution to the Thanarok Strain. Standing in zones cleansed with this solution can lead to radiation posioning depending on the amount used, death if sprayed directly on you or consumed.",
	causticItemName = "Caustic Solution",
	causticItemDesc = "A very dangerous amalgamation of different corrosive chemical compounds used to melt down Xenian infestations. Operate with care as exposure can cause the quick melting of skin, muscle, and bone.",
	cryogenicItemname = "Cryogenic Liquid",
	cryogenicItemDesc = "A synthesized liquefied gas of very low temperatures capable of instantly freezing anything that it touches within seconds. Exposure will result in severe frostbite in a matter of seconds.",
	hydrocarbonItemName = "Hydrocarbon Foam",
	hydrocarbonItemDesc = "A potent cocktail of sensitive chemicals and hydrocarbons made to exterminate pesky Xenian growths and infestations by the extremely fast-heating foam. Handle with caution as exposure can result in severe burns.",
	coarctateItemName = "Coarctate Mucus",
	coarctateItemDesc = "A rather sticky and strong smelling mucus like fluid. To the trained eye, it seems to have some medical applications.",
	itemCrafted = "This item can be created with the Crafting Skill.",
	itemSus = "CPs will view you as suspicious if found with this item.",
	itemHarvestedCrafted = "This item can be harvested from Infestation Growths and can be used with the Crafting Skill.",
	erebusItemName = "Erebus Mucus",
	erebusItemDesc = "A slippery, sticky, and stringy green fluid substance of a great many uses, contained in a large plastic jar.",
	applicatorItemName = "Foam Applicator",
	applicatorItemDesc = "A large weapon-like tool designed to convert substances into foam and spread them over an area.",
	clusterItemName = "Cluster-Hive",
	clusterItemDesc = "A faint orange cluster of honeycomb-like structures. They have a very dry texture to them.",
	hoseItemName = "Orange Hose",
	hoseItemDesc = "A large orange hose. It has two connection ports on either end.",
	nososItemName = "Nosos Heart",
	nososItemDesc = "An extremely veiny silk-like orb that appears to be still functioning due to its gently yet constant movements.",
	itemHarvestedHeadcrab = "This item can be harvested from a live Headcrab.",
	tankItemName = "Infestation Control Tank",
	tankItemDesc = "A large Infestation Control Tank. How can you even carry this?!",
	thanatosItemName = "Thanatos Embryo",
	thanatosItemDesc = "A thick stack protects and engulfs an unknown living entity inside.",
	thanarokItemName = "Thanarok Embryo",
	thanarokItemDesc = "An almost impossible to destroy substance hides inside a very think layer of Xenian Flesh, hardened by many layers of protective materials.",
	itemHarvested = "This item can be harvested from Infestation Growths.",
	detectorItemName = "Infestation Detector",
	detectorItemDesc = "A yellow infestation detector. It displays a reading at the front."
}

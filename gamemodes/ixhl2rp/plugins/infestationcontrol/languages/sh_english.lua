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
	infestationNew = "Nowa Strefa Skażenia",
	infestationName = "Nazwa Strefy",
	infestationType = "Typ Strefy",
	infestationSpread = "Szybkość Rozrostu",
	infestationSave = "Zapis Strefe Skażenia",
	infestationExists = "Ta Strefa Skażenia już istnieje!",
	invalidSpread = "Wpisana wartość szybkości rozrostu jest niepoprawna!",
	notEnoughProps = "Nie znaleziony wystarczająco propów Skażenia!",
	missingCore = "Nie znaleziono ogniska Skażenia!",
	infestationTank = "Zbiornik na chemikalia",
	infestationTankVolume = "Zawartość zbiornika: ",
	hoseAttached = "Wąż podłączony",
	hoseDetached = "Wąż odłączony",
	applicatorAttached = "Aplikator podłączony",
	applicatorDetached = "Aplikator odłączony",
	hoseDetachedSuccess = "Odłączyłeś wąż od zbiornika.",
	hoseDetachedFailure = "Musisz odłączyć aplikator przed odłączeniem węża!",
	noHoseAttached = "Do zbiornika nie ma podłączonego węża!",
	applicatorDetachedSuccess = "Odłączyłeś aplikator od zbiornika.",
	noApplicatorAttached = "Do zbiornika nie ma podłączonego aplikatora!",
	packUpFailureApplicator = "Musisz odłączyć aplikator przed zabraniem zbiornika!",
	packUpFailureHose = "Musisz odłączyć wąż przed zabraniem zbiornika!",
	packUpFailureInventory = "Nie masz wystarczająco miejsca w ekwipunku aby zabrać ten zbiornik!",
	packUpSuccess = "Podnosisz zbiornik i zabierasz go ze sobą. ...Jak?",
	mucusCollectSuccess = "Zebrałeś trochę Śluzu z Erebusa z narośli i schowałeś go do Plastikowego Słoika.",
	mucusCollectFailureLuck = "Nie udało ci się zebrać czegokolwiek z narośli!",
	mucusCollectFailureJar = "Potrzebujesz Pusty Słoik aby zebrać tą narośl!",
	thanatosCollectSuccess = "Odciąłeś mały, pełen warstw kawałek narośli. Delikatnie pulsuje.",
	thanatosCollectFailureLuck = "Nie udało ci się zebrać czegokolwiek z tej narośli",
	thanatosCollectFailureWrongTool = "Użyłeś tępego narzędzia i ta część narośli została zniszczona!",
	thanarokCollectSuccess = "Odciąłeś mały, pełen warstw kawałek narośli. Delikatnie pulsuje.",
	thanarokCollectFailureLuck = "Nie udało ci się zebrać czegokolwiek z tej narośli!",
	thanarokCollectFailureWrongTool = "Użyłeś tępego narzędzia i ta część narośli została zniszczona!",
	xipeCollectSuccess = "Odciąłeś kawałek Gniazdo-Plastra z tej narośli.",
	xipeCollectFailureLuck = "Nie udało ci się zebrać czegokolwiek z tej narośli!",
	tankFilled = "Wlałeś %s do zbiornika.",
	tankFull = "Zbiornik jest pełen!",
	tankDifferentChemical = "Zbiornik wypełniony jest już inną substancją chemiczną!",
	invalidTank = "Musisz celować na prawidłowy zbiornik!",
	applicatorAttachFailureAttached = "Do zbiornika przyczepiony jest inny aplikator!",
	applicatorAttachFailureNoHose = "Do zbiornika musi być podłączony wąż zanim podłączysz aplikator!",
	applicatorAttachSuccess = "Podłączyłeś aplikator do zbiornika.",
	applicatorEquipFailureNoHose = "Wąż nie jest podłączony!",
	hoseAttachFailureAttached = "Do tego zbiornika przyczepiony jest inny wąż!",
	hoseAttachSuccess = "Podłączyłeś pomarańczowy wąż do zbiornika.",
	hoseConnectFailureConnected = "Do tego zbiornika podłączony jest inny wąż!",
	hoseConnectFailureMultipleHoses = "Możesz nosić tylko jeden podłączony wąż w danym momencie!",
	hoseConnectSuccess = "Podłączyłeś pomarańczowy wąż do zbiornika.",
	hoseDisconnectFailureApplicator = "Musisz odłożyć aplikator przed odłączeniem węża!",
	hoseDisconnectSuccess = "Odłączyłeś pomarańczowy wąż od zbiornika.",
	hoseDisconnectForced = "Pomarańczowy wąż odłączył się od zbiornika ponieważ zbyt daleko się od niego oddaliłeś!",
	tankDeploySuccess = "Postawiłeś zbiornik. To musiało być wycięczające.",
	tankDeployFailureDistance = "Nie możesz upuścić zbiornika tak daleko od siebie!",
	none = "Żaden",
	empty = "Pusty",
	chemicalType = "Typ substancji: ",
	chemicalVolume = "Wypełnienie zbiornika: ",
	reading = "Odczyt: ",
	menuMainTitle = "Tryb edycji Skażenia - Menu",
	menuMainEdit = "Aby edytować istniejąca już strefe skażenia, naciśnij CTRL + SHIFT + PRAWY PRZYCISK MYSZKI",
	menuMainCreate = "Aby stworzyć nową strefe skażenia, naciśnij CTRL + SHIFT + LEWY PRZYCISK MYSZKI",
	menuMainExit = "Aby wyjść z trybu edycji skażenia, naciśnij CTRL + SHIFT + ALT",
	menuCreateTitle = "Tryb edycji Skażenia - Stwórz strefę skażenia",
	menuCreateNotice = "Jakikolwiek zrespiony prop zostanie uznany za skażony",
	menuCreateSave = "Aby zapisać zmiany i stworzyć strefę skażenia, naciśnij CTRL + SHIFT + LEWY PRZYCISK MYSZKI",
	menuCreateCore = "Aby określić prop ogniskiem skażenia, naciśnij CTRL + SHIFT + PRAWY PRZYCISK MYSZKI",
	menuCreateExit = "Aby wyjść i anulować wszystkie zmiany, naciśnij CTRL + SHIFT + ALT",
	menuEditTitle = "Tryb edycji Skażenia - Edytuj strefę skażenia",
	menuEditRemove = "Aby całkowicie usunąć strefę skażenia, naciśnij CTRL + SHIFT + PRAWY PRZYCISK MYSZKI",
	menuEditExit = "Aby wyjść i anulować wszystkie zmiany, naciśnij CTRL + SHIFT + ALT",
	cmdInfestationEdit = "Włącz tryb edycji stref skażenia.",
	noPetFlags = "Tryb edycji Skażenia wymaga posiadania flag, których nie posiadasz!",
	invalidZone = "To nie jest prawidłowa strefa skażenia!",
	invalidInfestationProp = "To nie jest prawidłowy prop skażenia!",
	zoneRemoved = "Strefa Skażenia usunięta.",
	zoneCreated = "Strefa Skażenia \"%s\" utworzona pomyślnie.",
	viviralItemName = "Czynnik anty-Xenowy",
	viviralItemDesc = "Zsyntetyzowany wirus stworzony specjalnie do wyniszczania struktur komórkowych organizmów z Xen. Jest to nadzwyczaj potężne narzędzie do walki ze skażeniami z Xen, ale również bardzo groźne - kontakt z człowiekiem powoduje niewydolność wielonarządową w ciągu dwóch minut. By uniknąć wybuchu epidemii, wirus został przystosowany tak, by uległ rozpadowi trzy minuty po opuszczeniu specjalnego pojemnika.",
	thermoradioItemName = "Roztwór termo-radioaktywny",
	thermoradioItemDesc = "Całkowite przeciwieństwo płynu kriogenicznego, wykorzystujące zarówno mieszankę tworzącą efekt EKSTREMALNEGO ciepła, jak i odrobinę radioaktywnych chemikaliów, aby stworzyć ostateczne, ale bardzo niebezpieczne i śmiertelne rozwiązanie dla szczepu Thanarok. Przebywanie w strefach oczyszczonych tym roztworem może prowadzić do zatrucia promieniowaniem, w zależności od użytej ilości, śmierci w przypadku bezpośredniego rozpylenia lub spożycia.",
	causticItemName = "Roztwór żrący",
	causticItemDesc = "Bardzo groźne połączenie różnych żrących związków chemicznych, które używane jest do stapiania skażeń z Xen. Z wyżej wymienioną substancją należy obchodzić się bardzo ostrożnie - roztwór może szybko przeżreć się przez skórę, tkankę mięśniową oraz kości.",
	cryogenicItemname = "Płyn kriogeniczny",
	cryogenicItemDesc = "Zsyntetyzowany i upłynniony gaz o bardzo niskich temperaturach, zdolny do zamrożenia wszystkiego czego dotknie w ciągu zaledwie kilku sekund. Kontakt z substancją może wywołać odmrożenie narażonej części ciała prawie natychmiast po zetknięciu się z płynem.",
	hydrocarbonItemName = "Płyn z pianą węglowodorową",
	hydrocarbonItemDesc = "Silnie oddziałująca mieszanina chemikaliów i węglowodorów stworzona, by wytępić uciążliwą narośl z Xen oraz skażenia poprzez niezwykle prędko nabierającą temperaturę pianę. Należy ostrożnie obchodzić się z substancją, gdyż może ona doprowadzić do poważnych poparzeń.",
	coarctateItemName = "Wydzielina z Coarctate",
	coarctateItemDesc = "Klejąca i śmierdząca substancja płynna. Dla niektórych może wydawać się, że ma jakieś zastosowanie w medycynie.",
	itemCrafted = "Ten przedmiot może zostać wytworzony przy użyciu umiejętności wytwarzania.",
	itemSus = "CP będzie coś podejrzewać jeżeli znajdą przy tobie ten przedmiot.",
	itemHarvestedCrafted = "Ten przedmiot może zostać zebrany ze strefy skażenia i można wykorzystać go przy wytwarzaniu.",
	erebusItemName = "Śluz z Erebusa",
	erebusItemDesc = "Oślizgła, klejąca się zielona substancja płynna o wielu zastosowaniach, przechowywana w słoiku.",
	applicatorItemName = "Aplikator piany",
	applicatorItemDesc = "Jest to duże urządzenie, które pochłania substancje i chemikalia służące do walki ze skażeniem, przetwarzając je w pianę, którą później jest w stanie ‘wystrzelić’ aby pokryć nią duży obszar. Zależnie od użytego czynnika piana ta zmieni się w ciecz, a jej efekty widoczne będą po paru sekundach, jednakże cały proces może zająć nawet do kilku minut.",
	clusterItemName = "Gniazdo-Plaster",
	clusterItemDesc = "Zgrupowane skupisko struktur podobnych do plastra miodu. Bardzo suche w dotyku.",
	hoseItemName = "Pomarańczowy wąż",
	hoseItemDesc = "Długi, pomarańczowy wąż. Na obu końcach posiada zawory.",
	nososItemName = "Serce Nosos",
	nososItemDesc = "Bardzo żylasta, podobna do jedwabiu kula, która wydaje się dalej funkcjonować ze względu na jej ciągłe ruchy..",
	itemHarvestedHeadcrab = "Ten przedmiot może zostać pozyskany z żywego Headcraba",
	tankItemName = "Zbiornik na chemikalia",
	tankItemDesc = "Duży zbiornik na chemikalia przeciwko skażeniu. Jak ty to w ogóle możesz unieść?!",
	thanatosItemName = "Embrion Thanatos",
	thanatosItemDesc = "Niebywale gruba otoczka chroni nieznany żywy organizm znajdujący się w środku.",
	thanarokItemName = "Embrion Thanarok",
	thanarokItemDesc = "Prawie niemożliwa do zniszczenia substacja skrywająca się pod wieloma warstwami materiału ochronnego.",
	itemHarvested = "Ten przedmiot może zostać zebrany ze strefy skażenia.",
	detectorItemName = "Detektor Skażenia",
	detectorItemDesc = "Żółty detektor skażenia. Na wyświetlaczu zobaczyć można różne odczyty."
}
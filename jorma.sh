#!/bin/bash

paikka=ullakko
ovella=false
maila=false
rikki=false
porras=0
run=True

echo "Jorma on autiotalossa"
echo "Auta Jormaa pakenemaan autiotalosta ennen kuin on liian myöhäistä"
echo "Voit ohjata Jormaa komennoilla kuten esimerkiksi <katso ympärillesi>  <mene ovelle>   <ota esine>   <käytä esninettä> ."




echo -n ">> "
read input


while [[ $paikka == "ullakko" ]];
do

	if [[ $input == "katso ympärillesi" ]]; then
    		unset input
    		echo "Olet autiotalon ullakkohuoneessa"
    		echo "Lattialla lojuu pesäpallomaila"
    		echo "Huoneen toisella puolella on ikkuna ja toisella ovi"
    		echo -n ">> "
    		read input

	
	elif [[ $input == "mene ikkunalle" ]]; then
		echo "Putoat ikkunasta ja kuolet"
		break
		

	elif [[ $input == "ota maila" || $input == "ota pesäpallomaila" ]]; then
    		unset input
    		echo "Maila otettu"
    		maila=true
		echo -n ">> "
    		read input


	elif [[ $input == "mene ovelle" && $ovella == "false" || $input == "mene oven luo" && $ovella == "false" ]]; then
		unset input
		echo "Kävellään..."
		sleep 2
		echo "Ovella"
		echo -n ">> "
		read input
		ovella=true


	elif [[ $input == "katso ovea" && $ovella == "true" ]]; then
		unset input
		echo "Se on vanha ja tehty puusta"
		echo "Lukko on rikki"
		echo -n ">> "
		read input
	
	
	elif [[ $input == "käytä mailaa oveen" && $ovella == "true" && $maila == "true" && $rikki == "false" || $input == "lyö ovea mailalla" && $ovella == "true" && $maila == "true" && $rikki == "false" ]]; then
		
		rikki=true	
		unset input
		echo "Ovi hajosi"
		echo -n ">> "
		read input


	elif [[ $input == "mene ovesta" && $maila == "true" && $ovella == "true" && $rikki == "true" ]]; then
		unset maila
		unset ovella
		unset rikki
		unset input
		echo "Olet pimeässä portaikossa"
		paikka=portaikko
		echo -n ">> "
		read input
		

	else
		echo "Ma ei ummarrra"
		unset input
		echo -n ">> "
		read input
	fi
done

while [[ $paikka == "portaikko" ]];
do
	if [[ $input == "katso ympärillesi" ]]; then
		unset input
		echo "Olet pimeässä portaikossa"
		echo -n ">> "
		read input

	
	elif [[ $input == "mene alas" ]]; then
		paikka=alhaalla
		unset input
		echo "Kävellään..."
		sleep 2
		echo "Alhaalla"
		echo -n ">> "
		read input



	else
		echo "Ma ei ummarra"
		unset input
		echo -n ">> "
		read input

	fi
done


while [[ $paikka ==  "alhaalla" ]];
do

	if [[ $input == "katso ympärillesi" ]]; then
		unset input
		echo "Olet alakerrassa ja siellä on pimeää"
		echo -n ">> "
		read input


	elif [[ $input == "mene eteenpäin" ]]; then
		unset input
		tappelu=true
		echo "Törmäät isoon vihreään otukseen ja sillä on veitsi kädessä!"
		echo "Mitä teet!?"
		echo -n ">> "
		read input


	elif [[ $input == "lyö pesäpallomailalla otusta" && $tappelu == "true" || $input == "lyö mailalla otusta" && $tappelu == "true"|| $input == "lyö mailalla" && $tappelu == "true" ]]; then
		unset input
		echo "Otus kaatui ja kuoli"
		echo "Voitit pelin!"
		break
	

	elif [[ $input == "juokse karkuun" || $input == "mene karkuun" || $input == "juokse" ]]; then
		unset input
		echo "Otus lyö sinua veitsellänsä ja kuolet"
		echo "Aloita alusta, jos haluat voittaa pelin"
		break


	else
		echo "Ma ei ummarrrrra"
		unset input
		echo -n ">> "
		read input
	fi
done


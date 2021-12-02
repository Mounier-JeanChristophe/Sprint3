#!/bin/bash

	if [ ! -d "TEXT" ] 
		then
			$(mkdir TEXT/)
	fi

	for fich in $(find -name "*.pdf")
	do
		$(pdftotext $fich)
	done

	for fich in $(find CORPUS_TRAIN -name "*.txt" | grep -oP '(?<=/)[^ ]*')
	do
		if [ ! -f TEXT/$fich ]
			then 
				mv CORPUS_TRAIN/$fich TEXT
		else
			rm TEXT/$fich
			mv CORPUS_TRAIN/$fich TEXT
		fi
	done
	

#! /bin/bash

VERSION=`git shortlog | grep -E '^[ ]+\w+' | wc -l`

fpm -s dir -t deb -a all  \
	--name "mcollective-plugins-cleanup" \
	--version "0.$VERSION" \
	--maintainer "Lars van de Kerkhof <lars@permanentmarkers.nl>" \
	--url "https://github.dtc.avira.com/VDT/mcollective-cleanup" \
	--depends "mcollective" \
	--prefix "/usr/share/mcollective/plugins/mcollective" \
	--exclude "README.rst" \
	--edit \
    *

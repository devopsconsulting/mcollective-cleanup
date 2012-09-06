#! /bin/bash

VERSION=`git shortlog | grep -E '^[ ]+\w+' | wc -l`

fpm -s dir -t rpm -a all  \
	--name "mcollective-plugins-cleanup" \
	--version "0.$VERSION" \
	--maintainer "Frank Spijkerman <frank.spijkerman@avira.com>" \
	--url "https://github.dtc.avira.com/VDT/mcollective-cleanup" \
	--depends "mcollective" \
	--prefix "/usr/share/mcollective/plugins/mcollective" \
	--exclude "README.rst" \
    *

#!/bin/bash

for FILE in $(echo .* | grep -v \\.\\. | grep -v \\.); do
	ln -s $(pwd)/$FILE ../
done


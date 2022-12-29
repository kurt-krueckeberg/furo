#! /usr/bin/env php
<?php

exec("rm t/*");

// copy transcript file to t folder
exec("cp p/* t");

/*
The sed -r options changes the regex flavor to sed's extended regex.

We change line that don't begin with any of ".#:" to begin with leading space. In rst
quoted paragraphs are created by just indenting them more than the surrounding paragraphs.
A a single space or a tab can be used.
*/

$f = 'find -L t -name "*.rst" -exec sed -r -i "s/^([^\.#:].*)$/ \\1/g" {} \;'; 

exec($f);

exec("make clean");

exec ("make html");

#! /usr/bin/env php
<?php

exec("rm t/*");

// copy transcript file to t folder
exec("cp p/* t");

// -r uses sed's extended regex 
// Lines that don't begin with a dot have four leading spaces inserted.
//TODO: Remove the find command ansd instead use code entirely to iterate file
// in /t folder and do preg_match or preg_replaced . Also change the format of the .rst files in /p
// to be whatever makes the php code easiest.
 //todo: only one space is needed forliteral blocks

$f = 'find -L t -name "*.rst" -exec sed -r -i "s/^([^\.#:].*)$/    \\1/g" {} \;'; 

echo "Copied transcript/translation files."

exec($f);

$f = 'find -L t -name "*.rst" -exec sed -r -i "s/^(### (.*)$/

exec($f);

exec("make clean");

exec ("make html");

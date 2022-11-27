#! /usr/bin/env php
<?php

// copy transcript file to t folder
exec("cp p/* t");

// -r uses sed's extended regex 
// Lines that don't begin with a dot have four leading spaces inserted.
$f = 'find -L t -name "*.rst" -exec sed -r -i "s/^([^\.].*)$/    \\1/g" {} \;'; 

echo "Doing this command:\n" .  $f . "\n";

exec($f);

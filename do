#! /usr/bin/env php
<?php

// -r uses sed's extended regex 
$f = 'find -L t -name "*.rst" -exec sed -r -i "s/^([^\.].*)$/    \\1/g" {} \;'; 

echo "Doing this command:\n" .  $f . "\n";

$output=exec($f);


echo "The output was:\n" > $output;

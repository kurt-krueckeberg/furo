#! /usr/bin/env bash
$sedcmd = "sed -r 's/^(.*)$/    \1/g'"; 

$f = 'find -L t -name "*.rst" -exec $sedcmd {} \;'; 

print  "Doing this command:\nexec({$f})\n";
return;

$retval=null;

$output=exec($f, $retval);

echo "Returned with status $retval and output:\n";

print_r($output);

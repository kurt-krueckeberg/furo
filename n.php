<?php
declare(strict_types=1);
include "vendor/autoload.php";
//use Tools\FileReader;

$iterator = new FilesystemIterator(__DIR__, FilesystemIterator::CURRENT_AS_PATHNAME);

foreach ($iterator as $fileinfo)

    echo $iterator->current() . "\n";

/*
$iter = new FilesystemIterator("t");
var_dump($iter);

foreach ($iter as $value) { 
   var_dump($value);
}

return;
*/

/*

$md2html = function(\SplFileInfo $info) use ($template_name) 
{

$m = preg_replace_callback("^#+\s(Tr.*)$", "$1\r\~~~~~~~\r'r::\r\r");


};


foreach ($md_filter_iter as $info) $md2html($info);
*/

<?php
declare(strict_types=1);

// This example will list the contents of the directory containing the script.

$iter = new FilesystemIterator("t");

foreach ($iter as $key => $value) {
    // $arr[3] will be updated with each value from $arr...
    echo "{$key} => {$value} ";
    print_r($arr);
}

return;
/*



$md2html = function(\SplFileInfo $info) use ($template_name) 
{

preg_match(...)

};


foreach ($md_filter_iter as $info) $md2html($info);
*/

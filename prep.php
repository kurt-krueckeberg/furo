<?php
declare(strict_types=1);
use Tools\FileReader;

include 'vendor/autoload.php';

class Writer {
    
    public function __construct(private string $path)
    {
     $this->ofile = new SplFileObject($path,"w"); 
    }
    
    public function __invoke(string $line)
    {
       $this->ofile->fwrite($line . "\n");
    }
};

$iter = new FilesystemIterator('p', FilesystemIterator::KEY_AS_FILENAME |FilesystemIterator::CURRENT_AS_PATHNAME | FilesystemIterator::SKIP_DOTS);
 
/*  
Look into generators
  */

$format = function(string $line) {

    $str = rtrim($line);

    if (preg_match("@^#+\s(\S.*)$@", $str, $m) === 1) {

        $str = $m[1] . "\n" . str_repeat('~',  strlen($m[1])) . "\n";

    } else
        $str = '   ' . $line;
    
    return $str;
};

foreach ($iter as $file => $path) {

    $iter = new FileReader($path);

    $writer =  new Writer('t/' . $file); 

    foreach ($iter as $line) $writer($format($line));
     
    $writer(" ");
}

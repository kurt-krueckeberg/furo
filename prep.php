<?php
declare(strict_types=1);

class Writer {
    
    public function __construct(private string $path)
    {
     $this->ofile = new SplFileObject($path,"w"); 
    }
    
    public function __invoke(string $line)
    {
       $this->ofile->fwrite($line); 
    }
};

$iter = new FilesystemIterator('p', FilesystemIterator::KEY_AS_FILENAME |FilesystemIterator::CURRENT_AS_PATHNAME | FilesystemIterator::SKIP_DOTS);
 
/*  
todo:disting. betw transcr. and tranllatin--literal vs block quoteLook into generators
  */

$format = function(string $line) {

    $str = rtrim($line);

    if (preg_match("@^#+\s(\S.*)$@", $str, $m) === 1) {

        $str = $m[1] . "\n" . str_repeat('~',  strlen($m[1])) . "\n::\n";

    } else
        $str = ' ' . $line;
    
    return $str;
};

foreach ($iter as $file_name => $path) {

    $file = new SplFileObject($path, "r"); 

    $file->setFlags(\SplFileObject::READ_AHEAD);

    $writer =  new Writer('t/' . $file_name); 

    foreach ($file as $line) $writer($format($line));
     
    $writer(" ");
}

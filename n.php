<?php
declare(strict_types=1);

class writer {
    
    public fuction __constructor(private string $opath)
    {
     $this->ofile = new SplFileObject($opath,"w"); // todo: Add the readahead and skipempty param of FileReader
    }
    
    public function __invoke(string $line)
    {
       $this->ofile->write($line);
    }
};

$iter = new FilesystemIterator('p', FilesystemIterator::KEY_AS_FILENAME |FilesystemIterator::CURRENT_AS_PATHNAME FilesystemIterator::SKIP_DOTS);
 
/*  
Look into generators
  */

$format = function(string $line) {

    $str = rtrim($line);

    if (preg_match('^#+(\S.*)$', $str, $m) === 1) {

        $str = $m[1] . "\n" . str_repeat('~',  strlen($m[1])) . "\n";

    } else
        $str = '   ' . $line;
    
    return $str;
};

foreach ($iter as $file => $path) {

    $iter = new reader($path);

    $writer write('t/' . $file); 

    foreach ($iter as $line) write($format($line));
}

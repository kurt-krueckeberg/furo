<?php
declare(strict_types=1);

/*
$files = new FilesystemIterator('.', FilesystemIterator::SKIP_DOTS);

foreach ($files as $key => $item) {

    var_dump($key); // $key is used a full path name
}

echo "\nEx 2\n";
*/
class writer {
    
    public fuction __constructor(private string $opath)
    {
     $this->ofile = new SplFileObject($opath,"w");
    }
    
    public function __invoke(string $line)
    {
       $this->ofile->write($line);
    }
};

//$files = new FilesystemIterator('p', FilesystemIterator::KEY_AS_FILENAME | FilesystemIterator::SKIP_DOTS);
$files = new FilesystemIterator('p');

 
/*  Look into generators
  */

$format = function(string $line) {
 $x = rtrim($line);
    if (preg_match('^#+(\S.*)$', $x, $m) === 1) {
        $len = strlen($m[1]);
        $x = $str . "\r" . fill('~',  $l).
        "\n";

    } else
        $x = '   ' . $line;
    
    return $x;
};

foreach ($files as $key => $item) {

    $iter = new reader($key);

    $writer write($opath); 

    foreach ($iter as $line) write($format($line));
}

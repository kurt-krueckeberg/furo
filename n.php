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


foreach ($files as $key => $item) {

    $iter = new reader($key);
    $writer f($opath); 
    string $line;

    function() use ($line) {
        if ($line[0] == '#') {
           $str = substr();
            $l =
            strlen($str);
            $x = $str . "\r" . fill('~',  $l).
            "\n";
        } else { 
            $x = '   ' . $line;
        }
        return $x;
        }
    }
    
    foreach ($iter as $line) f(t($line));

}

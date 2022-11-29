<?php
declare(strict_types=1);
 

enum fs: string
{
    case transcript_header = "Transcription\n~~~~~~~~~~~~~";
    case translation_header = "Translation\n~~~~~~~~~~~";
    case transcript_text = 'script';
    case translation_text = 'translation';
}

enum State
{
    case transcript_header;
    case transcript_text;
    case translation_header;
    case translation_text;
    
    public function text(): string
    {
        return match($this) 
        {
            State::transcript_header => "Transcription\n~~~~~~~~~~~~~",
            State::translation_header => "Translation\n~~~~~~~~~~~",               
        };
    }
}
//todo: skip blandk lines

class Writer {
    private static $script_spaces = 1;
    private static $translation_spaces = 4;
    
    private $fs;
    
    public function __construct(private string $path)
    {
       $this->fs  = fs::transcript_header;

       $this->ofile = new SplFileObject($path, "w"); 
    }
 
    private function format(string $line) {
        
      $str = '';
      
      if ($this->fs == fs::transcript_header) {
          if ($line[0] !== '#')
             throw LogicException("# placeholder for transcript header not found.");
      }
      
     if ($this->fs == fs::transcript_text && $line[0] == '#') {
         
         $this->fs = fs::translation_header;
     }
     
     switch ($this->fs) {
           
          case fs::transcript_header:
              
            //if ($line[0] !== '#')
            //    throw LogicException("# placeholder for transcript header not found.");
              
            $str = $this->fs->value;  // fs::transcript_header->value;
            
            $str .= "\n\n::\n";
            
            $this->fs = fs::transcript_text;
            
            break;
            
          case fs::transcript_text:
          case fs::translation_text:
              
              $num = $this->fs == fs::transcript_text ? self::$script_spaces : self::$translation_spaces;
              
              $str = str_repeat(' ', $num) . $line;
              break;
              
          case fs::translation_header:
              
                if ($line[0] !== '#')
                  throw new LogicException("# placeholder for translation header not found.");
                
                $str =  $str = $this->fs->value . "\n";  
                
                $this->fs = fs::translation_text;
                
          break;
         
       } 
       
       return $str;
    }
    
    public function __invoke(string $line)
    {
       $str = $this->format($line);
        
       $this->ofile->fwrite($str); 
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

    $file->setFlags(SplFileObject::READ_AHEAD | SplFileObject::SKIP_EMPTY);

    $writer =  new Writer('t/' . $file_name); 

    foreach ($file as $line) 
        $writer($line);
    
     
    $writer(" ");
}

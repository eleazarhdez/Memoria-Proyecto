use strict;
use warnings;
use Template;

my $tt = Template->new(
           'INCLUDE_PATH' => [ '.' ],
           #'ABSOLUTE' => 1,
           #'PLUGIN_BASE' => [],
           #'POST_PROCESS' => [],
           #'PRE_PROCESS' => [],
           #'RELATIVE' => 1,
           #'VARIABLES' => {},
           # INTERPOLATE  => 1,
           # EVAL_PERL    => 1,
          ) || die Template->error();


$tt->process(
  'perlexamples.tt2', 
  {},
  'perlexamples.tex', 
  #{binmode => 1} 
) || die $tt->error(), "\n";



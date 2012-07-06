use strict;
use warnings;
use Template;

my $file = shift || '';

$file =~ s/\.tt2$//;

-r "$file.tt2" or die "Error. Not found '$file.tt2'. Provide the article template filename";

my $tt = Template->new(
           'INCLUDE_PATH' => [ '.' ],
           #'ABSOLUTE' => 1,
           #'PLUGIN_BASE' => [],
           #'POST_PROCESS' => [],
           #'PRE_PROCESS' => [],
           #'RELATIVE' => 1,
           #'VARIABLES' => {},
           # INTERPOLATE  => 1,
           EVAL_PERL    => 1,
          ) || die Template->error();


$tt->process(
  "$file.tt2", 
  {},
  "$file.tex", 
  #{binmode => 1} 
) || die $tt->error(), "\n";




use strict;
use warnings;
use Games::SGF::Go::Rotator;

my $sgf = Games::SGF::Go::Rotator->new();
$sgf->readFile("t/2010-04-21a-with-variations.sgf");

$sgf->rotate90();

$sgf->writeFile("t/2010-04-21a-with-variations-90.sgf");

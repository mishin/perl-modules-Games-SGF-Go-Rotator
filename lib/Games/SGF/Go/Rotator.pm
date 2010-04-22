package Games::SGF::Go::Rotator;

use strict;
use warnings;

use base 'Games::SGF::Go';
use vars qw($VERSION);
$VERSION = '1.0';

use Scalar::Util qw(blessed);
use Games::SGF::Util;

=head1 NAME

Games::SGF::Go::Rotator - subclass of Games::SGF::Go that can rotate the board

=head1 DESCRIPTION

If you have an SGF file of a game that your opponent recorded, it will be
the wrong way up from your perspective, and so harder for you to remember
what's going on when you analyse the game later.  This subclass of
Games::SGF::Go provides extra methods for rotating it.

=head1 SYNOPSIS

  my $sgf = Games::SGF::Go::Rotator->new();
  $sgf->readFile('mygame.sgf');
  $sgf->rotate();  # rotate by 180 degrees, what you'd normally want
  $sgf->rotate90(); # rotate 90 degrees clockwise.

=head1 METHODS

In addition to the methods documented below, all of Games::SGF::Go's
methods are, of course, also available.  Neither of the new methods
take any arguments, and they return the rotated SGF as well as altering
it in-place, for convenience when chaining methods.

=head2 rotate

Rotate the SGF through 180 degrees.

=cut

sub rotate { shift()->rotate90()->rotate90(); }

=head2 rotate90

Rotate the SGF through 90 degrees clockwise.

=cut

sub rotate90 {
  my $self = shift;
  my $util = Games::SGF::Util->new($self);

  # algorithm:
  #
  # consider a square NxN board ...
  #
  #   01234    Each 90 degree rotation moves W to X to Y to Z.
  # 0 .W...    So (x1, y1) => (N-y1, x1)
  # 1 ....X
  # 2 .....
  # 3 Z....
  # 4 ...Y.
  
  $util->filter($_, sub {
    my $coord = shift;
    my($x, $y) = @{$coord};
    # 18 == 19 - 1 # FIXME get this form the SZ tag
    return bless([18 - $y, $x], blessed($coord));
  }) foreach(qw(B W));

  return $self;
}

=head1 BUGS and FEEDBACK

I welcome feedback about my code, including constructive criticism.
Bug reports should be made using L<http://rt.cpan.org/> or by email,
and should include the smallest possible chunk of code, along with
any necessary data, which demonstrates the bug.  Ideally, this
will be in the form of a file which I can drop in to the module's
test suite.

=head1 SEE ALSO

L<Games::SGF::Go>

=head1 AUTHOR, COPYRIGHT and LICENCE

David Cantrell E<lt>F<david@cantrell.org.uk>E<gt>

Copyright 2010 David Cantrell E<lt>david@cantrell.org.ukE<gt>

This software is free-as-in-speech software, and may be used,
distributed, and modified under the terms of either the GNU   
General Public Licence version 2 or the Artistic Licence.  It's
up to you which one you use.  The full text of the licences can
be found in the files GPL2.txt and ARTISTIC.txt, respectively.

=head1 CONSPIRACY

This module is also free-as-in-mason software.

=cut

1;

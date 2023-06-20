use strict;
use warnings;

package Neo4j::Types::Point;
# ABSTRACT: Represents a Neo4j spatial point value


use Carp qw(croak);


my %DIM = ( 4326 => 2, 4979 => 3, 7203 => 2, 9157 => 3 );

sub new {
	my ($class, $srid, @coordinates) = @_;
	
	croak "Points must have SRID" unless defined $srid;
	my $dim = $DIM{$srid};
	croak "Unsupported SRID $srid" unless defined $dim;
	croak "Points with SRID $srid must have $dim dimensions" if @coordinates < $dim;
	return bless [ $srid, @coordinates[0 .. $dim - 1] ], $class;
}


sub X { shift->[1] }
sub Y { shift->[2] }
sub Z { shift->[3] }

sub longitude { shift->[1] }
sub latitude  { shift->[2] }
sub height    { shift->[3] }

sub srid { shift->[0] }

sub coordinates {
	my @coordinates = @{$_[0]}[ 1 .. $#{$_[0]} ];
	return @coordinates;
}


1;

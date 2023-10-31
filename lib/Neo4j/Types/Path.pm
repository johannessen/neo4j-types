use v5.10.1;
use strict;
use warnings;

package Neo4j::Types::Path;
# ABSTRACT: Represents a directed sequence of relationships between two nodes



sub elements {
	my ($self) = @_;
	
	return @$self;
}


sub nodes {
	my ($self) = @_;
	
	my $i = 0;
	return grep { ++$i & 1 } @$self;
}


sub relationships {
	my ($self) = @_;
	
	my $i = 0;
	return grep { $i++ & 1 } @$self;
}


1;

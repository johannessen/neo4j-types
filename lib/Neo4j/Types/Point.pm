use strict;
use warnings;

package Neo4j::Types::Point;
# ABSTRACT: Represents a Neo4j spatial point value


sub new {
	warnings::warnif deprecated => "Deprecated: Use Neo4j::Types::Generic::Point->new() instead";
	
	require Neo4j::Types::Generic::Point;
	&Neo4j::Types::Generic::Point::new;
}


1;

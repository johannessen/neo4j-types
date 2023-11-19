#!perl
use strict;
use warnings;
use lib qw(lib);

use Test::More 0.88;
use Test::Neo4j::Types;
use Test::Warnings 0.010 qw(:no_end_test);
my $no_warnings;
use if $no_warnings = $ENV{AUTHOR_TESTING} ? 1 : 0, 'Test::Warnings';


# These packages extend the outdated Neo4j::Types 1.00
# default implementations just to the point where they
# can pass the conformance tests. Changes are primarily
# related to method call context.

plan tests => 4 + $no_warnings;


neo4j_node_ok 'Neo4j_Test::NodeDef', sub { bless pop, shift };

neo4j_relationship_ok 'Neo4j_Test::RelDef', sub {
	my ($class, $params) = @_;
	return bless {
		%$params,
		start => $params->{start_id},
		end   => $params->{end_id},
	}, $class;
};

neo4j_path_ok 'Neo4j_Test::PathDef', sub { bless pop->{elements}, shift };

neo4j_point_ok 'Neo4j_Test::PointDef', sub {
	my ($class, $params) = @_;
	return bless [
		$params->{srid},
		@{$params->{coordinates}},
	], $class;
};


done_testing;


package Neo4j_Test::NodeDef;
use parent 'Neo4j::Types::Node';

sub labels {
	my @l = shift->SUPER::labels(@_);
}
sub get {
	scalar shift->SUPER::get(@_);
}


package Neo4j_Test::RelDef;
use parent 'Neo4j::Types::Relationship';

sub get {
	scalar shift->SUPER::get(@_);
}


package Neo4j_Test::PathDef;
use parent 'Neo4j::Types::Path';

sub elements {
	my @e = shift->SUPER::elements(@_);
}
sub nodes {
	my @n = shift->SUPER::nodes(@_);
}
sub relationships {
	my @r = shift->SUPER::relationships(@_);
}


package Neo4j_Test::PointDef;
use parent 'Neo4j::Types::Point';

sub srid { shift->[0] }
sub coordinates {
	my @self = @{+shift};
	my @coords = @self > 3 ? @self[ 1 .. 3 ] : @self[ 1 .. 2 ];
}

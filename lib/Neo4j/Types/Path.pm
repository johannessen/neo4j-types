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

__END__

=head1 SYNOPSIS

 ($node1, $rel, $node2) = $path->elements;
 
 ($node1, $node2) = $path->nodes;
 ($rel)           = $path->relationships;

=head1 DESCRIPTION

A Neo4j path is a directed sequence of relationships between
two nodes. Its direction may be separate from that of the
relationships traversed.

It is allowed to have zero length, meaning there are no
relationships in it. In this case, it contains only a single
node which is both the start and the end of the path.

L<Neo4j::Types::Path> objects may be created by executing
a Cypher statement against a Neo4j database server.

=head1 METHODS

L<Neo4j::Types::Path> implements the following methods.

=head2 elements

 @all = $path->elements;

Return the path as a list alternating between nodes
and relationships in path sequence order.

In scalar context, return the number of elements in this path.

 $count = scalar $path->elements;

=head2 nodes

 @nodes = $path->nodes;

Return all L<nodes|Neo4j::Types::Node> of this path.

The start node of this path is the first node in the list this method
returns, the end node is the last one.

 @nodes = $path->nodes;
 $start_node = $nodes[0];
 $end_node   = $nodes[@nodes - 1];

In scalar context, return the number of nodes in this path.

 $count = scalar $path->nodes;

=head2 relationships

 @rels = $path->relationships;

Return all L<relationships|Neo4j::Types::Relationship>
of this path.

In scalar context, return the number of relationships in this path.
The length of a path is defined as the number of relationships.

 $length = scalar $path->relationships;

=head1 SEE ALSO

=over

=item * L<Neo4j::Types::B<Node>>, L<Neo4j::Types::B<Relationship>>

=item * L<Neo4j::Bolt::Path>

=item * L<Neo4j::Driver::Type::Path>

=item * L<REST::Neo4p::Path>

=item * L<"Structural types" in Neo4j Cypher Manual|https://neo4j.com/docs/cypher-manual/current/syntax/values/#structural-types>

=back

=cut

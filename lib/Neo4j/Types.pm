use strict;
use warnings;

package Neo4j::Types;
# ABSTRACT: Common Neo4j type system


use Neo4j::Types::Node;
use Neo4j::Types::Path;
use Neo4j::Types::Point;
use Neo4j::Types::Relationship;

1;

__END__

=head1 DESCRIPTION

The packages in this distribution offer a Neo4j type system for Perl.
Other distributions for the Neo4j ecosystem such as L<Neo4j::Bolt>
and L<Neo4j::Driver> can (if they so choose) use these packages
either directly or indirectly.

If several such distributions share the same representation of Neo4j
values, sharing data between distributions becomes more efficient and
users may have an easier time alternating between them.

The module L<Neo4j::Types> itself contains no code, but you can
C<use> it as a shortcut to load all modules that are included
in this distribution:

=over

=item * L<Neo4j::Types::Node>

=item * L<Neo4j::Types::Relationship>

=item * L<Neo4j::Types::Path>

=item * L<Neo4j::Types::Point>

=back

=head1 IMPLEMENTOR GUIDANCE

The Neo4j Cypher Manual mentions a variety of types.
For a discussion of typical ways to implement these in Perl,
see L<Neo4j::Types::ImplementorNotes>.

=head1 SEE ALSO

=over

=item * L<Neo4j::Bolt/"Return Types">

=item * L<Neo4j::Driver::Record/"get">

=item * L<REST::Neo4p::Entity>

=item * L<"Values and types" in Neo4j Cypher Manual|https://neo4j.com/docs/cypher-manual/current/syntax/values/>

=back

=cut

#!perl
use strict;
use warnings;
use lib qw(lib);

use Test::More 0.88;
use Test::Exception;
use Test::Warnings;
use Neo4j::Types::Path;

plan tests => 3 + 3 + 6 + 6 + 1;


my (@p, $p, @e);

sub new_path { bless shift, 'Neo4j::Types::Path' }

# Real path objects contain only blessed references to nodes
# or relationships, but the Path module doesn't actually care
# about what kind of references its elements are.

@p = ( \6, \7, \8 );
$p = new_path [ @p ];
@e = $p->elements;
is_deeply [@e], [@p], 'deeply elements 3';
@e = $p->nodes;
is_deeply [@e], [$p[0],$p[2]], 'deeply nodes 2';
@e = $p->relationships;
is_deeply [@e], [$p[1]], 'deeply rel 1';

@p = ( \9 );
$p = new_path [ @p ];
@e = $p->elements;
is_deeply [@e], [@p], 'deeply elements 1';
@e = $p->nodes;
is_deeply [@e], [$p[0]], 'deeply nodes 1';
@e = $p->relationships;
is_deeply [@e], [], 'deeply rel 0';

@p = ( \1, \2, \3, \4, \5 );
$p = new_path [ @p ];
@e = $p->elements;
is_deeply [@e], [@p], 'deeply elements 5';
lives_and { is scalar($p->elements), 5 } 'scalar context elements';
@e = $p->nodes;
is_deeply [@e], [$p[0],$p[2],$p[4]], 'deeply nodes 3';
lives_and { is scalar($p->nodes), 3 } 'scalar context nodes';
@e = $p->relationships;
is_deeply [@e], [$p[1],$p[3]], 'deeply rel 2';
lives_and { is scalar($p->relationships), 2 } 'scalar context relationships';

$p = new_path [];
@e = $p->elements;
is scalar(@e), 0, 'no elements gigo';
lives_and { is scalar($p->elements), 0 } 'scalar context no elements';
@e = $p->nodes;
is scalar(@e), 0, 'no nodes 0 gigo';
lives_and { is scalar($p->nodes), 0 } 'scalar context no nodes';
@e = $p->relationships;
is scalar(@e), 0, 'no relationships 0 gigo';
lives_and { is scalar($p->relationships), 0 } 'scalar context no relationships';


done_testing;

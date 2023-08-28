#!perl
use strict;
use warnings;
use lib qw(lib);

use Test::More 0.88;
use Test::Warnings;

plan tests => 9 + 1;


require_ok 'Neo4j::Types';
ok $INC{'Neo4j/Types.pm'}, 'use types';
ok $INC{'Neo4j/Types/ByteArray.pm'}, 'use byte array';
ok $INC{'Neo4j/Types/DateTime.pm'}, 'use node';
ok $INC{'Neo4j/Types/Duration.pm'}, 'use node';
ok $INC{'Neo4j/Types/Node.pm'}, 'use node';
ok $INC{'Neo4j/Types/Path.pm'}, 'use path';
ok $INC{'Neo4j/Types/Point.pm'}, 'use point';
ok $INC{'Neo4j/Types/Relationship.pm'}, 'use relationship';


done_testing;

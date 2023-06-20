Neo4j::Types
============

The [Neo4j::Types][] packages form a common Neo4j type system for Perl.
Implementations such as [Neo4j::Bolt][] and [Neo4j::Driver][] can
(if they so choose) use these packages either directly:

```perl
$node = bless $data, 'Neo4j::Types::Node';
```

Or indirectly:

```perl
$node = bless $data, 'Local::Node';

package Local::Node;
use parent 'Neo4j::Types::Node';
```

Packages in this distribution primarily define methods. They do not currently
make any particular assumptions about their internal data structures.
Insofar as this distribution offers default implementations of the methods
it defines, they are designed to work with [Neo4j::Bolt][] data structures.
But inheritors (such as `Local::Node` in the example above) are free to use
any data structure they like, provided that they override methods so as not
to change the API.

Not all [Cypher types][] have representations as packages in this
distribution. The [Neo4j::Types][] documentation offers some guidance
on implementing Cypher types in Perl.

Feedback and pull requests are welcome. However, for proposed changes to this
distribution, interoperability concerns for its existing users (particularly
users of [Neo4j::Bolt][]) must be considered.

[Cypher types]: https://neo4j.com/docs/cypher-manual/5/values-and-types/


Installation
------------

The installation of [Neo4j::Types][] usually happens automatically as
part of another module's dependency chain. Released versions can also
be installed explicitly:

	cpanm Neo4j::Types

[![CPAN distribution](https://badge.fury.io/pl/Neo4j-Types.svg)](https://badge.fury.io/pl/Neo4j-Types)

To install a development version from this repository, run the following steps:

```sh
git clone https://github.com/johannessen/neo4j-types && cd neo4j-types
cpanm Dist::Zilla::PluginBundle::Author::AJNN
dzil install

# To upload a new version to CPAN (requires indexing permissions):
dzil release
```

This is a “Pure Perl” module, so you generally do not need
Dist::Zilla to contribute patches. You can simply clone the
repository and run the test suite using `prove` instead.

[Neo4j::Types]: https://metacpan.org/release/Neo4j-Types
[Neo4j::Bolt]: https://metacpan.org/release/Neo4j-Bolt
[Neo4j::Driver]: https://metacpan.org/release/Neo4j-Driver

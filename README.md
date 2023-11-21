Neo4j::Types
============

The [Neo4j::Types][] packages form a common Neo4j type system for Perl.
They represent Cypher types for use with the Neo4j graph database system.

The Perl modules in this distribution specify an interface which
conformant Perl drivers for Neo4j should implement. See the
[implementor notes][] for detailed guidance. Many of the decisions
that shaped this specification were made by the maintainer at some
point in the past, but we are always happy to open topics up again.
Even if it’s been months or years since the spec was written –
if you disagree with it, then let’s just talk about it.
Obviously, for any proposed changes, interoperability concerns for
existing users must be considered. But my door is always open.

Current Neo4j::Types users include:

* [Neo4j::Bolt][]
* [Neo4j::Driver][]

Installation
------------

The installation of [Neo4j::Types][] usually happens automatically as
part of another module’s dependency chain. Released versions can also
be installed explicitly:

	cpanm Neo4j::Types

[![CPAN distribution](https://badge.fury.io/pl/Neo4j-Types.svg)](https://badge.fury.io/pl/Neo4j-Types)

To install a development version from this repository, run the following steps:

```sh
git clone https://github.com/johannessen/neo4j-types && cd neo4j-types
cpanm Dist::Zilla::PluginBundle::Author::AJNN
dzil install
```

[![Build and Test](https://github.com/johannessen/neo4j-types/actions/workflows/build-and-test.yaml/badge.svg)](https://github.com/johannessen/neo4j-types/actions/workflows/build-and-test.yaml)


Contributing
------------

Thank you for considering contributing to this distribution.
If you have any questions or difficulties, please feel free
to get in touch with the maintainer, [Arne Johannessen][],
through the GitHub “issues” feature (preferred), or by
emailing him directly.

Feedback, issue reports, and patches are welcome. You can submit
patches by forking the repository, pushing your changes to a new
branch in your fork, and then submitting a pull request.
If your patch ends up being included in the distribution,
you will be identified as a contributor (unless you ask not to be).

The targeted minimum version of Perl for version 2 of this software is v5.16.
In practice, Perl versions as old as v5.10.1 are currently supported as well.
However, the intention is to raise this to v5.14 soon.
Issues and patches aimed at versions older than v5.16
are welcome, but will be treated with low priority.

This distribution is managed with [Dist::Zilla][]. Many of the usual
files you might expect are not included in the repository, but are
generated at release time instead. However, this is a “Pure Perl” module,
so you generally do not need Dist::Zilla to contribute patches.
You can simply clone the repository and run the test suite using
`prove` instead.

```sh
git clone https://github.com/johannessen/neo4j-types && cd neo4j-types
prove

# Set up a self-contained, Makefile-free, Dist::Zilla-free
# work environment inside the git working directory:
cpanm Neo4j::Types --installdeps -L ext
prove -Iext/lib/perl5
perl -Ilib -Iext/lib/perl5 -mNeo4j::Types -E '...'

# To upload a new version to CPAN:
# (requires Dist::Zilla and indexing permissions)
dzil release
```

[Neo4j::Types]: https://metacpan.org/release/Neo4j-Types
[Neo4j::Bolt]: https://metacpan.org/release/Neo4j-Bolt
[Neo4j::Driver]: https://metacpan.org/release/Neo4j-Driver
[implementor notes]: https://github.com/johannessen/neo4j-types/blob/main/lib/Neo4j/Types/ImplementorNotes.pod

[Dist::Zilla]: https://metacpan.org/dist/Dist-Zilla
[Arne Johannessen]: https://arne.johannessen.de/

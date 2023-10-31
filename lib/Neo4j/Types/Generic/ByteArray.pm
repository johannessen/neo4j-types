use v5.10.1;
use strict;
use warnings;

package Neo4j::Types::Generic::ByteArray;
# ABSTRACT: Generic representation of a Neo4j byte array


use parent 'Neo4j::Types::ByteArray';

use Encode ();


sub new {
	# uncoverable pod - see Generic.pod
	my ($class, $bytes) = @_;
	
	$bytes .= '';
	Encode::_utf8_off $bytes;
	return bless \$bytes, __PACKAGE__;
}


sub as_string { ${$_[0]} }


1;

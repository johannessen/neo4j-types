use v5.10.1;
use strict;
use warnings;

package Neo4j::Types::Generic::Duration;
# ABSTRACT: Generic representation of a Neo4j temporal duration value


use parent 'Neo4j::Types::Duration';


sub new {
	my ($class, $params) = @_;
	
	$params->{$_} ||= 0 for qw( months days seconds nanoseconds );
	return bless $params, __PACKAGE__;
}


sub months { shift->{months} }
sub days { shift->{days} }
sub seconds { shift->{seconds} }
sub nanoseconds { shift->{nanoseconds} }


1;

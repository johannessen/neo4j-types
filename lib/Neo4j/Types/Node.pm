use v5.10.1;
use strict;
use warnings;

package Neo4j::Types::Node;
# ABSTRACT: Describes a node from a Neo4j graph



sub get {
	my ($self, $property) = @_;
	
	return $self->{properties}->{$property};
}


sub id {
	my ($self) = @_;
	
	return $self->{id};
}


sub labels {
	my ($self) = @_;
	
	return my @empty unless defined $self->{labels};
	return @{$self->{labels}};
}


sub properties {
	my ($self) = @_;
	
	return {} unless defined $self->{properties};
	return $self->{properties};
}


1;

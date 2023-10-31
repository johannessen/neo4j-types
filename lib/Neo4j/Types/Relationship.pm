use v5.10.1;
use strict;
use warnings;

package Neo4j::Types::Relationship;
# ABSTRACT: Describes a relationship from a Neo4j graph



sub get {
	my ($self, $property) = @_;
	
	return $self->{properties}->{$property};
}


sub id {
	my ($self) = @_;
	
	return $self->{id};
}


sub type {
	my ($self) = @_;
	
	return $self->{type};
}


sub start_id {
	my ($self) = @_;
	
	return $self->{start};
}


sub end_id {
	my ($self) = @_;
	
	return $self->{end};
}


sub properties {
	my ($self) = @_;
	
	return {} unless defined $self->{properties};
	return $self->{properties};
}


1;

# Pragmas.
use strict;
use warnings;

# Modules.
use Encode qw(decode_utf8);
use Map::Tube::Dnipropetrovsk;
use Test::More tests => 3;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Dnipropetrovsk->new;
my $ret = $map->get_node_by_name('foo');
is($ret, undef, 'Get node for bad node name.');

# Test.
my @ret = sort map { $_->id } $map->get_node_by_name(decode_utf8('Комунарівська'));
is_deeply(
	\@ret,
	[
		'1-01',
	],
	"Get all nodes for 'Комунарівська'.",
);

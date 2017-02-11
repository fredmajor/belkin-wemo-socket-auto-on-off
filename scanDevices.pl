use 5.010;
use strict;
use warnings;
use utf8;
use WebService::Belkin::WeMo::Device;
use WebService::Belkin::WeMo::Discover;

my $dbFile=$ENV{"HOME"}. "/usr/belkin.db";
print "dbfile=$dbFile\n";

my $wemoDiscover = WebService::Belkin::WeMo::Discover->new();

# Perform UPNP Search for all Belkin WeMo switches
my $discovered = $wemoDiscover->search();

# Save device info to make API calls faster - eliminates search on startup
$wemoDiscover->save($dbFile);

# Load from storage
$discovered = $wemoDiscover->load($dbFile);

foreach my $ip (keys %{$discovered}) {
	print "IP = $ip\n";
	print "Friendly Name = $discovered->{$ip}->{'name'}\n"
}


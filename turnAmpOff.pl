use 5.010;
use strict;
use warnings;
use utf8;
use WebService::Belkin::WeMo::Device;
use WebService::Belkin::WeMo::Discover;


my $dbFile=$ENV{"HOME"}. "/usr/belkin.db";
my $dev="amp";

say "dbfile=".$dbFile;

my $wemo = WebService::Belkin::WeMo::Device->new(name => $dev, db => $dbFile);
say "On/Off=" . $wemo->isSwitchOn();
$wemo->off();
say $dev . "turned off";

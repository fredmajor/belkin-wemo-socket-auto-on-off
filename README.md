# belkin-wemo-socket-auto-on-off
Short scripts to automatically enable/disable Belkin Wemo electric socket based on the state of the sound card.


This assumes you use perlbrew and perl 5.16.0 is installed.
Required Perl packages:
	`cpanm  "WebService::Belkin::WeMo::Discover"`

	`cpanm  "WebService::Belkin::WeMo::Device"`


Also make sure to create the required file before the first usage:
`mkdir -p "~/usr"`
`touch ~/usr/belkin.db`


Before using the actual turn on/off funcionality, you need to scan for available WEMO devices first. 
In my case the device I am interested in is called simply "amp".

The main file containing the logic is `monitorSoundcard.sh`

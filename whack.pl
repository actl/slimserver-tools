#!/usr/bin/perl -w

my %convertlist =	(
	"SliMP3::Buttons" =>			"Slim::Buttons",
	"SliMP3::Animation" =>		"Slim::Display::Animation",
	"SliMP3::CLI" =>				"Slim::Control::CLI",
	"SliMP3::Command" =>			"Slim::Control::Command",
	"SliMP3::Stdio" =>			"Slim::Control::Stdio",
	"SliMP3::Animation" =>		"Slim::Display::Animation",
	"SliMP3::Display" =>			"Slim::Display::Display",
	"SliMP3::AIFF" =>			"Slim::Formats::AIFF",
	"SliMP3::Movie" =>			"Slim::Formats::Movie",
	"SliMP3::Ogg" =>				"Slim::Formats::Ogg",
	"SliMP3::Parse" =>			"Slim::Formats::Parse",
	"SliMP3::Wav" =>				"Slim::Formats::Wav",
	"SliMP3::Decoder" =>			"Slim::Hardware::Decoder",
	"SliMP3::IR" =>				"Slim::Hardware::IR",
	"SliMP3::VFD" =>				"Slim::Hardware::VFD",
	"SliMP3::i2c" =>				"Slim::Hardware::i2c",
	"SliMP3::mas3507d" =>		"Slim::Hardware::mas3507d",
	"SliMP3::mas35x9" =>			"Slim::Hardware::mas35x9",
	"SliMP3::Info" =>			"Slim::Music::Info",
	"SliMP3::MoodLogic" =>		"Slim::Music::MoodLogic",
	"SliMP3::MusicFolderScan" =>	"Slim::Music::MusicFolderScan",
	"SliMP3::iTunes" =>			"Slim::Music::iTunes",
	"SliMP3::mDNS" =>			"Slim::Networking::mDNS",
	"SliMP3::Client" =>			"Slim::Player::Client",
	"SliMP3::Control" =>			"Slim::Player::Control",
	"SliMP3::Discovery" =>		"Slim::Networking::Discovery",
	"SliMP3::Playlist" =>		"Slim::Player::Playlist",
	"SliMP3::Protocol" =>		"Slim::Networking::Protocol",
	"SliMP3::Stream" =>			"Slim::Networking::Stream",
	"SliMP3::Misc" =>			"Slim::Utils::Misc",
	"SliMP3::OSDetect" =>		"Slim::Utils::OSDetect",
	"SliMP3::Prefs" =>			"Slim::Utils::Prefs",
	"SliMP3::Scan" =>			"Slim::Utils::Scan",
	"SliMP3::Scheduler" =>		"Slim::Utils::Scheduler",
	"SliMP3::Strings" =>			"Slim::Utils::Strings",
	"SliMP3::Timers" =>			"Slim::Utils::Timers",
	"SliMP3::HTTP" =>			"Slim::Web::HTTP",
	"SliMP3::History" =>			"Slim::Web::History",
	"SliMP3::Olson" =>			"Slim::Web::Olson",
	"SliMP3::Pages" =>			"Slim::Web::Pages",
	"SliMP3::RemoteStream" =>	"Slim::Web::RemoteStream",
	"SliMP3::Setup" =>			"Slim::Web::Setup"
	);


foreach my $file (@ARGV) {
	rename ($file, $file . ".old");
	open(FILE, $file . ".old") or die "can't open $file";
	open(OUTFILE, ">$file");
	while ($line = <FILE>) {	
		foreach my $tag (keys %convertlist) {
			$line =~ s/$tag/$convertlist{$tag}/ge;		
		}
		print OUTFILE $line;
	}
	close FILE;
	close OUTFILE;
}
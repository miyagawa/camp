package Camp::Command::Version;
use strict;
use warnings;
use parent qw(Camp::Command);

sub run {
    my($self, $cmd) = @_;
    print "camp $Camp::VERSION\n";
}

1;

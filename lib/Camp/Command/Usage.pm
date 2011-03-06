package Camp::Command::Usage;
use strict;
use warnings;
use parent qw(Camp::Command);

sub run {
    my($self, $cmd) = @_;

    my $usage = "Usage: camp COMMAND [OPTIONS]\n\n";
    $usage .= "Unknown command: $cmd\n\n" if $cmd;
    $usage .= "Type `camp help` to see the list of commands\n";

    die $usage;
}

1;

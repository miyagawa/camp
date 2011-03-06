package Camp::Command::Help;
use strict;
use warnings;
use parent qw(Camp::Command);

sub COLUMN() { 12 }

sub run {
    my($self, $cmd) = @_;

    if ($cmd) {
        my $command = Camp::CLI->command($cmd);
        return $command->help if $command;
    }

    my $camp = Camp->new;
    $camp->load_plugins;

    print <<HELP;
Usage: camp COMMAND [OPTIONS]

Options:
  -h, --help           Show help
  -v, --version        Show program's version

Available commands:
  install              Install distributions
  uninstall            Uninstall distributions
  upgrade              Upgrade all distributions
  info                 Show the information about distributions
  scandeps             Scan and show the depednencies tree
HELP
}

1;

package Camp::CLI;
use strict;
use warnings;
use Getopt::Long ();

use Camp;

sub run {
    my($class, @args) = @_;

    # global options
    my %options = (
        verbose => 0,
        quiet   => 0,
        color   => 1,
    );

    Getopt::Long::Configure("no_ignore_case", "pass_through");
    Getopt::Long::GetOptionsFromArray(
        \@args,
        "h|help"    => \$options{help},
        "v|version" => \$options{version},
    );

    unshift @args, 'help' if $options{help};
    @args = ("version")   if $options{version};

    my $cmd = (@args && $args[0] =~ /^[a-z]/) ? shift(@args) : "usage";
    $cmd = "install" if index("index", $cmd) == 0; # :)

    my $command = $class->command($cmd);
    if ($command) {
        $command->new(\%options)->run(@args);
    } else {
        require Camp::Command::Usage;
        Camp::Command::Usage->new(\%options)->run($cmd);
    }
}

sub command {
    my($class, $cmd) = @_;

    my $command = "Camp::Command::" . ucfirst($cmd);
    if (eval "require $command; 1") {
        return $command;
    }

    die $@ if $@ && $@ !~ /Can\'t locate/;

    return;
}

1;

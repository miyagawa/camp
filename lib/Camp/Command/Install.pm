package Camp::Command::Install;
use strict;
use warnings;
use parent qw(Camp::Command);

sub run {
    my($self, @args) = @_;

    my $camp = Camp->new;
    $camp->install_modules(@args);
}

1;

__END__

=head1 NAME

CLI::Command::Install - Install modules

=head1 SYNOPSIS

  camp install Plack

=head1 OPTIONS

blah blah blah

=cut

package Camp;

use strict;
use 5.008_001;
use version 0.77; our $VERSION = qv('v0.9.0');

sub gut {
    my $self = shift;
    require Camp::Gut;
    Camp::Gut->new(quiet => 1, @_);
}

sub new {
    my($class, @args) = @_;
    my $self = bless {}, $class;
    $self->init;
    $self;
}

sub init {}

sub load_plugins {}

sub install_modules {
    my($self, @args) = @_;

    my $gut = $self->gut;
    $gut->parse_options(@args);
    $gut->doit;
}

1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Camp - CPAN Suite (aka cpanminus plus)

=head1 SYNOPSIS

  camp install Modules

=head1 INSTALLATION

  curl -L cpanmin.us | perl - Camp

=head1 DESCRIPTION

Camp is a fork of cpanminus with more awesomeness.

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

=head1 COPYRIGHT

Copyright 2011- Tatsuhiko Miyagawa

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<cpanminus>

=cut

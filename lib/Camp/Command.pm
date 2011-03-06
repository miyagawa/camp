package Camp::Command;
use strict;
use warnings;

sub new {
    my($class, $options) = @_;
    bless { options => $options }, $class;
}

sub cmd {
    my $self = shift;
    my $name = ref $self;
    $name =~ s/.*:://;
    return lc $name;
}

sub help {
    my $class = shift;
    require Pod::Usage;
    Pod::Usage::pod2usage({ -exitval => 0, -input => $class->inc_file });
}

sub inc_file {
    my $class = shift;

    my $file = ref $class || $class;
    $file =~ s!::!/!g;

    return $INC{"$file.pm"};
}

1;

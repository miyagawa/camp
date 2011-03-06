use inc::Module::Install;
all_from 'lib/Camp.pm';
readme_from('lib/Camp.pm');

requires 'LWP::UserAgent', 5.802;
requires 'Try::Tiny';
requires 'parent';
requires 'version', 0.77;
requires 'Pod::Usage';

requires 'Parse::CPAN::Meta';
requires 'local::lib';
requires 'Module::Metadata';
requires 'CPAN::DistnameInfo';
requires 'Module::CoreList';
requires 'JSON';
requires 'YAML';
requires 'Archive::Zip';
requires 'Compress::Zlib';

install_script 'bin/camp';

build_requires 'Test::More', 0.88;
test_requires 'Test::Requires';

auto_set_repository();
WriteAll;

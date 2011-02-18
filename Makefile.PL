
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'This module is a subclass of Digest using the Crypt::PBKDF2 algorithm.',
  'AUTHOR' => 'Amiri Barksdale <abarksdale@campusexplorer.com>',
  'BUILD_REQUIRES' => {
    'Scalar::Util' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Digest-PBKDF2',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Digest::PBKDF2',
  'PREREQ_PM' => {
    'Crypt::PBKDF2' => '0.110461',
    'Digest::base' => '0',
    'parent' => '0'
  },
  'VERSION' => '0.004',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




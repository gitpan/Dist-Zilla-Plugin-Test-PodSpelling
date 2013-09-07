
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Author tests for POD spelling",
  "AUTHOR" => "Caleb Cushing <xenoterracide\@gmail.com>, Marcel Gruenauer <hanekomu\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-Test-PodSpelling",
  "EXE_FILES" => [],
  "LICENSE" => "artistic_2",
  "NAME" => "Dist::Zilla::Plugin::Test::PodSpelling",
  "PREREQ_PM" => {
    "Dist::Zilla::Plugin::InlineFiles" => 0,
    "Dist::Zilla::Role::FileFinderUser" => 0,
    "Dist::Zilla::Role::TextTemplate" => 0,
    "Moose" => 0,
    "Test::Spelling" => "0.12",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Carp" => 0,
    "Cwd" => 0,
    "Dist::Zilla::Tester" => 0,
    "English" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Path::Class" => 0,
    "Scalar::Util" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.94",
    "Test::Requires" => 0,
    "Test::Script" => "1.05",
    "Test::Tester" => 0
  },
  "VERSION" => "2.006001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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




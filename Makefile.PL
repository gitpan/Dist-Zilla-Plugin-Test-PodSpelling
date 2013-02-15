
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Author tests for POD spelling",
  "AUTHOR" => "Caleb Cushing <xenoterracide\@gmail.com>, Randy Stauner <randy\@magnificent-tears.com>, Marcel Gruenauer <marcel\@cpan.org>, Harley Pig <harleypig\@gmail.com>",
  "BUILD_REQUIRES" => {
    "Carp" => 0,
    "Cwd" => 0,
    "Dist::Zilla::Tester" => 0,
    "English" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Path::Class" => 0,
    "Scalar::Util" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.94",
    "Test::Script" => "1.05",
    "Test::Spelling" => 0,
    "Test::Tester" => 0
  },
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
    "Pod::Wordlist::hanekomu" => 0,
    "Test::Spelling" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "2.004000",
  "test" => {
    "TESTS" => "t/*.t"
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




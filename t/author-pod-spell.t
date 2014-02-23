
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling bootstrapped version
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
wordlist
Caleb
Cushing
xenoterracide
Marcel
Gruenauer
hanekomu
Alexandr
Ciornii
alexchorny
Breno
de
Oliveira
garu
David
Golden
dagolden
Harley
Pig
harleypig
Karen
Etheridge
ether
Randy
Stauner
rwstauner
lib
Dist
Zilla
Plugin
PodSpellingTests
Test
PodSpelling

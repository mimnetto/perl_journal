#!/usr/bin/perl
# Perl Program Journal Program
# Michelle Netto
# Prompts user to record a Journal Entry and appends it to journal.txt


use 5.8.8;
use strict;
use Time::localtime;

sub todaysTime {
  my $today = localtime; #assigns date
  return sprintf( "%02d-%02d-%04d", #numeric format
                   $today->mon + 1, $today->mday, $today->year + 1900, ); #formats date to mmddyyyy
}

print 'Hello I am your personal journal. Today is ' . todaysTime() . '.'. "\n \n"; #program's greating

{
    local( $| ) = ( 1 );
    print "Please press the <Enter> or <Return> key to continue. "; #prompt user to continue - just a formality
    my $resp = <STDIN>."\n";
}

my $file = 'journal.txt'; #input destination
open my $fh, '>>', $file or die $!; #open file or kills it if error

print "\n".'Please give your entry a title for ' . todaysTime() . '.'."\n"; #asks user to title the entry
  my $todayEntry = "\n\t Date: ".'' . todaysTime() . ' '."\nTitle: ".<STDIN>."\n" ; #formats and adds date
    chomp $todayEntry; #removes trailing characters
    print "\nWhat is your mood today?\n";
  my $todayMood = 'Your mode was: '.<STDIN>."\n" ; #formats mood
    chomp $todayMood;
    print $fh $todayEntry.$todayMood; #prints to fh
print "\nNow please tell me about your day.\nWhen you are done please enter an empty line to exit.\n";#prompts user and fives intructions
  while (<STDIN>) {
    last if /^$/; #break out with blank line
    print $fh $_;#prints user input to fh
}

print "Thank you! See you tomorrow!\n";

exit;

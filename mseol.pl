#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper qw(Dumper);

my ($basename, $filesnum) = @ARGV;
print Dumper \@ARGV;

print "hello \n";

my @lines = <>;
#print @lines;
print "$lines[1]\n";

open FILEOUT, ">" , $basename or die $!;
foreach my $line (@lines)
{
  # Use substitute regex to replace "dangerous"
  # with the word "safe"
 #$line =~ s/dangerous/safe/gi;
 $line =~ s/\n$/\r\n/;
 print FILEOUT $line;
}

close FILEOUT;





=begin
open DATAOUT, ">$data_file" or die "can't open $data_file $!";

# Start a foreach loop assigning
# each line to $line, in turn.
foreach my $line (@array_of_data)
   {
   # Print each line in turn to the new filehandle DATAOUT
   print DATAOUT "$line";
   }
# Close the new file.
close (DATAOUT)


#open TOMS, '>', $basename .  ".srt" or die $!;
#open(FILE, $basename .  ".srt");
#perl -i.bak -pe 's/\n$/\r\n/' <TOMS>;
#close(TOMS);
=cut

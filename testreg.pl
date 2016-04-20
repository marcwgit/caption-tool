#! perl
use strict;
use warnings;

my $text = <<EOT;
The quick brown fox
jumps over the unfortunate dog.
EOT

my %searches  = ( 'A'         =>     'fox.+?jumps',
                  'B'         => '(?s)fox.+?jumps' );

my %functions = ( '1. no'     => \&no_mod,
                  '2. qr//'   => \&qr_mod,
                  '3. late'   => \&late_mod,
                  '4. inline' => \&inline_mod );

foreach my $search_key (sort keys %searches)
{
    print "\nSearching on '$searches{$search_key}':\n\n";

    foreach my $fn_key (sort keys %functions)
    {
        printf "%s%-9s 's' modifier: %s\n",
                $search_key,
                $fn_key,
                $functions{$fn_key}->($text, $searches{$search_key}) ?
+ 'Match found' : 'No match';
    }
}

sub no_mod                              # no 's' modifier
{
    my ($string, $pattern) = @_;
    my  $regex = qr/$pattern/;

    return ($string =~ /$regex/);
}

sub qr_mod
{
    my ($string, $pattern) = @_;
    my  $regex = qr/$pattern/s;         # <= 's' modifier

    return ($string =~ /$regex/);
}

sub late_mod
{
    my ($string, $pattern) = @_;
    my  $regex = qr/$pattern/;

    return ($string =~ /$regex/s);      # <= 's' modifier
}

sub inline_mod
{
    my ($string) = @_;

    return ($string =~ /fox.+?jumps/s); # <= 's' modifier
}

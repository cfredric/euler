#!/usr/bin/perl -w
use strict;


open NAMEF, "<names.txt" or die "couldn't open names.txt: $!\n";
my $t = <NAMEF>;
$t =~ s/\"//g;
my @names = sort(split(",",$t));
my $sum = 0;
for my $n (0..@names-1){
   $sum += &score($names[$n], $n+1);
}
print "sum = $sum\n";

sub score{
   my ($name, $n) = @_;
   my @letters = split "", $name;
   my $sum = 0;
   for my $l (@letters){
      $sum += ord($l) - ord('A') + 1;
   }
   return $sum * $n;
}

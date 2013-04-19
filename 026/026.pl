#!/usr/bin/perl -w
use strict;

#the length of the repeating part of the decimal 1/m is the order of 10 in the ring Zm

my ($length, $d) = (0,0);
for my $n (2..1000){
   if(&gcd($n, 10) == 1){
      #find the length of the cycle
      if((my $l = &ord(10, $n)) > $length){
         $length = $l;
         $d = $n;
         print "found longer ($l): $d\n";
      }
   }
}

sub gcd{
   my ($a, $b) = @_;
   if ($a < $b){ return &gcd($b, $a); }
   my $x = $a % $b;
   if($x == 0){
      return $b;
   }else{
      return &gcd($b, $x);
   }
}


sub ord{ #compute the order of an element in Zm
   my ($x, $m) = @_;
   my $size = scalar(&units($m));
   for(1..$size){ #minimum order is 1 (for x = 1), max is |units| for a root
      return $_ if(&exp($x, $_, $m) == 1);
   }
}

sub units{  #find the group of units for a given Zn
   my ($n) = @_;
   my @units;
   for my $i (1..$n-1){
      if(&gcd($n, $i) == 1){  #an element is a unit iff it has no common factors with the modulus
         push(@units, $i);
      }
   }
   return @units;
}

sub exp{ #compute $a ** $exp (mod $mod)
   my ($a, $exp, $mod) = @_;
   $a = &canon($a, $mod);                 #reduce
   return 1 if($exp <= 0);                #base case
   if($exp % 2 == 0){                     #even exponent
      my $q = &exp($a, $exp/2, $mod);
      return ($q*$q % $mod);
   }else{                                 #odd exponent
      my $q = &exp($a, $exp-1, $mod);
      return ($q*$a) % $mod;
   }
}

sub canon{     #return the "canonical" representation of a number, modulo some modulus $mod.
   my ($x, $mod) = @_;
   $x += $mod while($x < 0);     #deal with negatives
   $x %= $mod;                   #reduce
   return $x;
}


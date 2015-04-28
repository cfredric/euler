#!/usr/bin/perl -w

sub isPalindromic($){
    my $n = shift;
    my $b = sprintf "%b", $n;
    if(reverse($n) eq $n and reverse($b) eq $b){
        return $n;
    }
    return 0;
}

my $u = 1000000;
my $sum = 0;
for(1..$u){
   $sum += isPalindromic($_); 
}

printf "Sum under $u: $sum\n";

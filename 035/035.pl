#!/usr/bin/perl -w


sub isPrime($){
    my $n = shift;
    return 0 if ($n % 2 == 0 and $n != 2);
    my $i = 3;
    while($i <= sqrt($n)){
        return 0 if($n % $i == 0);
        $i += 2;
    }
    return 1;
}

sub rotate($){
    my $num = shift;
    my ($h, $t) = $num =~ m/^(\d)(\d*)$/;
    return $t . $h;
}

sub isCircularPrime($){
    my $num = shift;
    my $l = length($num);
    my $circularPrime = 1;
    for (1..$l){
        $num = rotate($num);
        unless(isPrime($num)){
            $circularPrime = 0;
        }
    }
    
    if ($circularPrime){
        print "Found one! " . $num . "\n";
        return 1;
    }
    return 0;
}

my $sum = 0;
my $u = 1000000;
for(2..$u){
    $sum += isCircularPrime($_);
}
print "Found $sum circular primes below $u.\n";

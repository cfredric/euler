import std.stdio;
import std.string;
import std.conv;
import std.string;

class Fraction {
    uint num, denom;
    this(uint num, uint denom){
        this.num = num;
        this.denom = denom;
    }

    override string toString(){
        return format("%d / %d", num, denom);
    }
    
    Fraction reduce(){
        auto g = gcd(num, denom);
        return new Fraction(num/g, denom/g);
    }

    uint gcd(uint a, uint b){
        while( b != 0){
            auto t = b;
            b = a % b;
            a = t;
        }
        return a;
    }

    Fraction cancel(){
        auto ac = to!string(num).dup;
        auto bc = to!string(denom).dup;
        for(int i = 0; i < ac.length; i++){
            for(int j = 0; j < bc.length; j++){
                if(ac[i] == bc[j]){
                    ac[i] = ' ';
                    bc[j] = ' ';
                }
            }
        }

        auto as = to!string(ac);
        auto bs = to!string(bc);
        auto ta = translate(as, ['a':'a'], " ");
        auto tb = translate(bs, ['a':'a'], " ");
        uint ia;
        uint ib;
        if(ta == "" || tb == ""){
            ia = 999;
            ib = 999;
        }else{ 
            ia = to!int(ta);
            ib = to!int(tb);
        }

        if(ib == 0)
            ib = 999;
        return new Fraction(ia, ib);
    }

    bool equals(Fraction f){
        //writef("%d / %d =? %d / %d\n", this.num, this.denom, f.num, f.denom);
        return this.num == f.num && this.denom == f.denom;
    }
}

unittest {
    writeln("running unittests...");
    auto f = new Fraction(5,15);
    auto g = f.reduce();
    assert(g.num == 1 && g.denom == 3);


    f = new Fraction(49, 98);
    f = f.cancel();
    assert(f.num == 4 && f.denom == 8);
    f = f.reduce();
    assert(f.num == 1 && f.denom == 2);

    f = new Fraction(1,2);
    g = new Fraction(2,4);
    assert(!f.equals(g), "1/2 == 2/4 should be false");
    assert(g.reduce().equals(f), "1/2 and 2/4 should reduce to equal fractions");

    writeln("done running unittests");
}


void main(){
    uint pnum = 1;
    uint pdenom = 1;
    for(int d = 11; d < 100; d++){
        for(int n = 10; n < d; n++){
            if(n != d && !(n %10 ==0 && d %10 ==0)){
                auto v = new Fraction(n,d);
                auto vr = v.reduce();
                auto vc = v.cancel();
                if(!vr.equals(v) && !vc.equals(v)) {
                    if(vr.equals(vc.reduce())){
                        writeln(v);
                        pnum *= vr.num;
                        pdenom *= vr.denom;
                    }
                }
            }
        }
    }

    //get denominator of product of fractions in reduced form
    auto ans = new Fraction(pnum, pdenom).reduce();
    write("answer --> "); writeln(ans.denom);
}

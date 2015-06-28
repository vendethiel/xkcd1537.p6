#!/usr/bin/env perl6
my &add = &infix:<+>;

multi sub infix:<+>(Int $n, Str $n2) {
  add($n, $n2).Str;
}

multi sub infix:<+>(Str $n, @ary where !@ary) {
  "[$n]";
}

multi sub infix:</>(Int $n, 0) {
  NaN;
}

class NaP {};

multi sub infix:<+>(NaN, 2) {
  NaP.new
}

multi sub infix:<+>("", "") {
  '"+"'
}

multi sub infix:<+>(Int @n, Int $n) {
  so none(@n) == $n
}

say 2 + "2";
say "2" + [];
say 2 / 0;
say (2/0) + 2;
say "" + "";

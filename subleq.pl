#!/usr/bin/env perl
# Author: Richard James Howe
# License: The Unlicense
# Project: N-bit SUBLEQ OISC
# Repo: <https:github.com/howerj/subleq-perl>
# Email: <mailto:howe.r.j.89@gmail.com>
#
# See <https://github.com/howerj/subleq> for more information
# and images.
use strict;
use warnings;
die "Usage: $0 bits file.dec\n" if (($#ARGV + 1) < 1);
my $bits = shift;
die "Invalid bit range (8-32 inclusive)\n" if ($bits < 8 || $bits > 32);
my $high = 1 << ($bits - 1);
my $mask = (1 << $bits) - 1;
my $size = 65536;
my @m = ();
for (my $file = shift; defined($file); $file = shift) { # LOAD ALL FILES
	open (my $fh, $file) or die "Unable to open '$file' for reading\n";
	while (<$fh>) { chomp; push @m, split; }
	close($fh);
}
for (my $c = 0; $c < $size; $c++) { # CORRECT IMAGE
	$m[$c] = 0 if (!defined $m[$c]);
	$m[$c] = ($mask + $m[$c]) + 1 if ($m[$c] < 0);
}
for (my $pc = 0; $pc < @m && $pc != $mask;) { # SUBLEQ VM
	my ($a, $b, $c) = @m[$pc++,$pc++,$pc++];
	if ($a == $mask) {
		my $ch = getc;
		$m[$b] = defined($ch) ? ord($ch) : $mask;
	} elsif ($b == $mask) {
		print chr($m[$a]);
		STDOUT->flush();
	} else {
		my $r = $m[$b] - $m[$a];
		$r &= $mask;
		$m[$b] = $r;
		if ($r == 0 || $r & $high) {
			$pc = $c;
		}
	}
}

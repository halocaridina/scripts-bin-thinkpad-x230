#!/usr/bin/perl -w
#
# Author: Ralf Schwarz <ralf@schwarz.ath.cx>
#         February 20th 2006
#
# returns 0 if host is listening on specified tcp port
#

use strict;
use Socket;

# set time until connection attempt times out
my $timeout = 3;

if ($#ARGV != 1) {
  print "usage: is_tcp_port_listening hostname portnumber\n";
  exit 2;
}

my $hostname = $ARGV[0];
my $portnumber = $ARGV[1];
my $host = shift || $hostname;
my $port = shift || $portnumber;
my $proto = getprotobyname('tcp');
my $iaddr = inet_aton($host);
my $paddr = sockaddr_in($port, $iaddr);

socket(SOCKET, PF_INET, SOCK_STREAM, $proto) || die "socket: $!";

eval {
  local $SIG{ALRM} = sub { die "timeout" };
  alarm($timeout);
  connect(SOCKET, $paddr) || error();
  alarm(0);
};

if ($@) {
  close SOCKET || die "close: $!";
  print "$hostname is NOT listening on tcp port $portnumber.\n";
  exit 1;
}
else {
  close SOCKET || die "close: $!";
  print "$hostname is listening on tcp port $portnumber.\n";
  exit 0;
}

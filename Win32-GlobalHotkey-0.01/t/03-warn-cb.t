use ExtUtils::testlib;

use strict;
use warnings;

use Win32::GlobalHotkey;

use Test::More tests => 1;


my $hk = Win32::GlobalHotkey->new( warn => sub { die 'test: ' . $_[0] } );


# warn - Event loop started
eval {
	$hk->StartEventLoop;
	$hk->PrepareHotkey( vkey => Win32::GlobalHotkey::KEY_ADD, modifier =>  Win32::GlobalHotkey::MOD_ALT, cb => sub{ print 'ALT-B', "\n" } );
	$hk->StopEventLoop;
};

if ( substr( $@, 0, 4 ) eq 'test' ) {
	pass( 'standard' );
} else {
	fail( 'standard' );
}



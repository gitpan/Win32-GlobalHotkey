use ExtUtils::testlib;

use strict;
use warnings;

use Win32::GlobalHotkey;

use Test::More tests => 1;

eval {
	my $hk = Win32::GlobalHotkey->new;
	$hk->PrepareHotkey( vkey => Win32::GlobalHotkey::KEY_C, modifier =>  Win32::GlobalHotkey::MOD_ALT, cb => sub{ print 'ALT-C', "\n" } );
	$hk->PrepareHotkey( vkey => Win32::GlobalHotkey::KEY_Q, modifier =>  Win32::GlobalHotkey::MOD_CONTROL |  Win32::GlobalHotkey::MOD_ALT, cb => sub{ print 'CONTROL-ALT-Q', "\n" } );
	$hk->StartEventLoop;
	sleep 1;
	$hk->StopEventLoop;
	sleep 1;
};

if ( $@ ) {
	fail 'standard';	
} else {
	pass 'standard';
}

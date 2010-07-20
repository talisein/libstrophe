This is strophe, our XMPP client library.

Our goals are:

    * usable quickly
    * well documented
    * reliable

== Build Instructions ==

	./bootstrap.sh
	./configure.sh [options]
	make
	make install

== Requirements ==

Libstrophe requires libresolv on UNIX systems. Make sure you include -lresolv
if you are compiling by hand.

It also uses expat for XML processing, but a current copy is included in the
expat/ directory of the SVN checkout



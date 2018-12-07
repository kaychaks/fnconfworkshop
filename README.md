# fnconfworkshop
Samples and other material for the Functional Conf workshop


# Preparing for the workshop

Participants should bring a laptop with a recent (post 7.7.11) install of SWI-Prolog (http://swi-prolog.org).Latest as of this moment is 7.7.23

Windows users - just download and install using the installer from the website.

Linux/mac:

I recommend using swivm to install https://github.com/fnogatz/swivm

Instructions:

Install release 0.5.0 of swivm https://github.com/fnogatz/swivm

Then use it to install swi-prolog 7.7.23 with:

swivm install 7.7.23

swivm use 7.7.23

swipl

This launches SWI-Prolog and should leave you at a ?- prompt.

?-check_installation. (dont type ?-, do type period)

This tests your installation.

SWI-Prolog is 'batteries included' and hence has lots of dependencies. Those not needed canfail.

These libs aren't needed and can fail:

    jpl (java interop),
    odbc (database connect),
    readline (if you have readline OR editline you're good),
    uuid,
    zlib (zip encoding),
    ssl


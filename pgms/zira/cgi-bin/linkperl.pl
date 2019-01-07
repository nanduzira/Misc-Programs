#!/usr/bin/perl -w
use CGI qw(:standard -debug);
print "Content-type:text/html\n\n";
print "<html>\n";
print "<head><title>Perl Programming</title></head>";
print "<body>Welcome ",param(name)," of ",param(dept)," batch ",param(batch), "</body>";
print "</html>";

#!/usr/bin/perl -w
use CGI":standard";
print header;
print start_html("CG1-Perl form,using CGI.Pm");
$cgi=CGI->new();
my($reg,$no)=(param("reg"),param("no"));
print "<h4>Details:<br/>";
print "<b>REG NO:</b> $reg<br/>";
print "<b>AD NO:</b> $no<br/>";
print end_html;
1;





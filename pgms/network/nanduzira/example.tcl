set ns [new Simulator]

$ns color 1 Blue
$ns color 2 Red

set nr [open out.tr w]
$ns trace-all $nr

set nf [open out.nam w]
$ns namtrace-all $nf

proc finish {} {
	global ns nr nf
	$ns flush-trace
	close $nr
	close $nf
	exec nam out.nam &
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]


$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail
$ns duplex-link $n3 $n4 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n3 $n5 1Mb 10ms DropTail

set tcp [new Agent/TCP]
$tcp set class_ 1
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink
$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

set udp [new Agent/UDP]
$udp set class_ 2
$ns attach-agent $n1 $udp

set null [new Agent/Null]
$ns attach-agent $n4 $null
$ns connect $udp $null

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp

$ns duplex-link-op $n0 $n2 orient up-right
$ns duplex-link-op $n2 $n3 orient right
$ns duplex-link-op $n3 $n4 orient right-up
$ns duplex-link-op $n1 $n2 orient right-down
$ns duplex-link-op $n3 $n5 orient down-right

$ns at 0.1 "$cbr start"
$ns at 1.0 "$ftp start"
$ns at 124.0 "$ftp stop"
$ns at 124.5 "$cbr stop"

$ns at 125.0 "finish"

$ns run

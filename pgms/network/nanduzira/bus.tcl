
set ns [new Simulator]
#open tracefiles
set tracefile1 [open out.tr w]
$ns trace-all $tracefile1
#open nam file
set namfile [open out.nam w]
$ns namtrace-all $namfile
#define the finish procedure
proc finish {} {
	global ns tracefile1 namfile
	$ns flush-trace
	close $tracefile1
	close $namfile
	exec nam out.nam &
	exit 0
	} 
#create six nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#create links between the nodes
$ns duplex-link $n0 $n1 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 2Mb 10ms DropTail
$ns duplex-link $n3 $n4 2Mb 10ms DropTail

#set lan [$ns newLan "$n3 $n4 $n5" 2Mb 10ms LL Queue/DropTail MAC/Csma/Cd Channel]
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n1 $n2 orient right
$ns duplex-link-op $n2 $n3 orient right
$ns duplex-link-op $n3 $n4 orient right
#setup TCP connection
set tcp [new Agent/TCP/Newreno]
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink/DelAck]
$ns attach-agent $n4 $sink
$ns connect $tcp $sink



#set ftp over tcp connection
set ftp [new Application/FTP]
$ftp attach-agent $tcp


#scheduling the events
$ns at 0.1 "$ftp start"
$ns at 124.0 "$ftp stop"

$ns rtmodel-at 1.0  down $n1 $n2
$ns rtmodel-at 1.5 up $n1 $n2

$ns at 125.0 "finish"
$ns run


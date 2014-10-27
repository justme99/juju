<html>
<head>
<title>OpenDJ Replication status</title>
</head>
<body>
<h1>OpenDJ Replication status</h1>

<?php
$output = shell_exec('cd /opt/opendj;bin/dsreplication status -h localhost -p 5555 -I admin -w password -X -n');
echo "<pre>$output</pre>";
?>
</body>
</html>

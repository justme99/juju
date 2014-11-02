<html>
<head>
<STYLE type="text/css">
body {
	font-family: "proxima-nova";
	font-weight: 300;
	font-size: 1rem;
	background-color: #2D3437;
	background-image: url('./FR_home_image.jpg');
	background-size: cover;
	height: 100vh;
}
h1 {
	font-size: 4.64rem;
	line-height: 4.64rem;
	color: #ffffff;
	font-weight: 700;
	text-transform: uppercase;
	margin-bottom: 40px;
	text-align:center;
}
h4 {
	font-size: 1.5rem;
	line-height: 1.5rem;
	color: #ffffff;
	text-transform: uppercase;
	font-weight: 400;
	margin-bottom: 20px;
	text-align:center;
}
div.box1 {
	font-family: "proxima-nova";
	color: #ffffff;
	font-size: 1.5rem;
	background-color: #2D3437;
	width:500px;
	min-height: 10em;
	padding:10px;
	border:5px solid gray;
	margin:0px;
	margin-left: auto;
    margin-right: auto;
}
th,td {
	color: #ffffff;
	font-size: 1.2rem;
}
</STYLE>
</head>
<body>
<h1 style="margin-top: 5%;">ForgeRock OpenAM</h1>
<h4 class="lowercase">Apache Web agent</h4>

<div class="box1">
<br/>
<div style="text-align:center; font-size:1.8rem;">Welcome...</div>
</br>
<table border="0" cellspacing="5">
<?php
$headers = apache_request_headers();
$fullName = $headers['cn'];

if(!empty($fullName)){
        echo "<tr><td>Full name:</td><td>" . $fullName . "</td></tr>";
        echo "<tr><td>email:</td><td>" . $headers['mail'] . "</td></tr>";
        echo "<tr><td>uid:</td><td>" . $headers['uid'] . "</td></tr>";
        echo "<tr><td>telephoneNumber:</td><td>" . $headers['telephoneNumber'] . "</td></tr>";
        echo "<tr><td colspan='2'><div style=\"text-align:center;\"><form method=post action=";
        include("logout.txt");
        echo "><button type=submit name=logout>Logout</button></td></tr>";
} else {
        echo "<tr><td colspan='2'>I don't know who you are !!!</td></tr>";
}
?>
</table>
</div>

</body>
</html>

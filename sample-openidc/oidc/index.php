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
	width:600px;
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
<script>
/**
 * Delete a Cookie
 * @param key name of the cookie
 */
function deleteCookie(key)
{
  // Delete a cookie by setting the date of expiry to yesterday
  date = new Date();
  date.setDate(date.getDate() -1);
  document.cookie = escape(key) + '=;expires=' + date;
}
</script>
</head>
<body>
<h1 style="margin-top: 5%;">ForgeRock OpenAM</h1>
<h4>OpenID Connect - Apache - mod_auth_openidc</h4>

<p align=center>
<span style="background-color:#ffffff;font-size:1.2rem"><a href="https://github.com/pingidentity/mod_auth_openidc">Apache module: mod_auth_openidc</a></span>
</p>

<div class="box1">
<br/>
<div style="text-align:center; font-size:1.8rem;">Welcome...</div>
</br>
<table border="0" cellspacing="5">
<?php
$headers = apache_request_headers();

//print_r($headers);

$nonce = $headers['OIDC_CLAIM_nonce'];

if(!empty($nonce)){
        $logout = $headers['OIDC_CLAIM_iss'];
        $idtoken = $headers['OIDC_CLAIM_at_hash'];
        foreach ($headers as $header => $value) {
//              echo "$header --> $value <br />\n";
                if(substr($header, 0, 10)=="OIDC_CLAIM") {
                        $key = substr($header, 11);
                        if ($key != "urls" && $key != "photos") {
                                echo "<tr><td>$key:</td><td>$value</td></tr>";
                        }
                }
        }

        echo "<tr><td colspan=2 align=center><a href=\"";
        include("oidc_logout.txt");
        echo "\"><button>OIDC logout</button></a></td></tr>";
} else {
        echo "<tr><td colspan='2'>I don't know who you are !!!</td></tr>";
}
?>
</table>
</div>
<!--
<button onclick="deleteCookie('mod_auth_openidc_session')">Kill Cookie</button>
-->
</body>
</html>

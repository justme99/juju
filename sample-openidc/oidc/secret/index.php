<html>
    <body>
    <h1>Hello, <?php echo($_SERVER['REMOTE_USER']) ?></h1>
    <pre><?php print_r(apache_request_headers()); ?></pre>
    <pre>https://$OPENAM_PUBLIC_FQDN:$TOMCAT_HTTPS_PORT/$OPENAM_CONTEXT/UI/Logout</pre>
    <a href="/protected/redirect_uri?logout=https://localhost/loggedout.html">Logout</a>
  </body>
</html>


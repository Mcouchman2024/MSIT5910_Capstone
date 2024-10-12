<html>
<head>
<link rel="stylesheet" href="style1.css">
<title>
	Capstone Project by Michael Couchman (2024)
</title>
</head>
<body class="main">
<hr class="divider1">
<div id="top">
	<font color=red>Capstone Project: Master of Science in Information Technology (MSIT)<img src="logo.jpeg" width=115 style="position: fixed; top: 20px; right: 39px; border: 5px solid black; border-radius: 5%; "></font>
	<br>Couchman, M. (2024, November)<br>University of the People
</div>
<hr class="divider2">
<br>
<font style="font-family: font1;">
This project is part of the completion requirements for the Master of Science in Information Technology Degree at the University People. The connected database houses open-source intelligence (OSINT) data on targets specified by the user. It is housed for permanent storage and formatted for presentation. The purpose of the project is not for illicit use. It is strictly intended for educational purposes <br><br>The information that is presented in the table view below would be useful for tracking vulnerabilites over time, as well as other information useful for the purposes of penetration testing. For example, if a target responds to an ICMP ping, it provides the information that it may be vulnerable to certain types of denial of service (DOS) attacks. Open ports present potential areas of entry for subsequent attempts to either probe or exploit. Discovered vulnerabilities under the CVE section would provide a likely avenue of attack through a framework like Metasploit. <br></font>
<?php
  $serverName = "localhost";
  $dbUser = "root";
  $dbName = "capdata";
  $dbPass = "";
  $conn = mysqli_connect($serverName,$dbUser,$dbPass,$dbName);
  if (!$conn) {
  	die("Connection failed" . msqli_connect_error());
  }
  $sql = "SELECT * FROM osint;";
  $result = mysqli_query($conn, $sql);
  $result_check = mysqli_num_rows($result);
  echo '<br>';
  echo '<div class="items"><b><center><font style="font-family: font1;">Table view: </center></font></b></div>';
  echo '<table width=100% border=4>';
  echo '<tr style="background-color: white;"><td><b>Date</b></td><td><b>Domain Name</b></td><td><b>IP Address</b></td><td><b>Open Ports</b></td><td><b>Responds to Ping?</b></td><td><b>CVEs / Vulnerabilities</td><td><b>OS</b></td></tr></b>';
  while ($row2 = mysqli_fetch_array($result)) {
    echo '<tr>';
    echo '<td>'.$row2['Date'].'</td>';
    echo '<td>'.$row2['Domain_Name'].'</td>';
    echo '<td>'.$row2['IP'].'</td>';
    echo '<td>'.$row2['Open_Ports'].'</td>';
  
    if ($row2['Responds_ICMP'] == 'Y') { 
      echo '<td><b>'.$row2['Responds_ICMP'].'</td></b>'; 
    } 
      else { 
        echo '<td>'.$row2['Responds_ICMP'].'</td>';
      }
    echo '<td>'.$row2['CVE'].'</td>';
    echo '<td>'.$row2['OS'].'</td>';
    echo '</tr>';
  }
  echo '</table>';
?>
<?php
  $servName2 = "localhost";
  $dbUser2 = "root";
  $dbName2 = "capdata";
  $dbPass2 = "";
  $conn2 = mysqli_connect($servName2,$dbUser2,$dbPass2,$dbName2);
  if (!$conn) {
    die("Connected faile" . mysql_connect_error());
  }
  echo '<br><hr>';
  echo '<div class="items"><b><font style="font-family: font1;"><center>Detailed View: </center></font></div>';
?>
</body>
</html>

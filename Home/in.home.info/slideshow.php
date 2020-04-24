<html>
	<head>
		<title>Slideshow</title>
		<meta http-equiv="refresh" content="20">
		<link rel="stylesheet" type="text/css" href="slideshow.css">
	</head>
	<body onLoad="window.scrollTo(0, document.body.scrollHeight);"> <!-- Force scolling to bottom to trigger fullscreen on iPad -->
		<?php
		$slideshow = "inventory.txt";
		$lines = file($slideshow); 
		echo $lines[array_rand($lines)];
		?>
	</body>
</html>

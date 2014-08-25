<?php

define("BASE_PATH", "http://localhost");
$path = "/ubi-mvc";
$url = $_SERVER['REQUEST_URI'];
$url = str_replace($path,"",$url);
$tmp_uri = preg_split('[\\/]', $url, -1, PREG_SPLIT_NO_EMPTY);
$uri = array();

if(!empty($tmp_uri))
{
	if(count($tmp_uri) == 3)
	{
		$uri['controller']    = $tmp_uri[0];
		$uri['method']    = $tmp_uri[1];
		$uri['id']       = $tmp_uri[2];
	}
	else if(count($tmp_uri) == 2)
	{
		$uri['controller']    = $tmp_uri[0];
		$uri['method']    = $tmp_uri[1];
	}
	else if(count($tmp_uri) == 1)
	{
		$uri['controller']    = $tmp_uri[0];
	}
}

//panggil base (class Application)
require_once("application/base.php");
////memuat controller
$application = new \Application\Application($uri);
if(!empty($uri))
{
	$class = $uri['controller']?$uri['controller']:'';
	$application->loadController($class);
}
else
	$application->loadController($uri);

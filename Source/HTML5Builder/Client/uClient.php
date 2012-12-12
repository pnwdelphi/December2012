<?php
require_once("rpcl/rpcl.inc.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");

//Class definition
class Page1 extends Page
{
    public $Edit1 = null;
    public $Label1 = null;
    public $Button1 = null;
    public $Label2 = null;
}

global $application;

global $Page1;

//Creates the form
$Page1=new Page1($application);

$Page1->isclientpage=true;

//Read from resource file
$Page1->loadResource(__FILE__);

//Shows the form
$Page1->show();

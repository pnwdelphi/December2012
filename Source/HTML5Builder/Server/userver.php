<?php
require_once("rpcl/rpcl.inc.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");

//Class definition
class Page1 extends Page
{
    public $Label6 = null;
    public $Label5 = null;
    public $Button3 = null;
    public $Label4 = null;
    public $Button2 = null;
    public $Label3 = null;
    public $Edit1 = null;
    public $Label1 = null;
    public $Button1 = null;
    public $Label2 = null;
    public $Edit2 = null;
    function Button1Click($sender, $params)
    {
       $this->Label1->Caption = "Hello, ".$this->Edit1->Text."!";
    }
    function Button2Click($sender, $params)
    {
      // DON'T DO THIS
      // For demonstration purposes only.
      // From the php documentation:
      // The eval() language construct is very dangerous because it allows
      // execution of arbitrary PHP code. Its use thus is discouraged. If
      // you have carefully verified that there is no other option than to
      // use this construct, pay special attention not to pass any user
      // provided data into it without properly validating it beforehand.
      eval('$str='.$this->Edit2->Text.';');
      $this->Label3->Caption = $str;
    }
    function Button3JSClick($sender, $params)
    {
      // DON'T DO THIS
      // For demonstration purposes only.
      // always validate user input. In this case you want to parse it,
      // verify it is a proper mathematical expression which can be
      // evaluated. To do otherwise is to invite injection attacks.
        ?>
        //begin js
          var value = $('#Edit2').val();
          $('#Label4').html(eval(value));
        //end
        <?php
    }
}

global $application;

global $Page1;

//Creates the form
$Page1=new Page1($application);

//Read from resource file
$Page1->loadResource(__FILE__);

//Shows the form
$Page1->show();

?>
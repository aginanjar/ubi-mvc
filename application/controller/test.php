<?php
namespace controller;
class test extends \application\Application
{
    public function __construct()
    {
        $this->loadModel('Test');
    }

    public function index($title = "")
    {
        //var_dump( $this->loadModel('Test1') );
        // var_dump($this);die;
        $arc = \model\Test::select();
        $data['articles'] = $arc;
        $this->loadView('test',$data);
    }

}

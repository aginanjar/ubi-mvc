<?php
namespace application;
class Application
{
    public $uri;
    public $model;

    public function __construct($uri = "")
    {
        $this->uri = $uri;
    }

    public function loadController($class)
    {
        if(empty($class)) $this->welcome();
        else
        {
            $file = "application/controller/".$this->uri['controller'].".php";
            if(!file_exists($file))
            {
                echo 'File not found. Where you\'ll go now ?';die;
            }
            if(empty($this->uri['method']))
            {
                $method = '';
            }
            else
            {
                $method = $this->uri['method'];
            }
            require_once($file);
            $class = "\controller\\".$this->uri['controller'];

            $controller = new $class;
            if(method_exists($controller, $method))
            {

                //$controller->index();
                // $controller->{$this->uri['method'])}($this->uri['var']);
            }
            else
            {
                $controller->index();
            }
        }
    }

    public function loadModel($model)
    {
        $class = "\model\\".$model;
        require_once('db.php');
        require_once('model/'.$model.'.php');

        $this->model = new $class;
    }

    public function loadView($view, $vars = "")
    {
        if(is_array($vars) == count($vars) > 0)
        {
            extract($vars, EXTR_PREFIX_SAME, 'wddx');
            require_once('view/'.$view.'.php');
        }
    }

    public function welcome()
    {
        echo 'Welcome! wilujeung sumping, mangga kalebet. anggo weh sendalna.';
    }
}

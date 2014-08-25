<?php
namespace application;
class DB
{
    protected $_table;
    protected $db_type;
    protected $host;
    protected $db_name;
    protected $user;
    protected $pass;

    public function __construct()
    {
        $this->db_type = "mysql";
        $this->host = "localhost";
        $this->db_name = "teras_sosis";
        $this->user = "root";
        $this->pass = "1234";

        $con = $this->db_type.":host=".$this->host.";dbname=".$this->db_name;
        try
        {
            $this->_table = new \PDO($con,$this->user,$this->pass);
            // var_dump(new \PDO($con,$this->user,$this->pass));die;
            // var_dump($this->_table);die;
            if(!$this->_table)
                throw new \Exception('Data base salah!!');

        }
        catch(Exception $e)
        {
        	echo "Warning: ".$e->getMessage();
        }
    }

    public function getPdo()
    {
        return $this->_table;
    }

    // fungsi insert (C)
    public function add()
    {}

    // fungsi select (R)
    public function selectAll($table)
    {}

    // fungsi update (U)
    public function update($table, $id)
    {}

    // fungsi delete (D)
    public function delete($table, $id)
    {}

    public static function hallo()
    {
        return "Halo tjoy!";
    }
}

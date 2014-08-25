<?php
namespace model;
class Test extends \application\Application
{
    private $_db;
    public function __construct()
    {
        // koneksi db, crud db, dll
        $this->_db = new \application\DB;
    }

    public static function select()
    {
        return array('Lalalala','Yeyyee');
    }

    public function add($table, $datas = null)
    {
        $query = 'INSERT INTO '.$table;
        $row = null;
        $value = null;

        $credentials = array();
        if(!empty($datas))
        {
            foreach($datas as $k=>$v)
            {
                $row .= ", ". $k;
                $value .= ", :". $k;
                $credentials[":$k"] = $v;
            }
            $query .= "(".substr($row,1).") ";
            $query .= "VALUES(".substr($value,1).")";

            $stmt = $this->_db->getPdo()->prepare($query);

            return $stmt->execute($credentials)?"Already inserted!XD":"Failed to insert :'(";
        }
        else
        {
            return "Data tidak boleh kosong!";
        }
    }
}

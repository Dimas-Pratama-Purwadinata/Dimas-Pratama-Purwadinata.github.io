<?php
  class DB
  {
    var $defaultDebug = false;
    var $nbQueries;
    var $lastResult;
    function DB($base, $server, $user, $pass)
    {
      $this->mtStart    = $this->getMicroTime();
      $this->nbQueries  = 0;
      $this->lastResult = NULL;
      $this->connection = FALSE;
      $this->connection = mysqli_connect($server, $user, $pass, $base);
      if ($this->connection==FALSE) {
          $data='Database Connection is Not valid Please Enter The valid database connection';
   header("location: install_step1.php?msg=$data");
    exit;
}
    }
    function query($query, $debug = -1)
    {
      $this->nbQueries++;
      $this->lastResult = mysqli_query($this->connection,$query) or $this->debugAndDie($query);

      $this->debug($debug, $query, $this->lastResult);

      return $this->lastResult;
    }
    function execute($query, $debug = -1)
    {
      $this->nbQueries++;
      mysqli_query($this->connection,$query) or $this->debugAndDie($query);

      $this->debug($debug, $query);
    }
    function fetchNextObject($result = NULL)
    {
      if ($result == NULL)
        $result = $this->lastResult;

      if ($result == NULL || mysqli_num_rows($result) < 1)
        return NULL;
      else
        return mysqli_fetch_object($result);
    }
    function numRows($result = NULL)
    {
      if ($result == NULL)
        return mysqli_num_rows($this->lastResult);
      else
        return mysqli_num_rows($result);
    }
    function queryUniqueObject($query, $debug = -1)
    {
      $query = "$query LIMIT 1";

      $this->nbQueries++;
      $result = mysqli_query($this->connection,$query) or $this->debugAndDie($query);

      $this->debug($debug, $query, $result);

      return mysqli_fetch_object($result);
    }
    function queryUniqueValue($query, $debug = -1)
    {
      $query = "$query LIMIT 1";

      $this->nbQueries++;
      $result = mysqli_query($this->connection,$query) or $this->debugAndDie($query);
      $line = mysqli_fetch_row($result);

      $this->debug($debug, $query, $result);

      return $line[0];
    }
    function maxOf($column, $table, $where)
    {
      return $this->queryUniqueValue("SELECT MAX(`$column`) FROM `$table` WHERE $where");
    }
    function maxOfAll($column, $table)
    {
      return $this->queryUniqueValue("SELECT MAX(`$column`) FROM `$table`");
    }
    function countOf($table, $where)
    {
      return $this->queryUniqueValue("SELECT COUNT(*) FROM `$table` WHERE $where");
    }
    function countOfAll($table)
    {
      return $this->queryUniqueValue("SELECT COUNT(*) FROM `$table`");
    }
    function debugAndDie($query)
    {
      $this->debugQuery($query, "Error");
      die("<p style=\"margin: 2px;\">".mysqli_error($this->connection)."</p></div>");
    }
    function debug($debug, $query, $result = NULL)
    {
      if ($debug === -1 && $this->defaultDebug === false)
        return;
      if ($debug === false)
        return;

      $reason = ($debug === -1 ? "Default Debug" : "Debug");
      $this->debugQuery($query, $reason);
      if ($result == NULL)
        echo "<p style=\"margin: 2px;\">Number of affected rows: ".mysqli_affected_rows()."</p></div>";
      else
        $this->debugResult($result);
    }
    function debugQuery($query, $reason = "Debug")
    {
      $color = ($reason == "Error" ? "red" : "orange");
      echo "<div style=\"border: solid $color 1px; margin: 2px;\">".
           "<p style=\"margin: 0 0 2px 0; padding: 0; background-color: #DDF;\">".
           "<strong style=\"padding: 0 3px; background-color: $color; color: white;\">$reason:</strong> ".
           "<span style=\"font-family: monospace;\">".htmlentities($query)."</span></p>";
    }
    function debugResult($result)
    {
      echo "<table border=\"1\" style=\"margin: 2px;\">".
           "<thead style=\"font-size: 80%\">";
      $numFields = mysqli_num_fields($result);
      $tables    = array();
      $nbTables  = -1;
      $lastTable = "";
      $fields    = array();
      $nbFields  = -1;
      while ($column = mysqli_fetch_field($result)) {
        if ($column->table != $lastTable) {
          $nbTables++;
          $tables[$nbTables] = array("name" => $column->table, "count" => 1);
        } else
          $tables[$nbTables]["count"]++;
        $lastTable = $column->table;
        $nbFields++;
        $fields[$nbFields] = $column->name;
      }
      for ($i = 0; $i <= $nbTables; $i++)
        echo "<th colspan=".$tables[$i]["count"].">".$tables[$i]["name"]."</th>";
      echo "</thead>";
      echo "<thead style=\"font-size: 80%\">";
      for ($i = 0; $i <= $nbFields; $i++)
        echo "<th>".$fields[$i]."</th>";
      echo "</thead>";
      // END HEADER
      while ($row = mysqli_fetch_array($this->connection,$result)) {
        echo "<tr>";
        for ($i = 0; $i < $numFields; $i++)
          echo "<td>".htmlentities($row[$i])."</td>";
        echo "</tr>";
      }
      echo "</table></div>";
      $this->resetFetch($result);
    }
    function getExecTime()
    {
      return round(($this->getMicroTime() - $this->mtStart) * 1000) / 1000;
    }
    function getQueriesCount()
    {
      return $this->nbQueries;
    }
    function resetFetch($result)
    {
      if (mysqli_num_rows($result) > 0)
          mysqli_data_seek($result, 0);
    }
    function lastInsertedId()
    {
      return mysqli_insert_id();
    }
    function close()
    {
        mysqli_close($this->connection);
    }
    function getMicroTime()
    {
      list($msec, $sec) = explode(' ', microtime());
      return floor($sec / 1000) + $msec;
    }
  } 
?>

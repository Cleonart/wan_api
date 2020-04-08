<?php


header('Access-Control-Allow-Origin: *');

class dale{
	
    //YANGSIG CLASS VARIABLE
	protected $connect = null;         //TO ESTABILISH CONNECTION
    protected $host    = null;         //SET THE HOST FOR DATABASE
    protected $database_name = null;   //SET THE NAME OF DATABASE
    protected $error = 1;
    protected $handshake_credential    = 0;
    protected $handshake_authorization = 0; //0 MEAN THERE'S NO NEED OF SPECIFIC AUTHORIZATION TO ACCESS API

    /* PUBLIC FUNCTION */
    public function authorization($min=""){
        $this->handshake_authorization = $min;
    }

    //CONNECT TO DATABASE FUNCTION
	public function konek_ke_database($host="", $dbName="", $user="", $password="", $log=0){
        
        $i = 0;
        $errors = [];

        //IF DATABASE NAME IS NOT EXIST
        if($dbName == "") {
           $errors[$i] = array('code'=>"BD_KOSONG", 'msg'=>"Oops, parameter basis data tidak boleh kosong");
           $i++;
        }

        //IF DATABASE HOST IS NOT EXIST
        if($host == ""){
            $errors[$i] = array('code'=>"HT_KOSONG", 'msg'=>"Oops, parameter host tidak boleh kosong");
            $i++;
        }

        //IF DATABASE USER IS NOT EXIST
        if($user == "") {
           $errors[$i] = array('code'=>"PG_KOSONG", 'msg'=>"Oops, parameter user tidak boleh kosong");
        }

        //ABORT CONNECTION
        if ($errors != []) {
            echo json_encode($errors);
        }

        //ESTABILISH CONNECTION WITH DATABASE
        else{

    		try {

                $this->database_name = $dbName;
                $this->host = $host;

                //SET DESTINATION TO SEND DATA
                $destination = "mysql:dbname=".$dbName.";host=".$host;

            	//PDO OPTIONS
                $options  = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                                  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                );

                //MAKE NEW PDO
                $this->connect = new PDO($destination, $user, $password, $options);
                $this->error = null;

                //ONLY IF DEBUGGING TURNED ON
                if ($log == 1) {
                    $this->showError("BERHASIL_TERKONEK", "Koneksi ke basis data berhasil dilakukan");
                }

    		} 

            catch (PDOException $e) {
                $this->showError("SQLSTATE[".$e->errorInfo[0]."]",$e->errorInfo[2]);
                $this->error = 1;
            }
    
        }
    
    }

    // querying data
    public function kueri($sql_query){

        try{

            // trying to connect to database
            if($this->connect){
                
                // explode array to find out what sql method used
                $exploded_query = explode(" ", $sql_query);

                if($exploded_query[0] == "SELECT"){

                    // execute query from sql command
                    $result = $this->connect->query($sql_query);

                    // initialize and fetch the data
                    $data = [];
                    foreach($result as $row){
                        $data[] = $row;
                    }

                }

                else if($exploded_query[0] == "INSERT" || 
                        $exploded_query[0] == "UPDATE" || 
                        $exploded_query[0] == "DELETE"){
                    
                    // execute query from sql command
                    $result = $this->connect->query($sql_query);

                    // notify user that 
                    $data = json_encode(array('kode'=>"QRY_200",
                                              'pesan'=>"Query $exploded_query[0] berhasil dilakukan"));

                }
                

                else{
                     // notify user that 
                    $data = json_encode(array('kode'=>"QRY_404",
                                              'pesan'=>"Query $exploded_query[0] tidak ditemukan"));
                }

                $data = json_encode($data);

                // return data
                return $data;

                
            }

        }

        catch(PDOException $e){
            $this->showError("ERROR", $e);
        }

    }

    public function log(){

        if ($this->error == 0) {
            echo "\nconnected to <b>\"" . $this->host . "\"</b> with database <b>\"" . $this->database_name ."\"</b>";
        }}


    /* PROTECTED FUNCTION */

    //show error
    protected function showError($code, $message, $errorType=0){

        $errorLog = json_encode(array('kode'=>$code,
                                      'pesan'=>$message));
        
        if ($errorType == 1) {
            return $errorLog;
        }

        else if($errorType == 0){
            echo $errorLog;
        }}

}

?>
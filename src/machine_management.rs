use crate::sql_request::{start_stop_one_machine, start_stop_all_machine};

pub fn start_stop_machine(status:String ,machineid :Option<i32>)->String{
    if machineid.is_some(){
        match start_stop_one_machine(status, machineid.unwrap_or(-1)){
            true => "Success".to_string(),
            false => "Error : can't stop this machine".to_string(), 
        }
    }else{
        match start_stop_all_machine(status){
            true => "Success".to_string(),
            false => "Error : can't stop all machines".to_string(), 
        }
    }
}
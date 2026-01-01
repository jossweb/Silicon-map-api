use crate::sql_request::{stop_all_machine, stop_one_machine};

pub fn stop_machine(machineid :Option<i32>)->String{
    if machineid.is_some(){
        match stop_one_machine(machineid.unwrap_or(-1)){
            true => "Success".to_string(),
            false => "Error : can't stop this machine".to_string(), 
        }
    }else{
        match stop_all_machine(){
            true => "Success".to_string(),
            false => "Error : can't stop all machines".to_string(), 
        }
    }
}
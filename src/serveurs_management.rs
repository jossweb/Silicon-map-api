use crate::sql_request::{start_stop_one_machine, start_stop_all_machine, create_machine_db, delete_machine_db, create_component_db, delete_component_db};

pub fn start_stop_machine(status:String, machineid : Option<i32>)->String{
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
pub fn create_machine(hostname: String, ip_addr : String, mac_addr : String, os : String, machine_type : String) -> String{
    if hostname.len() > 255{
        return "Error : max length hostname = 255".to_string();
    } 
    if ip_addr.len() > 15{
        return "Error : max length ip_addr = 15".to_string();
    }
    if mac_addr.len() > 17{
        return "Error : max length mac_addr = 17".to_string();
    }
    if os.len() > 255{
        return "Error : max length os = 255".to_string();
    }
    let valid_types : [String; 6] = [
        "Storage".to_string(),
        "Compute".to_string(),
        "GPU_Compute".to_string(),
        "switch".to_string(),
        "router".to_string(),
        "firewall".to_string(),
    ];

    if !valid_types.contains(&machine_type) {
        return "Error: invalid value for machine_type, check the doc!".to_string();
    }

    return match create_machine_db(hostname, ip_addr, mac_addr, os, machine_type){
        true => "Success".to_string(),
        false => "Unexpected error".to_string(),
    }
}
pub fn create_component(brand : String, model : String, machine_id : Option<String>, spec_value_primary : Option<i32>, spec_value_secondary : Option<i32>, component_type : String)->String{
    if brand.len() > 40{
        return "Error : max length brand = 40".to_string();
    }
    if model.len() > 80{
        return "Error : max length model = 80".to_string();
    }
    let valid_types : [String; 6] = [
        "CPU".to_string(),
        "GPU".to_string(),
        "RAM".to_string(),
        "DISK".to_string(),
        "Power_supply".to_string(),
        "Chassis".to_string(),
    ];
    if !valid_types.contains(&component_type){
        return "Error: invalid value for component_type, check the doc!".to_string();
    }
    match create_component_db(brand, model, machine_id, spec_value_primary, spec_value_secondary, component_type){
        true => "Success".to_string(),
        false => "Unexpected error".to_string(),
    }
}
pub fn delete_machine(id : i32)->String{
    match delete_machine_db(id){
        true => "Success".to_string(),
        false => "Unexpected error".to_string()
    }
}
pub fn delete_component(id : i32)->String{
    match delete_component_db(id){
        true => "Success".to_string(),
        false => "Unexpected error".to_string()
    }
}
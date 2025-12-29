use std::collections::HashMap;
use rand::Rng;
use std::time::Duration;
use actix_rt::time::sleep;

use crate::structs::{Machine, Component};
use crate::sql_request::{get_all_machine, get_all_component, set_temp, set_load};

pub async fn simulator(){

    let prev_temp : HashMap<u32, i32> = HashMap::new();
    let prev_load : HashMap<u32, u32> = HashMap::new(); 

   loop{
        let machine_list : Vec<Machine> = get_all_machine();
        let component_list : Vec<Component> = get_all_component();

        generate_temp(machine_list, 65, prev_temp.clone());
        generate_load(component_list, 60, prev_load.clone());

        sleep(Duration::from_secs(10)).await; 
    }

}
fn generate_temp(machine_list: Vec<Machine>, base_temp:i32, prev_temp : HashMap<u32, i32>)->HashMap<u32, i32>{
    let mut map : HashMap<u32, i32> = HashMap::new();
    for machine in machine_list{
        let temp : i32;
        if prev_temp.get(&machine.id) != None{
            temp = *prev_temp.get(&machine.id).unwrap();
        }else{
            temp = match machine.server_type.as_str(){
                "Compute" => base_temp,
                "GPU_Compute" => base_temp + 20,
                _ => base_temp - 10
            }
        }
        let mut rand = rand::thread_rng();
        let random_val: f32 = rand.gen_range(0.6..=1.6);
        let mut new_temp = temp as f32 * random_val;

        if new_temp > 130.0 {
            new_temp = 125.0;
        }

        map.insert(machine.id, new_temp as i32);
    }
    set_temp(map.clone());
    map
}
fn generate_load(component_list: Vec<Component>, base_load:u32, prev_load : HashMap<u32, u32>)->HashMap<u32, u32>{
    let mut map : HashMap<u32, u32> = HashMap::new();
    for component in component_list{
        let load : u32;
        if prev_load.get(&component.id) != None{
            load = *prev_load.get(&component.id).unwrap();
        }else{
            load = base_load;
        }
        let mut rand = rand::thread_rng();
        let random_val: f32 = rand.gen_range(0.6..=1.6);
        let mut new_load = load as f32 * random_val;

        // new process start on component 
        new_load += match rand.gen_range(0..=5){
            4 => 10.0,
            5 => 20.0,
            _ => 0.0,
        };

        map.insert(component.id, new_load as u32);
    }
    set_load(map.clone());
    map
}
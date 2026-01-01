use std::collections::HashMap;
use mysql::{Opts, OptsBuilder, Pool, Value};
use mysql::prelude::Queryable;
use once_cell::sync::OnceCell;
use dotenvy::dotenv;
use std::env;


use crate::structs::{Component, Machine};

static DB_POOL: OnceCell<Pool> = OnceCell::new();

pub fn init_db() -> Result<(), mysql::Error> {
    dotenv().ok();

    let opts = OptsBuilder::new()
        .ip_or_hostname(Some(env::var("DB_HOST").expect("DB_HOST must be set")))
        .tcp_port(env::var("DB_PORT").expect("DB_PORT must be set").parse().expect("DB_PORT must be a number"))
        .user(Some(env::var("DB_USER").expect("DB_USER must be set")))
        .pass(Some(env::var("DB_PASS").expect("DB_PASS must be set")))
        .db_name(Some(env::var("DB_NAME").expect("DB_NAME must be set")));

    let pool = Pool::new(Opts::from(opts))?;

    DB_POOL.set(pool)
        .expect("DB_POOL already initialized");

    Ok(())
}

pub fn test_db() -> String {
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(e) => return format!("DB error: {}", e),
    };

    let result: u32 = match conn.query_first("SELECT 1") {
        Ok(r) => r.unwrap(),
        Err(_) => 0,
    };
    if result == 1{
        "DB Ready!".to_string()
    }else{
        "Error : can't init or check db!".to_string()
    }
}
pub fn get_all_machine()->Vec<Machine>{
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(_) => return Vec::new(),
    };

    conn.query_map("SELECT id, type FROM machines WHERE status = 'Online';", |(id, server_type)| {
        Machine{id, server_type}
    }).unwrap_or_default()
}
pub fn get_all_component()->Vec<Component>{
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(_) => return Vec::new(),
    };

    conn.query_map("SELECT components.id FROM components INNER JOIN machines ON machines.id = components.machine_id WHERE components.status = 'actually_use' AND machines.status <> 'Offline';", |id| {
        Component{id}
    }).unwrap_or_default()
}
pub fn set_temp(map: HashMap<u32, i32>) -> bool {
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(_) => return false,
    };

    let mut query = "INSERT INTO temperature (temperature, machine_id) VALUES ".to_string();
    for i in 0..map.len() {
        if i < map.len() - 1 {
            query += "(?, ?), ";
        } else {
            query += "(?, ?);";
        }
    }

    let stmt = match conn.prep(query) {
        Ok(s) => s,
        Err(_) => return false,
    };
    let mut params: Vec<Value> = Vec::with_capacity(map.len() * 2);
    for (machine, temp) in &map {
        params.push(Value::from(temp));
        params.push(Value::from(machine));
    }

    match conn.exec_drop(stmt, params) {
        Ok(_) => true,
        Err(_) => false,
    }
}
pub fn set_load(map: HashMap<u32, u32>) -> bool {
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(_) => return false,
    };

    let mut query = "INSERT INTO component_load (components_load, component_id) VALUES ".to_string();
    for i in 0..map.len() {
        if i < map.len() - 1 {
            query += "(?, ?), ";
        } else {
            query += "(?, ?);";
        }
    }

    let stmt = match conn.prep(query) {
        Ok(s) => s,
        Err(_) => return false,
    };
    let mut params: Vec<Value> = Vec::with_capacity(map.len() * 2);
    for (machine, temp) in &map {
        params.push(Value::from(temp));
        params.push(Value::from(machine));
    }

    match conn.exec_drop(stmt, params) {
        Ok(_) => true,
        Err(_) => false,
    }
}
pub fn stop_one_machine(machine_id: i32) -> bool {
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(_) => return false,
    };

    let result = conn.exec_drop(
        "UPDATE machines SET status = 'Offline' WHERE id = ?",
        (machine_id,),
    );

    match result {
        Ok(_) => true,
        Err(_) => false,
    }
}
pub fn stop_all_machine() -> bool {
    let pool = DB_POOL.get().expect("DB not initialized");

    let mut conn = match pool.get_conn() {
        Ok(c) => c,
        Err(_) => return false,
    };
    let result = conn.exec_drop(
        "UPDATE machines SET status = 'Offline'",
        (),
    );

    match result {
        Ok(_) => true,
        Err(_) => false,
    }
}
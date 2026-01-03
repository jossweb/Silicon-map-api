use actix_web::{get, App, HttpServer, Responder, HttpResponse, web};
use crate::sql_request::{test_db, init_db};
use crate::simulator::{simulator, start_high_temperature};
use crate::serveurs_management::{start_stop_machine, create_machine, delete_machine, create_component, delete_component};
use serde::Deserialize;

mod sql_request;
mod simulator;
mod structs;
mod serveurs_management;


#[derive(Deserialize)]
struct StopMachineQuery {
    machine: Option<i32>,
}
#[get("/stop_machine")]
async fn stop_machine_handler(query: web::Query<StopMachineQuery>) -> impl Responder{
    let machine_id = query.machine;
    let response = start_stop_machine("Offline".to_string(), machine_id);
    HttpResponse::Ok().body(format!("{}", response))
}
#[get("/start_machine")]
async fn start_machine_handler(query: web::Query<StopMachineQuery>) -> impl Responder{
    let machine_id = query.machine;
    let response = start_stop_machine("Online".to_string(), machine_id);
    HttpResponse::Ok().body(format!("{}", response))
}
#[get("/set_warning_machine")]
async fn warning_machine_handler(query: web::Query<StopMachineQuery>) -> impl Responder{
    let machine_id = query.machine;
    let response = start_stop_machine("Maintenance".to_string(), machine_id);
    HttpResponse::Ok().body(format!("{}", response))
}
#[get("/test_db")]
async fn db_test() -> impl Responder {
    let value : String = test_db();
    HttpResponse::Ok().body(format!("DB OK: {}", value))
}
#[get("/start_high_temperature")]
async fn high_temperature_mode()-> impl Responder {
    let status: String = start_high_temperature();
    HttpResponse::Ok().body(format!("Status : {}", status))
}
#[derive(Deserialize)]
struct CreateMachine {
    hostname: String,
    ip_addr : String,
    mac_addr : String,
    os : String, 
    machine_type : String
}
#[get("/create_machine")]
async fn create_machine_handler(query: web::Query<CreateMachine>)-> impl Responder{
    let result : String = create_machine(query.hostname.clone(), query.ip_addr.clone(), query.mac_addr.clone(), query.os.clone(), query.machine_type.clone()); 
    HttpResponse::Ok().body(format!("Status : {}", result))
}
#[derive(Deserialize)]
struct DeleteElement {
    id: i32,
}
#[get("/delete_machine")]
async fn delete_machine_handler(query: web::Query<DeleteElement>)-> impl Responder{
    let result : String = delete_machine(query.id.clone()); 
    HttpResponse::Ok().body(format!("Status : {}", result))
}
#[derive(Deserialize)]
struct CreateComponent {
    brand : String, 
    model : String, 
    machine_id : Option<String>, 
    spec_value_primary : Option<i32>, 
    spec_value_secondary : Option<i32>, 
    component_type : String
}
#[get("/create_component")]
async fn create_component_handler(query: web::Query<CreateComponent>)-> impl Responder{
    let result : String = create_component(query.brand.clone(), query.model.clone(), query.machine_id.clone(), query.spec_value_primary.clone(), query.spec_value_secondary.clone(), query.component_type.clone()); 
    HttpResponse::Ok().body(format!("Status : {}", result))
}
#[get("/delete_component")]
async fn delete_component_handler(query: web::Query<DeleteElement>)-> impl Responder{
    let result : String = delete_component(query.id.clone()); 
    HttpResponse::Ok().body(format!("Status : {}", result))
}
#[actix_web::main] 
async fn main() -> std::io::Result<()> {
    println!("Listening on port 2526");
    init_db().expect("Failed to initialize DB");
    actix_rt::spawn(async {
        simulator().await;
    });
    HttpServer::new(|| {
        App::new()
        .service(db_test)
        .service(high_temperature_mode)
        .service(stop_machine_handler)
        .service(start_machine_handler)
        .service(warning_machine_handler)
        .service(create_machine_handler)
        .service(delete_machine_handler)
        .service(create_component_handler)
        .service(delete_component_handler)

    })
    .bind(("0.0.0.0", 2526))?
    .run()
    .await
}
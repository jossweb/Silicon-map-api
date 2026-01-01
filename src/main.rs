use actix_web::{get, App, HttpServer, Responder, HttpResponse, web};
use crate::sql_request::{test_db, init_db};
use crate::simulator::{simulator, start_high_temperature};
use crate::machine_management::{stop_machine};
use serde::Deserialize;

mod sql_request;
mod simulator;
mod structs;
mod machine_management;


#[derive(Deserialize)]
struct StopMachineQuery {
    machine: Option<i32>,
}
#[get("/stop_machine")]
async fn stop_machine_handler(query: web::Query<StopMachineQuery>) -> impl Responder{
    let machine_id = query.machine;
    let response = stop_machine(machine_id);
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
#[actix_web::main] 
async fn main() -> std::io::Result<()> {
    println!("Listening on localhost:2526");
    init_db().expect("Failed to initialize DB");
    actix_rt::spawn(async {
        simulator().await;
    });
    HttpServer::new(|| {
        App::new()
        .service(db_test)
        .service(high_temperature_mode)
        .service(stop_machine_handler)
    })
    .bind(("0.0.0.0", 2526))?
    .run()
    .await
}
use actix_web::{get, App, HttpServer, Responder, HttpResponse};
use crate::sql_request::{test_db, init_db};
use crate::simulator::simulator;

mod sql_request;
mod simulator;
mod structs;

#[get("/testdb")]
async fn db_test() -> impl Responder {
    let value : String = test_db();
    HttpResponse::Ok().body(format!("DB OK: {}", value))
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
    })
    .bind(("0.0.0.0", 2526))?
    .run()
    .await
}
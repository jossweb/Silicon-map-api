use argon2::{Argon2, PasswordHash, password_hash::{PasswordVerifier}};

/*pub fn hash_password(input: String) -> String {
    let mut rng = thread_rng();
    let salt = SaltString::generate(&mut rng);

    Argon2::default()
        .hash_password(input.as_bytes(), &salt)
        .unwrap()
        .to_string()
}*/

pub fn verify_password(hash: String, password: String) -> bool {
    let parsed_hash = match PasswordHash::new(&hash) {
        Ok(hash) => hash,
        Err(_) => return false,
    };

    match Argon2::default().verify_password(password.as_bytes(), &parsed_hash) {
        Ok(_) => true,
        Err(_) => false,
    }
}
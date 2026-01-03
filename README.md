# Siliconmap api

## About
This API is used to demonstrate that the Silicon map application (computer science degree project) is capable of functioning without its local database and can be used with any database external to the project.

However it's not recommended, the Java client connects directly to the database without using the API. This is because it's one of the evaluation criteria to connect the Java client directly to the database with a single connection.

The Rust code is used to inject data into the MySQL database to roughly simulate the behavior of the machines (temp) and their components (load). Thanks to the API, it's possible to perform several actions, such as switching to extreme temperature mode or turning the machines on and off.

## Endpoints

### Stop machine(s)

- **URL**: `/stop_machine`
- **Method**: `GET`

#### Query parameters

| Name    | Type           | Required | Description |
|--------|----------------|----------|-------------|
| machine | string / int | No | ID of the machine to stop |

- If no parameter is provided, this endpoint will stop **all machines stored in the database**.
- If machine is provided, only the specified machine will be stopped.

---
### Start machine(s)

- **URL**: `/start_machine`
- **Method**: `GET`

#### Query parameters

| Name    | Type           | Required | Description |
|--------|----------------|----------|-------------|
| machine | string / int | No | ID of the machine to start |

- If no parameter is provided, this endpoint will start **all machines stored in the database**.
- If machine is provided, only the specified machine will be started.

---
### Set warning mode on machine(s)

- **URL**: `/set_warning_machine`
- **Method**: `GET`

#### Query parameters

| Name    | Type           | Required | Description |
|--------|----------------|----------|-------------|
| machine | string / int | No | ID of the machine to set in warning state |

- If no parameter is provided, this endpoint will set **all machines** in warning state.
- If machine is provided, only the specified machine will be affected.

--- 
### Start high temperature mode

- **URL**: `/start_high_temperature`
- **Method**: `GET`

#### Description
Triggers the high temperature scenario (alerts, safety actions, automatic shutdown, etc.).

--- 
### Test database connection

- **URL**: `/test_db`
- **Method**: `GET`

#### Description
Checks the database connection and returns it's status.

## Database structure

The mysql database schema can be found here:  
https://github.com/jossweb/silicon-map/blob/main/sql-struct/siliconmap.sql


### Warning
This project is for educational purposes only and is not intended for production use.
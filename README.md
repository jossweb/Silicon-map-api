# Siliconmap api

## About
This API is used to demonstrate that the Silicon map application (computer science degree project) is capable of functioning without its local database and can be used with any database external to the project.

However it's not recommended, the Java client connects directly to the database without using the API. This is because it's one of the evaluation criteria to connect the Java client directly to the database with a single connection.

The Rust code is used to inject data into the MySQL database to roughly simulate the behavior of the machines (temp) and their components (load). Thanks to the API, it's possible to perform several actions, such as switching to extreme temperature mode or turning the machines on and off.

## Endpoints

### Login (get your token)
- **URL**: `/get_token`

| Name | Type | Required | Description |
|--------|------|----------|-------------|
| username | String | Yes | Your id |
| pass_string | String | Yes | Your password |

 - Return your token.

### Stop machine(s)

- **URL**: `/stop_machine`
- **Method**: `GET`

#### Query parameters

| Name | Type | Required | Description |
|--------|------|----------|-------------|
| token | String | Yes | Your login token |
| machine | int | No | ID of the machine to stop |

- If no parameter is provided, this endpoint will stop all machines stored in the database.
- If machine is provided, only the specified machine will be stopped.

---

### Start machine(s)

- **URL**: `/start_machine`
- **Method**: `GET`

#### Query parameters

| Name    | Type | Required | Description |
|--------|------|----------|-------------|
| token | String | Yes | Your login token |
| machine | int  | No | ID of the machine to start |

- If no parameter machine is provided, this endpoint will start all machines stored in the database.
- If machine is provided, only the specified machine will be started.

---

### Set warning mode on machine(s)

- **URL**: `/set_warning_machine`
- **Method**: `GET`

#### Query parameters

| Name | Type | Required | Description |
|--------|------|----------|-------------|
| token | String | Yes | Your login token |
| machine | int  | No | ID of the machine to set in maintenance mode |

- If no parameter machine is provided, this endpoint will set all machines in maintenance state.
- If machine is provided, only the specified machine will be affected.

---

### Create machine

- **URL**: `/create_machine`
- **Method**: `GET`

#### Query parameters

| Name | Type | Required | Description |
|-----|------|----------|-------------|
| token | String | Yes | Your login token |
| hostname | string | Yes | Machine hostname |
| ip_addr | string | Yes | IPv4 address |
| mac_addr | string | Yes | MAC address |
| os | string | Yes | Operating system |
| machine_type | string | Yes | Machine type (Storage, Compute, GPU, GPU_Compute, switch, router, firewall) |

#### Description
Creates a new machine in the database.

---

### Delete machine

- **URL**: `/delete_machine`
- **Method**: `GET`

#### Query parameters

| Name | Type | Required | Description |
|-----|------|----------|-------------|
| token | String | Yes | Your login token |
| id | int | Yes | ID of the machine to delete |

#### Description
Deletes a machine from the database.

---

### Create component

- **URL**: `/create_component`
- **Method**: `GET`

#### Query parameters

| Name | Type | Required | Description |
|-----|------|----------|-------------|
| token | String | Yes | Your login token |
| brand | string | Yes | Component brand |
| model | string | Yes | Component model |
| machine_id | string | No | Associated machine ID |
| spec_value_primary | int | No | Primary specification value |
| spec_value_secondary | int | No | Secondary specification value |
| component_type | string | Yes | Component type (CPU, RAM, GPU, DISK, etc.) |

#### Description
Creates a new component and optionally attaches it to a machine.

---

### Delete component

- **URL**: `/delete_component`
- **Method**: `GET`

#### Query parameters

| Name | Type | Required | Description |
|-----|------|----------|-------------|
| token | String | Yes | Your login token |
| id | int | Yes | ID of the component to delete |

#### Description
Deletes a component from the database.

---

### Start high temperature mode

- **URL**: `/start_high_temperature`
- **Method**: `GET`

#### Description
Triggers the high temperature simulation scenario.


## Database structure

The mysql database schema can be found at `/struct-sql/db.sql`


### Warning
This project is for educational purposes only and is not intended for production use.
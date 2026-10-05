CREATE TABLE IF NOT EXISTS delta_drones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    drone_model VARCHAR(50) NOT NULL,
    spawn_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO delta_drones (owner_id, drone_model) VALUES (1, 'buzzard');
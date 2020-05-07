CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON wordpress.* TO username @'localhost' IDENTIFIED BY 'password';

CREATE USER 'fmanetti' @'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO  'fmanetti' @'localhost' WITH GRANT OPTION;


CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `admin` BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE apartments (
    `apartment_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `amount` INT NOT NULL DEFAULT 0,
    `stars` BOOLEAN NOT NULL DEFAULT false,
    `image_url` VARCHAR(255),
    `description` TEXT,
    `date` DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE reservations (
    `reserve_id` INT AUTO_INCREMENT PRIMARY KEY,
    `apartment_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `amount` INT NOT NULL,
    `stars` INT NOT NULL,
    `date` DATE NOT NULL,
    FOREIGN KEY (`apartment_id`) REFERENCES apartments(`apartment_id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO apartments (name, price, amount, stars, image_url, description, date)
VALUES 
('The Cosy Corner', 120.00, 12, 3, 'https://i.redd.it/9poelxyzykv81.jpg', 'A cosy corner apartment with a beautiful view of the city.', '2024-06-06'),
('Sandy Beach', 200.00, 10, 4, 'https://media.cnn.com/api/v1/images/stellar/prod/160920112147-beachfront-hotel-2-le-guanahani-2.jpg?q=w_1900,h_1069,x_0,y_0,c_fill', 'A beachfront hotel with a stunning view of the ocean.', '2024-06-07'),
('Rustic Respite', 175.00, 9, 5, 'https://img.freepik.com/premium-photo/harvest-haven-rustic-retreat-heart-countryside_705284-36640.jpg', 'A rustic retreat in the heart of the countryside.', '2024-06-08'),
('Modern Marvel', 250.00, 12, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg8HpDEUIdEOtTkjyfI4h8ZYRSuXrdgR2r9A&s', 'A modern apartment with state-of-the-art facilities.', '2024-06-09'),
('Classic Comfort', 150.00, 11, 2, 'https://amazingarchitecture.com/storage/6941/bright-apartment-moscow-art-simple-studio.jpg', 'A classic apartment with comfortable furnishings.', '2024-06-09');

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    apartment VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    experience TEXT NOT NULL,
    stars INT NOT NULL
);

INSERT INTO reviews (apartment, name, experience, stars) VALUES 
('The Cozy Corner', 'John Doe', 'Great experience, very comfortable!', 5),
('Sandy Beach Hotel', 'Jane Smith', 'It was okay, but had some issues.', 3),
('The Rustic Respite', 'Alice Johnson', 'Terrible service, will not come back.', 1),
('The Cozy Corner', 'Bob Brown', 'Amazing place, highly recommend!', 4);

create table social_links (
    id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE NOT NULL,
    telegram TEXT,
    viber TEXT,
    vk TEXT
);

create TABLE users(
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE NOT NULL,
    role VARCHAR(10),
    name VARCHAR(50),
    surname VARCHAR(50),
    city VARCHAR(50),
    phone_number VARCHAR(11),
    INN VARCHAR(10),
    organization VARCHAR(50),
    photos TEXT,
    social_linksID INT,
    pass TEXT,
    FOREIGN KEY (social_linksID) REFERENCES social_links(id)
);

create table portfolio (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE NOT NULL,
    userID INT,
    photo TEXT,
    FOREIGN KEY (userID) REFERENCES users(id)
);

create TABLE specialization (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE NOT NULL,
    tittle VARCHAR(100)
);

create table user_specialization (
    userID INT,
    specializationID INT,
    FOREIGN KEY (userID) REFERENCES users(id),
    FOREIGN KEY (specializationID) REFERENCES specialization(id)
);

create table posts (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE NOT NULL,
    userID INT,
    description TEXT,
    tags TEXT,
    photo TEXT,
    FOREIGN KEY (userID) REFERENCES users(id)
);

create TABLE services (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE NOT NULL,
    userID INT,
    tittle VARCHAR(255),
    price VARCHAR(255),
    descriptions TEXT,
    photos TEXT,
    word_key VARCHAR(255),
    FOREIGN KEY (userID) REFERENCES users(id)
);

create table posts_services (
    postID INT,
    servicesID INT,
    FOREIGN KEY (postID) REFERENCES posts(id),
    FOREIGN KEY (servicesID) REFERENCES services(id)
);

create table favorites (
    userID INT,
    servicesID INT,
    FOREIGN KEY (userID) REFERENCES users(id),
    FOREIGN KEY (servicesID) REFERENCES services(id)
);

create table favoritesPosts (
    userID INT,
    postID INT,
    FOREIGN KEY (userID) REFERENCES users(id),
    FOREIGN KEY (postID) REFERENCES posts(id)
)

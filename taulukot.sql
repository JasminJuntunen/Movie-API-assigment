CREATE TABLE Genre(  
    GenreID INT PRIMARY KEY,
    Genre_name VARCHAR(255),
    descr VARCHAR(255)
);
CREATE TABLE Movie(  
    MovieID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Year INT,
    GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);
CREATE TABLE Users(  
    UsersID INT PRIMARY KEY,
    Name VARCHAR(255),
    Username VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Birth_year INT
);
CREATE TABLE Review(  
    ReviewID INT PRIMARY KEY,
    UsersID INT,
    MovieID INT,
    Stars INT CHECK (Stars BETWEEN 1 AND 5),
    ReviewText TEXT,
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);
CREATE TABLE FavoriteMovies(  
    UsersID INT,
    MovieID INT,
    PRIMARY KEY (UsersID, MovieID),
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);
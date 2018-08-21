--Task1
create table Movie(mID int, title nvarchar(30), year int, director nvarchar(30), constraint movies_const PRIMARY KEY (mID, title, year));
create table Reviewer(rID int, name nvarchar(30) NOT NULL, constraint reviewer_const primary key (rID));
create table Rating(rID int, mID int, stars int not null, ratingDate date, constraint rating_rating UNIQUE (rID, mID, ratingDate));

insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');


alter table movie add check (year > 1900);
alter table Rating add check (stars > 0 and stars < 6);
alter table Rating add check (ratingDate > '2000-01-01');

alter table Movie add constraint check_SS check (year < 1990 or director not like 'Steven Spielberg');
alter table Movie add constraint check_JS check (year > 1990 or director not like 'James Cameron');


alter table Rating
    add constraint review_on_update
    foreign key (rID) references Reviewer(rID) on update cascade

alter table Rating
    add constraint review_on_delete
    foreign key (rID) references Reviewer(rID) on delete set null

/* alter table Rating
    add constraint movie_on_delete
    foreign key (mID) references Movie(mID) on delete cascade */


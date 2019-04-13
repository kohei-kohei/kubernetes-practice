create database clair;
create user clair;
alter role clair with password 'clair';
grant all privileges on database clair to clair;
alter database clair owner to clair;


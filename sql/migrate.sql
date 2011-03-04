-- migrate user_status_code
delete from aichallenge.user_status_code;
alter table aichallenge.user_status_code auto_increment = 0;
insert into aichallenge.user_status_code (status_id, name)
select status_id, name from planetwars.user_status_codes
order by status_id;

-- migrate country
delete from aichallenge.country;
alter table aichallenge.country auto_increment = 0;
insert into aichallenge.country (country_id, country_code, name, flag_filename)
select country_id, country_code, name, flag_filename from planetwars.countries
order by country_id;

-- migrate organization
delete from aichallenge.organization;
-- mysql really needs an IDENTITY INSERT ON, or I need training
insert into aichallenge.organization (org_id, name) values (1, 'Other');
update aichallenge.organization set org_id = 0 where name = 'Other';
alter table aichallenge.organization auto_increment = 1;
insert into aichallenge.organization (org_id, name)
select org_id, name from planetwars.organizations
where org_id > 0
order by org_id;

-- migrate language
delete from aichallenge.language;
insert into aichallenge.language (language_id, name, main_code_file, command, platform_specific_compilation) values (1, 'Unknown', '', '', 0);
update aichallenge.language set language_id = 0 where name = 'Unknown';
alter table aichallenge.language auto_increment = 0;
insert into aichallenge.language (language_id, name, main_code_file, command, platform_specific_compilation)
select language_id, name, main_code_file, command, platform_specific_compilation from planetwars.languages
where language_id > 0
order by language_id;

-- migrate user
delete from aichallenge.user;
alter table aichallenge.user auto_increment = 0;
insert into aichallenge.user (user_id, username, password, email, status_id, activation_code, org_id, bio, country_id, created, activated, admin)
select user_id, username, password, email, status_id, activation_code, org_id, bio, country_id, created, activated, admin  from planetwars.users
order by user_id;

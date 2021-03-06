INSERT INTO SEC.ADM_USERS (ID, USERNAME, PASSWORD, ACTIVE, BLOCKED, PASSWORD_SENT, CREATED, CREATED_BY)
VALUES (-1, 's-petrus', 'c514ff8f08ef1693cd082d5362b13422dc643ecf', 'Y', 'Y', 'Y', current_timestamp, 's-petrus');

INSERT INTO SEC.ADM_SCOPES (ID, NAME, CREATED, CREATED_BY) VALUES
 (-1, 'ADM', current_timestamp, 's-petrus');

INSERT INTO SEC.ADM_ROLES (ID, SCP_ID, NAME, FROZEN, VALID, CREATED, CREATED_BY)
 VALUES (-1, (SELECT ID FROM SEC.ADM_SCOPES WHERE NAME = 'ADM'), 'API Test role', 'Y', 'Y', current_timestamp, 's-petrus');

INSERT INTO SEC.ADM_PRIVILEGES (ID, SCP_ID, NAME, VALID, CREATED, CREATED_BY)
 VALUES (-1, (SELECT ID FROM SEC.ADM_SCOPES WHERE NAME = 'ADM'), 'API Delete', 'Y', current_timestamp, 's-petrus');
INSERT INTO SEC.ADM_PRIVILEGES (ID, SCP_ID, NAME, VALID, CREATED, CREATED_BY)
 VALUES (-2, (SELECT ID FROM SEC.ADM_SCOPES WHERE NAME = 'ADM'), 'API Insert', 'Y', current_timestamp, 's-petrus');

INSERT INTO SEC.ADM_ROLE_PRIVILEGES (ROL_ID, PRV_ID)
 VALUES ((SELECT ID FROM SEC.ADM_ROLES WHERE NAME = 'API Test role'), (SELECT ID FROM SEC.ADM_PRIVILEGES WHERE NAME = 'API Delete'));
INSERT INTO SEC.ADM_ROLE_PRIVILEGES (ROL_ID, PRV_ID)
 VALUES ((SELECT ID FROM SEC.ADM_ROLES WHERE NAME = 'API Test role'), (SELECT ID FROM SEC.ADM_PRIVILEGES WHERE NAME = 'API Insert')); 

 INSERT INTO SEC.ADM_USER_ROLES (ID, USR_ID, ROL_ID, ACTIVE, ACTIVE_FROM, CREATED, CREATED_BY)
 VALUES (-1, (SELECT ID FROM SEC.ADM_USERS WHERE ID = (SELECT ID FROM SEC.ADM_USERS WHERE USERNAME = 's-petrus')), (SELECT ID FROM SEC.ADM_ROLES WHERE NAME = 'API Test role'), 'Y', current_timestamp, current_timestamp, 's-petrus');
 
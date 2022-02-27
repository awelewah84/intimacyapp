CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

----------------***************************************************----------------------
INSERT INTO public."user"(
	"Username", "UserType", "DateCreated", "Status")
	VALUES ('superuser', 'admin', current_timestamp, true);
	
INSERT INTO public."user"(
	"Username", "UserType", "DateCreated", "Status")
	VALUES ('test.user1@gmail.com', 'regiistered', current_timestamp, true);
	
	
INSERT INTO public."user"(
	"Username", "UserType", "DateCreated", "Status")
	VALUES ('guest.user1@gmail.com', 'guest', current_timestamp, true);

    select * FROM public."user"

"19985d58-1576-4ea1-9d3c-ac454ed0de58"	"superuser"
"c7de445c-3e08-4698-ac19-69b90ca71cec"	"test.user1@gmail.com"
"324e6648-431a-4cc8-9a95-d2efa097d08d"	"test.user2@gmail.com"
"85b2076f-976c-448a-a428-b2a626315f0f"	"guest.user1@gmail.com"
"3c096571-f7fd-4f6e-8064-2c56f97e0806"	"guest.user2@gmail.com"

    ----------------***************************************************----------------------
    --SuperUser
    INSERT INTO public."userActivity"(
	"UserUID", "LoginTS", "ActivityType")
	VALUES ('19985d58-1576-4ea1-9d3c-ac454ed0de58', current_timestamp, 'Login');
	
	--test.user1@gmail.com
    INSERT INTO public."userActivity"(
	"UserUID", "LoginTS", "ActivityType")
	VALUES ('c7de445c-3e08-4698-ac19-69b90ca71cec', current_timestamp, 'Login');
	
	--test.user1@gmail.com
    INSERT INTO public."userActivity"(
	"UserUID", "LoginTS", "ActivityType")
	VALUES ('c7de445c-3e08-4698-ac19-69b90ca71cec', current_timestamp, 'Login');
	
	--guest.user1@gmail.com
    INSERT INTO public."userActivity"(
	"UserUID", "LoginTS", "ActivityType")
	VALUES ('85b2076f-976c-448a-a428-b2a626315f0f', current_timestamp, 'Login');

    SELECT * FROM public."userActivity"

 ----------------***************************************************----------------------

INSERT INTO public."eventDetails"(
	"Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated")
	VALUES ('Intimacy 21Day Challenge', 'Intimacy 21Day Challenge Details', 'Closed', 'Main', current_timestamp, current_timestamp, true, true, 'Admin1', current_timestamp);
	
	
	INSERT INTO public."eventDetails"(
	"ParentUID","Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated")
	VALUES ('c7706ce6-b8db-42ba-bf51-860d31efcae4','Day1', 'Intimacy 21Day Challenge  - Day1', 'Closed', 'Sub', current_timestamp, current_timestamp, true, true, 'Admin1', current_timestamp);
	
			INSERT INTO public."eventDetails"(
	"ParentUID","Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated")
	VALUES ('e5b02cc9-0e40-4b1b-9dcc-6114f9e43a21','Bible Study', 'Bile Study - Day1', 'Closed', 'Activity', current_timestamp, current_timestamp, true, true, 'Admin1', current_timestamp);
	
	INSERT INTO public."eventDetails"(
	"ParentUID","Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated")
	VALUES ('e5b02cc9-0e40-4b1b-9dcc-6114f9e43a21','Prayer Time', 'Prayer Time - Day1', 'Closed', 'Activity', current_timestamp, current_timestamp, true, true, 'Admin1', current_timestamp);
	
		INSERT INTO public."eventDetails"(
	"ParentUID","Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated")
	VALUES ('e5b02cc9-0e40-4b1b-9dcc-6114f9e43a21','Ministraation Time', 'Minstrration Time - Day1', 'Closed', 'Activity', current_timestamp, current_timestamp, true, true, 'Admin1', current_timestamp);
	

	--************************************************************************************************************************
		--Subscription tracker
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('c7706ce6-b8db-42ba-bf51-860d31efcae4','c7de445c-3e08-4698-ac19-69b90ca71cec', 'Subscription', current_timestamp);
	
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('c7706ce6-b8db-42ba-bf51-860d31efcae4','85b2076f-976c-448a-a428-b2a626315f0f', 'Subscription', current_timestamp);
	
	--Activity Tracker
	--Day1 - Bible Study - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('17575a81-d558-4dca-9d9e-cb9ac784caf2','c7de445c-3e08-4698-ac19-69b90ca71cec', 'CheckIn', current_timestamp);
	
	--Day1 - "Prayer Time" - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fae682e0-1bb8-40f7-8411-fb6a22d1979b','c7de445c-3e08-4698-ac19-69b90ca71cec', 'CheckIn', current_timestamp);
	
	--Day1 - Ministration Time - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fef1ae8a-1f4d-4441-875e-b43e1f4f1c50','c7de445c-3e08-4698-ac19-69b90ca71cec', 'CheckIn', current_timestamp);
	
	--Day1 - Bible Study - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('17575a81-d558-4dca-9d9e-cb9ac784caf2','85b2076f-976c-448a-a428-b2a626315f0f', 'CheckIn', current_timestamp);
	
	--Day1 - "Prayer Time" - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fae682e0-1bb8-40f7-8411-fb6a22d1979b','85b2076f-976c-448a-a428-b2a626315f0f', 'CheckIn', current_timestamp);
	
	--Day1 - Ministration Time - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fef1ae8a-1f4d-4441-875e-b43e1f4f1c50','85b2076f-976c-448a-a428-b2a626315f0f', 'ActivtyTrak', current_timestamp);
	
	--Activity Tracker
	--Day1 - Bible Study - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('17575a81-d558-4dca-9d9e-cb9ac784caf2','c7de445c-3e08-4698-ac19-69b90ca71cec', 'ActivtyTrak', current_timestamp);
	
	--Day1 - "Prayer Time" - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fae682e0-1bb8-40f7-8411-fb6a22d1979b','c7de445c-3e08-4698-ac19-69b90ca71cec', 'ActivtyTrak', current_timestamp);
	
	--Day1 - Ministration Time - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fef1ae8a-1f4d-4441-875e-b43e1f4f1c50','c7de445c-3e08-4698-ac19-69b90ca71cec', 'ActivtyTrak', current_timestamp);

	--Day1 - Bible Study - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('17575a81-d558-4dca-9d9e-cb9ac784caf2','85b2076f-976c-448a-a428-b2a626315f0f', 'ActivtyTrak', current_timestamp);
	
	--Day1 - "Prayer Time" - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fae682e0-1bb8-40f7-8411-fb6a22d1979b','85b2076f-976c-448a-a428-b2a626315f0f', 'ActivtyTrak', current_timestamp);
	
	--Day1 - Ministration Time - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fef1ae8a-1f4d-4441-875e-b43e1f4f1c50','85b2076f-976c-448a-a428-b2a626315f0f', 'ActivtyTrak', current_timestamp);
	
	
	--Activity Tracker
	--Day1 - Bible Study - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('17575a81-d558-4dca-9d9e-cb9ac784caf2','c7de445c-3e08-4698-ac19-69b90ca71cec', 'AutoCheckOut', current_timestamp);
	
	--Day1 - "Prayer Time" - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fae682e0-1bb8-40f7-8411-fb6a22d1979b','c7de445c-3e08-4698-ac19-69b90ca71cec', 'AutoCheckOut', current_timestamp);
	
	--Day1 - Ministration Time - user1
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fef1ae8a-1f4d-4441-875e-b43e1f4f1c50','c7de445c-3e08-4698-ac19-69b90ca71cec', 'AutoCheckOut', current_timestamp);
	
	--Day1 - Bible Study - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('17575a81-d558-4dca-9d9e-cb9ac784caf2','85b2076f-976c-448a-a428-b2a626315f0f', 'AutoCheckOut', current_timestamp);
	
	--Day1 - "Prayer Time" - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fae682e0-1bb8-40f7-8411-fb6a22d1979b','85b2076f-976c-448a-a428-b2a626315f0f', 'AutoCheckOut', current_timestamp);
	
	--Day1 - Ministration Time - user2
	INSERT INTO public."eventTracker"(
	"EventUID", "UserUID", "TrackerType", "ActivityStamp")
	VALUES ('fef1ae8a-1f4d-4441-875e-b43e1f4f1c50','85b2076f-976c-448a-a428-b2a626315f0f', 'AutoCheckOut', current_timestamp);
	--***************************************************************************************************************************
	SELECT "ID", "EventUID", "ParentUID", "Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated"
	FROM public."eventDetails"
	WHERE "EventStatus" = true
	
	SELECT "EventUID", "EventStatus","EventClass"
	FROM public."eventDetails"
	WHERE 
	"EventClass" = 'Main'
	and "EventStatus" = true
	
	
	SELECT row_to_json(eventDetails)
	FROM (
		SELECT "EventUID", "EventStatus","EventClass"
		FROM public."eventDetails" AS "Main"
		WHERE 
		"EventClass" = 'Main'
		and "EventStatus" = true
	) eventDetails
	-


	--Rewcursive CTE
WITH  RECURSIVE  "MyCTE"
AS
(
        -- anchor
    SELECT "EventUID", "ParentUID", "Name", "Description", "EventType", "EventClass", "StartDate", "StopDate", "EventStatus", "Monitored", "CreatedBy", "DateCreated"
		FROM public."eventDetails" P1
		WHERE 
		"EventClass" = 'Main'
		and "EventStatus" = true
		AND "EventUID"='c7706ce6-b8db-42ba-bf51-860d31efcae4'

    UNION ALL
        --recursive member
	
	SELECT P2."EventUID", P2."ParentUID", P2."Name", P2."Description", P2."EventType", P2."EventClass", P2."StartDate", P2."StopDate", P2."EventStatus", P2."Monitored", P2."CreatedBy", P2."DateCreated"
		FROM public."eventDetails" P2
		INNER JOIN "MyCTE" AS M ON P2."ParentUID" = M."EventUID"
		AND P2."EventClass" != 'Main'
		and P2."EventStatus" = true
)
SELECT *
--row_to_json("MyCTE")
FROM "MyCTE"
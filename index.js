// Imports dependencies and set up http server
const express = require("express"),
  bodyParser = require("body-parser"),
  app = express().use(bodyParser.json()), // creates express http server
  dotenv = require("dotenv");

dotenv.config();

// Sets server port and logs message on success
const listener = app.listen(process.env.PORT || 3000, () =>
  console.log("webhook is listening on port " + listener.address().port)
);


app.get("/", (req, res) => {
  res.status(200).send("connected to the application.");
});


// Authenticate
app.get("/Authenticate", (req, res) => {
  let bearerToken = {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUzYmMzMzIwLTIyNTgtMTFlOS04ZGZmLTY1MTNlZjhlNTQ5MyIsInVzZXJuYW1lIjoiZGVtb3VzZXIiLCJmaXJzdG5hbWUiOiJEZW1vIiwibGFzdG5hbWUiOiJVc2VyIiwiaWF0IjoxNTgzNTU1NTM1LCJleHAiOjE1ODM1NTkxMzV9.x_DBM9-44e3EQ3BCpFJTG0PUTTZr5nuroHexy9Aett8",
    "expires_in": 3600,
    "token_type": "Bearer",
    "scope": "api.intimacy"
  };

  let simpleToken  = {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUzYmMzMzIwLTIyNTgtMTFlOS04ZGZmLTY1MTNlZjhlNTQ5MyIsInVzZXJuYW1lIjoiZGVtb3VzZXIiLCJmaXJzdG5hbWUiOiJEZW1vIiwibGFzdG5hbWUiOiJVc2VyIiwiaWF0IjoxNTgzNTU1NTM1LCJleHAiOjE1ODM1NTkxMzV9.x_DBM9-44e3EQ3BCpFJTG0PUTTZr5nuroHexy9Aett8"
  };

  res.send(bearerToken);
});


// ValidateUser
app.get("/ValidateUser", (req, res) => {
  let superuser = {
    "username": "superuser",
    "UID":"19985d58-1576-4ea1-9d3c-ac454ed0de58",
    "scope":"Admin",
    "Active": true
  };
  
  let testUser1 = {
    "username": "test.user1@gmail.com",
    "UID":"c7de445c-3e08-4698-ac19-69b90ca71cec",
    "scope":"AuthUser",
    "Active": true
  };
  
  let testUser2 = {
    "username": "guest.user1@gmail.com",
    "UID":"85b2076f-976c-448a-a428-b2a626315f0f",
    "scope":"UnAuthuser",
    "Active": true
  };

  res.send(superuser);

});

//UserActivity
app.post("/UserActivity", (req, res) => {
  //
});

//Should allow active /non active
app.get("/AllMainEvents", (req, res) => {
  let AllMainEvents = {
        "AllMainEvents": [
          {
            "Name": "3 Day Intimacy Challenge FEB2021",
            "Details": "Challenge yourself for a 3 Day Intimacy boost this FEB2021",
            "eventType": "Closed",
            "EventClass": "Main",
            "StartDate": "2022-02-23 22:00:00.956125+00",
            "StopDate": "2022-02-26 22:00:00.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "3 Day Intimacy Challenge  MAR2021",
            "Details": "Challenge yourself for a 3 Day Intimacy boost this MAR2021",
            "eventType": "Closed",
            "EventClass": "Main",
            "StartDate": "2022-03-23 22:00:00.956125+00",
            "StopDate": "2022-03-26 22:00:00.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-03-23 17:58:58.956125+00"
          },
          {
            "Name": "3 Day Intimacy Challenge APR2021",
            "Details": "Challenge yourself for a 3 Day Intimacy boost this APR2021",
            "eventType": "Closed",
            "EventClass": "Main",
            "StartDate": "2022-04-23 22:00:00.956125+00",
            "StopDate": "2022-04-26 22:00:00.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-04-23 17:58:58.956125+00"
          }
        ]
      };

  res.send(AllMainEvents);
});

//Get Event Details, GIVEN A major EventID
app.get("/EventDetails", (req, res) => {
  let eventDetaiils = {
    "Name": "3 Day Intimacy Challenge FEB2021",
    "Details": "Challenge yourself for a 3 Day Intimacy boost this FEB2021",
    "eventType": "Closed",
    "EventClass": "Main",
    "StartDate": "2022-02-23 22:00:00.956125+00",
    "StopDate": "2022-02-26 22:00:00.956125+00",
    "Active": true,
    "Monitored": true,
    "CreatedBy": "Admin1",
    "DateCreated": "2022-02-23 17:58:58.956125+00",
    "SubEvent": [
      {
        "Name": "Day1 - 3 Day Intimacy Challenge FEB2021",
        "Details": "Day1 - 3 Day Intimacy Challenge FEB2021",
        "eventType": "Closed",
        "EventClass": "Sub",
        "StartDate": "2022-02-24 00:00:27.956125+00",
        "StopDate": "2022-02-24 00:00:27.956125+00",
        "Active": true,
        "Monitored": true,
        "CreatedBy": "Admin1",
        "DateCreated": "2022-02-23 17:58:58.956125+00",
        "Activity": [
          {
            "Name": "Day1 - Morning Devotion",
            "Details": "Day1 - Morning Devotion",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 05:30:27.956125+00",
            "StopDate": "2022-02-24 06:00:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "Day1 - Bible Study",
            "Details": "Day1 - Bible Study",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 06:00:27.956125+00",
            "StopDate": "2022-02-24 06:30:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "Day1 - Group Prayer",
            "Details": "Day1 - Group Prayer",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 23:00:27.956125+00",
            "StopDate": "2022-02-24 00:00:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          }
        ]
      },
      {
        "Name": "Day2 - 3 Day Intimacy Challenge FEB2021",
        "Details": "Day2 - 3 Day Intimacy Challenge FEB2021",
        "eventType": "Closed",
        "EventClass": "Sub",
        "StartDate": "2022-02-25 00:00:27.956125+00",
        "StopDate": "2022-02-25 00:00:27.956125+00",
        "Active": true,
        "Monitored": true,
        "CreatedBy": "Admin1",
        "DateCreated": "2022-02-23 17:58:58.956125+00",
        "Activity": [
          {
            "Name": "Day2 - Morning Devotion",
            "Details": "Day2 - Morning Devotion",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 05:30:27.956125+00",
            "StopDate": "2022-02-24 06:00:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "Day2 - Bible Study",
            "Details": "Day2 - Bible Study",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 06:00:27.956125+00",
            "StopDate": "2022-02-24 06:30:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "Day2 - Group Prayer",
            "Details": "Day2 - Group Prayer",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 23:00:27.956125+00",
            "StopDate": "2022-02-24 00:00:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          }
        ]
      },
      {
        "Name": "Day3 - 3 Day Intimacy Challenge FEB2021",
        "Details": "Day3 - 3 Day Intimacy Challenge FEB2021",
        "eventType": "Closed",
        "EventClass": "Sub",
        "StartDate": "2022-02-26 00:00:27.956125+00",
        "StopDate": "2022-02-26 00:00:27.956125+00",
        "Active": true,
        "Monitored": true,
        "CreatedBy": "Admin1",
        "DateCreated": "2022-02-23 17:58:58.956125+00",
        "Activity": [
          {
            "Name": "Day3 - Morning Devotion",
            "Details": "Day3 - Morning Devotion",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 05:30:27.956125+00",
            "StopDate": "2022-02-24 06:00:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "Day3 - Bible Study",
            "Details": "Day3 - Bible Study",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 06:00:27.956125+00",
            "StopDate": "2022-02-24 06:30:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          },
          {
            "Name": "Day3 - Group Prayer",
            "Details": "Day3 - Group Prayer",
            "eventType": "Closed",
            "EventClass": "Activty",
            "StartDate": "2022-02-24 23:00:27.956125+00",
            "StopDate": "2022-02-24 00:00:27.956125+00",
            "Active": true,
            "Monitored": true,
            "CreatedBy": "Admin1",
            "DateCreated": "2022-02-23 17:58:58.956125+00"
          }
        ]
      }
    ]
  };

  res.send(eventDetaiils);
});

//Robust
app.post("/CreateEvent", (req, res) => {
  //
});
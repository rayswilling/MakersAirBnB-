# DreamBnB by The Dream Team

DreamBnb is a web application for users to request a booking for an overnight stay at a property of their choosing, as well as list their own properties. 

**Installation Instructions**

In your computer's terminal, run:
```
# Fork / clone this repo
> git clone https://github.com/rayswilling/MakersAirBnB-
> cd MakersAirBnB-

# Connect to `psql` in the terminal and create the `Dreambnb` database
> psql
> CREATE DATABASE dreambnb;
> \q;

# Install the necessary dependencies
> bundle install

# Datamapper will automatically setup the required tables
> rspec
> rackup 

# Visit localhost:9292/ in the browser to see the app in action!
```

**Technologies**

The app is written in Ruby. The database was created with PostgreSQL and the tables were created with Datamapper. The front end used JQuery, including Datepicker.

**Testing** 

This project uses RSpec for running unit tests and Capybara for feature tests.
To run the tests, run `rspec` in the terminal.



**Database Tables**


*User Table (Sign Up)*

 ID | Email | Password
 -----|-----|--------
 #1 | hello@gmail.com | secret
 #2 | heya@gmail.com | alsosecret


*Listings Table*

  ID | Name (of property) | Description | Price Per Night | Available From | Available Until | User ID (property owner)
 -----|-----|--------|-----|-----|--------|--------
 #1 | House in the countryside | Nice house | £29 | 3/6/19 | 19/7/19 | #1

*Requests Table*


ID | Arrival Date | Confirm | User ID (requester) | Listing Property ID
-----|-----|-----|-----|-----
#1 | 10/6/19 | True | #2 | #1

<br>

# Approach

*Members of the Dream Team: Edina, Francesca, Laurence, Max and Ray.*

This was our first group project as well as our first chance to build an app just from a specification (listed below) and this [mockup](https://github.com/makersacademy/course/blob/master/makersbnb/makers_bnb_images/MakersBnB_mockups.pdf).

As the aim of the project was to build an app as a team, we followed the [XP values](https://github.com/makersacademy/course/tree/master/makersbnb#xp-values) to ensure an Agile Working Process. This included having a stand up every morning to make a daily plan and a retro in the afternoon to update the group with each pair's progress.

We divided the project by working on the user stories in pairs (which we rotated daily) and merging our work using the github feature branch work flow. We kept track of what each pair had done on Trello.

**Headline Specifications**
```
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.
```

**User Stories**

```
As a user, to use MakersAirBnB,
I want to be able to sign up to the Makers AirBnB.

As a user, to post a listing or book and booking,
I want to be able to sign in and out to MakersAirBnB .

As a user, to post a listing,
I want to be able to upload the information of my listings.

As a user, so that I can reserve properties,
I want to be able to see a list of all the properties available.

As a user, so that I can refine my search,
I want to be able to filter the list of properties by available dates.
(Low Priority)

As a user, so I can make a booking,
I want to be able to make a booking request.

As a host, so I can accept bookings,
I want to see a list of all the request I have received.

As a host, so that I can accept bookings,
I want to be able to accept or decline booking requests.

As a user, so that I keep track of my booking requests,
I want to be able to see a list of my booking requests.

```
<br>

**Mapping**

![amazingspecnesting](./image.png)

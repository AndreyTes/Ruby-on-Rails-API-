# README

[![Build Status](https://travis-ci.org/YuKitAs/rails-rest-api.svg?branch=master)](https://travis-ci.org/YuKitAs/rails-rest-api)

# Ruby-on-Rails Rest API

## Project Setup

**Install all gems**:

```console
$ bundle install
```

**Start the web server on `http://localhost:3000` by default**:

```console
$ rails server
```

## Usage

| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| POST | /register| Create a user|
| POST | /autenticate| Authenticate a user |
| GET | /posts    | List all posts|
| GET | /posts/:post_id | Show a single post |
| POST | /posts | Create a post |
| PUT | /posts/:post_id | Update a post |
| DELETE | /posts/:post_id | Delete a post |
| GET | /posts/:post_id/comments | List all comments of a post |
| GET | /posts/:post_id/comments/:comment_id | Show a single comment |
| POST | /posts/:post_id/comments | Create a comment |
| PUT | /posts/:post_id/comments/:comment_id | Update a comment |
| DELETE | /posts/:post_id/comments/:comment_id | Delete a comment |

On successful autenticate, `{"auth_token": <token>}` will be returned. This token will be expired after 24 hours.

**In order to access the posts and comments, add `'Authorization: <token>'` to the header of every request for CRUD operations.**


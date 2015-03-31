Feature: Admin and Teacher users share wufoo forms with other users

  @admin_signed_in
  Scenario: An admin shares a wuffo form with students in a network
    Given a network
     Then the signed in user should be able to share a wufoo form with the students in the network

  @admin_signed_in
  Scenario: An admin shares a wuffo form with teachers in a network
    Given a network
     Then the signed in user should be able to share a wufoo form with the teachers in the network

  @admin_signed_in
  Scenario: An admin shares a wuffo form with teachers and students in a network
    Given a network
     Then the signed in user should be able to share a wufoo form with the students and teachers in the network

  @admin_signed_in
  Scenario: A teacher shares a wuffo form with students in a course
    Given a course
     Then the signed in user should be able to share a wufoo form with the students in the course

  @admin_signed_in
  Scenario: A teacher shares a wuffo form with teachers in a course
    Given a course
     Then the signed in user should be able to share a wufoo form with the teachers in the course

  @admin_signed_in
  Scenario: A teacher shares a wuffo form with teachers and students in a course
    Given a course
     Then the signed in user should be able to share a wufoo form with the students and teachers in the course

  @teacher_signed_in
  Scenario: A teacher shares a wuffo form with students in a course
    Given a course
     Then the signed in user should be able to share a wufoo form with the students in the course

  @teacher_signed_in
  Scenario: A teacher shares a wuffo form with teachers in a course
    Given a course
     Then the signed in user should be able to share a wufoo form with the teachers in the course

  @teacher_signed_in
  Scenario: A teacher shares a wuffo form with teachers and students in a course
    Given a course
     Then the signed in user should be able to share a wufoo form with the students and teachers in the course

  @student_signed_in
  Scenario: A student submits a network wufoo form
    Given a network wufoo form
     Then the signed in user answers the wuffo form

  @teacher_signed_in
  Scenario: A teacher submits a network wufoo form
    Given a network wufoo form
     Then the signed in user answers the wuffo form

  @student_signed_in
  Scenario: A student submits a course wufoo form
    Given a course wufoo form
     Then the signed in user answers the wuffo form

  @teacher_signed_in
  Scenario: A teacher submits a course wufoo form
    Given a course wufoo form
     Then the signed in user answers the wuffo form

### Your toolbelt


#### Exercise: Uses and understands unit, functional and integration tests

1. You've now written two types of tests. Name them, and explain the differences.
The test's writen were the Unit Tests and the Integration Tests. The Unit Tests are to teste a small piece of code, mainly to test the models (the views and the controllers aren't so much tested, in case of the views because it can change in a short period of time) Ideally, there will be, at least, one test for each method. The Integration Tests are maded to test differentes pieces of code of the system and garantee the they work together. In the simple sinatra sitiuation, the integration tests were to navegate in the routes, fill a specific field, click a button and expect the page to have a specific text.

2. The other tests we haven't made are the Functional Tests, that are the tests to the controllers. The controllers receive incomming web requeste and eventually respond with a view.
A simple case will be 

```ruby
it 'should be testable' do
  get '/'
  last_response.should be_ok
end
```
#### Exercise: Knows how Capybara and drivers work

1. What type of tests do we use Capybara for? What are its strengths and limitations?
-- We use the capybara to do integration tests, by simulating how a real user interacts with the app.
The advantages of using Capybara are:
a. No setup necessary for rails and rack applications. Works out of the box.
b. Intuitive API 
c. Switch the backend - The tests uses a simulated engine of the browser, without the overhead.
d. Powerful synchronization - so that we never have to manually wait for the asynchronous processes to complete. 
One limitation of capybara is that the default driver is `:rack_test`, which does not support javascript and HTTP resources are not accessible outside of your rack application. 

2. Explain what a capybara driver is, and what some benefits are of the default driver.
- The Capybara driver is to simulate the browser, and the main benefit is to be lightweight.

3. Name a case where a driver other than the default would be necessary, then go implement it with your overlord code.
- Other driver than the default may be de selenium if we want to use javascript.

#### Exercise: Knows why flapping tests are destructive

1. First, tell me what a flapping test is. Then, explain some ways that flapping tests are more destructive than even failing or non-existent tests.
- A flapping test is a test that may fail, but the next time it runs, it can pass. 
- The flapping tests are more destructive than a failing or a non-existing test because they force the developer to visit many more tests each time we modify our codebase, leading to decrease a productivity. For a normal failing test, we actually expect the test to fail initially, and it is just a matter of writing working code to make the test pass. Furthermore, when you experience flapping tests, you lose confidence that your test is actually doing its job: verifying a specific part of the application is working properly.

2. Name some gotchas when writing tests that can cause them to become fragile, and how to fix those problems.
- The browser Environment: Never assume the page has loaded; 
- Race conditions: This often occur with AJAX.  AJAX calls and returns to the browser may occur after the test assertion occurs, making the test fail. Although Capybara tries to overcome this by retrying the assertion, you can manually fix this by adding a "wait_until" method to wait for the AJAX response.
- Fake data: using poor fake data, for instance from Faker, that adds random fake data your application isn't built to handle (such as foreign zip codes). To counteract this, understand the fake data you are generating to ensure it tests your application appropriately.
- External dependencies: when you rely on external services, you are injecting possible random failures in your test base due to the service's reliability and data. To handle failures, you need to reproduce what is causing the error. This can be done by capturing the database state at the time of failure and replaying third-party responses using libraries such as webmock and vcr. The main purpose of the test code is to know when your code is broken, not the third party's. You can test whether the third-party service is broken or has changed by testing these interactions through an external build, separate from your normal build.



### It's Not All Automatic
#### Exercise: Knows why manual testing doesn't scale

1.Name some cases where manual testing is preferable or necessary to verify code.
- Manual manual testing is important for test the usabilitie. This tests must be performed by real users, so they can check if the software is easy to use (user friendly).

2 Name some strategies for manually testing code that constrain the time cost of testing.
- in order to minimize the time spent on manual testing, the tests must be performed frequently and as soon as possible in each iteration.
This may point problems that are easiest to solve in a ealy phase than in a phase where the project is advanced, and to solve a problem it may imply to redifine the whole strucure.
- Another technique to constrain the time spent on testing is to use Timeboxing, which enforces a set period of time on an activity, in this case, testing. Before starting, a time limit is agreed upon, and once reached, testing stops. 

#### Exercise: Uses happy path, sad path, and error path to create test cases

2. Think about what sort of tests you may have missed for the various paths, and add them to the code.

#### Exercise: Writes test plans at the beginning of a task, and uses them to clarify requirements

1. go to https://github.com/jmmastey/level_up_exercises/tree/master/shopping_cart and made this 
- You need some exercise in writing test plans. I've got the cure for what ails you. Write a test plan for a basic shopping cart. Make sure to include Happy Path, Sad Path and Bad Path in your tests.

### Strategies for Better Testing

#### Exercise: Understands how "writing the code you want to see" makes for better code

1. Explain the theory around 'writing the code you want to see'.

The 'writing the code you want to see' means to starting at class level and working high level. Once you get the the interfaces of the classes built, you can delve lower into each one, writing the logic, algorithms and data structures that will eventually from the classes of your application.
Writing high level integration tests, and making them pass, leads to coding in this fashion. The tests will start you at a high level, and eventually tell you to delve deeper into the implementation of the application. This leads to a minimal implementation that consists of simple, expressive interfaces.

2. Create a short gist illustrating a place where violating this rule would cause you to write worse code.

Suppose I am creating a blog application. If I don't start with integration tests, I would likely start at the model level. Because I don't know what the customer needs (which would otherwise be defined in the Integration tests), I would have to guess what is needed in the model.
Perhaps I'd need an Article model, with several attributes:

`rails g model Article title:string text:text date:datetime published:boolean publish_date:datetime author:string`

I would then create unit tests for the details of the model.
However, down the road, I find out that the customer doesn't care about the author. Perhaps they are like The Economist and use anonymous authors. By starting at the low level implementation, I've overbuilt the model. And I've probably created an Author model with associations between it and the Article Model. Furthermore, I've probably built validations, controller logic and views that all use an Author.

If I had started out agreeing to this simple Feature with the customer, I would have avoided a lot of unnecessary code:

```rails
  Feature: Add Articles
  As an administrator
  I want to add articles
  So the content is shown on the blog
 
  Scenario: Get articles
    Given an article supplied as a JSON file
    When I add the article to the blog
    Then I should see the article title and content
```

#### Exercise: Writes meaningful tests, and knows what tautological tests are

1. Write an example of a tautological test. Show the correct implementation of that test.


#### Exercise: Tries to make tests fail to verify that they work

1. Go check the tests you've written during this course. Try to change the system under test to make the tests fail. If they don't, refactor them until they do.



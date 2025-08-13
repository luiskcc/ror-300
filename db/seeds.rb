# To avoid duplicates and ensure a clean slate, we destroy existing records first.
puts "Destroying existing records..."
Answer.destroy_all
Question.destroy_all
Section.destroy_all
puts "Existing records destroyed."


puts "Creating sections..."
sections_data = [
  { name: 'Core Concepts', description: 'Story, Architecture, MVC (Models, Views, Controllers), Routes' },
  { name: 'Setup & Tools', description: 'Setup, Scaffolding, Console, Gems, Packages, Bin, Environments, Heroku' },
  { name: 'Authentication', description: 'Devise' },
  { name: 'Frontend Integration', description: 'Tailwind.css, Stimulus, Hotwire, Webpacker/JavaScript Integration, React' },
  { name: 'Data Layer', description: 'Active Record Associations, Validations, Scopes/Lambdas' },
  { name: 'Background & Jobs', description: 'Active Job, Background Processing, Sidekiq/Resque (optional)' },
  { name: 'Security', description: 'Cybersecurity' },
  { name: 'API & REST', description: 'RESTful Architecture, API Building (JSON APIs)' },
  { name: 'Testing', description: 'RSpec, Minitest' },
  { name: 'Rails Versions', description: 'Rails 7 - 8' },
  { name: 'File Management', description: 'Active Storage' },
  { name: 'Service Objects', description: 'Services Pattern (organizing business logic)' },
  { name: 'Tasks Automation', description: 'Rake Tasks, Seeds Management' },
  { name: 'Code Organization', description: 'Concerns, Decorators, Modularization' },
  { name: 'Real-Time Features', description: 'Action Cable, WebSockets, Redis Integration' },
  { name: 'Performance & Scaling', description: 'Caching, Performance Optimization, Scaling Basics' },
  { name: 'Gems & Extensions', description: 'Creating/Managing Gems, Plugins, Monkey Patching' },
  { name: 'Internationalization', description: 'I18n' }
]

sections_data.each do |section_attrs|
  Section.find_or_create_by!(name: section_attrs[:name]) do |section|
    section.description = section_attrs[:description]
  end
end
puts "Sections created."

questions_by_section = {
  'Core Concepts' => [
    {
      question: "What was the initial release date of Ruby on Rails?",
      answer: "Ruby on Rails was first released as an open-source framework in July 2004."
    },
    {
      question: "Who created Ruby on Rails?",
      answer: "David Heinemeier Hansson (DHH) created Ruby on Rails."
    },
    {
      question: "What programming language is Rails built on?",
      answer: "Rails is built on the Ruby programming language."
    },
    {
      question: "What are the two core principles of the Rails Doctrine?",
      answer: "The two core principles are Convention over Configuration (CoC) and Don't Repeat Yourself (DRY)."
    },
    {
      question: "Explain 'Convention over Configuration' (CoC).",
      answer: "CoC means Rails provides sensible defaults and patterns, reducing the need for explicit configuration from the developer. For example, a model named `User` automatically maps to a database table named `users`."
    },
    {
      question: "Explain 'Don't Repeat Yourself' (DRY).",
      answer: "DRY is a principle aimed at reducing repetition of code and logic. In Rails, this is achieved through features like partials, helpers, and concerns."
    },
    {
      question: "What was the 'Basecamp' application and what is its relation to Rails?",
      answer: "Basecamp is a project management tool from which Ruby on Rails was extracted by DHH as an open-source framework."
    },
    {
      question: "How did Rails influence modern web development?",
      answer: "Rails popularized the MVC pattern, CoC, and a focus on developer productivity, influencing many other web frameworks."
    },
    {
      question: "What are some famous applications built with Rails?",
      answer: "Famous applications built with Rails include GitHub, Shopify, Airbnb, and Basecamp."
    },
    {
      question: "What is the basic directory structure of a new Rails application?",
      answer: "Key directories include `app`, `bin`, `config`, `db`, `lib`, `public`, and `test`."
    },
    {
      question: "What is the purpose of the `app` directory?",
      answer: "The `app` directory contains the core application logic, including models, views, controllers, and helpers."
    },
    {
      question: "What is the role of the `db` directory?",
      answer: "The `db` directory holds the database schema, migrations, and seed data."
    },
    {
      question: "Explain the purpose of the Gemfile and Gemfile.lock.",
      answer: "The `Gemfile` lists the application’s gem dependencies, while `Gemfile.lock` records the exact versions of the gems that were installed, ensuring consistent environments."
    },
    {
      question: "Explain the request/response cycle in a Rails application.",
      answer: "An HTTP request is received by the Rails router, which maps it to a controller action. The action interacts with models, then renders a view, which is sent back as an HTTP response."
    },
    {
      question: "What are Rails environments and how are they configured?",
      answer: "Rails has `development`, `test`, and `production` environments, each with its own specific configuration file in the `config/environments` directory."
    },
    {
      question: "What is a Model in the context of Rails MVC?",
      answer: "A Model represents the data and business logic of the application, typically implemented as an Active Record class that interacts with the database."
    },
    {
      question: "What is Active Record?",
      answer: "Active Record is Rails' Object-Relational Mapping (ORM) framework that connects models to database tables, simplifying database interactions."
    },
    {
      question: "What is an Active Record migration?",
      answer: "An Active Record migration is a script used to alter the database schema in a structured and version-controlled manner."
    },
    {
      question: "What are validations in Active Record? Give an example.",
      answer: "Validations ensure that only valid data is saved to the database. An example is `validates :name, presence: true` to ensure a name field is not empty."
    },
    {
      question: "What are callbacks in Active Record? Name three.",
      answer: "Callbacks are hooks into the lifecycle of an Active Record object that allow code to be executed at specific moments. Examples include `before_save`, `after_create`, and `after_destroy`."
    },
    {
      question: "Explain the `has_many` and `belongs_to` associations.",
      answer: "`has_many` indicates a one-to-many relationship where one record has many associated records. `belongs_to` signifies the inverse, where a record belongs to another single record."
    },
    {
      question: "What is the N+1 query problem?",
      answer: "The N+1 query problem occurs when fetching a parent record and then, in a loop, executing a separate query for each of its associated child records, leading to many unnecessary database queries."
    },
    {
      question: "How can you solve an N+1 query problem using `includes`?",
      answer: "The `includes` method eager loads associated records, fetching them in a single or minimal number of queries to avoid the N+1 problem. For example, `User.includes(:posts)`."
    },
    {
      question: "What are scopes in Active Record?",
      answer: "Scopes are custom class methods defined in models to encapsulate and reuse common queries. An example is `scope :active, -> { where(active: true) }`."
    },
    {
      question: "What is the difference between `find`, `find_by`, and `where`?",
      answer: "`find` retrieves a single record by its primary key. `find_by` returns the first record that matches a given condition. `where` returns a collection of records that satisfy a specified condition."
    },
    {
      question: "What is the purpose of `pluck` in Active Record?",
      answer: "`pluck` retrieves specific column(s) directly from the database without instantiating full Active Record objects, useful for performance when only specific data is needed."
    },
    {
      question: "What is a Controller in the context of Rails MVC?",
      answer: "A Controller in Rails is responsible for handling incoming web requests, processing input, interacting with Models, and preparing data for the View layer."
    },
    {
      question: "What is a View in the context of Rails MVC?",
      answer: "A View in Rails is responsible for presenting data to the user, typically as HTML generated from ERB templates that use data provided by the Controller."
    },
    {
      question: "How do you define a basic route in Rails?",
      answer: "Routes are defined in `config/routes.rb`. A basic route can be defined using `get '/path', to: 'controller#action'`."
    },
    {
      question: "What are RESTful routes in Rails?",
      answer: "RESTful routes map HTTP verbs (GET, POST, PUT/PATCH, DELETE) to controller actions, providing a standardized way to interact with resources (e.g., `resources :users` creates routes for `index`, `show`, `new`, `create`, `edit`, `update`, `destroy` actions)."
    }
  ],
  'Setup & Tools' => [
    { question: 'How do you install Ruby on Rails?', answer: 'By running `gem install rails` in your terminal, which installs the latest Rails version as a gem.' },
    { question: 'What command creates a new Rails application?', answer: 'The command `rails new app_name` creates a new Rails application with the default directory structure and files.' },
    { question: 'What is scaffolding in Rails?', answer: 'Scaffolding generates a basic set of MVC files and routes for a resource quickly, e.g., `rails generate scaffold Post title:string body:text`.' },
    { question: 'How do you start the Rails console?', answer: 'Run `rails console` (or `rails c`) in your terminal to open an interactive Ruby shell within the Rails environment.' },
    { question: 'What is a Gemfile?', answer: 'The Gemfile is a file that lists all the Ruby gems your Rails application depends on, managed by Bundler.' },
    { question: 'How do you add a gem to a Rails project?', answer: 'Add the gem entry to your Gemfile and then run `bundle install` to install it.' },
    { question: 'What is Bundler?', answer: 'Bundler is a Ruby tool that manages gem dependencies through the Gemfile and installs the specified gems.' },
    { question: 'What is the purpose of the `bin/` directory in a Rails app?', answer: 'The `bin/` directory contains executable scripts such as `rails`, `rake`, and `setup` to manage tasks in a consistent environment.' },
    { question: 'What are Rails environments?', answer: 'Rails environments such as development, test, and production are separate contexts with specific configurations and behavior.' },
    { question: 'Where are environment configurations stored in Rails?', answer: 'In the `config/environments/` directory, with files like `development.rb`, `test.rb`, and `production.rb`.' },
    { question: 'How do you run database migrations?', answer: 'By running `rails db:migrate` in the terminal, which executes migration scripts to modify the database schema.' },
    { question: 'What command runs the Rails server?', answer: 'Run `rails server` or `rails s` to start the default WEBrick (or Puma) web server in development.' },
    { question: 'What is the `rails routes` command?', answer: 'It lists all the routes defined in the application along with their HTTP verbs, paths, and controller actions.' },
    { question: 'How do you seed the database?', answer: 'By adding data to `db/seeds.rb` and running `rails db:seed` to populate the database with initial data.' },
    { question: 'What package managers can you use with Rails for JavaScript?', answer: 'You can use Yarn or npm to manage JavaScript packages alongside Rails via Webpacker or import maps.' },
    { question: 'What is Webpacker?', answer: 'Webpacker is a Rails gem that integrates Webpack to manage and bundle JavaScript packs and assets.' },
    { question: 'How do you specify Ruby version for a Rails app?', answer: 'By adding a `.ruby-version` file or specifying the Ruby version in the Gemfile using `ruby "2.x.x"`.' },
    { question: 'What is Heroku?', answer: 'Heroku is a cloud platform that makes it easy to deploy, run, and manage Rails applications.' },
    { question: 'How do you deploy a Rails app to Heroku?', answer: 'Typically by pushing your code to Heroku using Git (`git push heroku main`), running database migrations with `heroku run rails db:migrate`, and configuring environment variables.' },
    { question: 'What is the difference between development and production environments in Rails?', answer: 'Development is optimized for developer convenience with code reloading and detailed errors; production is optimized for performance and security with caching and error suppression.' },
    { question: 'How do you check installed gems in a Rails project?', answer: 'Run `bundle list` or `bundle show` to see the gems installed via Bundler.' },
    { question: 'What is the purpose of the `Gemfile.lock` file?', answer: 'It records the exact gem versions installed to ensure the same gems are used across different deployments and machines.' },
    { question: 'How do you add custom scripts in Rails?', answer: 'You can create executables or rake tasks in the `bin/` folder or `lib/tasks/` directory respectively.' },
    { question: 'What is a Rake task?', answer: 'Rake is Ruby’s make-like build tool used in Rails for automating tasks such as database migrations, backups, or data seeding.' },
    { question: 'How do you stop the Rails server?', answer: 'Press `Ctrl+C` in the terminal where the server is running.' },
    { question: 'What does `bundle update` do?', answer: 'It updates all gems specified in the Gemfile to their latest compatible versions and updates the Gemfile.lock file.' },
    { question: 'What does the `rails db:rollback` command do?', answer: 'It reverses the last database migration, undoing the most recent schema change.' },
    { question: 'How do you run tests in Rails?', answer: 'Using `rails test` for Minitest or `rspec` command if using RSpec.' },
    { question: 'What is the purpose of `config/application.rb`?', answer: 'It is the primary configuration file where you set global settings for your Rails application.' },
    { question: 'How do you restart your Rails server after changes?', answer: 'Stop the server (Ctrl+C) and start it again with `rails server` to reload code and configurations.' }
  ],
  'Authentication' => [
    { question: 'What is the Devise gem used for in Rails?', answer: 'Devise is a flexible, full-featured authentication solution for Ruby on Rails applications that handles user registration, login, logout, password recovery, and session management.' },
    { question: 'How do you install Devise in a Rails 7 application?', answer: 'Add `gem "devise"` to your Gemfile, run `bundle install`, and then run `rails generate devise:install` to set up Devise.' },
    { question: 'How do you create a User model with Devise?', answer: 'Run `rails generate devise User` to generate the User model, migration, and routes for authentication.' },
    { question: 'Which Devise module manages locking user accounts after failed login attempts?', answer: 'The `lockable` module handles locking accounts after a number of failed attempts to prevent brute force attacks.' },
    { question: 'How can you customize Devise’s controllers?', answer: 'You can generate Devise controllers using `rails generate devise:controllers [scope]` and then modify the generated controllers as needed.' },
    { question: 'What is the purpose of the `config.action_mailer.default_url_options` in Devise setup?', answer: 'It sets the default URL options for mailer links used in password reset and confirmation emails.' },
    { question: 'How does Devise handle sessions securely?', answer: 'Devise uses Warden, a Rack-based authentication framework, to securely manage user sessions with session strings and encryption.' },
    { question: 'Name two common Devise modules besides database authentication.', answer: 'Examples include `recoverable` (password resets) and `confirmable` (email confirmation).' },
    { question: 'How can you restrict access for unauthenticated users in a Rails app using Devise?', answer: 'By adding `before_action :authenticate_user!` in controllers or ApplicationController to require login before action execution.' },
    { question: 'How do you add sign-up and login links in the view with Devise?', answer: 'Use Devise helper methods such as `user_signed_in?` and `current_user` to conditionally display links like `link_to "Sign Up", new_user_registration_path`.' }
  ],
  'Frontend Integration' => [
    { question: 'What is Tailwind CSS?', answer: 'Tailwind CSS is a utility-first CSS framework that provides low-level utility classes to build custom designs directly in your markup.' },
    { question: 'How do you integrate Tailwind CSS into a Rails app?', answer: 'Add Tailwind via the Tailwindcss-rails gem or configure it with Webpacker/postcss for asset compilation.' },
    { question: 'What is Stimulus.js in Rails?', answer: 'Stimulus is a modest JavaScript framework for adding behavior to HTML elements, designed to complement server-rendered HTML.' },
    { question: 'How does Hotwire improve Rails front-end development?', answer: 'Hotwire uses Turbo (for partial page updates) and Stimulus (JavaScript controllers) to create reactive apps with minimal custom JavaScript.' },
    { question: 'What is Turbo in Hotwire?', answer: 'Turbo speeds up web applications by replacing full-page reloads with partial HTML updates over WebSocket or HTTP.' },
    { question: 'What are the main components of Hotwire?', answer: 'Turbo Drive, Turbo Frames, Turbo Streams, and Stimulus.js.' },
    { question: 'What is Webpacker in Rails?', answer: 'Webpacker is a Rails gem that integrates Webpack to manage JavaScript, CSS, and other assets bundling.' },
    { question: 'How do you add React to a Rails application?', answer: 'Install React via Webpacker or import maps, and use React components either within Rails views or in standalone frontends.' },
    { question: 'How does stimulus enhance Rails UIs?', answer: 'Stimulus enables declarative JavaScript behaviors triggered by HTML attributes, enhancing interactivity without complex frameworks.' },
    { question: 'What command generates a new Stimulus controller?', answer: '`rails generate stimulus controller_name`.' },
    { question: 'How does Turbo Frames work?', answer: 'Turbo Frames allow you to replace or update only parts of a page by targeting specific HTML frame elements.' },
    { question: 'What advantages does Hotwire provide over SPA frameworks?', answer: 'Hotwire reduces JavaScript complexity by leveraging server rendering, resulting in faster initial load and simpler maintenance.' },
    { question: 'How do you customize Tailwind config in Rails?', answer: 'Modify `tailwind.config.js` to add custom colors, fonts, and variants.' },
    { question: 'What is the purpose of the `app/javascript` directory in Rails?', answer: 'It holds JavaScript packs and modules managed by Webpacker.' },
    { question: 'How do you import assets like images in Webpacker?', answer: 'Import images in JavaScript or CSS and use Webpack’s asset pipeline to handle them during bundling.' },
    { question: 'How to enable React hot reloading in Rails?', answer: 'Use React Hot Loader and configure Webpack Hot Module Replacement (HMR) in development.' },
    { question: 'How does Turbo Streams update views?', answer: 'Turbo Streams use WebSocket or HTTP to append, replace, or remove elements in real time without full page reloads.' },
    { question: 'What is the role of `application.js` in Rails with Webpacker?', answer: '`application.js` is the main JavaScript entry point where you import libraries, controllers, and initialize JS functionality.' },
    { question: 'How do you add Tailwind directives in a Rails project?', answer: 'Include the `@tailwind base;`, `@tailwind components;`, and `@tailwind utilities;` directives in your CSS/SCSS files.' },
    { question: 'How can you ensure React and Rails communicate effectively?', answer: 'By using APIs, embedding React components in the Rails views, or using libraries like React-Rails for seamless integration.' }
  ],
  'Data Layer' => [
    { question: 'What is an Active Record association?', answer: 'It declares relationships between models, such as `belongs_to`, `has_many`, and `has_one`.' },
    { question: 'How do you define a one-to-many association?', answer: 'Use `has_many` on the parent model and `belongs_to` on the child model.' },
    { question: 'What is a polymorphic association?', answer: 'It allows a model to belong to multiple other models using a single association.' },
    { question: 'What are validations in Active Record?', answer: 'Validations ensure that only valid data is saved into the database, like presence or uniqueness checks.' },
    { question: 'How do you validate the presence of an attribute?', answer: 'Use `validates :attribute_name, presence: true` in the model.' },
    { question: 'What is the purpose of scopes in Active Record?', answer: 'Scopes allow defining reusable, chainable queries for filtering records.' },
    { question: 'How do you define a scope using a lambda?', answer: 'Example: `scope :active, -> { where(active: true) }`.' },
    { question: 'What is the difference between `where` and `scope`?', answer: '`where` runs a query directly, while `scope` defines a reusable method that can be chained.' },
    { question: 'How do you validate uniqueness of an attribute?', answer: 'Use `validates :attribute_name, uniqueness: true` to enforce unique values.' },
    { question: 'What are callbacks in Active Record?', answer: 'Callbacks hook into object lifecycle events like `before_save` or `after_create` to trigger custom code.' },
    { question: 'How do you implement a many-to-many relationship?', answer: 'Use `has_and_belongs_to_many` or set up a join model with two `belongs_to` associations.' },
    { question: 'What does `dependent: :destroy` do in an association?', answer: 'It automatically deletes associated records when the parent record is destroyed.' },
    { question: 'How do you create a scope that accepts arguments?', answer: 'Use a lambda with parameters, e.g., `scope :created_after, ->(date) { where("created_at > ?", date) }`.' },
    { question: 'What is the difference between `valid?` and `save`?', answer: '`valid?` runs validations without saving; `save` runs validations and saves the record if valid.' },
    { question: 'How do you chain multiple scopes?', answer: 'Scopes return Active Record relations, so you can chain them like `Model.active.paid`.' }
  ],
  'Background & Jobs' => [
    { question: 'What is Active Job in Rails?', answer: 'Active Job is a framework to declare jobs and run them on various queuing backends.' },
    { question: 'Name some background job processors usable with Active Job.', answer: 'Sidekiq, Resque, Delayed Job, and Que.' },
    { question: 'Why use background jobs?', answer: 'To offload long-running tasks like sending emails or processing files outside the web request cycle.' },
    { question: 'How do you create a new background job?', answer: 'Run `rails generate job JobName`, then define the `perform` method.' },
    { question: 'How do you enqueue a job?', answer: 'Call `JobName.perform_later(arguments)` to enqueue asynchronously.' },
    { question: 'What is the difference between `perform_now` and `perform_later`?', answer: '`perform_now` runs the job immediately, `perform_later` enqueues it to run asynchronously.' },
    { question: 'How does Sidekiq process jobs?', answer: 'Sidekiq uses Redis to store job data and processes jobs concurrently using threads.' },
    { question: 'What is the use of the `retry` option in Sidekiq?', answer: 'It controls how many times Sidekiq retries a failed job before giving up.' },
    { question: 'How can you monitor background jobs?', answer: 'Sidekiq provides a web UI dashboard; other tools or custom logging can also be used.' },
    { question: 'What happens if a background job fails?', answer: 'It is retried according to backend settings or moved to a dead queue for manual inspection.' },
    { question: 'How do you schedule a job to run in the future?', answer: 'Use `perform_later` with `set(wait: time)` or scheduler gems like `sidekiq-scheduler`.' },
    { question: 'Can background jobs affect your database transactions?', answer: 'Yes, jobs should be enqueued after transactions commit to avoid inconsistencies.' },
    { question: 'How do you test background jobs in Rails?', answer: 'Use test adapters like `ActiveJob::TestHelper` to assert job enqueuing and execution.' },
    { question: 'What is idempotency in background jobs?', answer: 'Ensuring a job can safely be retried without undesired side effects.' },
    { question: 'How do you pass arguments to a background job?', answer: 'Pass simple data types like strings or integers to `perform_later`. Avoid non-serializable objects.' }
  ],
  'Security' => [
    { question: 'How does Rails protect against SQL injection?', answer: 'By using parameterized queries and Active Record’s query interface which escapes inputs automatically.' },
    { question: 'What is Cross-Site Request Forgery (CSRF) protection in Rails?', answer: 'Rails embeds an authenticity token in forms and verifies it on submission to prevent CSRF attacks.' },
    { question: 'How do you prevent Cross-Site Scripting (XSS) in Rails?', answer: 'Rails auto-escapes output in views by default, preventing malicious scripts from executing.' },
    { question: 'How does Devise enhance security in authentication?', answer: 'Devise provides modules like account locking, password encryption, timeoutable sessions, and email confirmation.' },
    { question: 'What steps should be taken to secure uploaded files in Rails?', answer: 'Validate file types, limit sizes, store files outside the public directory, and use Active Storage’s built-in security features.' }
  ],
  'API & REST' => [
    { question: 'What is REST?', answer: 'REST (Representational State Transfer) is an architectural style for designing networked applications using stateless, standardized HTTP methods.' },
    { question: 'How does Rails support RESTful architecture?', answer: 'Rails uses resourceful routing with standard controller actions like `index`, `show`, `create`, `update`, and `destroy`.' },
    { question: 'What command generates a scaffold for an API-only Rails app?', answer: '`rails new app_name --api` generates a Rails app optimized for building APIs without views.' },
    { question: 'How do you render JSON in Rails controllers?', answer: '`render json: @object` converts Ruby objects into JSON format for API responses.' },
    { question: 'What are serializers in Rails?', answer: 'Serializers format model objects as JSON API responses, examples include ActiveModel::Serializers and fast_jsonapi.' },
    { question: 'How do you version an API in Rails?', answer: 'You can namespace routes and controllers, e.g., `namespace :api do namespace :v1 do resources :posts end end`.' },
    { question: 'What HTTP status codes are commonly used for REST APIs?', answer: '200 (OK), 201 (Created), 204 (No Content), 400 (Bad Request), 401 (Unauthorized), 404 (Not Found), 422 (Unprocessable Entity), 500 (Server Error).' },
    { question: 'What headers are important in API responses?', answer: 'Content-Type, Authorization, and CORS headers are important for API responses.' },
    { question: 'How do you secure an API in Rails?', answer: 'Use token-based authentication like JWT, API keys, or OAuth, and enforce SSL and rate limiting.' },
    { question: 'What gem can be used for OAuth authentication in Rails APIs?', answer: 'The OmniAuth gem integrates OAuth strategies with Rails applications.' },
    { question: 'How do you handle errors in Rails APIs?', answer: 'By rescuing exceptions and rendering JSON error messages with appropriate HTTP status codes.' },
  
  { question: 'How do you paginate API results in Rails?', answer: 'Use gems like Kaminari or WillPaginate and include metadata in JSON responses for pagination.' },
    { question: 'What is CORS and why is it important in APIs?', answer: 'Cross-Origin Resource Sharing (CORS) allows browsers to safely restrict cross-origin HTTP requests. Rails can configure CORS to allow trusted domains.' },
    { question: 'How do you document Rails APIs?', answer: 'Using tools like Swagger, rswag, or Apiary to generate interactive API documentation.' },
    { question: 'What is the difference between `PUT` and `PATCH` in REST?', answer: '`PUT` replaces a resource entirely; `PATCH` updates only specific fields.' },
    { question: 'What are resourceful routes?', answer: 'Routes that follow REST conventions and map to standard controller actions for CRUD operations.' },
    { question: 'How do you test APIs in Rails?', answer: 'Use integration tests with tools like RSpec and request specs or API testing tools like Postman.' },
    { question: 'What is JSON API?', answer: 'A specification for building JSON APIs that standardizes request and response formats.' },
    { question: 'How do you handle serialization of nested associations in APIs?', answer: 'Use serializers with includes or relationships to embed or sideload associated objects.' },
    { question: 'How does Rails 7 support API-only applications?', answer: 'Rails 7 includes enhanced API mode with streamlined middleware, Action Cable support, and tighter integration with JavaScript frameworks.' }
  ],
  'Testing' => [
    { question: 'What is RSpec?', answer: 'RSpec is a testing framework for Ruby, designed for behavior-driven development (BDD).' },
    { question: 'How do you write a simple model test in RSpec?', answer: 'Use `describe ModelName do` and write examples using `it` blocks with expectations like `expect(subject).to be_valid`.' },
    { question: 'What is a FactoryBot in RSpec?', answer: 'FactoryBot is a fixtures replacement that allows defining factories to generate test data.' },
    { question: 'How do you run RSpec tests?', answer: 'Run `bundle exec rspec` or simply `rspec` in your project directory.' },
    { question: 'What is a request spec in RSpec?', answer: 'Request specs test HTTP endpoint behavior and full request/response cycles, often used for API testing.' }
  ],
  'File Management' => [
    { question: 'What is Active Storage in Rails?', answer: 'Active Storage is a built-in framework to upload files to cloud services or the local file system and attach them to Active Record models.' },
    { question: 'How do you attach a file to a model with Active Storage?', answer: 'Use `has_one_attached :file` or `has_many_attached :files` in the model.' },
    { question: 'What storage services does Active Storage support?', answer: 'It supports Amazon S3, Google Cloud Storage, Microsoft Azure, and local disk storage.' },
    { question: 'How do you upload a file through a form using Active Storage?', answer: 'Use a file_field form helper with the attachment attribute, e.g., `file_field :model, :attachment`.' },
    { question: 'How do you serve files stored with Active Storage?', answer: 'Use URL helpers like `rails_blob_path` or direct links in views that authenticate signed URLs.' },
    { question: 'How do you validate attached files in Active Storage?', answer: 'Use validation gems like `activestorage-validator` or custom validations in models.' },
    { question: 'What is variant processing in Active Storage?', answer: 'It allows generating resized or transformed versions of images on demand.' },
    { question: 'Can Active Storage handle direct uploads?', answer: 'Yes, it supports direct uploads from the browser to cloud storage with JavaScript integration.' },
    { question: 'How do you delete attached files?', answer: 'Call `attachment.purge` or `attachment.purge_later` on the attached file to remove it.' },
    { question: 'What configuration file is used to set storage services?', answer: 'Storage services are configured in `config/storage.yml`.' }
  ],
  'Service Objects' => [
    { question: 'What is a service object in Rails?', answer: 'A service object encapsulates business logic that does not naturally fit into models or controllers, promoting single responsibility and cleaner code.' },
    { question: 'When should you use a service object?', answer: 'Use service objects for complex operations spanning multiple models or multi-step processes to keep models/controllers slim.' },
    { question: 'Where are service objects typically located?', answer: 'They are often placed in the `app/services` directory.' },
    { question: 'What is the common method convention used in service objects?', answer: 'The `.call` class method is commonly used for invoking service objects.' },
    { question: 'How do service objects improve testability?', answer: 'They isolate business logic, making it easier to write focused unit tests without depending on controllers or models.' },
    { question: 'Can service objects take initialization parameters?', answer: 'Yes, they typically accept parameters via the initializer or `.call` method.' },
    { question: 'How do you call a service object?', answer: 'Usually with `ServiceClass.call(args)` which executes the encapsulated logic.' },
    { question: 'What principle do service objects follow?', answer: 'They adhere to the Single Responsibility Principle by focusing on one distinct piece of business logic.' },
    { question: 'Give an example use case for a service object.', answer: 'Handling payment processing, which involves external API calls, validations, and multiple model updates.' },
    { question: 'How do you test a service object?', answer: 'Write unit tests that verify the outcome of calling the service given different inputs.' },
  ],
  'Tasks Automation' => [
    { question: 'What is a Rake task?', answer: 'A Rake task automates command-line tasks in Rails, like database migrations or clearing caches.' },
    { question: 'Where do you define custom Rake tasks?', answer: 'In `.rake` files inside the `lib/tasks` directory.' },
    { question: 'How do you run a Rake task?', answer: 'Using the command `rails task:name` or `rake task:name`.' },
    { question: 'What is the purpose of `db/seeds.rb`?', answer: 'It seeds the database with initial or sample data.' },
    { question: 'How do you execute seeds?', answer: 'By running `rails db:seed`.' },
    { question: 'How can you pass arguments to Rake tasks?', answer: 'Define task arguments using `task :name, [:arg1, :arg2] => :environment do |t, args| ... end`.' },
    { question: 'Why include `:environment` as a dependency in Rake tasks?', answer: 'To load the Rails environment, giving access to models and app classes inside the task.' },
    { question: 'How do you reset the database and reseed?', answer: 'Run `rails db:reset` which drops, recreates, migrates, and seeds the database.' },
    { question: 'Can Rake tasks be scheduled?', answer: 'Yes, using gems like `whenever` to automate task scheduling via cron.' },
    { question: 'What command generates default Rails tasks?', answer: '`rails new` generates built-in Rake tasks for migrations, assets, and tests.' }
  ],
  'Code Organization' => [
    { question: 'What is a concern in Rails?', answer: 'A concern is a module that encapsulates reusable code to be shared across models or controllers.' },
    { question: 'Where do you place concerns?', answer: 'Model concerns go in `app/models/concerns` and controller concerns in `app/controllers/concerns`.' },
    { question: 'How do you include a concern?', answer: 'Use `include ModuleName` within the model or controller class.' },
    { question: 'What is a decorator?', answer: 'A decorator wraps a model to add presentation-specific logic without cluttering the model.' },
    { question: 'Which gem is commonly used for decorators?', answer: 'The Draper gem is popular for implementing decorators in Rails.' },
    { question: 'What is modularization?', answer: 'Organizing code into self-contained, reusable components such as modules, services, or engines.' },
    { question: 'How do Rails engines support modularization?', answer: 'Engines are mini Rails applications that can be plugged into other Rails apps to encapsulate features.' },
    { question: 'Why is code organization important?', answer: 'Good organization makes maintenance, testing, and scaling easier.' },
    { question: 'How do decorators improve separation of concerns?', answer: 'They separate business logic from presentation logic.' },
    { question: 'What kind of logic belongs in concerns?', answer: 'Shared validations, callbacks, or methods that multiple models/controllers require.' }
  ],
  'Real-Time Features' => [
    { question: 'What is Action Cable?', answer: 'Action Cable is Rails’ integrated framework for handling WebSockets and real-time features.' },
    { question: 'How do you generate a new channel in Action Cable?', answer: 'With `rails generate channel ChannelName`.' },
    { question: 'Why use Redis with Action Cable?', answer: 'Redis acts as a pub/sub backend to broadcast messages between multiple server instances.' },
    { question: 'How does WebSocket differ from HTTP?', answer: 'WebSockets provide persistent, two-way communication unlike the stateless request-response nature of HTTP.' },
    { question: 'What does the `stream_from` method do?', answer: 'It subscribes a client to a broadcasting stream to receive updates.' },
    { question: 'How do you broadcast messages in Action Cable?', answer: 'Using `ActionCable.server.broadcast("channel", data)`.' },
    { question: 'Where are channel classes defined?', answer: 'In the `app/channels` directory.' },
    { question: 'How do you restrict access to a channel?', answer: 'By authorizing in the `subscribed` callback and rejecting unauthorized clients.' },
    { question: 'What is a subscription in Action Cable?', answer: 'It is a client-side connection listening to broadcasts on a channel.' },
    { question: 'How do you update the frontend UI using Action Cable?', answer: 'Use JavaScript to listen for broadcasts and modify the DOM upon receiving messages.' }
  ],
  'Performance & Scaling' => [
    { question: 'What is caching in Rails?', answer: 'Caching stores expensive computations or database queries to improve app performance.' },
    { question: 'Name three types of caching available in Rails.', answer: 'Page caching, action caching, and fragment caching.' },
    { question: 'What is fragment caching?', answer: 'Caching specific parts of a view to avoid rerendering unchanged sections.' },
    { question: 'What is Russian Doll Caching?', answer: 'A caching strategy nesting cached fragments inside others to maximize cache reuse.' },
    { question: 'What does eager loading prevent?', answer: 'It prevents N+1 query problems by loading related data in fewer queries.' },
    { question: 'How do you horizontally scale a Rails app?', answer: 'By adding more server instances behind a load balancer.' },
    { question: 'What role does Redis play in scaling?', answer: 'Redis is used for fast caching and as a pub/sub backend for real-time features.' },
    { question: 'What is a CDN?', answer: 'A Content Delivery Network caches and serves static assets nearer to users to improve speed.' },
    { question: 'How do you profile slow queries in Rails?', answer: 'Using logs, Rack Mini Profiler, Bullet gem, or database profiling tools.' },
    { question: 'Why offload work to background jobs?', answer: 'To improve response time by performing long tasks asynchronously.' }
  ],
  'Gems & Extensions' => [
    { question: 'What is a gem?', answer: 'A gem is a packaged Ruby library that extends functionality for Ruby or Rails applications.' },
    { question: 'How do you create a new gem?', answer: 'Use `bundle gem gem_name` to scaffold a new gem project.' },
    { question: 'What is monkey patching?', answer: 'Modifying or extending existing Ruby classes or modules at runtime.' },
    { question: 'Why should monkey patching be used cautiously?', answer: 'Because it can cause unexpected behavior and conflicts if not managed properly.' },
    { question: 'What is a Rails plugin?', answer: 'A way to extend or modify common Rails behavior, often distributed as gems.' },
    { question: 'How do you publish a gem?', answer: 'Build it with `gem build` and push it to RubyGems.org with `gem push`.' },
    { question: 'How can you include a local gem in a Rails app?', answer: 'Use `gem "gem_name", path: "/path/to/gem"` in your Gemfile.' },
    { question: 'What is a Rails engine?', answer: 'A mini Rails app that can be mounted inside another app, useful for modularization.' },
    { question: 'Why create custom gems?', answer: 'To package and reuse shared functionality across multiple projects.' },
    { question: 'How do you manage gem dependencies?', answer: 'With Bundler using a Gemfile to specify required gems and their versions.' }
  ],
  'Internationalization' => [
    { question: 'What does I18n stand for?', answer: 'Internationalization, the process of preparing software for localization and multiple languages.' },
    { question: 'Where are translation files stored in Rails?', answer: 'Inside the `config/locales` directory as YAML files.' },
    { question: 'How do you translate a string in a view?', answer: 'Use the `t("translation.key")` helper method.' },
    { question: 'How do you change the default locale?', answer: 'By setting `config.i18n.default_locale` in `config/application.rb`.' },
    { question: 'How do you set the locale dynamically?', answer: 'By assigning `I18n.locale` in a controller or middleware, often based on user preference.' },
    { question: 'What is interpolation in I18n?', answer: 'Inserting dynamic values into translation strings using placeholders like `%{name}`.' },
    { question: 'How do you handle pluralization in Rails I18n?', answer: 'Using pluralization keys like `one`, `other` in translation files to display correct strings based on count.' }
  ]
}

questions_by_section.each do |section_name, qas|
  section = Section.find_by!(name: section_name)
  puts "Seeding #{qas.length} questions for '#{section_name}'..."
  qas.each do |qa|
    question = section.questions.create!(content: qa[:question])
    question.answers.create!(content: qa[:answer])
  end
end

puts "Database has been seeded successfully."
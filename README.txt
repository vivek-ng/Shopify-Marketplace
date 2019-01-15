
                     Installation Steps


            1) Install Ruby using RVM ( Ruby Version Manager) and Rails.
            2) Install Mysql and Redis . If you are using Mac , You can do so by using Homebrew.
            3) Clone the repo and cd into it.
            4) Edit Database.yml file to include the password and username of your database
            4) Run Bundle install 
            5) Create the database and run all migrations by running the following commands

               rake db:create
               rake db:migrate
            6) start the rails server by running rails s
            7) Shopify Marketplace API server is running!!!

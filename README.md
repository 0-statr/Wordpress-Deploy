# Wordpress-Deploy
Deploy Wordpress On Heroku + Railway + Koyeb + Render

# WordPress with PostgreSQL on Render

This repository contains the necessary files to deploy a WordPress site with PostgreSQL on Render.

## Project Structure

'''
my-wordpress-project/
├── Dockerfile
├── pg4wp/
│ └── db.php
├── render.yaml (optional)
└── README.md
'''


## Steps to Deploy

1. **Push Your Code to GitHub**:
    Ensure your project is in a GitHub repository.

2. **Create a New Web Service on Render**:
    - Go to [Render](https://render.com) and log in.
    - Click on "New +" and select "Web Service".
    - Connect your GitHub repository containing the Dockerfile and other project files.

3. **Add a PostgreSQL Database**:
    - Add a PostgreSQL database from Render’s dashboard.
    - After creating the database, note down the database credentials (host, user, password, name).

4. **Set Environment Variables on Render**:
    - Go to your service in the Render dashboard.
    - Navigate to the "Environment" tab.
    - Add the necessary environment variables (`WORDPRESS_DB_HOST`, `WORDPRESS_DB_USER`, `WORDPRESS_DB_PASSWORD`, `WORDPRESS_DB_NAME`) with the values obtained from your PostgreSQL database.

## Notes

- Ensure the `pg4wp/db.php` file is properly included and configured for PostgreSQL support.
- The environment variables in the `Dockerfile` will be overridden by those set in the Render dashboard or `render.yaml`.

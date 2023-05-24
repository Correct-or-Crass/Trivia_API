#### This app is in the developmental phase. please see "Project Status" for more information
<a name="readme-top"></a>

<br>
<a name="table-of-contents"></a>
<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
      <li><a href="#project-status">Project Status</a></li>
      <li><a href="#overview">Overview</a></li>
      <ul>
        <li><a href="#apis-consumed">APIs Consumed</a></li>
      </ul>
    </li>
    <li>
      <a href="#specs-and-deployment-instructions">Specs and Deployment instructions</a>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
  </ul>
</details>

<!-- PROJECT STATUS -->
<details close>
<summary>Project Status</summary>
May 24 update: 
</details>
<br>

<!-- OVERVIEW -->
## Overview
Trivia API exposes endpoints that provide information for a front-end application to build a sassy trivia game!
The end user will have to match a word (from a list) to a photo for five rounds. 

So easy, right!?! 

"BUT"... the user better score well because at the end of the fifth round we evaluate the user's performance and provide a triumphant message celebrating a winning record or a disparaging phrase that playfully "kicks 'em while they're down", along with a gif to emphatically drive home our thoughts!

We provide all this lighthearted content! All the front-end has to do is plug and let their users play. 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Specs and Deployment instructions
- Ruby 3.2.2
- Rails 7.0.4

Deploy locally:
1. Clone the repo
   ```
   git clone git@github.com:Correct-or-Crass/Trivia_API.git
   ```
2. Install gems
   ```
   bundle install
   ```
3. Setup db
   ```
   rails db:{drop,create,migrate}
   ```

4. Run RSpec tests
    ```
    bundle exec rspec spec
    ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## APIs Consumed

<p align="right">(<a href="#readme-top">back to top</a>)</p>